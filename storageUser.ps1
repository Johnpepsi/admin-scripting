$computers = "", ""  # Add the names of the computers you want to check

foreach ($computer in $computers) {
    $diskInfo = Get-WmiObject Win32_LogicalDisk -ComputerName $computer -Filter "DriveType=3" | Select-Object DeviceID, @{Name="FreeSpace(GB)"; Expression={[math]::Round($_.FreeSpace / 1GB, 2)}}, @{Name="TotalSize(GB)"; Expression={[math]::Round($_.Size / 1GB, 2)}}

    Write-Host "Storage information for"
    $diskInfo | Format-Table -AutoSize
    Write-Host ""
}

-------------------------------------------------------------------------------------------------
# another way to check when logged in to user machine to check storage 
How to check user storage using shell
# Get-StorageUsage.ps1

# Function to get storage usage
function Get-StorageUsage {
    Get-PSDrive -PSProvider FileSystem | ForEach-Object {
        [pscustomobject]@{
            Drive = $_.Name
            UsedSpaceGB = [math]::round(($_.Used / 1GB), 2)
            FreeSpaceGB = [math]::round(($_.Free / 1GB), 2)
            TotalSpaceGB = [math]::round(($_.Used + $_.Free) / 1GB, 2)
            PercentUsed = [math]::round(($_.Used / ($_.Used + $_.Free) * 100), 2)
        }
    }
}

# Display storage usage
Get-StorageUsage | Format-Table -AutoSize
