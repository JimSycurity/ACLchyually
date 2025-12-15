<#
.SYNOPSIS
Creates a ValidatedWrite OU test surface with predefined tesst users/computers/groups,
ACEs, and a user.

.DESCRIPTION
Given a parent OU distinguished name, this script provisions an OU named
ValidatedWrites, ensures its DACL is protected, creates a fixed set of users, 
computers, and domain local groups. Then grants the TrusteeGroup tailored 
rights on each test object, and creates a ControlUser account with a prompted 
password inside the OU.

.PARAMETER ParentOu
DistinguishedName of the OU under which the ValidatedWrite OU will be created.

.PARAMETER TrusteeUser
Optional AD user identity to add to the TrusteeGroup during provisioning.
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
    "SelfMembership",
    "ValidatedDNSHostName",
    "ValidatedAdditionalDNS",
    "ValidatedBehaviorVersion",
    "ValidatedSPN",    
    "ValildatedWriteComputer",
    "AllValidatedWrites"
)

$trustees = @(
    "TrusteeGroup",  # abreviated as TG
    "NT AUTHORITY\SELF" # abreviated as S
)

<# TODO Modify so that instead of iterating through groupNames to create groups the code will iterate
 through validatedWriteNames and then nested iterate through $testObjects and then an additional nested
 iteration over $trustees to create an object of $testObject type that is named 
 '$ValidatedWriteName_$testObject_$trustee' where $testObject and $trustee may be an abreviation if the comments 
 on the array define it as such. 

 We want to keep the $objectCache in play for future iterations.


#>
$objectCache = @{}
foreach ($name in $groupNames) {
    $objectCache[$name] = Ensure-DomainLocalGroup -Name $name -Path $ou.DistinguishedName
}

# TODO: Create the domain local TrusteeGroup regardless of its inclusion in any array or not
if ($PSBoundParameters.ContainsKey("TrusteeUser")) {
    try {
        Add-ADGroupMember -Identity $objectCache["TrusteeGroup"].DistinguishedName -Members $TrusteeUser -ErrorAction Stop
    } catch {
        throw "Unable to add specified trustee user '$TrusteeUser' to TrusteeGroup: $($_.Exception.Message)"
    }
}

$selfSid = 'S-1-5-10'
$trusteeSid = $objectCache["TrusteeGroup"].SID

$membershipPropertySetGuid = Get-ControlAccessGuid -DisplayName "Membership"
$memberAttributeGuid = Get-SchemaGuid -LdapDisplayName "member"

$SelfMembershipGuid = Get-ControlAccessGuid -DisplayName "Self-Membership"
$ValidatedDNSHostNameGuid = Get-ControlAccessGuid -DisplayName "Validated-DNS-Host-Name"
$ValidatedAdditionalDNSGuid = Get-ControlAccessGuid -DisplayName "Validated-MS-DS-Additional-DNS-Host-Name"
$ValidatedBehaviorVersionGuid = Get-ControlAccessGuid -DisplayName "Validated-MS-DS-Behavior-Version"
$ValidatedSPNGuid = Get-ControlAccessGuid -DisplayName "Validated-SPN"
$ValildatedWriteComputerGuid = Get-ControlAccessGuid -DisplayName "DS-Validated-Write-Computer"

$aceDefinitions = @(
    @{ Name = "SelfMembership"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $selfMembershipGuid},
    @{ Name = "ValidatedDNSHostName"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $selfMembershipGuid},   
    @{ Name = "ValidatedAdditionalDNS"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $selfMembershipGuid},   
    @{ Name = "ValidatedBehaviorVersion"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $selfMembershipGuid}, 
    @{ Name = "ValidatedSPN"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $selfMembershipGuid},  
    @{ Name = "ValildatedWriteComputer"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $selfMembershipGuid},                         
    @{ Name = "AllValidatedWrites"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self}   
)

<# TODO  Iterate through the $objectCache instead of $aceDefinitions and add the corresponding $aceDefinition for the $objectCache item
 with a TrusteeSid that corresponds to the _$trustee at the end of the objectCache name.

#>
foreach ($definition in $aceDefinitions) {
    $targetDn = $objectCache[$definition.Name].DistinguishedName
    $objectGuid = if ($definition.ContainsKey("ObjectGuid")) { $definition.ObjectGuid } else { [Guid]::Empty }
    Set-TrusteeAccessRule -TargetDistinguishedName $targetDn -TrusteeSid $($definition.Trustee) -Rights $definition.Rights -ObjectType $objectGuid
}

$controlUserDn = "CN=ControlUser,$($ou.DistinguishedName)"
try {
    $controlUser = Get-ADUser -Identity $controlUserDn -Properties Enabled -ErrorAction Stop
} catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
    $controlUser = $null
}
if (-not $controlUser) {
    $password = Read-Host -Prompt "Enter password for ControlUser" -AsSecureString
    New-ADUser -Name "ControlUser" -SamAccountName "ControlUser" -UserPrincipalName "ControlUser@$(Get-ADDomain).DNSRoot" -AccountPassword $password -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires $false -Path $ou.DistinguishedName
} else {
    if (-not $controlUser.Enabled) {
        Set-ADUser -Identity $controlUser -Enabled $true
        Write-Verbose "ControlUser re-enabled."
    } else {
        Write-Verbose "ControlUser already exists in $($ou.DistinguishedName)."
    }
}
