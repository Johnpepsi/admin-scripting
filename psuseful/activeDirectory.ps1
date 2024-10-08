# Variables
$UserFirstName = "John"
$UserLastName = "Dedede"
$UserName = "jdoedede"
$UserPassword = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force
$OU = "OU=Users,DC=example,DC=com"

# Create New User
New-ADUser `
    -GivenName $UserFirstName `
    -Surname $UserLastName `
    -Name "$UserFirstName $UserLastName" `
    -SamAccountName $UserName `
    -UserPrincipalName "$UserName@example.com" `
    -Path $OU `
    -AccountPassword $UserPassword `
    -Enabled $true
