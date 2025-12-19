[CmdletBinding()]
param(
    [string]$OrganizationalUnitDN = "OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol",
    [string]$TranscriptPath,
    [string]$DomainController
)

if ([string]::IsNullOrWhiteSpace($OrganizationalUnitDN)) {
    throw "OrganizationalUnitDN must be provided."
}

if (-not $TranscriptPath) {
    $timestamp = Get-Date -Format "yyyyMMddHHmmss"
    $TranscriptPath = Join-Path -Path $PSScriptRoot -ChildPath "ValidatedWriteTest-$timestamp.log"
}

$transcriptDirectory = Split-Path -Parent $TranscriptPath
if ($transcriptDirectory -and -not (Test-Path -LiteralPath $transcriptDirectory)) {
    New-Item -Path $transcriptDirectory -ItemType Directory -Force | Out-Null
}

Import-Module ActiveDirectory -ErrorAction Stop
Import-Module DSInternals -ErrorAction Stop

$script:DirectoryServer = $null
$script:ADServerParams = @{}

$initialDomainInfo = $null
try {
    $initialDomainInfo = Get-ADDomain -ErrorAction Stop
} catch {
    throw "Unable to query domain information: $($_.Exception.Message)"
}

if (-not [string]::IsNullOrWhiteSpace($DomainController)) {
    $script:DirectoryServer = $DomainController.Trim()
} elseif ($initialDomainInfo -and -not [string]::IsNullOrWhiteSpace($initialDomainInfo.PDCEmulator)) {
    $script:DirectoryServer = $initialDomainInfo.PDCEmulator
}

if ($script:DirectoryServer) {
    $script:ADServerParams = @{ Server = $script:DirectoryServer }
}

function Get-LeafObjectClass {
    param(
        [Microsoft.ActiveDirectory.Management.ADObject]$AdObject
    )

    if (-not $AdObject -or -not $AdObject.objectClass) {
        return $null
    }

    $classes = @($AdObject.objectClass)
    return ($classes[-1]).ToLowerInvariant()
}

function Invoke-DnsHostNameTest {
    param(
        [Microsoft.ActiveDirectory.Management.ADObject]$AdObject,
        [string[]]$DnsSuffixes
    )

    if (-not $DnsSuffixes -or $DnsSuffixes.Count -eq 0) {
        Write-Warning "    No DNS suffixes available to construct a valid dNSHostName value."
        return
    }

    $sam = $AdObject.SamAccountName
    if ([string]::IsNullOrWhiteSpace($sam)) {
        Write-Warning ("    Unable to compute dNSHostName for {0}; SamAccountName is not populated." -f $AdObject.Name)
        return
    }

    $sam = $sam.TrimEnd('$')
    if ([string]::IsNullOrWhiteSpace($sam)) {
        Write-Warning ("    Unable to compute dNSHostName for {0}; SamAccountName trimming resulted in empty value." -f $AdObject.Name)
        return
    }

    $currentValue = $AdObject.'dNSHostName'
    $candidateValues = New-Object System.Collections.Generic.List[string]
    foreach ($suffix in $DnsSuffixes) {
        $candidate = "{0}.{1}" -f $sam.ToLowerInvariant(), $suffix
        if (-not [string]::IsNullOrWhiteSpace($candidate)) {
            [void]$candidateValues.Add($candidate)
        }
    }
    $candidateValues = $candidateValues | Select-Object -Unique

    $targetValue = $candidateValues | Where-Object { $_ -ne $currentValue } | Select-Object -First 1
    if (-not $targetValue) {
        $targetValue = $candidateValues | Select-Object -First 1
    }

    if (-not $targetValue) {
        Write-Warning ("    Unable to compute a candidate dNSHostName for {0}." -f $AdObject.Name)
        return
    }

    $dn = $AdObject.DistinguishedName
    try {
        Set-ADObject @script:ADServerParams -Identity $dn -Replace @{ 'dNSHostName' = $targetValue } -ErrorAction Stop
        Write-Host "    Successfully set dNSHostName to $targetValue."
    } catch {
        Write-Warning ("    Failed to set {2} dNSHostName on {0}: {1}" -f $AdObject.Name, $_.Exception.Message, $targetValue)
        return
    }

    try {
        $refreshed = Get-ADObject @script:ADServerParams -Identity $dn -Properties 'dNSHostName' -ErrorAction Stop
        $updatedValue = $refreshed.'dNSHostName'
        if ($updatedValue -eq $targetValue) {
            Write-Host ("    Verified dNSHostName is {0}." -f $updatedValue)
        } else {
            Write-Warning ("    Expected dNSHostName {0}, but retrieved {1}." -f $targetValue, $updatedValue)
        }
    } catch {
        Write-Warning ("    Unable to read back dNSHostName on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
    }
}

function Invoke-AdditionalDnsTest {
    param(
        [Microsoft.ActiveDirectory.Management.ADObject]$AdObject,
        [string]$DnsRoot
    )

    $dn = $AdObject.DistinguishedName
    $valueToAdd = "{0}-additional-{1}.{2}" -f $AdObject.Name.ToLowerInvariant(), (Get-Random -Minimum 1000 -Maximum 9999), $DnsRoot
    $addSucceeded = $false
    try {
        Set-ADObject @script:ADServerParams -Identity $dn -Add @{ 'msDS-AdditionalDnsHostName' = $valueToAdd } -ErrorAction Stop
        $addSucceeded = $true
        Write-Host "    Added msDS-AdditionalDnsHostName value $valueToAdd."
    } catch {
        Write-Warning ("    Failed to add {2} msDS-AdditionalDnsHostName on {0}: {1}" -f $AdObject.Name, $_.Exception.Message, $valueToAdd)
    } finally {
        if ($addSucceeded) {
            try {
                $refreshed = Get-ADObject @script:ADServerParams -Identity $dn -Properties 'msDS-AdditionalDnsHostName' -ErrorAction Stop
                $currentValues = @($refreshed.'msDS-AdditionalDnsHostName')
                if ($currentValues -and $currentValues -contains $valueToAdd) {
                    Write-Host "    Verified msDS-AdditionalDnsHostName includes:"
                    foreach ($value in $currentValues) {
                        Write-Host ("        {0}" -f $value)
                    }
                } else {
                    Write-Warning ("    Added value {0} was not found in msDS-AdditionalDnsHostName after write." -f $valueToAdd)
                }
            } catch {
                Write-Warning ("    Unable to read back msDS-AdditionalDnsHostName on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
            }
        }
    }
}

function Get-FirstAttributeStringValue {
    param(
        $Value,
        [switch]$TrimDollarSuffix
    )

    if ($null -eq $Value) {
        return $null
    }

    if ($Value -is [System.Collections.IEnumerable] -and -not ($Value -is [string])) {
        foreach ($item in $Value) {
            $result = Get-FirstAttributeStringValue -Value $item -TrimDollarSuffix:$TrimDollarSuffix
            if ($result) {
                return $result
            }
        }
        return $null
    }

    $stringValue = [string]$Value
    if ($TrimDollarSuffix) {
        $stringValue = $stringValue.TrimEnd('$')
    }

    $stringValue = $stringValue.Trim()
    if ([string]::IsNullOrWhiteSpace($stringValue)) {
        return $null
    }

    return $stringValue.ToLowerInvariant()
}

function Invoke-SpnTest {
    param(
        [Microsoft.ActiveDirectory.Management.ADObject]$AdObject
    )

    $samBase = Get-FirstAttributeStringValue -Value $AdObject.SamAccountName -TrimDollarSuffix
    if (-not $samBase) {
        Write-Warning ("    Skipping SPN write for {0}; SamAccountName is not available." -f $AdObject.Name)
        return
    }

    $newSpn = "TEST/{0}" -f $samBase
    $dn = $AdObject.DistinguishedName
    $addSucceeded = $false
    try {
        Set-ADObject @script:ADServerParams -Identity $dn -Add @{ servicePrincipalName = $newSpn } -ErrorAction Stop
        $addSucceeded = $true
        Write-Host "    Added SPN $newSpn."
    } catch {
        Write-Warning ("    Failed to add SPN on {0} (value: {1}): {2}" -f $AdObject.Name, $newSpn, $_.Exception.Message)
    } finally {
        if ($addSucceeded) {
            try {
                $refreshed = Get-ADObject @script:ADServerParams -Identity $dn -Properties 'servicePrincipalName' -ErrorAction Stop
                $currentSpns = @($refreshed.servicePrincipalName)
                if ($currentSpns -and $currentSpns -contains $newSpn) {
                    Write-Host "    Verified servicePrincipalName includes:"
                    foreach ($spn in $currentSpns) {
                        Write-Host ("        {0}" -f $spn)
                    }
                } else {
                    Write-Warning ("    Added SPN {0} was not returned when reading servicePrincipalName." -f $newSpn)
                }
            } catch {
                Write-Warning ("    Unable to read back servicePrincipalName on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
            }
        }
    }
}

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

        return $ngcKey.ToDNWithBinary()
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
    try {
        Write-Host ("    Setting msDS-KeyCredentialLink to:`n        {0}" -f $keyCredentialValue)
        Set-ADObject @script:ADServerParams -Identity $dn -Clear 'msDS-KeyCredentialLink' -Add @{ 'msDS-KeyCredentialLink' = $keyCredentialValue } -ErrorAction Stop
        # Set-ADComputer
        $addSucceeded = $true
        Write-Host "    Added placeholder msDS-KeyCredentialLink."
    } catch {
        Write-Warning ("    Failed to modify msDS-KeyCredentialLink on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
    } finally {
        if ($addSucceeded) {
            try {
                $refreshed = Get-ADObject @script:ADServerParams -Identity $dn -Properties 'msDS-KeyCredentialLink' -ErrorAction Stop
                $currentValues = @($refreshed.'msDS-KeyCredentialLink')
                if ($currentValues -and $currentValues -contains $keyCredentialValue) {
                    Write-Host "    Verified msDS-KeyCredentialLink contains:"
                    foreach ($value in $currentValues) {
                        Write-Host ("        {0}" -f $value)
                    }
                } else {
                    Write-Warning ("    Added msDS-KeyCredentialLink value was not found when reading the object.")
                }
            } catch {
                Write-Warning ("    Unable to read back msDS-KeyCredentialLink on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
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

function Write-GroupMembership {
    param(
        [Parameter(Mandatory)]
        [string]$GroupIdentity,

        [string]$Heading = "Group Membership:"
    )

    Write-Host $Heading
    try {
        $members = Get-ADGroupMember @script:ADServerParams -Identity $GroupIdentity -ErrorAction Stop
    } catch {
        Write-Warning ("    Unable to retrieve membership for {0}: {1}" -f $GroupIdentity, $_.Exception.Message)
        return
    }

    if (-not $members) {
        Write-Host "    (No members found)"
        return
    }

    foreach ($member in $members) {
        Write-Host ("    {0} ({1})" -f $member.Name, $member.DistinguishedName)
    }
}

$domainInfo = $initialDomainInfo
if ($script:DirectoryServer) {
    try {
        $domainInfo = Get-ADDomain @script:ADServerParams
    } catch {
        Write-Warning ("Unable to query domain information from {0}: {1}" -f $script:DirectoryServer, $_.Exception.Message)
    }
}

if (-not $domainInfo) {
    throw "Unable to determine domain information required for the validated write tests."
}

if ($script:DirectoryServer) {
    Write-Host ("Using domain controller {0} for validated write operations." -f $script:DirectoryServer)
}

$dnsRoot = $domainInfo.DNSRoot
$domainObject = $null
try {
    $domainObject = Get-ADObject @script:ADServerParams -Identity $domainInfo.DistinguishedName -Properties 'msDS-AllowedDNSSuffixes' -ErrorAction Stop
} catch {
    Write-Verbose "Unable to retrieve msDS-AllowedDNSSuffixes for domain: $($_.Exception.Message)"
}
$dnsSuffixes = @()
if ($dnsRoot) {
    $dnsSuffixes += $dnsRoot
}
if ($domainObject -and $domainObject.'msDS-AllowedDNSSuffixes') {
    $dnsSuffixes += $domainObject.'msDS-AllowedDNSSuffixes'
}
$dnsSuffixes = $dnsSuffixes |
    Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
    ForEach-Object { $_.Trim().ToLowerInvariant() } |
    Select-Object -Unique
$propertiesToLoad = @(
    'objectClass',
    'dNSHostName',
    'msDS-AdditionalDnsHostName',
    'servicePrincipalName',
    'msDS-KeyCredentialLink',
    'samAccountName',
    'msDS-AdditionalSamAccountName',
    'objectSid'
)

$rawObjects = Get-ADObject @script:ADServerParams -SearchBase $OrganizationalUnitDN -SearchScope OneLevel -Filter * -Properties $propertiesToLoad -ErrorAction Stop |
    Sort-Object -Property Name

$testCandidates = foreach ($obj in $rawObjects) {
    $segments = $obj.Name -split "_"
    if ($segments.Count -eq 3) {
        [PSCustomObject]@{
            Object   = $obj
            Segments = $segments
        }
    }
}

$orderedTests = @(
    'ValidatedDNSHostName',
    'ValidatedAdditionalDNS',
    'ValidatedSPN',
    'ValildatedWriteComputer'
)

$testHandlers = @{
    'ValidatedDNSHostName'    = { param($target) Invoke-DnsHostNameTest -AdObject $target -DnsSuffixes $dnsSuffixes }
    'ValidatedAdditionalDNS'  = { param($target) Invoke-AdditionalDnsTest -AdObject $target -DnsRoot $dnsRoot }
    'ValidatedSPN'            = { param($target) Invoke-SpnTest -AdObject $target }
    'ValildatedWriteComputer' = { param($target) Invoke-KeyCredentialWriteTest -AdObject $target }
}

$transcriptStarted = $false
try {
    Start-Transcript -Path $TranscriptPath -Force
    $transcriptStarted = $true

    if (-not $testCandidates) {
        Write-Warning "No ValidatedWrite test objects were located in $OrganizationalUnitDN."
        return
    }

    Write-Host ("=" * 60)
    Write-Host "VWInitial TrusteeGroup membership:"
    $trusteeGroupDN = "CN=VWTrusteeGroup,$OrganizationalUnitDN"
    Write-GroupMembership -GroupIdentity $trusteeGroupDN -Heading "VWTrusteeGroup Membership:"

    Write-Host ("=" * 60)
    Write-Host "Current user token information:"
    Write-CurrentTokenInfo
    foreach ($candidate in $testCandidates) {
        $object = $candidate.Object
        $testName = $candidate.Segments[0]
        $testsToRun = @()

        if ($testName -eq 'AllValidatedWrites') {
            $testsToRun = $orderedTests
        } elseif ($testHandlers.ContainsKey($testName)) {
            $testsToRun = @($testName)
        } else {
            Write-Host ("Skipping object {0}; no handler defined for {1}." -f $object.Name, $testName)
            continue
        }

        Write-Host ("=" * 60)
        Write-Host ("Processing {0}" -f $object.Name)
        Write-Host ("DistinguishedName: {0}" -f $object.DistinguishedName)

        foreach ($test in $testsToRun) {
            Write-Host ("- Running {0} test" -f $test)
            try {
                & $testHandlers[$test] $object
            } catch {
                Write-Warning ("    Unexpected error while running {0} on {1}: {2}" -f $test, $object.Name, $_.Exception.Message)
            }
        }
    }
} finally {
    if ($transcriptStarted) {
        Stop-Transcript
    }
}
