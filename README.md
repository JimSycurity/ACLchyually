# ACLchyually
Various Windows Access Control Model resources, heavy on the Access Control List

<img width="680" height="680" alt="ACLchyually" src="https://github.com/user-attachments/assets/e1bc17ed-d2cb-4234-ab02-6409a1b33751" />

[Group Membership](./Membership/Membership.md) - Active Directory accounts for members of groups via the group's `member` property. There are approximately 12 different ACEs that can modify this property.

[Validated Writes](./ValidatedWrites/ValidatedWrites.md) - Active Directory includes a mechanism for restricted writes to specific object properties. Each validated write has rules that must be adhered to above and beyond the default AD schema restrictions for the property values.