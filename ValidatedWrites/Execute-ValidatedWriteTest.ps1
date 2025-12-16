[CmdletBinding()]
param(
    [string]$OrganizationalUnitDN = "OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol",
    [string]$TranscriptPath
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
    $originalValue = $currentValue
    try {
        Set-ADObject -Identity $dn -Replace @{ 'dNSHostName' = $targetValue } -ErrorAction Stop
        Write-Host "    Successfully set dNSHostName to $targetValue."
    } catch {
        Write-Warning ("    Failed to set dNSHostName on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
        return
    }

    try {
        if ([string]::IsNullOrWhiteSpace($originalValue)) {
            Set-ADObject -Identity $dn -Clear 'dNSHostName' -ErrorAction Stop
        } else {
            Set-ADObject -Identity $dn -Replace @{ 'dNSHostName' = $originalValue } -ErrorAction Stop
        }
        Write-Host "    Reverted dNSHostName to original value."
    } catch {
        Write-Warning ("    Unable to revert dNSHostName on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
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
        Set-ADObject -Identity $dn -Add @{ 'msDS-AdditionalDnsHostName' = $valueToAdd } -ErrorAction Stop
        $addSucceeded = $true
        Write-Host "    Added msDS-AdditionalDnsHostName value $valueToAdd."
    } catch {
        Write-Warning ("    Failed to add msDS-AdditionalDnsHostName on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
    } finally {
        if ($addSucceeded) {
            try {
                Set-ADObject -Identity $dn -Remove @{ 'msDS-AdditionalDnsHostName' = $valueToAdd } -ErrorAction Stop
                Write-Host "    Removed temporary msDS-AdditionalDnsHostName value."
            } catch {
                Write-Warning ("    Unable to remove msDS-AdditionalDnsHostName from {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
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
        Set-ADObject -Identity $dn -Add @{ servicePrincipalName = $newSpn } -ErrorAction Stop
        $addSucceeded = $true
        Write-Host "    Added SPN $newSpn."
    } catch {
        Write-Warning ("    Failed to add SPN on {0} (value: {1}): {2}" -f $AdObject.Name, $newSpn, $_.Exception.Message)
    } finally {
        if ($addSucceeded) {
            try {
                Set-ADObject -Identity $dn -Remove @{ servicePrincipalName = $newSpn } -ErrorAction Stop
                Write-Host "    Removed temporary SPN."
            } catch {
                Write-Warning ("    Unable to remove SPN from {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
            }
        }
    }
}

function Write-KeyCredentialEntry {
    param(
        [Parameter(Mandatory)]
        [System.IO.BinaryWriter]$Writer,

        [Parameter(Mandatory)]
        [byte]$EntryType,

        [Parameter(Mandatory)]
        [byte[]]$Value
    )

    $Writer.Write([UInt16]$Value.Length)
    $Writer.Write($EntryType)
    $Writer.Write($Value)
}

function New-RsaPublicKeyBlob {
    param(
        [int]$KeySize = 2048
    )

    $rsa = [System.Security.Cryptography.RSA]::Create($KeySize)
    try {
        $parameters = $rsa.ExportParameters($false)
    } finally {
        if ($rsa) {
            $rsa.Dispose()
        }
    }

    $modulus = $parameters.Modulus
    $exponent = $parameters.Exponent

    $memoryStream = New-Object System.IO.MemoryStream
    $writer = New-Object System.IO.BinaryWriter($memoryStream)
    try {
        $writer.Write([UInt32]0x31415352) # "RSA1"
        $writer.Write([UInt32]($modulus.Length * 8))
        $writer.Write([UInt32]$exponent.Length)
        $writer.Write([UInt32]$modulus.Length)
        $writer.Write([UInt32]0) # cbPrime1
        $writer.Write([UInt32]0) # cbPrime2
        $writer.Write($exponent)
        $writer.Write($modulus)
        $writer.Flush()
        return $memoryStream.ToArray()
    } finally {
        $writer.Dispose()
        $memoryStream.Dispose()
    }
}

function New-ShadowCredentialBlob {
    $creationTime = [DateTime]::UtcNow
    $keyMaterial = New-RsaPublicKeyBlob
    $deviceId = [Guid]::NewGuid()
    $deviceBytes = $deviceId.ToByteArray()
    $creationBytes = [BitConverter]::GetBytes($creationTime.ToFileTimeUtc())

    $keyUsageBytes = New-Object byte[] 1
    $keyUsageBytes[0] = 0x01
    $keySourceBytes = New-Object byte[] 1
    $keySourceBytes[0] = 0x00

    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    try {
        $keyIdentifierBytes = $sha256.ComputeHash($keyMaterial)

        $propertyStream = New-Object System.IO.MemoryStream
        $propertyWriter = New-Object System.IO.BinaryWriter($propertyStream)
        try {
            Write-KeyCredentialEntry -Writer $propertyWriter -EntryType 0x03 -Value $keyMaterial
            Write-KeyCredentialEntry -Writer $propertyWriter -EntryType 0x04 -Value $keyUsageBytes
            Write-KeyCredentialEntry -Writer $propertyWriter -EntryType 0x05 -Value $keySourceBytes
            Write-KeyCredentialEntry -Writer $propertyWriter -EntryType 0x06 -Value $deviceBytes
            Write-KeyCredentialEntry -Writer $propertyWriter -EntryType 0x09 -Value $creationBytes
            $propertyWriter.Flush()
            $propertyBytes = $propertyStream.ToArray()
        } finally {
            $propertyWriter.Dispose()
            $propertyStream.Dispose()
        }

        $keyHashBytes = $sha256.ComputeHash($propertyBytes)

        $blobStream = New-Object System.IO.MemoryStream
        $blobWriter = New-Object System.IO.BinaryWriter($blobStream)
        try {
            $blobWriter.Write([UInt32]0x00000200) # Version 2
            Write-KeyCredentialEntry -Writer $blobWriter -EntryType 0x01 -Value $keyIdentifierBytes
            Write-KeyCredentialEntry -Writer $blobWriter -EntryType 0x02 -Value $keyHashBytes
            $blobWriter.Write($propertyBytes)
            $blobWriter.Flush()
            return $blobStream.ToArray()
        } finally {
            $blobWriter.Dispose()
            $blobStream.Dispose()
        }
    } finally {
        $sha256.Dispose()
    }
}

function New-DnWithBinaryValue {
    param(
        [Parameter(Mandatory)]
        [byte[]]$BinaryData,

        [Parameter(Mandatory)]
        [string]$DistinguishedName
    )

    if (-not $BinaryData -or [string]::IsNullOrWhiteSpace($DistinguishedName)) {
        return $null
    }

    try {
        return New-Object Microsoft.ActiveDirectory.Management.ADDNWithBinary ($DistinguishedName, $BinaryData)
    } catch {
        Write-Verbose ("Failed to create ADDNWithBinary value for {0}: {1}" -f $DistinguishedName, $_.Exception.Message)
    }

    try {
        return New-Object System.DirectoryServices.ActiveDirectory.DNWithBinary ($DistinguishedName, $BinaryData)
    } catch {
        Write-Verbose ("Failed to create DNWithBinary value for {0}: {1}" -f $DistinguishedName, $_.Exception.Message)
    }

    try {
        $hex = [System.BitConverter]::ToString($BinaryData).Replace("-", "")
        return "B:{0}:{1}:{2}" -f $BinaryData.Length, $hex, $DistinguishedName
    } catch {
        Write-Verbose ("Failed to format DN-Binary string for {0}: {1}" -f $DistinguishedName, $_.Exception.Message)
        return $null
    }
}

function Invoke-KeyCredentialWriteTest {
    param(
        [Microsoft.ActiveDirectory.Management.ADObject]$AdObject
    )

    $dn = $AdObject.DistinguishedName
    $blob = New-ShadowCredentialBlob
    $dnBinaryValue = New-DnWithBinaryValue -BinaryData $blob -DistinguishedName $dn
    if (-not $dnBinaryValue) {
        Write-Warning ("    Failed to construct DN-Binary value for {0}; skipping msDS-KeyCredentialLink write." -f $AdObject.Name)
        return
    }

    $addSucceeded = $false
    try {
        Set-ADObject -Identity $dn -Add @{ 'msDS-KeyCredentialLink' = $dnBinaryValue } -ErrorAction Stop
        $addSucceeded = $true
        Write-Host ("    Added placeholder msDS-KeyCredentialLink ({0} bytes)." -f $blob.Length)
    } catch {
        Write-Warning ("    Failed to modify msDS-KeyCredentialLink on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
    } finally {
        if ($addSucceeded) {
            try {
                Set-ADObject -Identity $dn -Remove @{ 'msDS-KeyCredentialLink' = $dnBinaryValue } -ErrorAction Stop
                Write-Host "    Removed placeholder msDS-KeyCredentialLink to revert state."
            } catch {
                Write-Warning ("    Unable to clean up msDS-KeyCredentialLink on {0}: {1}" -f $AdObject.Name, $_.Exception.Message)
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
        $members = Get-ADGroupMember -Identity $GroupIdentity -ErrorAction Stop
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

$domainInfo = Get-ADDomain
$dnsRoot = $domainInfo.DNSRoot
$domainObject = $null
try {
    $domainObject = Get-ADObject -Identity $domainInfo.DistinguishedName -Properties 'msDS-AllowedDNSSuffixes' -ErrorAction Stop
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
    'msDS-AdditionalSamAccountName'
)

$rawObjects = Get-ADObject -SearchBase $OrganizationalUnitDN -SearchScope OneLevel -Filter * -Properties $propertiesToLoad -ErrorAction Stop |
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
