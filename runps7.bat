C:\Program Files\PowerShell\7

@echo OFF
SET ThisDir=%~dp0
SET PowerShellScriptPath=%ThisDir%ps\main.ps1

echo Launching PowerShell script as Administrator...
powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process pwsh -ArgumentList '-WorkingDirectory ""%ThisDir%"" -NoProfile -ExecutionPolicy Bypass -File ""%PowerShellScriptPath%""' -Verb RunAs}"