<#
.SYNOPSIS
Creates a Membership OU test surface with predefined groups, ACEs, and a user.

.DESCRIPTION
Given a parent OU distinguished name, this script provisions an OU named
Membership, ensures its DACL is protected, creates a fixed set of domain local
groups, grants the TrusteeGroup tailored rights on each group, and creates a
ControlUser account with a prompted password inside the OU.

.PARAMETER ParentOu
DistinguishedName of the OU under which the Membership OU will be created.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$ParentOu
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
    $group = Get-ADGroup -Identity $dn -ErrorAction SilentlyContinue
    if (-not $group) {
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
    $ace = New-Object System.DirectoryServices.ActiveDirectoryAccessRule(
        $TrusteeSid,
        $Rights,
        [System.Security.AccessControl.AccessControlType]::Allow,
        $ObjectType
    )

    while ($security.RemoveAccessRule($ace)) { }
    $security.AddAccessRule($ace)
    $entry.psbase.ObjectSecurity = $security
    $entry.psbase.CommitChanges()
}

$membershipOu = "OU=Membership,$ParentOu"
$membership = Get-ADOrganizationalUnit -Identity $membershipOu -ErrorAction SilentlyContinue
if (-not $membership) {
    $membership = New-ADOrganizationalUnit -Name "Membership" -Path $ParentOu -ProtectedFromAccidentalDeletion $true -PassThru
} elseif (-not $membership.ProtectedFromAccidentalDeletion) {
    Set-ADOrganizationalUnit -Identity $membership -ProtectedFromAccidentalDeletion $true
}

Enable-DaclProtection -DistinguishedName $membership.DistinguishedName

$groupNames = @(
    "GenericAllAll",
    "GenericWriteAll",
    "WritePropertyAll",
    "GenericAllMembershipPropertySet",
    "GenericWriteMembershipPropertySet",    
    "WritePropertyMembershipPropertySet",
    "GenericAllPropertyMember",
    "GenericWritePropertyMember",        
    "WritePropertyMember",
    "AllValidatedWrites",
    "SelfMembership",
    "SelfMembershipPropertySet",    # Testing with property set on VW
    "SelfMemberProperty",           # Testing with Member attribute on VW   
    "TrusteeGroup"
)

$groupCache = @{}
foreach ($name in $groupNames) {
    $groupCache[$name] = Ensure-DomainLocalGroup -Name $name -Path $membership.DistinguishedName
}

$trusteeSid = $groupCache["TrusteeGroup"].SID
$membershipPropertySetGuid = Get-ControlAccessGuid -DisplayName "Membership"
$memberAttributeGuid = Get-SchemaGuid -LdapDisplayName "member"
$selfMembershipGuid = Get-ControlAccessGuid -DisplayName "Self-Membership"

$aceDefinitions = @(
    @{ Name = "GenericAllAll"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::GenericAll },
    @{ Name = "GenericWriteAll"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::GenericWrite },
    @{ Name = "WritePropertyAll"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::WriteProperty },
    @{ Name = "GenericAllMembershipPropertySet"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::GenericAll; ObjectGuid = $membershipPropertySetGuid  },    
    @{ Name = "GenericWriteMembershipPropertySet"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::GenericWrite; ObjectGuid = $membershipPropertySetGuid  },    
    @{ Name = "WritePropertyMembershipPropertySet"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::WriteProperty; ObjectGuid = $membershipPropertySetGuid },
    @{ Name = "GenericAllPropertyMember"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::GenericAll; ObjectGuid = $memberAttributeGuid },    
    @{ Name = "GenericWritePropertyMember"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::GenericWrite; ObjectGuid = $memberAttributeGuid },    
    @{ Name = "WritePropertyMember"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::WriteProperty; ObjectGuid = $memberAttributeGuid },
    @{ Name = "AllValidatedWrites"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self },
    @{ Name = "SelfMembership"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $selfMembershipGuid },
    @{ Name = "SelfMembershipPropertySet"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $membershipPropertySetGuid }, # Testing with property set on VW
    @{ Name = "SelfMemberProperty"; Rights = [System.DirectoryServices.ActiveDirectoryRights]::Self; ObjectGuid = $memberAttributeGuid  }         
)

foreach ($definition in $aceDefinitions) {
    $targetDn = $groupCache[$definition.Name].DistinguishedName
    $objectGuid = if ($definition.ContainsKey("ObjectGuid")) { $definition.ObjectGuid } else { [Guid]::Empty }
    Set-TrusteeAccessRule -TargetDistinguishedName $targetDn -TrusteeSid $trusteeSid -Rights $definition.Rights -ObjectType $objectGuid
}

$controlUserDn = "CN=ControlUser,$($membership.DistinguishedName)"
$controlUser = Get-ADUser -Identity $controlUserDn -ErrorAction SilentlyContinue
if (-not $controlUser) {
    $password = Read-Host -Prompt "Enter password for ControlUser" -AsSecureString
    New-ADUser -Name "ControlUser" -SamAccountName "ControlUser" -UserPrincipalName "ControlUser@$(Get-ADDomain).DNSRoot" -AccountPassword $password -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires $false -Path $membership.DistinguishedName
} else {
    Write-Verbose "ControlUser already exists in $($membership.DistinguishedName)."
}

