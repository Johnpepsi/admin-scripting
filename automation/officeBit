# How to check user office as a plumber using a script

# Check the registry for Office 365 bitness information
$officeRegPath = "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration"

try {
    $bitness = Get-ItemProperty -Path $officeRegPath -Name Platform | Select-Object -ExpandProperty Platform

    if ($bitness -eq "x86") {
        Write-Host "Office 365 is installed as 32-bit."
    } elseif ($bitness -eq "x64") {
        Write-Host "Office 365 is installed as 64-bit."
    } else {
        Write-Host "Unable to determine if Office 365 is 32-bit or 64-bit."
    }
} catch {
    Write-Host "Office 365 installation not found or unable to access registry path."
}
