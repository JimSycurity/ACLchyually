<# TODO
  Write a properly formatted and documented PowerShell script that will test the following scenario:
  Configure and start a PowerShell transcript that will capture all test output.
  For each group in $groupNames:
    1. Output the security descriptor of the group in SDDL format
    2. Output the security desriptor of the group in .nTSecurityDescriptor.Access format
    3. Output current membership of the group. If there are no members, ensure that is shown.
    4. Attempt to add both the user running the script and the Active Directory user 'ControlUser' to the group. For each attempt, ensure the output is captured to the transcript.  Note: This should be done in such a way that any use of the Self-Membership validated write properly adds the current user if possible.
    5. Display membership of the group after attempting to add the users to the group.
  
  The OU where the groups and 'ControlUser' are located can be provided as a parameter to the script.  The groups and their permissions will have been created by the New-MembershipTest.ps1 script in the same directory path.
#>


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