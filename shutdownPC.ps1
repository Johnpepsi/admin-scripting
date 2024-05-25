# Define the target computer name or IP address
$computerName = "TargetComputerName"

# Define the credentials for accessing the target computer
$credential = Get-Credential

# Execute the shutdown command on the remote computer
Invoke-Command -ComputerName $computerName -Credential $credential -ScriptBlock {
    Stop-Computer -Force
}
