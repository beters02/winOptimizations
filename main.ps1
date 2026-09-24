Write-Host "RUNNING OPTIMIZER SCRIPT" -ForegroundColor Green

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
    powershell.exe -ExecutionPolicy Bypass -File ".\registry.ps1"
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
    Write-Host "Opening debloater" -ForegroundColor Green
    powershell.exe -ExecutionPolicy Bypass -File ".\debloatApp.ps1"
} else {
    Write-Host "Skipping debloat app" -ForegroundColor Yellow
}

Write-Host "OPTIMIZER SCRIPT FINISHED!" -ForegroundColor Green