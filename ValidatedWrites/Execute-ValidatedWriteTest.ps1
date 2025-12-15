<# TODO: Create a PowerShell test to go along with the test foundation created by New-ValidatedWriteTest.ps1
in the $OrganizationalUnitDN parameter.  

Perform transcript logging similar to Execute-MembershipTest.ps1. I want all relevant output around the tests to be captured in the transcript.

1. Retrieve all objects in $OrganizationalUnitDN. Split the object name on "_" and if there are 3 segments, include it in the array of test objects
2. Foreach object in the array of test objects, perform a test attempting to modify the attribute associated with the validated write in the 1st segment of the object's name.
3. For the AllValidatedWrites_x_x objects, perform all tests against each object.


Test:
    "ValidatedDNSHostName" - attempt to modify dNSHostName property
    "ValidatedAdditionalDNS" - attempt to modify ms-ds-additional-dns-host-name property
    "ValidatedSPN" - attempt to add an SPN, likely one that corresponds to the dNSHostname, msdsadditionaldnshostname, or the samaccountname of the object
    "ValildatedWriteComputer" - attempt to modify the msDs-KeyCredentialLink. For the sake of the test, attempt to do so using the "Shadow Credentials" technique. This may require calling Whisker.exe
    "AllValidatedWrites" - All tests
#>