# Define the domain you want to set for the User Logon Name (UPN)
$domain = "mydomain.com"

# Import Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Retrieve all users (you can modify the filter to select specific users or an OU)
$users = Get-ADUser -Filter * -Property SamAccountName, UserPrincipalName

foreach ($user in $users) {
    # Construct the new UPN using the SamAccountName and the domain
    $newUPN = "$($user.SamAccountName)@$domain"
    
    # Update the UserPrincipalName (UPN) for the user
    Set-ADUser -Identity $user.SamAccountName -UserPrincipalName $newUPN
    
    # Output the updated UPN to verify
    Write-Host "Updated UPN for $($user.SamAccountName) to $newUPN"
}
