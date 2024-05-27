function Get-Uptime {
    [CmdletBinding()]
    param (
        [string]$ComputerName = 'localhost'
    )

    foreach ($Computer in $ComputerName) {
        $os = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $Computer
        $lastBootUpTime = $os.ConvertToDateTime($os.LastBootUpTime)
        $currentTime = Get-Date
        $uptime = $currentTime - $lastBootUpTime

        $properties = @{
            'ComputerName' = $Computer;
            'UpTimeDays' = $uptime.Days;
            'UpTimeHours' = $uptime.Hours;
            'UpTimeMinutes' = $uptime.Minutes;
            'UpTimeSeconds' = $uptime.Seconds;
        }
        $obj = New-Object -TypeName PSObject -Property $properties

        Write-Output $obj
    }
}

# Example usage:
# Get-Uptime -ComputerName 'Computer1', 'Computer2'
