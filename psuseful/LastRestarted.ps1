Param(
	[Parameter(Mandatory = $True, HelpMessage = 'Enter Number of Days Since Last Logon:')]
	 [Int]$NumDays,
	 [string]$Path
)

if (!$Path){
	$Path = Get-Location | Select -ExpandProperty Path
	$Path = $Path + "\StaleAccounts.csv"
}

Write-Host "This script will export a CSV file of all users that are currently enabled and have not logged in for $NumDays days. `nNote that any user that has not logged in at all will also be listed. `nThe CSV file will be located here: $Path `nPlease be sure you have permissions to write to this directory." -ForegroundColor Red -BackgroundColor Black

$Date = (Get-Date).AddDays(-$NumDays)

Import-Module ActiveDirectory

Get-ADUser -Filter {(lastLogon -le $Date) -and (Enabled -eq "True") } | Select Name,DistinguishedName | Export-Csv -Path "$Path"
