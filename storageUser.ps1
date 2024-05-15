$computers = "BGC6746", "BGC4388"  # Add the names of the computers you want to check

foreach ($computer in $computers) {
    $diskInfo = Get-WmiObject Win32_LogicalDisk -ComputerName $computer -Filter "DriveType=3" | Select-Object DeviceID, @{Name="FreeSpace(GB)"; Expression={[math]::Round($_.FreeSpace / 1GB, 2)}}, @{Name="TotalSize(GB)"; Expression={[math]::Round($_.Size / 1GB, 2)}}

    Write-Host "Storage information for"
    $diskInfo | Format-Table -AutoSize
    Write-Host ""
}
