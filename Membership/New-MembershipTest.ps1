<# TODO 
Create a properly formed and documented PowerShell script that will create a test scenario in Active Directory whereby:
 - An OU path is provided as a parameter in DistinguishedName format
 - If it doesn't already exist, a 'Membership' OU will be created in that OU. The Membership OU will have the DACL_Protected flag enabled.
 - In the new 'Membership' OU, a set of domain local groups will be created:
    - GenericAll
    - GenericWrite
    - WritePropertyAll
    - WritePropertyMembershipPropertySet
    - WritePropertyMember
    - AllValidatedWrites
    - SelfMembership
    - TrusteeGroup
 - For each of these groups except for TrusteeGroup, an ACE will be added to the group granting TrusteeGroup the specific access specified by the group name.  For example, the GenericWrite group will have an ACE added to the DACL which grants TrusteeGroup GenericWrite allow ACE on the group.
 - In the 'Membership' OU create a user called "ControlUser" with a prompted for password.


#>