📋 Hướng dẫn thực hiện (Theo thứ tự):
Bước 1: Dùng file RDP tối ưu (Trên máy host)
Đóng kết nối RDP hiện tại
Vào thư mục: D:\Crack\[photoshopcs6portable.com]Adobe Photoshop CC 2020 Portable\Adobe Photoshop CC 2020 Portable
Double-click file Photoshop-RDP-Fast.rdp
Username: docker, Password: password
Lưu ý: RDP này đã tắt hết hiệu ứng đồ họa
Bước 2: Tối ưu Windows (Trong VM qua RDP)
Mở folder Shared trên Desktop
Right-click Optimize-Windows.bat → Run as administrator → Đợi xong
Right-click Clean-Windows.bat → Run as administrator
Restart Windows: Win + R → shutdown /r /t 0
Bước 3: Tối ưu Photoshop (Trong VM sau khi restart)
Mở folder Shared
Double-click Optimize-Photoshop.reg → Yes → OK
Chạy Photoshop
💡 Các tips thêm:
A. Tắt hiệu ứng Windows thủ công (nếu script chưa đủ):
Win + R → gõ: SystemPropertiesPerformance → Enter
Chọn "Adjust for best performance"
OK
B. Tắt Windows Defender thủ công:
Win + R → gõ: windowsdefender: → Enter
Tắt Real-time protection
C. Giảm độ phân giải trong Photoshop:
Edit → Preferences → Interface
Giảm UI Scaling về 100%
📊 Kết quả mong đợi:
Tối ưu	Cải thiện
RDP Fast file	⭐⭐⭐ Mượt hơn 30-40%
Optimize-Windows.bat	⭐⭐⭐⭐ Giảm lag đáng kể
Optimize-Photoshop.reg	⭐⭐⭐ Photoshop nhanh hơn
Tắt hiệu ứng đồ họa	⭐⭐ Responsive hơn
