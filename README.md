# Photoshop Dockurr (Docker + Windows VM access scripts)

Repository này chỉ chứa hạ tầng Docker, script tối ưu và tài liệu vận hành.
Không bao gồm file nhị phân/phần mềm có bản quyền hoặc dữ liệu runtime cỡ lớn.

## Mục tiêu
- Chạy môi trường Windows trong container với image `dockurr/windows`
- Truy cập qua RDP / noVNC / VNC
- Dùng các script có sẵn để tối ưu trải nghiệm remote desktop

## Yêu cầu
- Docker Desktop
- Tối thiểu đề xuất: RAM 16GB host
- Mở cổng cục bộ: `8006`, `3389`, `5900`

## Cách sử dụng sau khi pull

### 1) Pull repo
```bash
git clone https://github.com/ngominhthien2004/Photoshop_Dockurr.git
cd Photoshop_Dockurr
```

### 2) Chuẩn bị dữ liệu cục bộ (không có trong git)
- Tạo thư mục runtime:
  - `windows-data/`
  - `Data/`
- Chuẩn bị payload ứng dụng hợp pháp của bạn vào đúng vị trí local nếu cần.

### 3) Giải nén Photoshop (bắt buộc)
- Chuẩn bị file nén Photoshop hợp pháp của bạn.
- Giải nén vào thư mục local:
  - `input-output/Photoshop/`
- Đảm bảo sau khi giải nén có thể truy cập được bộ cài/portable trong `input-output/Photoshop/` từ bên trong VM qua thư mục Shared.

### 4) Chạy container
```bash
docker compose up -d
```

### 5) Kết nối
- RDP: mở file `Photoshop-RDP-Fast.rdp`
- noVNC: `http://localhost:8006`
- VNC: `localhost:5900`

Mặc định trong `docker-compose.yml`:
- Username: `docker`
- Password: `password`

### 6) Cài/khởi chạy Photoshop trong VM và tối ưu
Trong thư mục shared:
- Mở thư mục `Photoshop` (phần đã giải nén ở bước 3)
- Nếu cần, chạy `Install-Photoshop-Local.bat`
- Chạy `Optimize-Windows.bat` (Run as Administrator)
- Chạy `Clean-Windows.bat` (Run as Administrator)
- Restart VM
- Chạy `Optimize-Photoshop.reg`

## Truy cập từ máy khác (tuỳ chọn)
Trên host chạy PowerShell (Admin):
```powershell
.\Enable-Remote-Access.ps1
```
Sau đó dùng:
- RDP: `<host-ip>:3389`
- Web: `http://<host-ip>:8006`
- VNC: `<host-ip>:5900`

## Bảo mật khuyến nghị
- Đổi `USERNAME`/`PASSWORD` trong `docker-compose.yml`
- Chỉ mở firewall khi thật sự cần
- Không expose cổng trực tiếp ra Internet nếu không có VPN/reverse proxy bảo mật

## Ghi chú
Nếu bạn lỡ tạo dữ liệu lớn trong `windows-data/` và `Data/`, các thư mục này đã được `.gitignore` loại trừ để tránh push nhầm lên GitHub.
