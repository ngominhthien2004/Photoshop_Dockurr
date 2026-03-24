@echo off
echo ========================================
echo  Cleaning Windows Temp Files
echo ========================================

echo [1/4] Cleaning Temp folder...
del /s /f /q %TEMP%\*.* >nul 2>&1
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1

echo [2/4] Cleaning Prefetch...
del /s /f /q C:\Windows\Prefetch\*.* >nul 2>&1

echo [3/4] Cleaning Downloads...
del /s /f /q %USERPROFILE%\Downloads\*.* >nul 2>&1

echo [4/4] Running Disk Cleanup...
cleanmgr /sagerun:1 >nul 2>&1

echo.
echo ========================================
echo  Cleanup Complete!
echo ========================================
pause
