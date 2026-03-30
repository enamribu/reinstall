@echo off
net accounts /lockoutthreshold:0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v InstallChrome /t REG_SZ /d "powershell -ExecutionPolicy Bypass -Command \"$url='https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi'; $dst='C:\Windows\Temp\chrome.msi'; Invoke-WebRequest -Uri $url -OutFile $dst; Start-Process msiexec.exe -ArgumentList '/i `\"' + $dst + '`\" /qn /norestart' -Wait\"" /f
mode con cp select=437 >nul

set C=%SystemDrive:~0,1%
for /f "tokens=2" %%a in ('echo list vol ^| diskpart ^| findstr "\<installer\>"') do (echo select vol %%a & echo delete partition) | diskpart
for /f "tokens=2" %%a in ('echo list vol ^| diskpart ^| findstr "\<%C%\>"') do (echo select vol %%a & echo extend) | diskpart
del "%~f0"



