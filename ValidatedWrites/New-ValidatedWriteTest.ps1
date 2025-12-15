<#
.SYNOPSIS
Creates a ValidatedWrite OU test surface with predefined tesst users/computers/groups,
ACEs, and a user.

.DESCRIPTION
Given a parent OU distinguished name, this script provisions an OU named
ValidatedWrites, ensures its DACL is protected, creates a fixed set of users, 
computers, and domain local groups. Then grants the VWTrusteeGroup tailored 
rights on each test object, and creates a ControlUser account with a prompted 
password inside the OU.

.PARAMETER ParentOu
DistinguishedName of the OU under which the ValidatedWrite OU will be created.

.PARAMETER TrusteeUser
Optional AD user identity to add to the VWTrusteeGroup during provisioning.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$ParentOu,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$TrusteeUser = 'StdUser'
)

Import-Module ActiveDirectory -ErrorAction Stop

function Get-SchemaGuid {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$LdapDisplayName
    )

    $schemaNc = (Get-ADRootDSE).SchemaNamingContext
    $result = Get-ADObject -SearchBase $schemaNc -LDAPFilter "(lDAPDisplayName=$LdapDisplayName)" -Properties schemaIDGUID -ErrorAction Stop |
        Select-Object -First 1

    if (-not $result) {
        throw "Could not locate schema object for lDAPDisplayName '$LdapDisplayName'."
    }

    return [Guid]$result.schemaIDGUID
}

function Get-ControlAccessGuid {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$DisplayName
    )

    $configNc = (Get-ADRootDSE).ConfigurationNamingContext
    $result = Get-ADObject -SearchBase $configNc -LDAPFilter "(&(objectClass=controlAccessRight)(name=$DisplayName))" -Properties rightsGuid -ErrorAction Stop |
        Select-Object -First 1

    if (-not $result) {
        throw "Could not locate controlAccessRight '$DisplayName'."
    }

    return [Guid]$result.rightsGuid
}

function Enable-DaclProtection {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$DistinguishedName
    )

    $entry = [ADSI]"LDAP://$DistinguishedName"
    $security = $entry.psbase.ObjectSecurity
    if (-not $security.AreAccessRulesProtected) {
        $security.SetAccessRuleProtection($true, $false)
        $entry.psbase.ObjectSecurity = $security
        $entry.psbase.CommitChanges()
    }
}

function Ensure-DomainLocalGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Path
    )

    $dn = "CN=$Name,$Path"
    try {
        $group = Get-ADGroup -Identity $dn -ErrorAction Stop
    } catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
        $group = $null
    }

    if ($null -eq $group) {
        $group = New-ADGroup -Name $Name -SamAccountName $Name -GroupScope DomainLocal -GroupCategory Security -Path $Path -PassThru
    }

    return $group
}

function New-SamAccountName {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$BaseName,

        [int]$MaxLength = 20
    )

    if ($BaseName.Length -le $MaxLength) {
        return $BaseName
    }

    $hashProvider = [System.Security.Cryptography.SHA1]::Create()
    try {
        $hashBytes = $hashProvider.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($BaseName))
    } finally {
        $hashProvider.Dispose()
    }

    $hash = [System.BitConverter]::ToString($hashBytes).Replace("-", "")
    $prefixLength = [Math]::Min([Math]::Max(0, $MaxLength - 10), $BaseName.Length)
    $prefix = $BaseName.Substring(0, $prefixLength)
    $suffixLength = $MaxLength - $prefix.Length
    return $prefix + $hash.Substring(0, $suffixLength)
}

function Set-TrusteeAccessRule {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$TargetDistinguishedName,

        [Parameter(Mandatory)]
        [System.Security.Principal.SecurityIdentifier]$TrusteeSid,

        [Parameter(Mandatory)]
        [System.DirectoryServices.ActiveDirectoryRights]$Rights,

        [Guid]$ObjectType = [Guid]::Empty
    )

    $entry = [ADSI]"LDAP://$TargetDistinguishedName"
    $security = $entry.psbase.ObjectSecurity
    $existingRules = $security.GetAccessRules($true, $true, [System.Security.Principal.SecurityIdentifier]) |
        Where-Object {
            $_.IdentityReference -eq $TrusteeSid -and
            $_.ActiveDirectoryRights -eq $Rights -and
            $_.ObjectType -eq $ObjectType -and
            $_.AccessControlType -eq [System.Security.AccessControl.AccessControlType]::Allow
        }

    foreach ($rule in $existingRules) {
        $security.RemoveAccessRuleSpecific($rule) | Out-Null
    }

    $ace = New-Object System.DirectoryServices.ActiveDirectoryAccessRule(
        $TrusteeSid,
        $Rights,
        [System.Security.AccessControl.AccessControlType]::Allow,
        $ObjectType
    )

    $security.AddAccessRule($ace)
    $entry.psbase.ObjectSecurity = $security
    $entry.psbase.CommitChanges()
}

$validatedWritesOu = "OU=ValidatedWrites,$ParentOu"
try {
    $ou = Get-ADOrganizationalUnit -Identity $validatedWritesOu -ErrorAction Stop
} catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
    $ou = $null
}
if (-not $ou) {
    $ou= New-ADOrganizationalUnit -Name "ValidatedWrites" -Path $ParentOu -ProtectedFromAccidentalDeletion $false -PassThru
} elseif ($ou.ProtectedFromAccidentalDeletion) {
    Set-ADOrganizationalUnit -Identity oup -ProtectedFromAccidentalDeletion $false
}

Enable-DaclProtection -DistinguishedName $ou.DistinguishedName

$testObjects = @(
    "user",
    "computer",
    "group",   # Domain Local
    "msDS-GroupManagedServiceAccount" # abreviated as 'gmsa'
)

$validatedWriteNames = @(
    "ValidatedDNSHostName",
    "ValidatedAdditionalDNS",
    "ValidatedSPN",    
    "ValildatedWriteComputer",
    "AllValidatedWrites"
)

$trustees = @(
    "VWTrusteeGroup",  # abreviated as TG
    "NT AUTHORITY\SELF" # abreviated as S
)

$domainInfo = Get-ADDomain
$dnsRoot = $domainInfo.DNSRoot
$domainControllersGroup = Get-ADGroup -Identity "Domain Controllers" -ErrorAction Stop
$testObjectTokens = @{
    "msDS-GroupManagedServiceAccount" = "gmsa"
}
$trusteeTokens = @{
    "VWTrusteeGroup" = "TG"
    "NT AUTHORITY\SELF" = "S"
}

$defaultUserPasswordPlain = 'TempP@ssw0rd123!'

$objectCache = @{}
foreach ($validatedWriteName in $validatedWriteNames) {
    foreach ($testObject in $testObjects) {
        foreach ($trustee in $trustees) {
            $testToken = if ($testObjectTokens.ContainsKey($testObject)) { $testObjectTokens[$testObject] } else { $testObject }
            $trusteeToken = if ($trusteeTokens.ContainsKey($trustee)) { $trusteeTokens[$trustee] } else { $trustee }
            $objectName = "{0}_{1}_{2}" -f $validatedWriteName, $testToken, $trusteeToken
            $distinguishedName = "CN=$objectName,$($ou.DistinguishedName)"
            $object = $null

            switch ($testObject.ToLowerInvariant()) {
                'user' {
                    try {
                        $object = Get-ADUser -Identity $distinguishedName -ErrorAction Stop
                    } catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
                        $object = $null
                    }

                    if (-not $object) {
                        $samAccountName = New-SamAccountName -BaseName $objectName
                        $upn = "$samAccountName@$dnsRoot"
                        $securePassword = ConvertTo-SecureString -String $defaultUserPasswordPlain -AsPlainText -Force
                        $object = New-ADUser -Name $objectName -SamAccountName $samAccountName -UserPrincipalName $upn -Path $ou.DistinguishedName -AccountPassword $securePassword -Enabled $true -PassThru
                    }
                }
                'computer' {
                    try {
                        $object = Get-ADComputer -Identity $distinguishedName -ErrorAction Stop
                    } catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
                        $object = $null
                    }

                    if (-not $object) {
                        $samAccountName = New-SamAccountName -BaseName $objectName -MaxLength 15
                        $object = New-ADComputer -Name $objectName -SamAccountName $samAccountName -Path $ou.DistinguishedName -Enabled $true -PassThru
                    }
                }
                'group' {
                    try {
                        $object = Get-ADGroup -Identity $distinguishedName -ErrorAction Stop
                    } catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
                        $object = $null
                    }

                    if (-not $object) {
                        $samAccountName = New-SamAccountName -BaseName $objectName
                        $object = New-ADGroup -Name $objectName -SamAccountName $samAccountName -GroupScope DomainLocal -GroupCategory Security -Path $ou.DistinguishedName -PassThru
                    }
                }
                'msds-groupmanagedserviceaccount' {
                    try {
                        $object = Get-ADServiceAccount -Identity $distinguishedName -ErrorAction Stop
                    } catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
                        $object = $null
                    }

                    if (-not $object) {
                        $samAccountName = New-SamAccountName -BaseName $objectName -MaxLength 15
                        $dnsHostName = "{0}.{1}" -f $objectName.ToLowerInvariant(), $dnsRoot
                        $object = New-ADServiceAccount -Name $objectName -SamAccountName $samAccountName -DNSHostName $dnsHostName -PrincipalsAllowedToRetrieveManagedPassword $domainControllersGroup.DistinguishedName -Path $ou.DistinguishedName -PassThru
                    }
                }
                default {
                    throw "Unsupported test object type '$testObject'."
                }
            }

            $objectCache[$objectName] = $object
        }
    }
}

Ensure-DomainLocalGroup -Name "VWTrusteeGroup" -Path $ou.DistinguishedName

if ($PSBoundParameters.ContainsKey("TrusteeUser")) {
    try {
        Add-ADGroupMember -Identity "VWTrusteeGroup" -Members $TrusteeUser -ErrorAction Stop
    } catch {
        throw "Unable to add specified trustee user '$TrusteeUser' to VWTrusteeGroup: $($_.Exception.Message)"
    }
}

$selfSid = 'S-1-5-10'
$trusteeSid = (Get-ADGroup -Identity "VWTrusteeGroup" -Properties objectSid).SID.Value

$membershipPropertySetGuid = Get-ControlAccessGuid -DisplayName "Membership"
$memberAttributeGuid = Get-SchemaGuid -LdapDisplayName "member"

$SelfMembershipGuid = Get-ControlAccessGuid -DisplayName "Self-Membership"
$ValidatedDNSHostNameGuid = Get-ControlAccessGuid -DisplayName "Validated-DNS-Host-Name"
$ValidatedAdditionalDNSGuid = Get-ControlAccessGuid -DisplayName "Validated-MS-DS-Additional-DNS-Host-Name"
$ValidatedSPNGuid = Get-ControlAccessGuid -DisplayName "Validated-SPN"
$ValildatedWriteComputerGuid = Get-ControlAccessGuid -DisplayName "DS-Validated-Write-Computer"

$aceDefinitions = @(
    @{ Name = "ValidatedDNSHostName"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $ValidatedDNSHostNameGuid},   
    @{ Name = "ValidatedAdditionalDNS"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $ValidatedAdditionalDNSGuid},  
    @{ Name = "ValidatedSPN"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $ValidatedSPNGuid},  
    @{ Name = "ValildatedWriteComputer"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $ValildatedWriteComputerGuid},                         
    @{ Name = "AllValidatedWrites"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self}   
)

$aceDefinitionLookup = @{}
foreach ($definition in $aceDefinitions) {
    $aceDefinitionLookup[$definition.Name] = $definition
}

$trusteeSidLookup = @{
    'TG' = $trusteeSid
    'S' = $selfSid
}

foreach ($objectEntry in $objectCache.GetEnumerator()) {
    $nameSegments = $objectEntry.Key -split "_"
    if ($nameSegments.Count -lt 3) {
        continue
    }

    $definitionName = $nameSegments[0]
    $trusteeToken = $nameSegments[-1]
    if (-not $aceDefinitionLookup.ContainsKey($definitionName)) {
        continue
    }

    $targetDn = $objectEntry.Value.DistinguishedName
    if (-not $trusteeSidLookup.ContainsKey($trusteeToken)) {
        continue
    }

    $definition = $aceDefinitionLookup[$definitionName]
    $trusteeForToken = $trusteeSidLookup[$trusteeToken]
    $objectGuid = if ($definition.ContainsKey("ObjectGuid")) { $definition.ObjectGuid } else { [Guid]::Empty }
    Set-TrusteeAccessRule -TargetDistinguishedName $targetDn -TrusteeSid $trusteeForToken -Rights $definition.Rights -ObjectType $objectGuid
}

$controlUserDn = "CN=VWControlUser,$($ou.DistinguishedName)"
try {
    $controlUser = Get-ADUser -Identity $controlUserDn -Properties Enabled -ErrorAction Stop
} catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
    $controlUser = $null
}
if (-not $controlUser) {
    $password = Read-Host -Prompt "Enter password for ControlUser" -AsSecureString
    New-ADUser -Name "VWControlUser" -SamAccountName "VWControlUser" -UserPrincipalName "VWControlUser@$(Get-ADDomain).DNSRoot" -AccountPassword $password -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires $false -Path $ou.DistinguishedName
} else {
    if (-not $controlUser.Enabled) {
        Set-ADUser -Identity $controlUser -Enabled $true
        Write-Verbose "VWControlUser re-enabled."
    } else {
        Write-Verbose "VWControlUser already exists in $($ou.DistinguishedName)."
    }
}
