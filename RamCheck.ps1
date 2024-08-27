# Get the total physical memory installed on the machine
$TotalRAM = Get-CimInstance Win32_ComputerSystem | Select-Object -ExpandProperty TotalPhysicalMemory

# Convert the total RAM from bytes to gigabytes (GB)
$TotalRAM_GB = [math]::round($TotalRAM / 1GB, 2)

# Output the result
Write-Output "Total Installed RAM: $TotalRAM_GB GB"
