# Define the path to the OWN OST file SIZE location
# This is how to check own OST file
$ostFilePath = "$env:LOCALAPPDATA\Microsoft\Outlook"

# Get the list of OST files in the directory
$ostFiles = Get-ChildItem -Path $ostFilePath -Filter *.ost

# Check if any OST files are found and display their size
if ($ostFiles) {
    foreach ($file in $ostFiles) {
        $fileSizeMB = [math]::Round($file.Length / 1MB, 2)
        Write-Host "OST File: $($file.FullName) - Size: $fileSizeMB MB"
    }
} else {
    Write-Host "No OST files found in the default location."
}
