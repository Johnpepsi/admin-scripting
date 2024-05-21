# List of user profile directories
$userProfiles = Get-WmiObject Win32_UserProfile | Where-Object { $_.Special != $true -and $_.LocalPath -match "C:\\Users" }

foreach ($profile in $userProfiles) {
    $userProfilePath = $profile.LocalPath
    $ostFilePath = "$userProfilePath\AppData\Local\Microsoft\Outlook"

    if (Test-Path $ostFilePath) {
        $ostFiles = Get-ChildItem -Path $ostFilePath -Filter *.ost -ErrorAction SilentlyContinue

        if ($ostFiles) {
            foreach ($file in $ostFiles) {
                $fileSizeMB = [math]::Round($file.Length / 1MB, 2)
                Write-Host "User: $($userProfilePath.Split('\')[-1]) - OST File: $($file.FullName) - Size: $fileSizeMB MB"
            }
        } else {
            Write-Host "User: $($userProfilePath.Split('\')[-1]) - No OST files found."
        }
    } else {
        Write-Host "User: $($userProfilePath.Split('\')[-1]) - OST directory not found."
    }
}
