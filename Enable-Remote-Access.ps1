# Run this script as Administrator
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " Opening Firewall for Remote Access" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# RDP Port
Write-Host "[1/3] Opening port 3389 (RDP)..." -ForegroundColor Yellow
New-NetFirewallRule -DisplayName "Docker Photoshop RDP" -Direction Inbound -Protocol TCP -LocalPort 3389 -Action Allow -Profile Any -ErrorAction SilentlyContinue | Out-Null

# noVNC Port
Write-Host "[2/3] Opening port 8006 (noVNC Web)..." -ForegroundColor Yellow
New-NetFirewallRule -DisplayName "Docker Photoshop noVNC" -Direction Inbound -Protocol TCP -LocalPort 8006 -Action Allow -Profile Any -ErrorAction SilentlyContinue | Out-Null

# VNC Port
Write-Host "[3/3] Opening port 5900 (VNC)..." -ForegroundColor Yellow
New-NetFirewallRule -DisplayName "Docker Photoshop VNC" -Direction Inbound -Protocol TCP -LocalPort 5900 -Action Allow -Profile Any -ErrorAction SilentlyContinue | Out-Null

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host " Firewall Configuration Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Get local IP
$ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -notlike "*Loopback*" -and $_.IPAddress -notlike "169.254.*"} | Select-Object -First 1).IPAddress

Write-Host "Your computer IP address: $ip" -ForegroundColor Cyan
Write-Host ""
Write-Host "Other computers can now connect using:" -ForegroundColor White
Write-Host "  - RDP:    $ip:3389" -ForegroundColor Yellow
Write-Host "  - Web:    http://$ip:8006" -ForegroundColor Yellow
Write-Host "  - VNC:    $ip:5900" -ForegroundColor Yellow
Write-Host ""
Write-Host "Login credentials:" -ForegroundColor White
Write-Host "  Username: docker" -ForegroundColor Cyan
Write-Host "  Password: password" -ForegroundColor Cyan
Write-Host ""
Pause
