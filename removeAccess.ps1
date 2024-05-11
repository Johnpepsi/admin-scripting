## PowerShell script to REMOVE access for multiple users from Active Directory profiles:

# Import the Active Directory module
Import-Module ActiveDirectory

# List of users to remove access
$usersToRemove = @("user2", "user2")

# Use name of the group or container where the user accounts reside
$groupDN = "access here"

# Loop through each user and remove access
foreach ($user in $usersToRemove) {
    # Get the user's distinguished name
    $userDN = Get-ADUser -Identity $user | Select-Object -ExpandProperty DistinguishedName

    Remove-ADGroupMember -Identity $groupDN -Members $userDN -Confirm:$false

    Write-Host "Access removed for user: $user"
}
