# Scenario: Automating the deployment of updates and patches to servers and workstations.
# Example Script: A PowerShell script to update Windows systems.

# Check for updates
$updates = Get-WindowsUpdate -Install -AcceptAll -AutoReboot

# Output the results
$updates | Out-File -FilePath "C:\Logs\WindowsUpdate.log"
