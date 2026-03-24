@echo off
echo Starting Photoshop in Safe Mode...
cd /d "%~dp0PhotoshopPortable\App\Photoshop"
start "" "Photoshop.exe" -noSplash -disableGPU
