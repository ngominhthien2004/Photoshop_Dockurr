@echo off
echo ========================================
echo  Installing Photoshop to Local Drive
echo ========================================

set SOURCE=C:\Users\docker\Desktop\Shared\PhotoshopPortable
set TARGET=C:\PhotoshopPortable

echo [1/3] Checking if Photoshop already installed...
if exist "%TARGET%" (
    echo Photoshop already installed at %TARGET%
    echo Skipping installation...
    goto :RUN
)

echo [2/3] Copying Photoshop from Shared folder to C:\
echo This may take 3-5 minutes...
xcopy "%SOURCE%" "%TARGET%" /E /I /H /Y /Q

if errorlevel 1 (
    echo ERROR: Failed to copy Photoshop!
    pause
    exit /b 1
)

echo [3/3] Installation complete!

:RUN
echo.
echo ========================================
echo  Starting Photoshop...
echo ========================================

cd /d "%TARGET%\App\Photoshop"
start "" "Photoshop.exe"

echo Photoshop started!
echo.
echo You can create a shortcut to this batch file for easy access.
pause
