# Define the URL or network path to the printer driver
$driverUrl = "http://example.com/printer-driver.exe"
$driverPath = "C:\Temp\printer-driver.exe"

# Define the printer details
$printerName = "My Network Printer"
$printerPort = "192.168.1.100"

# Download the printer driver
Invoke-WebRequest -Uri $driverUrl -OutFile $driverPath

# Install the printer driver
Start-Process -FilePath $driverPath -ArgumentList "/S" -Wait

# Add the printer port
Add-PrinterPort -Name "IP_$printerPort" -PrinterHostAddress $printerPort

# Add the printer
Add-Printer -Name $printerName -DriverName "Your Printer Driver Name" -PortName "IP_$printerPort"

Write-Output "Printer installation completed successfully."
