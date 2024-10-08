#Import the Active Directory module

>> Import-Module ActiveDirectory
>>
>> # Define the location you want to filter by
>> $location = "Tower Road/BTL"  # Replace with the name of your building/location
>>
>> # Get all users in the Active Directory, filter for enabled accounts, and the specified location
>> $activeUsers = Get-ADUser -Filter {Enabled -eq $true -and PhysicalDeliveryOfficeName -eq $location} -Properties Enabled, PhysicalDeliveryOfficeName
>>
>> # Count the number of active users
>> $activeUserCount = $activeUsers.Count
>>
>> # Output the count
>> Write-Host "Number of active users in $location: $activeUserCount"
