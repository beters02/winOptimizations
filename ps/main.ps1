$registryScript = ".\ps\registry.ps1"
$debloatScript = ".\ps\debloatApp.ps1"

Write-Host "The current directory is: $PWD"

Write-Host "RUNNING OPTIMIZER SCRIPT" -ForegroundColor Green

# Check if the current session is running as Administrator
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Elevating privileges to Administrator..." -ForegroundColor Yellow
    
    # Relaunch the script as administrator
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    
    # Exit the current non-elevated script session
    Exit
}

# REGISTRY

Write-Host "Would you like to run the registry changes script? (y / N)" -ForegroundColor Cyan

# Captures a single key press immediately
$runRegistryKeyInfo = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# y = 89
# n = 78
# Extract the character or key name
$runRegistryKeyName = $runRegistryKeyInfo.VirtualKeyCode

if ($runRegistryKeyName -eq 89) {
    Write-Host "Running registry editor script" -ForegroundColor Green
    powershell.exe -ExecutionPolicy Bypass -File $registryScript
} else {
    Write-Host "Skipping registry editor script" -ForegroundColor Yellow
}

# DEBLOAT

Write-Host "Would you like to open the debloater? (y / N)" -ForegroundColor Cyan

# Captures a single key press immediately
$runDebloaterKeyInfo = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# y = 89
# n = 78
# Extract the character or key name
$runDebloaterKeyName = $runDebloaterKeyInfo.VirtualKeyCode

if ($runDebloaterKeyName -eq 89) {
    Write-Host "Opening debloater app" -ForegroundColor Green
    powershell.exe -ExecutionPolicy Bypass -File $debloatScript
} else {
    Write-Host "Skipping debloat app" -ForegroundColor Yellow
}

Write-Host "OPTIMIZER SCRIPT FINISHED!" -ForegroundColor Green