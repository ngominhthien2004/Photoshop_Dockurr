@echo off
echo ========================================
echo  Optimizing Windows for Performance
echo ========================================

REM Disable Windows Defender
echo [1/8] Disabling Windows Defender...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true" 2>nul

REM Disable Windows Update
echo [2/8] Disabling Windows Update...
sc config wuauserv start=disabled >nul 2>&1
net stop wuauserv >nul 2>&1

REM Disable Windows Search
echo [3/8] Disabling Windows Search...
sc config WSearch start=disabled >nul 2>&1
net stop WSearch >nul 2>&1

REM Disable Superfetch
echo [4/8] Disabling Superfetch...
sc config SysMain start=disabled >nul 2>&1
net stop SysMain >nul 2>&1

REM Disable visual effects for best performance
echo [5/8] Disabling visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f >nul 2>&1

REM Disable animations
echo [6/8] Disabling animations...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

REM Set High Performance power plan
echo [7/8] Setting High Performance power plan...
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

REM Disable unnecessary services
echo [8/8] Disabling unnecessary services...
sc config DiagTrack start=disabled >nul 2>&1
sc config dmwappushservice start=disabled >nul 2>&1
sc config RetailDemo start=disabled >nul 2>&1

echo.
echo ========================================
echo  Optimization Complete!
echo  Please restart Windows VM for changes to take effect.
echo ========================================
pause
