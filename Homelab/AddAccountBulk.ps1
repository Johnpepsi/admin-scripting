# Adding account in Bulk to Active Directory, using the CSV File. 
# To make it easier, find the OU of the Active Directory where all user will be stored at.

# Import required modules 
Import-module ActiveDirectory   
# Create a new password 
$securePassword = ConvertTo-SecureString "Brandt20288!!" -AsPlainText -Force 

# Prompt user for CSV File pathaddAccount 
$filepath = Read-Host -Prompt "Please enter the path of your CV File" 

# Import the file into a variable 
$users = Import-Csv $filepath 

# Loop through each row and gather information 
ForEach ($user in $users) { 

    # Gather the user's information 
    $fname = $user.'First Name' 
    $lname = $user.'Last Name' 
    $jtitle = $user.'Job Title' 
    $officephones = $user.'Office Phones' 
    $emailaddress = $user.'Description' 
    $OrganizationalUnit = $user.'Organizational Unit' 

    # Create the new AD user for each user in CSV File 
    New-ADUser -Name "$fname $lname" -GivenName $fname -Surname $lname -UserPrincipalName "$fname.$lname" -Path $OrganizationalUnit -AccountPassword $securePassword -ChangePasswordAtLogon $True -OfficePhone $officephones -Description $description -Enabled $True -EmailAddress $emailaddress 
    # Echo output for each new user 
    echo "Account created for $fname $lname in $OrganizationalUnit" 

} 
