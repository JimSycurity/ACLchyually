**********************
Windows PowerShell transcript start
Start time: 20251215205259
Username: CORP1\StdUser
RunAs User: CORP1\StdUser
Configuration Name: 
Machine: CORP1-WS01 (Microsoft Windows NT 10.0.19045.0)
Host Application: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command Import-Module 'c:\Users\StdUser\.vscode\extensions\ms-vscode.powershell-2025.4.0\modules\PowerShellEditorServices\PowerShellEditorServices.psd1'; Start-EditorServices -HostName 'Visual Studio Code Host' -HostProfileId 'Microsoft.VSCode' -HostVersion '2025.4.0' -BundledModulesPath 'c:\Users\StdUser\.vscode\extensions\ms-vscode.powershell-2025.4.0\modules' -EnableConsoleRepl -StartupBanner "PowerShell Extension v2025.4.0
Copyright (c) Microsoft Corporation.

https://aka.ms/vscode-powershell
Type 'help' to get help.
" -LogLevel 'Warning' -LogPath 'c:\Users\StdUser\AppData\Roaming\Code\logs\20251215T205235\window1\exthost\ms-vscode.powershell' -SessionDetailsPath 'c:\Users\StdUser\AppData\Roaming\Code\User\globalStorage\ms-vscode.powershell\sessions\PSES-VSCode-8060-976236.json' -FeatureFlags @() 
Process ID: 8572
PSVersion: 5.1.19041.6328
PSEdition: Desktop
PSCompatibleVersions: 1.0, 2.0, 3.0, 4.0, 5.0, 5.1.19041.6328
BuildVersion: 10.0.19041.6328
CLRVersion: 4.0.30319.42000
WSManStackVersion: 3.0
PSRemotingProtocolVersion: 2.3
SerializationVersion: 1.1.0.1
**********************
Transcript started, output file is C:\homelab\ValidatedWriteTest-20251215205258.log
============================================================
VWInitial TrusteeGroup membership:
VWTrusteeGroup Membership:
    Standard User (CN=Standard User,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol)
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
CORP1\VWTrusteeGroup                       S-1-5-21-1974516972-3116780949-2584384717-1575


============================================================
Processing AllValidatedWrites_computer_S
DistinguishedName: CN=AllValidatedWrites_computer_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on AllValidatedWrites_computer_S: Insufficient access rights to perform the operation
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on AllValidatedWrites_computer_S: Insufficient access rights to perform the operation
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on AllValidatedWrites_computer_S (value: TEST/allva290985653e): Insufficient access rights to perform the operation
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on AllValidatedWrites_computer_S: Insufficient access rights to perform the operation
============================================================
Processing AllValidatedWrites_computer_TG
DistinguishedName: CN=AllValidatedWrites_computer_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
    Successfully set dNSHostName to allvaf5c82d8b58.corp1.lab.home-labs.lol.
PS>TerminatingError(Set-ADObject): "The attribute syntax specified to the directory service is invalid"
WARNING:     Unable to revert dNSHostName on AllValidatedWrites_computer_TG: The attribute syntax specified to the directory service is invalid
- Running ValidatedAdditionalDNS test
    Added msDS-AdditionalDnsHostName value allvalidatedwrites_computer_tg-additional-8201.corp1.lab.home-labs.lol.
    Removed temporary msDS-AdditionalDnsHostName value.
- Running ValidatedSPN test
    Added SPN TEST/allvaf5c82d8b58.
    Removed temporary SPN.
- Running ValildatedWriteComputer test
    Added placeholder msDS-KeyCredentialLink.
    Removed placeholder msDS-KeyCredentialLink to revert state.
============================================================
Processing AllValidatedWrites_gmsa_S
DistinguishedName: CN=AllValidatedWrites_gmsa_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on AllValidatedWrites_gmsa_S: Insufficient access rights to perform the operation
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on AllValidatedWrites_gmsa_S: Insufficient access rights to perform the operation
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on AllValidatedWrites_gmsa_S (value: TEST/allvaa69c45513e): Insufficient access rights to perform the operation
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on AllValidatedWrites_gmsa_S: Insufficient access rights to perform the operation
============================================================
Processing AllValidatedWrites_gmsa_TG
DistinguishedName: CN=AllValidatedWrites_gmsa_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
    Successfully set dNSHostName to allvaa5066d6a37.corp1.lab.home-labs.lol.
PS>TerminatingError(Set-ADObject): "The attribute syntax specified to the directory service is invalid"
WARNING:     Unable to revert dNSHostName on AllValidatedWrites_gmsa_TG: The attribute syntax specified to the directory service is invalid
- Running ValidatedAdditionalDNS test
    Added msDS-AdditionalDnsHostName value allvalidatedwrites_gmsa_tg-additional-1599.corp1.lab.home-labs.lol.
    Removed temporary msDS-AdditionalDnsHostName value.
- Running ValidatedSPN test
    Added SPN TEST/allvaa5066d6a37.
    Removed temporary SPN.
- Running ValildatedWriteComputer test
    Added placeholder msDS-KeyCredentialLink.
    Removed placeholder msDS-KeyCredentialLink to revert state.
============================================================
Processing AllValidatedWrites_group_S
DistinguishedName: CN=AllValidatedWrites_group_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on AllValidatedWrites_group_S: Insufficient access rights to perform the operation
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on AllValidatedWrites_group_S: Insufficient access rights to perform the operation
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on AllValidatedWrites_group_S (value: TEST/allvalidat7f3da3d3d7): Insufficient access rights to perform the operation
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on AllValidatedWrites_group_S: Insufficient access rights to perform the operation
============================================================
Processing AllValidatedWrites_group_TG
DistinguishedName: CN=AllValidatedWrites_group_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on AllValidatedWrites_group_TG: Insufficient access rights to perform the operation
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on AllValidatedWrites_group_TG: Insufficient access rights to perform the operation
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on AllValidatedWrites_group_TG (value: TEST/allvalidatb813b2a261): Insufficient access rights to perform the operation
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on AllValidatedWrites_group_TG: Insufficient access rights to perform the operation
============================================================
Processing AllValidatedWrites_user_S
DistinguishedName: CN=AllValidatedWrites_user_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on AllValidatedWrites_user_S: Insufficient access rights to perform the operation
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on AllValidatedWrites_user_S: Insufficient access rights to perform the operation
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on AllValidatedWrites_user_S (value: TEST/allvalidat5eb7b938e5): Insufficient access rights to perform the operation
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on AllValidatedWrites_user_S: Insufficient access rights to perform the operation
============================================================
Processing AllValidatedWrites_user_TG
DistinguishedName: CN=AllValidatedWrites_user_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on AllValidatedWrites_user_TG: Insufficient access rights to perform the operation
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on AllValidatedWrites_user_TG: Insufficient access rights to perform the operation
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on AllValidatedWrites_user_TG (value: TEST/allvalidatc55f2da856): Insufficient access rights to perform the operation
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on AllValidatedWrites_user_TG: Insufficient access rights to perform the operation
============================================================
Processing ValidatedAdditionalDNS_computer_S
DistinguishedName: CN=ValidatedAdditionalDNS_computer_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on ValidatedAdditionalDNS_computer_S: Insufficient access rights to perform the operation
============================================================
Processing ValidatedAdditionalDNS_computer_TG
DistinguishedName: CN=ValidatedAdditionalDNS_computer_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedAdditionalDNS test
    Added msDS-AdditionalDnsHostName value validatedadditionaldns_computer_tg-additional-1912.corp1.lab.home-labs.lol.
    Removed temporary msDS-AdditionalDnsHostName value.
============================================================
Processing ValidatedAdditionalDNS_gmsa_S
DistinguishedName: CN=ValidatedAdditionalDNS_gmsa_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on ValidatedAdditionalDNS_gmsa_S: Insufficient access rights to perform the operation
============================================================
Processing ValidatedAdditionalDNS_gmsa_TG
DistinguishedName: CN=ValidatedAdditionalDNS_gmsa_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedAdditionalDNS test
    Added msDS-AdditionalDnsHostName value validatedadditionaldns_gmsa_tg-additional-9751.corp1.lab.home-labs.lol.
    Removed temporary msDS-AdditionalDnsHostName value.
============================================================
Processing ValidatedAdditionalDNS_group_S
DistinguishedName: CN=ValidatedAdditionalDNS_group_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on ValidatedAdditionalDNS_group_S: Insufficient access rights to perform the operation
============================================================
Processing ValidatedAdditionalDNS_group_TG
DistinguishedName: CN=ValidatedAdditionalDNS_group_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on ValidatedAdditionalDNS_group_TG: Insufficient access rights to perform the operation
============================================================
Processing ValidatedAdditionalDNS_user_S
DistinguishedName: CN=ValidatedAdditionalDNS_user_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on ValidatedAdditionalDNS_user_S: Insufficient access rights to perform the operation
============================================================
Processing ValidatedAdditionalDNS_user_TG
DistinguishedName: CN=ValidatedAdditionalDNS_user_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add msDS-AdditionalDnsHostName on ValidatedAdditionalDNS_user_TG: Insufficient access rights to perform the operation
============================================================
Processing ValidatedDNSHostName_computer_S
DistinguishedName: CN=ValidatedDNSHostName_computer_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on ValidatedDNSHostName_computer_S: Insufficient access rights to perform the operation
============================================================
Processing ValidatedDNSHostName_computer_TG
DistinguishedName: CN=ValidatedDNSHostName_computer_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
    Successfully set dNSHostName to validaf2a9b4cce.corp1.lab.home-labs.lol.
PS>TerminatingError(Set-ADObject): "The attribute syntax specified to the directory service is invalid"
WARNING:     Unable to revert dNSHostName on ValidatedDNSHostName_computer_TG: The attribute syntax specified to the directory service is invalid
============================================================
Processing ValidatedDNSHostName_gmsa_S
DistinguishedName: CN=ValidatedDNSHostName_gmsa_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on ValidatedDNSHostName_gmsa_S: Insufficient access rights to perform the operation
============================================================
Processing ValidatedDNSHostName_gmsa_TG
DistinguishedName: CN=ValidatedDNSHostName_gmsa_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
    Successfully set dNSHostName to validc5a3747d77.corp1.lab.home-labs.lol.
PS>TerminatingError(Set-ADObject): "The attribute syntax specified to the directory service is invalid"
WARNING:     Unable to revert dNSHostName on ValidatedDNSHostName_gmsa_TG: The attribute syntax specified to the directory service is invalid
============================================================
Processing ValidatedDNSHostName_group_S
DistinguishedName: CN=ValidatedDNSHostName_group_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on ValidatedDNSHostName_group_S: Insufficient access rights to perform the operation
============================================================
Processing ValidatedDNSHostName_group_TG
DistinguishedName: CN=ValidatedDNSHostName_group_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on ValidatedDNSHostName_group_TG: Insufficient access rights to perform the operation
============================================================
Processing ValidatedDNSHostName_user_S
DistinguishedName: CN=ValidatedDNSHostName_user_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on ValidatedDNSHostName_user_S: Insufficient access rights to perform the operation
============================================================
Processing ValidatedDNSHostName_user_TG
DistinguishedName: CN=ValidatedDNSHostName_user_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to set dNSHostName on ValidatedDNSHostName_user_TG: Insufficient access rights to perform the operation
============================================================
Processing ValidatedSPN_computer_S
DistinguishedName: CN=ValidatedSPN_computer_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on ValidatedSPN_computer_S (value: TEST/valid5cc2702fc8): Insufficient access rights to perform the operation
============================================================
Processing ValidatedSPN_computer_TG
DistinguishedName: CN=ValidatedSPN_computer_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedSPN test
    Added SPN TEST/valid8a5e0ca9b7.
    Removed temporary SPN.
============================================================
Processing ValidatedSPN_gmsa_S
DistinguishedName: CN=ValidatedSPN_gmsa_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on ValidatedSPN_gmsa_S (value: TEST/valida283b154cf): Insufficient access rights to perform the operation
============================================================
Processing ValidatedSPN_gmsa_TG
DistinguishedName: CN=ValidatedSPN_gmsa_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedSPN test
    Added SPN TEST/valida74695e391.
    Removed temporary SPN.
============================================================
Processing ValidatedSPN_group_S
DistinguishedName: CN=ValidatedSPN_group_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on ValidatedSPN_group_S (value: TEST/validatedspn_group_s): Insufficient access rights to perform the operation
============================================================
Processing ValidatedSPN_group_TG
DistinguishedName: CN=ValidatedSPN_group_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on ValidatedSPN_group_TG (value: TEST/validatedse150e10044): Insufficient access rights to perform the operation
============================================================
Processing ValidatedSPN_user_S
DistinguishedName: CN=ValidatedSPN_user_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on ValidatedSPN_user_S (value: TEST/validatedspn_user_s): Insufficient access rights to perform the operation
============================================================
Processing ValidatedSPN_user_TG
DistinguishedName: CN=ValidatedSPN_user_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedSPN test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to add SPN on ValidatedSPN_user_TG (value: TEST/validatedspn_user_tg): Insufficient access rights to perform the operation
============================================================
Processing ValildatedWriteComputer_computer_S
DistinguishedName: CN=ValildatedWriteComputer_computer_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_computer_S: Insufficient access rights to perform the operation
============================================================
Processing ValildatedWriteComputer_computer_TG
DistinguishedName: CN=ValildatedWriteComputer_computer_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
    Added placeholder msDS-KeyCredentialLink.
    Removed placeholder msDS-KeyCredentialLink to revert state.
============================================================
Processing ValildatedWriteComputer_gmsa_S
DistinguishedName: CN=ValildatedWriteComputer_gmsa_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_gmsa_S: Insufficient access rights to perform the operation
============================================================
Processing ValildatedWriteComputer_gmsa_TG
DistinguishedName: CN=ValildatedWriteComputer_gmsa_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
    Added placeholder msDS-KeyCredentialLink.
    Removed placeholder msDS-KeyCredentialLink to revert state.
============================================================
Processing ValildatedWriteComputer_group_S
DistinguishedName: CN=ValildatedWriteComputer_group_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_group_S: Insufficient access rights to perform the operation
============================================================
Processing ValildatedWriteComputer_group_TG
DistinguishedName: CN=ValildatedWriteComputer_group_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_group_TG: Insufficient access rights to perform the operation
============================================================
Processing ValildatedWriteComputer_user_S
DistinguishedName: CN=ValildatedWriteComputer_user_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_user_S: Insufficient access rights to perform the operation
============================================================
Processing ValildatedWriteComputer_user_TG
DistinguishedName: CN=ValildatedWriteComputer_user_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_user_TG: Insufficient access rights to perform the operation
**********************
Windows PowerShell transcript end
End time: 20251215205307
**********************
