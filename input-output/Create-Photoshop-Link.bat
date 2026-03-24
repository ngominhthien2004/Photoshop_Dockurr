@echo off
echo ========================================
echo  Creating symbolic link for Photoshop
echo ========================================

set SOURCE=C:\Users\docker\Desktop\Shared\PhotoshopPortable
set TARGET=C:\PhotoshopPortable

echo Creating symbolic link...
mklink /D "%TARGET%" "%SOURCE%"

if errorlevel 1 (
    echo ERROR: Failed to create symbolic link!
    echo Try running as Administrator.
    pause
    exit /b 1
)

echo.
echo Symbolic link created successfully!
echo Now you can run Photoshop from C:\PhotoshopPortable
pause
