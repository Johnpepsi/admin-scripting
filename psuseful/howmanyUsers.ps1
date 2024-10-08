#Import the Active Directory module
Import-Module ActiveDirectory

# Specify the Distinguished name (DN) of the OU want to search in
$OU = "OUinACtiveDirectory,Specify-OU" 

# Get all active users in the specified OU
$activeUsers = Get-ADUsers -Filter {Enabled -eq $true} -SearchBase $OU
# Count the number of active users
$userCount = $activeUsers.Count

# Output the count
Write-Host "Number of active users in the OU '$OU': $userCount"
