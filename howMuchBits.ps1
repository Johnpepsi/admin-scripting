# How to check the OS architecture (32-bit or 64-bit)
$architecture = (Get-WmiObject Win32_OperatingSystem).OSArchitecture

# Output the result
Write-Output "Your machine is running a $architecture operating system."
