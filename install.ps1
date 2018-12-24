Copy-Item . "~\Documents\WindowsPowerShell\Modules" -r -Force

Import-Module ~\Documents\WindowsPowerShell\Modules\posh-jump\posh-jump.psd1

Write-Host "Install successful. Restart powershell now"