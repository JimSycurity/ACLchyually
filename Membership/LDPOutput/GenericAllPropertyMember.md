-----------
Expanding base 'CN=GenericAllPropertyMember,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol'...
Getting 1 entries:
Dn: CN=GenericAllPropertyMember,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol
cn: GenericAllPropertyMember; 
distinguishedName: CN=GenericAllPropertyMember,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol; 
dSCorePropagationData (2): 12/11/2025 8:12:46 PM Central Standard Time; 0x0 = (  ); 
groupType: 0x80000004 = ( RESOURCE_GROUP | SECURITY_ENABLED ); 
instanceType: 0x4 = ( WRITE ); 
name: GenericAllPropertyMember; 
objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=corp1,DC=lab,DC=home-labs,DC=lol; 
objectClass (2): top; group; 
objectGUID: 3a4d06a8-bd42-4633-9247-9e96b8d27879; 
objectSid: S-1-5-21-1974516972-3116780949-2584384717-1275; 
sAMAccountName: GenericAllPropertyMember; 
sAMAccountType: 536870912 = ( ALIAS_OBJECT ); 
uSNChanged: 413759; 
uSNCreated: 413723; 
whenChanged: 12/11/2025 8:12:46 PM Central Standard Time; 
whenCreated: 12/11/2025 8:12:46 PM Central Standard Time; 

-----------
Security Descriptor:
Security Descriptor:SD Revision: 1
SD Control:  0x8c04
		SE_DACL_PRESENT
		SE_DACL_AUTO_INHERITED
		SE_SACL_AUTO_INHERITED
		SE_SELF_RELATIVE
Owner: CORP1\Domain Admins [S-1-5-21-1974516972-3116780949-2584384717-512]
Group: CORP1\Domain Admins [S-1-5-21-1974516972-3116780949-2584384717-512]
DACL:
	Revision      4
	Size:         268 bytes
	# Aces:       8
	Ace[0]
		Ace Type:  0x5 - ACCESS_ALLOWED_OBJECT_ACE_TYPE
		Ace Size:  56 bytes
		Ace Flags: 0x0
		Object Ace Mask:  0x000f01ff
			DELETE
			READ_CONTROL
			WRITE_DAC
			WRITE_OWNER
			ACTRL_DS_CREATE_CHILD
			ACTRL_DS_DELETE_CHILD
			ACTRL_DS_LIST
			ACTRL_DS_SELF
			ACTRL_DS_READ_PROP
			ACTRL_DS_WRITE_PROP
			ACTRL_DS_DELETE_TREE
			ACTRL_DS_LIST_OBJECT
			ACTRL_DS_CONTROL_ACCESS
		Object Ace Flags: 0x1
			ACE_OBJECT_TYPE_PRESENT
		Object Ace Type:  Add/Remove self as member - bf9679c0-0de6-11d0-a285-00aa003049e2
		Object Ace Sid:   CORP1\TrusteeGroup [S-1-5-21-1974516972-3116780949-2584384717-1281]
	Ace[1]
		Ace Type:  0x5 - ACCESS_ALLOWED_OBJECT_ACE_TYPE
		Ace Size:  44 bytes
		Ace Flags: 0x0
		Object Ace Mask:  0x00000010
			ACTRL_DS_READ_PROP
		Object Ace Flags: 0x1
			ACE_OBJECT_TYPE_PRESENT
		Object Ace Type:  tokenGroupsGlobalAndUniversal - 46a9b11d-60ae-405a-b7e8-ff8a58d456d2
		Object Ace Sid:   BUILTIN\Windows Authorization Access Group [S-1-5-32-560]
	Ace[2]
		Ace Type:  0x5 - ACCESS_ALLOWED_OBJECT_ACE_TYPE
		Ace Size:  40 bytes
		Ace Flags: 0x0
		Object Ace Mask:  0x00000100
			ACTRL_DS_CONTROL_ACCESS
		Object Ace Flags: 0x1
			ACE_OBJECT_TYPE_PRESENT
		Object Ace Type:  Send To - ab721a55-1e2f-11d0-9819-00aa0040529b
		Object Ace Sid:   NT AUTHORITY\Authenticated Users [S-1-5-11]
	Ace[3]
		Ace Type:  0x0 - ACCESS_ALLOWED_ACE_TYPE
		Ace Size:  36 bytes
		Ace Flags: 0x0
		Ace Mask:  0x000f01ff
			DELETE
			READ_CONTROL
			WRITE_DAC
			WRITE_OWNER
			ACTRL_DS_CREATE_CHILD
			ACTRL_DS_DELETE_CHILD
			ACTRL_DS_LIST
			ACTRL_DS_SELF
			ACTRL_DS_READ_PROP
			ACTRL_DS_WRITE_PROP
			ACTRL_DS_DELETE_TREE
			ACTRL_DS_LIST_OBJECT
			ACTRL_DS_CONTROL_ACCESS
		Ace Sid:   CORP1\Domain Admins [S-1-5-21-1974516972-3116780949-2584384717-512]
	Ace[4]
		Ace Type:  0x0 - ACCESS_ALLOWED_ACE_TYPE
		Ace Size:  24 bytes
		Ace Flags: 0x0
		Ace Mask:  0x000f01ff
			DELETE
			READ_CONTROL
			WRITE_DAC
			WRITE_OWNER
			ACTRL_DS_CREATE_CHILD
			ACTRL_DS_DELETE_CHILD
			ACTRL_DS_LIST
			ACTRL_DS_SELF
			ACTRL_DS_READ_PROP
			ACTRL_DS_WRITE_PROP
			ACTRL_DS_DELETE_TREE
			ACTRL_DS_LIST_OBJECT
			ACTRL_DS_CONTROL_ACCESS
		Ace Sid:   BUILTIN\Account Operators [S-1-5-32-548]
	Ace[5]
		Ace Type:  0x0 - ACCESS_ALLOWED_ACE_TYPE
		Ace Size:  20 bytes
		Ace Flags: 0x0
		Ace Mask:  0x00020094
			READ_CONTROL
			ACTRL_DS_LIST
			ACTRL_DS_READ_PROP
			ACTRL_DS_LIST_OBJECT
		Ace Sid:   NT AUTHORITY\SELF [S-1-5-10]
	Ace[6]
		Ace Type:  0x0 - ACCESS_ALLOWED_ACE_TYPE
		Ace Size:  20 bytes
		Ace Flags: 0x0
		Ace Mask:  0x00020094
			READ_CONTROL
			ACTRL_DS_LIST
			ACTRL_DS_READ_PROP
			ACTRL_DS_LIST_OBJECT
		Ace Sid:   NT AUTHORITY\Authenticated Users [S-1-5-11]
	Ace[7]
		Ace Type:  0x0 - ACCESS_ALLOWED_ACE_TYPE
		Ace Size:  20 bytes
		Ace Flags: 0x0
		Ace Mask:  0x000f01ff
			DELETE
			READ_CONTROL
			WRITE_DAC
			WRITE_OWNER
			ACTRL_DS_CREATE_CHILD
			ACTRL_DS_DELETE_CHILD
			ACTRL_DS_LIST
			ACTRL_DS_SELF
			ACTRL_DS_READ_PROP
			ACTRL_DS_WRITE_PROP
			ACTRL_DS_DELETE_TREE
			ACTRL_DS_LIST_OBJECT
			ACTRL_DS_CONTROL_ACCESS
		Ace Sid:   NT AUTHORITY\SYSTEM [S-1-5-18]
SACL not present
Security for "CN=GenericAllPropertyMember,OU=Membership,OU=Misconfigs,DC=corp1,DC=lab,DC=home-labs,DC=lol"
-----------
***Calling Security...
-----------
