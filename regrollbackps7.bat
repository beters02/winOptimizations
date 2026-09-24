@echo OFF
SET ThisDir=%~dp0
SET PowerShellScriptPath=%ThisDir%ps\rollbackRegistry.ps1

echo Launching PowerShell script as Administrator...
powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process pwsh -ArgumentList '-NoExit -WorkingDirectory ""%ThisDir%"" -NoProfile -ExecutionPolicy Bypass -File ""%PowerShellScriptPath%""' -Verb RunAs}"