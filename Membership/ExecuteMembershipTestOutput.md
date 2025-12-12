**********************
Windows PowerShell transcript start
Start time: 20251212085039
Username: CORP1\StdUser
RunAs User: CORP1\StdUser
Configuration Name: 
Machine: CORP1-WS01 (Microsoft Windows NT 10.0.19045.0)
Host Application: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command Import-Module 'c:\Users\StdUser\.vscode\extensions\ms-vscode.powershell-2025.4.0\modules\PowerShellEditorServices\PowerShellEditorServices.psd1'; Start-EditorServices -HostName 'Visual Studio Code Host' -HostProfileId 'Microsoft.VSCode' -HostVersion '2025.4.0' -BundledModulesPath 'c:\Users\StdUser\.vscode\extensions\ms-vscode.powershell-2025.4.0\modules' -EnableConsoleRepl -StartupBanner "PowerShell Extension v2025.4.0
Copyright (c) Microsoft Corporation.

https://aka.ms/vscode-powershell
Type 'help' to get help.
" -LogLevel 'Warning' -LogPath 'c:\Users\StdUser\AppData\Roaming\Code\logs\20251211T210451\window1\exthost\ms-vscode.powershell' -SessionDetailsPath 'c:\Users\StdUser\AppData\Roaming\Code\User\globalStorage\ms-vscode.powershell\sessions\PSES-VSCode-5856-850608.json' -FeatureFlags @() 
Process ID: 16984
PSVersion: 5.1.19041.6328
PSEdition: Desktop
PSCompatibleVersions: 1.0, 2.0, 3.0, 4.0, 5.0, 5.1.19041.6328
BuildVersion: 10.0.19041.6328
CLRVersion: 4.0.30319.42000
WSManStackVersion: 3.0
PSRemotingProtocolVersion: 2.3
SerializationVersion: 1.1.0.1
**********************
Transcript started, output file is C:\homelab\MembershipTest-20251212085039.log
============================================================
Initial TrusteeGroup membership:
TrusteeGroup Membership:

Name          SamAccountName ObjectClass
----          -------------- -----------
Standard User StdUser        user


============================================================
Current user token information:
User Identity: CORP1\StdUser
Authentication Type: Kerberos
Impersonation Level: None
SID: S-1-5-21-1974516972-3116780949-2584384717-1129
Group Membership (token):

Name                                       SID                                            Attributes
----                                       ---                                            ----------
CORP1\Domain Users                         S-1-5-21-1974516972-3116780949-2584384717-513
Everyone                                   S-1-1-0
BUILTIN\Administrators                     S-1-5-32-544
BUILTIN\Remote Desktop Users               S-1-5-32-555
BUILTIN\Users                              S-1-5-32-545
NT AUTHORITY\REMOTE INTERACTIVE LOGON      S-1-5-14
NT AUTHORITY\INTERACTIVE                   S-1-5-4
NT AUTHORITY\Authenticated Users           S-1-5-11
NT AUTHORITY\This Organization             S-1-5-15
LOCAL                                      S-1-2-0
CORP1\OPE                                  S-1-5-21-1974516972-3116780949-2584384717-1253
Authentication authority asserted identity S-1-18-1
CORP1\TrusteeGroup                         S-1-5-21-1974516972-3116780949-2584384717-1281


============================================================
Processing group: GenericAllAll
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-1974516972-3116780949-2584384717-1281)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                          GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericAllAll,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericAllAll,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
ControlUser   ControlUser    user
Standard User StdUser        user


============================================================
Processing group: GenericWriteAll
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;SWWPRC;;;S-1-5-21-1974516972-3116780949-2584384717-1281)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                        GenericWrite 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericWriteAll,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericWriteAll,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
ControlUser   ControlUser    user
Standard User StdUser        user


============================================================
Processing group: WritePropertyAll
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;WP;;;S-1-5-21-1974516972-3116780949-2584384717-1281)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                       WriteProperty 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=WritePropertyAll,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=WritePropertyAll,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
ControlUser   ControlUser    user
Standard User StdUser        user


============================================================
Processing group: GenericAllMembershipPropertySet
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;CCDCLCSWRPWPDTLOCRSDRCWDWO;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;;S-1-5-21-1974516972-3116780949-2584384717-1281)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                          GenericAll bc0ac240-79a9-11d0-9020-00c04fc2d4cf 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericAllMembershipPropertySet,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericAllMembershipPropertySet,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
ControlUser   ControlUser    user
Standard User StdUser        user


============================================================
Processing group: GenericWriteMembershipPropertySet
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;SWWPRC;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;;S-1-5-21-1974516972-3116780949-2584384717-1281)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                        GenericWrite bc0ac240-79a9-11d0-9020-00c04fc2d4cf 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericWriteMembershipPropertySet,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericWriteMembershipPropertySet,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
ControlUser   ControlUser    user
Standard User StdUser        user


============================================================
Processing group: WritePropertyMembershipPropertySet
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;;S-1-5-21-1974516972-3116780949-2584384717-1281)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                       WriteProperty bc0ac240-79a9-11d0-9020-00c04fc2d4cf 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=WritePropertyMembershipPropertySet,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=WritePropertyMembershipPropertySet,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
ControlUser   ControlUser    user
Standard User StdUser        user


============================================================
Processing group: GenericAllPropertyMember
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;CCDCLCSWRPWPDTLOCRSDRCWDWO;bf9679c0-0de6-11d0-a285-00aa003049e2;;S-1-5-21-1974516972-3116780949-2584384717-1281)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                          GenericAll bf9679c0-0de6-11d0-a285-00aa003049e2 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericAllPropertyMember,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericAllPropertyMember,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
ControlUser   ControlUser    user
Standard User StdUser        user


============================================================
Processing group: GenericWritePropertyMember
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;SWWPRC;bf9679c0-0de6-11d0-a285-00aa003049e2;;S-1-5-21-1974516972-3116780949-2584384717-1281)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                        GenericWrite bf9679c0-0de6-11d0-a285-00aa003049e2 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericWritePropertyMember,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=GenericWritePropertyMember,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
ControlUser   ControlUser    user
Standard User StdUser        user


============================================================
Processing group: WritePropertyMember
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WP;bf9679c0-0de6-11d0-a285-00aa003049e2;;S-1-5-21-1974516972-3116780949-2584384717-1281)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                       WriteProperty bf9679c0-0de6-11d0-a285-00aa003049e2 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=WritePropertyMember,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=WritePropertyMember,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
ControlUser   ControlUser    user
Standard User StdUser        user


============================================================
Processing group: AllValidatedWrites
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;SW;;;S-1-5-21-1974516972-3116780949-2584384717-1281)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                                Self 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=AllValidatedWrites,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=AllValidatedWrites,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
PS>TerminatingError(Add-ADGroupMember): "Insufficient access rights to perform the operation"
WARNING:     Failed to add ControlUser: Insufficient access rights to perform the operation
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
Standard User StdUser        user


============================================================
Processing group: SelfMembership
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;SW;bf9679c0-0de6-11d0-a285-00aa003049e2;;S-1-5-21-1974516972-3116780949-2584384717-1281)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                                Self bf9679c0-0de6-11d0-a285-00aa003049e2 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=SelfMembership,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=SelfMembership,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
PS>TerminatingError(Add-ADGroupMember): "Insufficient access rights to perform the operation"
WARNING:     Failed to add ControlUser: Insufficient access rights to perform the operation
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
Standard User StdUser        user


============================================================
Processing group: SelfMembershipPropertySet
SDDL:
O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a55-1e2f-11d0-9819-00aa0040529b;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;SW;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;;S-1-5-21-1974516972-3116780949-2584384717-1281)
Access Rules:

AccessControlType IdentityReference                ActiveDirectoryRights ObjectType                           InheritedObjectType                  IsInherited
----------------- -----------------                --------------------- ----------                           -------------------                  -----------
            Allow NT AUTHORITY\SELF                          GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users           GenericRead 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\SYSTEM                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-548                                GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\Domain Admins                         GenericAll 00000000-0000-0000-0000-000000000000 00000000-0000-0000-0000-000000000000       False
            Allow NT AUTHORITY\Authenticated Users         ExtendedRight ab721a55-1e2f-11d0-9819-00aa0040529b 00000000-0000-0000-0000-000000000000       False
            Allow S-1-5-32-560                              ReadProperty 46a9b11d-60ae-405a-b7e8-ff8a58d456d2 00000000-0000-0000-0000-000000000000       False
            Allow CORP1\TrusteeGroup                                Self bc0ac240-79a9-11d0-9020-00c04fc2d4cf 00000000-0000-0000-0000-000000000000       False


Current Membership:
    (No members)
Attempting to add Current User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=SelfMembershipPropertySet,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Success.
Attempting to add ControlUser (CN=ControlUser,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol) to CN=SelfMembershipPropertySet,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
PS>TerminatingError(Add-ADGroupMember): "Insufficient access rights to perform the operation"
WARNING:     Failed to add ControlUser: Insufficient access rights to perform the operation
Membership After Add Attempts:

Name          SamAccountName ObjectClass
----          -------------- -----------
Standard User StdUser        user


**********************
Windows PowerShell transcript end
End time: 20251212085050
**********************
