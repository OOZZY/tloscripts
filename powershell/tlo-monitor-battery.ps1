Add-Type -AssemblyName PresentationFramework # needed for MessageBox

Set-Variable LOW_THRESHOLD -option Constant -value 20
Set-Variable HIGH_THRESHOLD -option Constant -value 75
Set-Variable SLEEP_SECONDS -option Constant -value 600 # 10 minutes

$previousCharge = (Get-WmiObject Win32_Battery).EstimatedChargeRemaining
$currentCharge = $previousCharge

while (1) {
  $currentCharge = (Get-WmiObject Win32_Battery).EstimatedChargeRemaining

  tlo-date.ps1
  Write-Output "Previous charge was $previousCharge"
  Write-Output "Current charge is $currentCharge"

  if (($currentCharge -lt $previousCharge) -and
      ($currentCharge -lt $LOW_THRESHOLD)) {
    [System.Windows.MessageBox]::Show('Low Battery!!!', 'Battery Monitor')
  }

  if (($currentCharge -gt $previousCharge) -and
      ($currentCharge -gt $HIGH_THRESHOLD)) {
    [System.Windows.MessageBox]::Show('High Battery!!!', 'Battery Monitor')
  }

  $previousCharge = $currentCharge

  Write-Output "Sleeping"
  Start-Sleep -Seconds $SLEEP_SECONDS
}
