$registryScript = ".\ps\registry.ps1"
$debloatScript = ".\ps\debloatApp.ps1"

Write-Host ""
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

Write-Host ""
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

Write-Host ""
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

Write-Host ""
Write-Host "OPTIMIZER SCRIPT FINISHED!" -ForegroundColor Green
Write-Host ""

# Restart prompt
Write-Host "You must restart your computer in order to apply the changes. Would you like to restart now? (y / N)" -ForegroundColor Cyan

$restartKeyInfo = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
$restartKeyName = $restartKeyInfo.VirtualKeyCode

if ($restartKeyName -eq 89) {
    for ($i = 3; $i -gt 0; $i--) {
        Write-Host -NoNewline "`rRestarting PC in $i seconds... " -ForegroundColor Green
        Start-Sleep -Seconds 1
    }

    # Clear the countdown line
    Write-Host "`r$(' ' * 50)`r" -NoNewline

    Restart-Computer -Force
} else {
    Write-Host ""
    Write-Host "Thank you for using winOptimizations!" -ForegroundColor Green
    Write-Host ""

    for ($i = 3; $i -gt 0; $i--) {
        Write-Host -NoNewline "`rClosing window in $i seconds... " -ForegroundColor Green
        Start-Sleep -Seconds 1
    }

    # Clear the countdown line
    Write-Host "`r$(' ' * 50)`r" -NoNewline

    Exit
}