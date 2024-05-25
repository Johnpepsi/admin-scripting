# Function Name: Get-LoggedIn
# Return the current logged-in user of a remote machine.
function Get-LoggedIn {
  [CMDletBinding()
  param(
    [Parameter(Mandatory=$True)]
    [string[]]$computername
  )]

  foreach ($pc in $computername) {
    $logged_in = (gwmi win32_computersystem -COMPUTER $pc).username
    $name = $logged_in.split("\")[1]
    "{0}: {1}" -f $pc, $name
  }
}
