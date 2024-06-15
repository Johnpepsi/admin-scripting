## How to Disable account/bulk from AD: (make sure in the admin server)
# Import the Active Directory module
Import-Module ActiveDirectory

# List of usernames to disable (replace with your list of usernames)
$usernames = "user1", "user2", "user3"

# Disable each user account
foreach ($username in $usernames) {
    Disable-ADAccount -Identity $username
    Write-Host "Disabled user account: $username"
}
