**********************
Windows PowerShell transcript start
Start time: 20251218102439
Username: CORP1\StdUser
RunAs User: CORP1\StdUser
Configuration Name: 
Machine: CORP1-WS01 (Microsoft Windows NT 10.0.19045.0)
Host Application: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command Import-Module 'c:\Users\StdUser\.vscode\extensions\ms-vscode.powershell-2025.4.0\modules\PowerShellEditorServices\PowerShellEditorServices.psd1'; Start-EditorServices -HostName 'Visual Studio Code Host' -HostProfileId 'Microsoft.VSCode' -HostVersion '2025.4.0' -BundledModulesPath 'c:\Users\StdUser\.vscode\extensions\ms-vscode.powershell-2025.4.0\modules' -EnableConsoleRepl -StartupBanner "PowerShell Extension v2025.4.0
Copyright (c) Microsoft Corporation.

https://aka.ms/vscode-powershell
Type 'help' to get help.
" -LogLevel 'Warning' -LogPath 'c:\Users\StdUser\AppData\Roaming\Code\logs\20251218T101619\window1\exthost\ms-vscode.powershell' -SessionDetailsPath 'c:\Users\StdUser\AppData\Roaming\Code\User\globalStorage\ms-vscode.powershell\sessions\PSES-VSCode-7848-677960.json' -FeatureFlags @() 
Process ID: 8952
PSVersion: 5.1.19041.6328
PSEdition: Desktop
PSCompatibleVersions: 1.0, 2.0, 3.0, 4.0, 5.0, 5.1.19041.6328
BuildVersion: 10.0.19041.6328
CLRVersion: 4.0.30319.42000
WSManStackVersion: 3.0
PSRemotingProtocolVersion: 2.3
SerializationVersion: 1.1.0.1
**********************
Transcript started, output file is C:\homelab\ValidatedWriteTest-20251218102436.log
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
CORP1\SelfMembershipPropertySet            S-1-5-21-1974516972-3116780949-2584384717-1588
CORP1\GenericAllPropertyMember             S-1-5-21-1974516972-3116780949-2584384717-1583
CORP1\TrusteeGroup                         S-1-5-21-1974516972-3116780949-2584384717-1591
CORP1\AllValidatedWrites                   S-1-5-21-1974516972-3116780949-2584384717-1586
CORP1\GenericWriteMembershipPropertySet    S-1-5-21-1974516972-3116780949-2584384717-1581
CORP1\SelfMembership                       S-1-5-21-1974516972-3116780949-2584384717-1587
CORP1\GenericAllAll                        S-1-5-21-1974516972-3116780949-2584384717-1577
CORP1\GenericWritePropertyMember           S-1-5-21-1974516972-3116780949-2584384717-1584
CORP1\WritePropertyMember                  S-1-5-21-1974516972-3116780949-2584384717-1585
CORP1\GenericWriteAll                      S-1-5-21-1974516972-3116780949-2584384717-1578
CORP1\WritePropertyMembershipPropertySet   S-1-5-21-1974516972-3116780949-2584384717-1582
CORP1\VWTrusteeGroup                       S-1-5-21-1974516972-3116780949-2584384717-2678
CORP1\WritePropertyAll                     S-1-5-21-1974516972-3116780949-2584384717-1579
CORP1\GenericAllMembershipPropertySet      S-1-5-21-1974516972-3116780949-2584384717-1580


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
    Setting msDS-KeyCredentialLink to:
        B:732:000200002000011DE2547A4393370841F1A581102CC8F17F044A608844B4900946FA4751AB2E21200002A9B590C4F1F9F43FACEC62E0306779C3B42E6E930F1976E1185C222073D4B36B0E01033082010A0282010100BB861CC3E228E25A6AACB8AE873F49528ABA8296FE8B5141CDAA2396EB58E3C572E74CD3690E8F10530D3F1978A874BEEE3BB7A88712C251A36CE310235B104D3DA940AECBAED9177BE226EE5CB85BB2FAF14D19F0555A9604A48C815CD28048E79D67113F584933635AE7C94FFE68A39DBA99D8D73470F98C2E78CCC8FEF23F970B38C0BAF2EFC4FA6DF1243A43DA46EB79E43762E941260DD1A9E9F8BDE8D495D52298B6C8DF290A2CA99D6F538E9A455480565BDE235A4FD649D7D90973C846B00FFF13961B370D8FCB9B37BDD94A158A64761954E2561587B7A4F5A091EAC365713A8DA227444C12591D62B9A6A7E905CD04973B1CA75BAD8C8FB19C2D6102030100010100040101000500080009F47590CF3A70DC01:CN=AllValidatedWrites_computer_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on AllValidatedWrites_computer_S: Insufficient access rights to perform the operation
============================================================
Processing AllValidatedWrites_computer_TG
DistinguishedName: CN=AllValidatedWrites_computer_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
    Successfully set dNSHostName to allvaf5c82d8b58.corp1.lab.home-labs.lol.
    Verified dNSHostName is allvaf5c82d8b58.corp1.lab.home-labs.lol.
- Running ValidatedAdditionalDNS test
    Added msDS-AdditionalDnsHostName value allvalidatedwrites_computer_tg-additional-7906.corp1.lab.home-labs.lol.
    Verified msDS-AdditionalDnsHostName includes:
        allvalidatedwrites_computer_tg-additional-7906.corp1.lab.home-labs.lol
- Running ValidatedSPN test
    Added SPN TEST/allvaf5c82d8b58.
    Verified servicePrincipalName includes:
        TEST/allvaf5c82d8b58
- Running ValildatedWriteComputer test
    Setting msDS-KeyCredentialLink to:
        B:732:00020000200001FDEA2398C88DBDD8123F1A5CF88FD71C1D10DE777A547574FF2D522570467D96200002AAF9F2AA78EC1432460DD45F5A629D10E7753FE93DC7A177A18DE6FD14E1452E0E01033082010A0282010100ABD0C252267B1B49B7DFA182595EEBB4B4359D1578D054966FBD43CEB1BF5779F0207DE20F40EE1088B0A3784225AF459832A0C75669DCD302BABAA6E4C8E1FC945A83077B0C9193ADF65101310367016731D46DB549CBDAA229BA03D4B3D22BDFB574AEBE2A880CF497548B3A4D5DC49D5E61AF17F7662466248B98C2689D9CD142BC09A1993F19214E1BA79BD28A7EF2DBFD41054ED748C845B6C68F27601A280A00DC78CC77691C72FF716CC54EC66307D4B5D0B340AC833092CBB09E91D9666FAF4604535B8BFA41C2AB285EE6A7F2D8A429CD08BBF136DFC1670FA7C4CC505678CE45D72EAD6FE585C3BA1A1A4206BCD91EC17181DDC405F84891C49EF502030100010100040101000500080009464AF5CF3A70DC01:CN=AllValidatedWrites_computer_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Added placeholder msDS-KeyCredentialLink.
WARNING:     Added msDS-KeyCredentialLink value was not found when reading the object.
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
    Setting msDS-KeyCredentialLink to:
        B:732:00020000200001F106C2075E641E22E9A9B966152D544BDEC7558043D15EE3C5346883934AB00E2000023C83075D00C92D82BC6B2200EDF4E42861FCFADBFE9ACDC3EEF5B95C22A064CC0E01033082010A0282010100EA68ED64F150EDCB4380C1ABA2516D4A6421284FA40090DE8301069D909375521BFD2F89DCF38CA85FB0E363B240506BD29C137784BC5161AAEB111C64FEE1578B132331DC8AD0189041BDEE39E4DA9D7223D817C6126172764495A126A3D834A6A90D26F2B5D2BCDC70A6781C11151112E4C4676A28B01A1EEBB3D90C7CF9B980FF11546D921F70BAB755A19AA184EAA344F0658A5CB931678AFEEA55456EC7497620429A673FABE7A2A29AAAB8C0A4B791767913426FD1A90DEBBF72A73557735CC414CBCF4CF535A6886A444837E4B2165517C3E4FFE0B50582E306613F6DE8ACB66F87CB4B00BE248A256F44A62590DA2A535486011E2B685A240ECE348D02030100010100040101000500080009FCEC43D03A70DC01:CN=AllValidatedWrites_gmsa_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on AllValidatedWrites_gmsa_S: Insufficient access rights to perform the operation
============================================================
Processing AllValidatedWrites_gmsa_TG
DistinguishedName: CN=AllValidatedWrites_gmsa_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValidatedDNSHostName test
    Successfully set dNSHostName to allvaa5066d6a37.corp1.lab.home-labs.lol.
    Verified dNSHostName is allvaa5066d6a37.corp1.lab.home-labs.lol.
- Running ValidatedAdditionalDNS test
PS>TerminatingError(Set-ADObject): "The requested name already exists as a unique identifier"
WARNING:     Failed to add msDS-AdditionalDnsHostName on AllValidatedWrites_gmsa_TG: The requested name already exists as a unique identifier
- Running ValidatedSPN test
    Added SPN TEST/allvaa5066d6a37.
    Verified servicePrincipalName includes:
        TEST/allvaa5066d6a37
- Running ValildatedWriteComputer test
    Setting msDS-KeyCredentialLink to:
        B:732:000200002000019BF9CC60F8ACC44CDD10D51A10E4265E32197D57C2F7141CBA1555059EB2439120000210E62D4887E10DB729BEBF8D9439E79F295B7449BB4AD757AAD8DE16878C83A60E01033082010A0282010100C652BD720E04D14617BC6D8573C4F5576901DCE7C4F5530BA60E893FBDAD9B54AEDC89DD6B6929BF8B5DC6EEA325FBD60942990C48E168FDFDA93B171F7D05B8B141EF4DABA5F998A4DF58A652FAB086225D03D8F91DCCE2C33FE85DDDF1C83FFC2915747F6AEE522DB8453AE6222F791781FE9B855AA15453225D74979CBA2112CCFB10986F6D15D3DBBC66113ABF7E0429A9396C09DBFE56317D10DF6E53DF0C7F4A4F23190E3587D7702B296492AF04C012A599D79C4C9AF78056F3567BA6A54917D6EC0439F65FB25AEE98177B34D3554D9CFBE67E97B22D543503A3A8CC0395ACF14B40794886DA75644AAD5D85438E6C4303217EA1FD7611CCAECBBB8102030100010100040101000500080009A51A89D03A70DC01:CN=AllValidatedWrites_gmsa_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Added placeholder msDS-KeyCredentialLink.
WARNING:     Added msDS-KeyCredentialLink value was not found when reading the object.
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
    Setting msDS-KeyCredentialLink to:
        B:732:00020000200001790BCD367D97683B7DAC08ABD874B2DBF88D37DF8AFBB64DCC373C024569B9222000021EC4FC00B8AFD55353F5786FD142F24522F9D6B9311E847E2F42AB7EDD840DA50E01033082010A0282010100DC039032B921CBCF8622074B8A07A3A69A7905FD45C61C01131C01F42490B6418A0FAA461D57D2215F374E8D7D17F51BA1CA778F27872ED295CC3E6B69E9F0D3F3565BECC78C75763FC45B344C4BFC6E3B3219423A96CA23BAA4D69C94C6E04E6D92D62AAE2BCFBAD291A83C2DAE2E945922D83CE5C3B3E71F21BC5241A9CA2FD032C27598812C96C8876464CD5922FCF49E31DA4674CE9956B3F4C17EBE1B2B7747A83065FB663F766534F71851F56894282E9EB7AD8B549FB1D6CEF0AE37DB8389BDC06C50F6DD86F9061758116B87A9485E0F8EB90C0AB1C4D70324082238EF3D5A60F6D07C44463340A084A96F778A252B9DFEEA5FD6720012E4265A152902030100010100040101000500080009E41BBFD03A70DC01:CN=AllValidatedWrites_group_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
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
    Setting msDS-KeyCredentialLink to:
        B:732:00020000200001BD643C3C6451288FF31382C39D901ABE4FCF85DDFB31DCAF6093F061CB66A04820000271DC9DA4DAC3BB5E7609C7145A2D7B565CF27918EE2A5F5203607F4FEA06481F0E01033082010A0282010100E2E7BAB7419EFA1F3243E6F7BDF7422CD86A44D3D53BDDEF3E0E008D7990DD7C7D8BE485DDC502BB7DF35E60175CE2737F4AA5F2EC742EA50FFBF03998608B7789BBC746BDDA281389110E38631869DBE89500384329030C963806981F54CA1D23CE13F950CE71D5F8D70A04173A2E3DF98FBCF7820D335544E1CB2B9F4455DFC505FECB0981969D49081B5E10170A29D1FC222019E2F6FC1CFDA257AE1E1AF829A5D6DE66A56CA1907EEF4A125A674CD6847077EC61332F73DC93F4BABD431A60B8319EB98F8C908B3FEAC4E05D51A73DD695ACB0329E38DDA64468287916726DA0F1272C0DDD63385669592AD768603F23B1E88BA256ED1DDADFDE140EC6B9020301000101000401010005000800090C17FDD03A70DC01:CN=AllValidatedWrites_group_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
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
    Setting msDS-KeyCredentialLink to:
        B:732:00020000200001B55DF616F3597F017DCF42F87A93F3224596B17C9EA49F36FBC18A8D722DC9CA200002B641FED7728A630443E8AE7A1D7D9BBA79C00EA014145C5A96D2CA5D071A04EA0E01033082010A0282010100F2F813BA55CF9931D78632DD8D0E113D924849EAD080D505D9DB7B71E5E6B7BA202E934455079FF1EAF44BE2BB0127AA64BBBF25A716DF64E9BD0E3812292A0E54CF66007191B3437C3D5AD8474C750E596F6764419CE87A6B277485384942E75B7CCC7FB59A956E47085C63CC8D3E66F10177F56D3C5907124ACCC0FCE8CE8D0D67BA7474F701A84612FDC59E94CCAF5263D209B235F4F1868CBA02BFEBAD0949C59D4B11E9C6E482A837784E06B75C8009A9930B44512EAA838CDCE1C56DE8EB92ACF9B76CB9DBAB887E88613B12390A7C12A052F7AF224B5114522E21A9386B75C46E44A67BF4803A0F40CEABF2E32FDC0C8DADA9B84B586F8A14167D584902030100010100040101000500080009ABF438D13A70DC01:CN=AllValidatedWrites_user_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
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
    Setting msDS-KeyCredentialLink to:
        B:732:0002000020000130FF8EDDA8C61181C8A87AC00ED437ABBE4FC502A36C640F47581AB213C2C9052000021212DE5CD598707AA4F060F01CD12FA5B3A219BB68B138DD4EF85CF813C011FF0E01033082010A0282010100B6B24A5CD4227BB99134DB837D2B71022308B0E1461333DAD3D58352A94A2C9E13E37285625B31CB1A1CE84AF41E53F37E41713A5E674BA82BD4BD0ECE6177DF3A79F1D44ECA6047D01B81E2F2E412B0A6D1160C8A34ABE0030D2B9C798328F2C6436DD183340456A6BDDE520F2006C78464B8B433BD9446D6242BE8AAE0077CA286BADA4F77945FCF0F703AD98B48D3019C13373F5B435F31E9B6D7D860CBE2B30B9810CD42609629B600589F0CE575A52D8702C6960BFCE56C811A75749073D3C28081EBB91096C9123627DF9405E778BA2337BC7C84E3B0735DF34A3567DB92BDCD84263E18165DBB8A3C0F16B28FFCE28DE2D1C4A6AA90F1E61840BDC11102030100010100040101000500080009634E71D13A70DC01:CN=AllValidatedWrites_user_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
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
    Added msDS-AdditionalDnsHostName value validatedadditionaldns_computer_tg-additional-7434.corp1.lab.home-labs.lol.
    Verified msDS-AdditionalDnsHostName includes:
        validatedadditionaldns_computer_tg-additional-7434.corp1.lab.home-labs.lol
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
PS>TerminatingError(Set-ADObject): "The requested name already exists as a unique identifier"
WARNING:     Failed to add msDS-AdditionalDnsHostName on ValidatedAdditionalDNS_gmsa_TG: The requested name already exists as a unique identifier
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
    Verified dNSHostName is validaf2a9b4cce.corp1.lab.home-labs.lol.
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
    Verified dNSHostName is validc5a3747d77.corp1.lab.home-labs.lol.
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
    Verified servicePrincipalName includes:
        TEST/valid8a5e0ca9b7
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
    Verified servicePrincipalName includes:
        TEST/valida74695e391
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
    Setting msDS-KeyCredentialLink to:
        B:732:000200002000019410DBDB05082AADA7D825E30BAE8D6A2DACB2B74D2EC792899E5E9F968424C720000283413E014E243C274B50AA49A6247DF717F027BC1079C053ECF6B4A49322144B0E01033082010A0282010100AA414E0D2C179198B79D3257237E75CC34A531A6F298B2879539A2D183FC672A4E5EF22204829DBD48CC462B2868E89B7331393680F46D53607F816DCC0DE05870910E3297FEDC63D3FB32CE8378235E38BA5654574A6CA73295DC593ECCF0553A615957F2F8396DBB9B056B572D02270755CA196FC7E7AB6D899EF8E4ED6FAF1FDE09B17C23E649903CA29F95A3D512B05F62EF80146E4B1D6DFD57DE9285F832824F65A563741B4CFF8A3E54B5BC84B0381EA60A5FFCFD7B87601820638B689AEEF480BE360EDEBC04DEBD68FDAE3EC5CB75C23C91B280CAB4BC455409AF62CA167BD6075A272ACDED9CE672886726B918B439D270C60B9912F45ABF62B82102030100010100040101000500080009515766D23A70DC01:CN=ValildatedWriteComputer_computer_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_computer_S: Insufficient access rights to perform the operation
============================================================
Processing ValildatedWriteComputer_computer_TG
DistinguishedName: CN=ValildatedWriteComputer_computer_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
    Setting msDS-KeyCredentialLink to:
        B:732:00020000200001353994F2BCEEE189D29DF31DF29BF722C6AF4CE2F97D2EC904FCA01C60307D73200002DA037238539EC1030C44C2647A323D20468FFB0C8A0ACCD476132A8AF3773FFB0E01033082010A0282010100BB0110F178AFDFB87302D1A3B837034409B5403C81B6808F9847E0F4EF5A91C0806E549CD0C600B9DCF0604FE30B062CB269C4596734522801BFF500D7F3FF830833A4DA47E6B4E543D9CA09496BFD42DCFADB5070E3A60D4F65697C9BCDA1443A76E84B5142064639FCD6A53E90CE907864D0FD890C06C7369609770A3F584910491EBCBF759EEFC502576278C469DC011DE7AF8B9CF8E43F52B52463B703944FE165C8544D2EBEF04A4525B6C0AC455F4C665E4FE5CC63E9FF1F7B82B11CA615D8C084F892D88672FB461E9482AEE9993C726D339CAA3FAFEFBDFF9943028D26BBAD12A6D56D922EC0EEBE985C4287ADD5570FBD3C4B11F91C58EADE29180902030100010100040101000500080009F4A986D23A70DC01:CN=ValildatedWriteComputer_computer_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Added placeholder msDS-KeyCredentialLink.
WARNING:     Added msDS-KeyCredentialLink value was not found when reading the object.
============================================================
Processing ValildatedWriteComputer_gmsa_S
DistinguishedName: CN=ValildatedWriteComputer_gmsa_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
    Setting msDS-KeyCredentialLink to:
        B:732:0002000020000192072E44D98794F664F57B2EF8C1A3DFCD97981284FE1D4E2395FAA4158D61DA2000021763A4A976A6827AFD357E9A9D5F3A9F6C3372281615EDADFA56A4B380D487B20E01033082010A0282010100B7D8E7E7111F8C254C5F3C973CA4CBDD6E4DA3C1C99A2704B32BE0FDCC63B0E8D43D112E51D49DE4F45754056551DF4A60A9A5095666E7874AE50BFB453F749AD92F28F4AFB4EDBC3622C15572E11C47AA78EF9999634806DCA792512F923EA0544E4785C86A76C42B81F89224A1A47115F463AF219ED82D1CC851ECBDEB343CF93D49671FE1BD564D787691272187946C75A367DBEF9A834FBEC4A80EFA107F382F5F9572D873C48C1848AE1B5DB99D3B0DA28839D8E2DD843F4CD5FF2388585962366D6F554ACD4D87FAA02919F3DF21CA56C70A39B8FCE7C71C6C9DD78852FD2D454CB7C5F1FE28CFE7F42CAF7A41BDCFEB338D851EF1CC36B4258631D635020301000101000401010005000800095A64BED23A70DC01:CN=ValildatedWriteComputer_gmsa_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_gmsa_S: Insufficient access rights to perform the operation
============================================================
Processing ValildatedWriteComputer_gmsa_TG
DistinguishedName: CN=ValildatedWriteComputer_gmsa_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
    Setting msDS-KeyCredentialLink to:
        B:732:000200002000017823B8DFCBDF1DF195A3E0ABE044EAB28CF2D694EEB00819806CCA9B9E87A77820000218AEC219FB9804DFD1DC871D2941966C9C5326D1876F03464A86CFBFED951BE40E01033082010A0282010100D1E3E01316251F375239E763BD17C66F68369D931D33D315A87DBD3BE9CF0F784914B26304E84112C5D6B702BA67ED87401BD12660445C2162A89716BAF302DFF89EBBA2DF18408F8CD9D737E5144C617DE7CA883FE0CCE110D9C34EF88DA6946A1B8E0392BBF81F2836F938C52F667C012191023037A39B429B635D2B8618E6764F762379F22756B6FC839353CBE3C14F46DA67106A18E0E5183D1F483EF021821D2AD10D404B7187270A9A1D1AB7D732CC49EF7B879CD4903464072908FE72A165E1321494D02864E3F0AFE0129A0025BAD9D748FC90B6ADE6B06190E1F10C770E8A9FAD9676E4111D8BBBEF0B4EA88C35034D050C7C69107F64C98BF04B7902030100010100040101000500080009F283E4D23A70DC01:CN=ValildatedWriteComputer_gmsa_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
    Added placeholder msDS-KeyCredentialLink.
WARNING:     Added msDS-KeyCredentialLink value was not found when reading the object.
============================================================
Processing ValildatedWriteComputer_group_S
DistinguishedName: CN=ValildatedWriteComputer_group_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
    Setting msDS-KeyCredentialLink to:
        B:732:000200002000012F427274E52009FCE0C2139A20E8810786A20AA8BD1A7875D2B95C7B36551DA0200002C177E044DAE30D878F1A27D3E4ABA358485A1AD1F4DD8786206FE6DAB43DAE3F0E01033082010A0282010100B3A6E3BE60C9035FBB44F2E79AE4DED1A4D539A0F464D8026AEDC102409CBA9879E4F0B7397845270F30EC9237E68F09FEF3F480349DAE8B45E5E576D797B492AF22978141CC204628C326CA53ABCBE4C4F16F456592F9BFA4A788699FEF9FE615F312016346E9D589BCABE06F4F54525E178A28D562F986F4F2916F1132FC9563EB61C62C302C7886116C6942C9C9B2DE3889BCA91FE10957F2CBD221176BB889BD1FB6D707237FC96B1FF9057BF4BC5337A3FB11231331BD4047287C22719783E2C1E44D8D5759D4B9CCD3AA8B001BA619B43EDCE98AB79C661FBE775A3F1BD42D28C75140193656659732AA61F7C3E73597DFEEEBC938FCAED277C5B4B33502030100010100040101000500080009F52617D33A70DC01:CN=ValildatedWriteComputer_group_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_group_S: Insufficient access rights to perform the operation
============================================================
Processing ValildatedWriteComputer_group_TG
DistinguishedName: CN=ValildatedWriteComputer_group_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
    Setting msDS-KeyCredentialLink to:
        B:732:00020000200001C2E8C2348A66580852C41CCE4F680765D2F43BC06A6A121A86656C9548A3C544200002B4DF4C8F0ACA4790F0D1BF80616F34A10B3AEA0D9997CFA081F3971B150A08EB0E01033082010A0282010100DDA38D0C7E3ED9A1B6D1153A6F2F11D01A31A4E19950FCAF10917EA94897B6ABF358C5FA618DA8E8CA4F6E0690D061310A711EBA5B7602A2CA0219E9F2220D1088DA458939760A7E2B48F5D5B78DA54CA3DE74EC6F487832758DEFC00ECCEC23124D46237678CF9374F08916DCB472B7A0AB0FD591CF417B0602EA4E067774314AC1FA8CF5BF91C300AD88DCCA66DFA7F8528562D864189AF3533109CC5E5CCB3B57CEF0F0F96DF5B9F04A64C4A76217131F25080B37692B0A4866972C039E178F6CFDA33AD4ACD7A71A12E761CE98409B6660814BB6AC9CF9E0CCB64D7E7BFDD604F486597BD2CCD798288CE05D176409712ADF3A00D0EFFC63D9315A4C09FD02030100010100040101000500080009DC9540D33A70DC01:CN=ValildatedWriteComputer_group_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_group_TG: Insufficient access rights to perform the operation
============================================================
Processing ValildatedWriteComputer_user_S
DistinguishedName: CN=ValildatedWriteComputer_user_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
    Setting msDS-KeyCredentialLink to:
        B:732:0002000020000103C103E1E6049782C2406BD2866ED2DC92AE502A72FF352B209D223730BF2ABD2000028D5DA586575DCE5CD429CD94F431BD387A1068B8D4AB93A41EA03A21088F54A90E01033082010A0282010100E7D1EAAB796DCD2FE89D1EDA947032EEB9A778859D85D377CB5A3F928F5E8885D9FF74DC69F247EB3F16FC0A83AA325B0C73FB777A1069DC032BC04AD0CDA24CF240FC6DCEEE44974EB032570F30C1DA91432BCA3A86013AABEC00C584EBA632C69E7D09B3DFAC43A62FDC3693025D5A19C6C20385BB9A6954B75335F77862462A6F47CEAEBF6A9F7DE8AC87D4400A112BA0887C5F8C8312657B2902ADB970784BA2427979CBB599F89FB01BA3CE234E338F4FF9FABE1F175AB868388BE73D9138D557DD218AB4B8DD7FD8384447180EA625CDD353FF0970CFF6802E09C84820D980DC50D84E06FCAC5130A1CB14A17E7726FDFAD06C82D12B15E546CABE37BD02030100010100040101000500080009EF3667D33A70DC01:CN=ValildatedWriteComputer_user_S,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_user_S: Insufficient access rights to perform the operation
============================================================
Processing ValildatedWriteComputer_user_TG
DistinguishedName: CN=ValildatedWriteComputer_user_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
- Running ValildatedWriteComputer test
    Setting msDS-KeyCredentialLink to:
        B:732:00020000200001C2067CA8F263D24A9707E368FE6A177F5697A1868A74EC5358754879C378D88720000230B3BDEEBA496DB63F5B84C65BDF7B61559374FEC195D3DE32DB753E2933AC130E01033082010A0282010100E74A3DB4B835377CB958AB6213A7A49F10CED0D70909ED76AC6490EB425B7EBF5C129D88CEE64CF87D7E127CF7D1E768DF86FE588C45509E5B4640BFE4B2B35EF51DB6CE8830DCB548E35F92649F40F9B046FB1D80DEB4D747C721FC3AF5E07AD5CD292452D762A3A431C1016C34917D7030615225EECD4A73D62F8D07953EC78797AEFBC4CE9F944F82BDEDB3AE6CD44AFBA25110A00CE1C1FF52BC5492A1E90A46ADBD479DEFF86C613B9FBCD2A91682C5DD1D5399197B3A2E65413F1F4D6CC30A4F23D7C35BCDABD704927B26CDCA1905713889ACE7C11DC1A0C6C4B73FB406703451F665502F330B0D9642A710B29BC1BCD549E06087DBA3BBCE948B3E5502030100010100040101000500080009DFA494D33A70DC01:CN=ValildatedWriteComputer_user_TG,OU=ValidatedWrites,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
PS>TerminatingError(Set-ADObject): "Insufficient access rights to perform the operation"
WARNING:     Failed to modify msDS-KeyCredentialLink on ValildatedWriteComputer_user_TG: Insufficient access rights to perform the operation
**********************
Windows PowerShell transcript end
End time: 20251218102447
**********************
