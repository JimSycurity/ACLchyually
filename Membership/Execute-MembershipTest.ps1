param(
    [string]$OrganizationalUnitDN = "OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol",
    [string]$TranscriptPath
)

if ([string]::IsNullOrWhiteSpace($OrganizationalUnitDN)) {
    throw "OrganizationalUnitDN must be provided."
}

if (-not $TranscriptPath) {
    $timestamp = Get-Date -Format "yyyyMMddHHmmss"
    $TranscriptPath = Join-Path -Path $PSScriptRoot -ChildPath "MembershipTest-$timestamp.log"
}

$transcriptDirectory = Split-Path -Parent $TranscriptPath
if ($transcriptDirectory -and -not (Test-Path -LiteralPath $transcriptDirectory)) {
    New-Item -Path $transcriptDirectory -ItemType Directory -Force | Out-Null
}

Import-Module ActiveDirectory -ErrorAction Stop

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
    "SelfMembershipPropertySet",
    "SelfMemberProperty"
)

$currentUserResolved = $null
try {
    $currentUserSid = [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
    $currentUserResolved = Get-ADUser -Identity $currentUserSid -ErrorAction Stop
} catch {
    throw "Unable to resolve current user in Active Directory: $($_.Exception.Message)"
}

$currentUserIdentity = $currentUserResolved.DistinguishedName
$controlUserDN = "CN=ControlUser,$OrganizationalUnitDN"
$transcriptStarted = $false

function Write-GroupMembership {
    param(
        [string]$GroupIdentity,
        [string]$Heading
    )

    Write-Host $Heading
    try {
        $members = Get-ADGroupMember -Identity $GroupIdentity -ErrorAction Stop
        if (-not $members) {
            Write-Host "    (No members)"
            return
        }

        $members | Select-Object Name, SamAccountName, ObjectClass |
            Format-Table -AutoSize
    } catch {
        Write-Warning ("Unable to enumerate members for {0}: {1}" -f $GroupIdentity, $_.Exception.Message)
    }
}

function Write-SecurityDescriptorDetails {
    param(
        [string]$DistinguishedName
    )

    try {
        $adObject = Get-ADObject -Identity $DistinguishedName -Properties nTSecurityDescriptor -ErrorAction Stop
        $descriptor = $adObject.nTSecurityDescriptor
        if (-not $descriptor) {
            Write-Warning "No security descriptor returned for $DistinguishedName."
            return
        }

        Write-Host "SDDL:"
        Write-Output ($descriptor.GetSecurityDescriptorSddlForm("All"))
        Write-Host "Access Rules:"
        $descriptor.Access |
            Select-Object AccessControlType, IdentityReference, ActiveDirectoryRights, ObjectType, InheritedObjectType, IsInherited |
            Format-Table -AutoSize
    } catch {
        Write-Warning ("Unable to read security descriptor for {0}: {1}" -f $DistinguishedName, $_.Exception.Message)
    }
}

function Add-MemberWithLogging {
    param(
        [string]$GroupIdentity,
        [string]$MemberIdentity,
        [string]$Label
    )

    Write-Host "Attempting to add $Label ($MemberIdentity) to $GroupIdentity"
    try {
        Add-ADGroupMember -Identity $GroupIdentity -Members $MemberIdentity -ErrorAction Stop
        Write-Host "    Success."
    } catch {
        Write-Warning ("    Failed to add {0}: {1}" -f $Label, $_.Exception.Message)
    }
}

try {
    Start-Transcript -Path $TranscriptPath -Force 
    $transcriptStarted = $true

    foreach ($groupName in $groupNames) {
        $groupDN = "CN=$groupName,$OrganizationalUnitDN"
        Write-Host ("=" * 60)
        Write-Host "Processing group: $groupName"

        Write-SecurityDescriptorDetails -DistinguishedName $groupDN
        Write-GroupMembership -GroupIdentity $groupDN -Heading "Current Membership:"

        Add-MemberWithLogging -GroupIdentity $groupDN -MemberIdentity $currentUserIdentity -Label "Current User"
        Add-MemberWithLogging -GroupIdentity $groupDN -MemberIdentity $controlUserDN -Label "ControlUser"

        Write-GroupMembership -GroupIdentity $groupDN -Heading "Membership After Add Attempts:"
    }
} finally {
    if ($transcriptStarted) {
        Stop-Transcript 
    }
}
