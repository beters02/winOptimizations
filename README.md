WIP windows optimization script.

- Runs Chris Titus Tech Utility Script

- Changes some registry keys
  - "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games"
    - Scheduling Category: High
    - BackgroundPriority: 0
    - SFIO Priority: High
    - Latency Sensitive: True
  - "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl"
    - Win32PrioritySeparation: 38
  - "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
    - SystemResponsiveness: 10
    - NetworkThrottlingIndex: 0xffffffff