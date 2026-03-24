@echo off
echo ========================================
echo  Enabling Remote Desktop (RDP)
echo ========================================

REM Enable Remote Desktop
echo [1/5] Enabling Remote Desktop...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

REM Enable RDP through Windows Firewall
echo [2/5] Configuring Windows Firewall...
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

REM Allow connections from any version of Remote Desktop
echo [3/5] Setting RDP security level...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f

REM Add user to Remote Desktop Users group
echo [4/5] Adding user to Remote Desktop Users group...
net localgroup "Remote Desktop Users" docker /add

REM Restart Remote Desktop service
echo [5/5] Restarting Remote Desktop service...
net stop TermService /y
net start TermService

echo.
echo ========================================
echo  Remote Desktop is now enabled!
echo  You can now connect via RDP:
echo  - Address: localhost:3389
echo  - Username: docker
echo  - Password: password
echo ========================================
pause
