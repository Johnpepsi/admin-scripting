# This script is to see when was the last time user restarted their machineee
function Get-Uptime {
  [CmdletBinding()]
  param ()
    [string]$ComputerName = 'localhost'
}

foreach ($Computer in $ComputerName){
  $pc = $computername
  $os = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computername
  $diff = $os.ConverToDateTime($os.LocalDateTime) -$os.ConvertToDateTime($os.LocalDateTime)

  $properties=@{
    'ComputerName'=$pc;
    'UptimeDays'=$diff.Days;
    'UptimeHours'=$diff.Hours;
    'UptimeMinutes'=$diff.Minutes;
    'UptimeSeconds'=$diff.Seconds;
  }
  $obj = New-Ojbect -TypeName PSObject -Property $properties

  Write-Output $obj
  }
}
