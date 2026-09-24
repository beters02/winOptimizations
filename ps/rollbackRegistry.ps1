# Check if the current session is running as Administrator
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Elevating privileges to Administrator..." -ForegroundColor Yellow
    
    # Relaunch the script as administrator
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    
    # Exit the current non-elevated script session
    Exit
}

$games = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games"

Write-Host "Restoring MMCSS Games settings..." -ForegroundColor Yellow

# Normal/default-style Games scheduling
New-ItemProperty `
    -Path $games `
    -Name "Scheduling Category" `
    -Value "Medium" `
    -PropertyType String `
    -Force

New-ItemProperty `
    -Path $games `
    -Name "SFIO Priority" `
    -Value "Normal" `
    -PropertyType String `
    -Force

New-ItemProperty `
    -Path $games `
    -Name "Priority" `
    -Value 2 `
    -PropertyType DWORD `
    -Force

# Remove custom/questionable additions
Remove-ItemProperty `
    -Path $games `
    -Name "BackgroundPriority" `
    -ErrorAction SilentlyContinue

Remove-ItemProperty `
    -Path $games `
    -Name "Latency Sensitive" `
    -ErrorAction SilentlyContinue

Write-Host "Done. Restart Windows before testing CS2." -ForegroundColor Green