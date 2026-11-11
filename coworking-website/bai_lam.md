# BÀI LÀM – HACKATHON 02

- **Mã đề:** 09
- **Họ tên:**Vũ Đức Việt Anh
- **Lớp:**K26CNTT2
- **Link repository:**
- **Hệ điều hành (Windows/macOS):**Windows

## 4.2. Thao tác máy tính cơ bản bằng CLI

### Các lệnh đã chạy

```shell
# Ghi lần lượt các lệnh đã chạy, mỗi lệnh một dòng
pwd
get-childtiem -recurse -force
mv noi_quy_thanh_vien.txt docs
mkdir backup
cp data/thue_cho_thang_9.xlsx backup
rm .tmp
cd logs| get-childitem logs| cd..

```

### Kết quả liệt kê toàn bộ dự án (Windows: Get-ChildItem -Recurse -Force; macOS: ls -aR)

```text

PS C:\Users\hongn\OneDrive\Desktop\starter-kit\coworking-website> Get-ChildItem -Recurse -Force


    Directory: C:\Users\hongn\OneDrive\Desktop\starter-kit\coworking-website


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-r---        11/11/2026   1:41 PM                backup
d-r---        11/11/2026   1:41 PM                data
d-r---        11/11/2026   1:41 PM                docs
d-r---        11/11/2026   1:32 PM                evidence
d-r---        11/11/2026   1:34 PM                logs
d-r---        11/11/2026   1:30 PM                web
-a----         11/3/2026   7:08 AM             72 .env
-a----        11/11/2026   1:40 PM           2602 bai_lam.md
-a----         11/3/2026   7:08 AM             22 temp_909.tmp


    Directory: C:\Users\hongn\OneDrive\Desktop\starter-kit\coworking-website\backup


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/3/2026   7:08 AM           6162 thue_cho_thang_9.xlsx


    Directory: C:\Users\hongn\OneDrive\Desktop\starter-kit\coworking-website\data


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/3/2026   7:08 AM           6162 thue_cho_thang_9.xlsx


    Directory: C:\Users\hongn\OneDrive\Desktop\starter-kit\coworking-website\docs


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/3/2026   7:08 AM            146 noi_quy_thanh_vien.txt


    Directory: C:\Users\hongn\OneDrive\Desktop\starter-kit\coworking-website\logs


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/3/2026   7:08 AM            991 member.log


    Directory: C:\Users\hongn\OneDrive\Desktop\starter-kit\coworking-website\web


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-r---        11/11/2026   1:30 PM                images
-a----         11/3/2026   7:08 AM            605 app.js
-a----         11/3/2026   7:08 AM            543 index.html
-a----         11/3/2026   7:08 AM            460 style.css


    Directory: C:\Users\hongn\OneDrive\Desktop\starter-kit\coworking-website\web\images


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/3/2026   7:08 AM           3069 logo-coworkhub.png


```

## 4.3. Lọc log truy cập website

### a) Lệnh lọc các dòng status=500

```shell
  select-string "500" -path  logs/member.log >logs/loi_500.txt

```

### 2 dòng đầu tiên trong logs/loi_500.txt

```text
logs\member.log:3:2026-09-28 08:10:39 POST /api/dat-cho status=500
logs\member.log:4:2026-09-28 08:12:50 POST /api/dat-cho status=500

```

### b) Lệnh đếm số dòng status=404 và kết quả

```shell
select-string "404" -path  logs/member.log |measure-object

```

```text
PS C:\Users\hongn\OneDrive\Desktop\starter-kit\coworking-website> select-string "404" -path  logs/member.log |measure-object


Count    : 4
Average  :
Sum      :
Maximum  :
Minimum  :
Property :

```

## 4.4. Chạy script tong_hop (.ps1 hoặc .sh)

### Lệnh chạy (Windows: nếu dùng Phụ lục 2 thì ghi cả 2 lệnh)

```shell
# Script: tong_hop.ps1
# Tac gia: Vũ Đức Việt Anh
# Ngay tao: 11/11/2026
Write-Host "Dang tao bao cao.."
"=== BAO CAO SU CO WEBSITE ===" > logs/tong_hop.txt
Get-content logs/member.log | select-string "404" >> logs/tong_hop.txt
Get-content logs/member.log | select-string "500" | measure-object >> logs/tong_hop.txt
Write-Host "Hoan thanh"

```

### Nội dung file logs/tong_hop.txt

```text
=== BAO CAO SU CO WEBSITE ===

2026-09-28 08:28:45 GET /images/phong-hop-3.jpg status=404
2026-09-28 08:41:40 GET /goi-cu status=404
2026-09-28 08:49:13 GET /images/phong-hop-3.jpg status=404
2026-09-28 08:59:46 GET /images/phong-hop-3.jpg status=404




Count    : 6
Average  : 
Sum      : 
Maximum  : 
Minimum  : 
Property : 



```

## 4.5. README.md và bảo vệ thông tin bí mật

> README.md, .gitignore và .env.example được chấm trực tiếp trên file ở gốc dự án. Đánh dấu `[x]` vào các mục đã làm để tự kiểm tra.

- [x] README.md: Heading 1, mô tả có **in đậm** và *in nghiêng*, bảng, code block, task list, blockquote
- [x] .gitignore có dòng `.env` (tên file đúng, không có đuôi .txt)
- [x] .env.example có đủ tên biến, giá trị để trống (tên file đúng, không có đuôi .txt)

## 4.6. Kiểm tra trang web bằng DevTools (F12) và báo cáo lỗi

### Bảng lỗi

| STT | Tab DevTools phát hiện lỗi | Tên file hoặc thông báo lỗi | Cách khắc phục |
| --- | --- | --- | --- |
| 1 | Network | Failed to load resource: the server responded with a status of 404 (Not Found) | sửa lại đúng tên " logo-coworkhub.png |
| 2 | Console | ncaught ReferenceError: hienThiBangThue is not defined at app.js:18:1 | sửa lại đúng tên trong file app.ls dòng 18 thành hienThiGoiThue |

> Ảnh chụp màn hình lưu trong thư mục `evidence/` (network.png, console.png).

### Báo cáo lỗi gửi trưởng nhóm

- **Context:nhóm đang tạo 1 trang web có chức năng ghi lại bảng giá thuê chỗ nhưng bị lỗi** 
- **Expected:hiển thị được kết quả giá tiền** 
- **Actual:thực tế không thể chạy được ra kết quả** 
- **Log:ngày 11/11/2026 lỗi:Failed to load resource: the server responded with a status of 404 (Not Found)** 

### Câu tìm kiếm Google

```text
"Failed to load resource: the server responded with a status of 404 (Not Found)" site: stackoverflow.com

```

## 4.7. Excel

> Phần Excel được chấm trực tiếp trên file `data/thue_cho_thang_9.xlsx`, không cần ghi vào đây.
