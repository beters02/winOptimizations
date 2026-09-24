Write-Host "--- GAMING ---" -ForegroundColor Green
# Updates the gaming task scheduling category
Write-Host "Setting Scheduling Priority to High" -ForegroundColor Yellow
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "Scheduling Category" -Value "High" -PropertyType String -Force

# Updates the gaming task background priority
Write-Host "Setting BackgrondPriority to 0" -ForegroundColor Yellow
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "BackgroundPriority" -Value 0 -PropertyType DWORD -Force

# Updates the gaming task sfio priority
Write-Host "Setting SFIO Priority to High" -ForegroundColor Yellow
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "SFIO Priority" -Value "High" -PropertyType String -Force

# Updates the gaming task latency sensitive
Write-Host "Enabling Latency Sensitive" -ForegroundColor Yellow
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "Latency Sensitive" -Value "True" -PropertyType String -Force

Write-Host "--- PRIORITY CONTROL ---" -ForegroundColor Green
# 36, 20, 41, 64, 55
# Adjusts the foreground/background priority separation
Write-Host "Setting Win32PrioritySeparation to 38" -ForegroundColor Yellow
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 38 -PropertyType DWORD -Force

Write-Host "--- MULTIMEDIA ---" -ForegroundColor Green

# Sets system responsiveness reserve to 10
Write-Host "Setting SystemResponsiveness to 10" -ForegroundColor Yellow
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 10 -PropertyType DWORD -Force

Write-Host "Setting NetworkThrottlingIndex to a weird number" -ForegroundColor Yellow
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -PropertyType DWORD -Force

Write-Host "REG EDIT SCRIPT HAS FINISHED!" -ForegroundColor Green