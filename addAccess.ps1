## PowerShell script to ADD access for multiple users from Active Directory profiles

# Import the Active Directory module for scripting
Import-Module ActiveDirectory

# List of users to grant access (replace with actual usernames)
$usersToAdd = @("user1", "user2", "user3")

# Distinguished name of the group or container where the user accounts reside
$groupDN = "CN=GroupName,OU=Users,DC=domain,DC=com"

# Loop through each user and grant access
foreach ($user in $usersToAdd) {
    # Get the user's distinguished name
    $userDN = Get-ADUser -Identity $user | Select-Object -ExpandProperty DistinguishedName

    Add-ADGroupMember -Identity $groupDN -Members $userDN

    Write-Host "Access granted for user: $user"
}
