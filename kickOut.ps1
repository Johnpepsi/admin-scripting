# Define the server name and username
$serverName = "ServerName" #server
$username = "Username" #username

# Get the list of user sessions on the remote server
$sessions = quser /server:$serverName

# Parse the session information to find the session ID of the specified user
foreach ($session in $sessions) {
    if ($session -match $username) {
        $sessionInfo = $session -split "\s+"
        $sessionId = $sessionInfo[2]
        
        # Log off the user from the remote server
        logoff $sessionId /server:$serverName
        Write-Host "User $username has been logged off from $serverName."
    }
}
