## Power shell script for restting user password, For instance, I use the command net user firstname.lastname /domain.
## And it will show up if the users password has expired already or not. 
## I wanted to automate this things, if the scripts says that the user password has expired already, I want to reset the password. But if its not then keep the password as it is. 

# Define variables
$user = "firstname.lastname"  # Replace with the actual username
$newPassword = "NewSecurePassword123!"  # Set the new password

# Check user password status
$userInfo = net user $user /domain

# Parse the output to find the password expiration status
if ($userInfo -match "Password expired") {
    Write-Host "Password for user '$user' has expired. Resetting password..."
    
    # Reset the user's password
    try {
        # Use the Set-ADAccountPassword cmdlet to reset the password
        # Make sure you have the Active Directory module installed
        Set-ADAccountPassword -Identity $user -NewPassword (ConvertTo-SecureString $newPassword -AsPlainText -Force)
        Write-Host "Password for user '$user' has been reset successfully."
        
        # Optionally, force the user to change the password at next logon
        Set-ADUser -Identity $user -ChangePasswordAtLogon $true
        Write-Host "User '$user' will be prompted to change the password at next logon."
    } catch {
        Write-Host "Failed to reset password for user '$user': $_"
    }
} else {
    Write-Host "Password for user '$user' has not expired. No action taken."
}
