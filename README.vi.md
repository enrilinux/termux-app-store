<div align="center">

<img src=".assets/00.jpeg" width="420" alt="Termux App Store — Trình quản lý gói TUI cho Termux"/>

<br/>

<H1>
  <a href="https://djunekz.github.io/termux-app-store/">Termux App Store — Trình Quản Lý Gói TUI & CLI cho Termux</a>
</H1>

**Trình quản lý gói offline-first và source-based đầu tiên được xây dựng dành riêng cho Termux trên Android.**

[![CI](https://github.com/djunekz/termux-app-store/actions/workflows/build.yml/badge.svg)](https://github.com/djunekz/termux-app-store/actions)
[![Codecov](https://codecov.io/github/djunekz/termux-app-store/branch/master/graph/badge.svg?token=357W4EP8G0)](https://codecov.io/github/djunekz/termux-app-store)
[![PyPI](https://img.shields.io/pypi/v/termux-app-store?style=flat&logo=pypi&color=3fb950&label=pypi)](https://pypi.org/project/termux-app-store/)<br>
![Phiên bản](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fdjunekz%2Ftermux-app-store%2Ftags&query=%24%5B0%5D.name&style=flat&logo=github&color=3fb950&label=phát+hành)
[![Tải về](https://img.shields.io/github/downloads/djunekz/termux-app-store/total?style=flat&logo=github&color=3fb950&logoColor=white)](https://github.com/djunekz/termux-app-store)
[![Giấy phép](https://img.shields.io/badge/Giấy_phép-MIT-3fb950?style=flat&logo=opensourceinitiative&logoColor=white)](LICENSE)
<br>
<br>
[![Stars](https://img.shields.io/github/stars/djunekz/termux-app-store?style=flat&logo=github&color=white&label=stars&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/stargazers)
[![Forks](https://img.shields.io/github/forks/djunekz/termux-app-store?style=flat&logo=github&color=white&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/network)
<br>
<br>
[![Issues](https://img.shields.io/badge/issues-open-3fb950?style=flat&logo=github&logoColor=white)](https://github.com/djunekz/termux-app-store/issues)
[![PRs](https://img.shields.io/github/issues-pr/djunekz/termux-app-store?style=flat&logo=git&logoColor=white&color=3fb950)](https://github.com/djunekz/termux-app-store/pulls)
[![Cộng đồng](https://img.shields.io/badge/Cộng_đồng-Mở-3fb950?style=flat&logo=github)](https://github.com/djunekz/termux-app-store)

> **Offline-first &nbsp;•&nbsp; Dựa trên Source &nbsp;•&nbsp; An toàn &nbsp;•&nbsp; Native Termux &nbsp;•&nbsp; Android Terminal**

> Cài đặt và quản lý gói Termux từ source code — không cần root, không cần tài khoản, không có telemetry

> Đọc bằng ngôn ngữ: 🇬🇧 **[English](README.md)** &nbsp;|&nbsp; 🇮🇩 [Indonesia](README.id.md) &nbsp;|&nbsp; 🇹🇭 **[ภาษาไทย](README.th.md)** &nbsp;|&nbsp; 🇯🇵 **[日本語](README.jp.md)** &nbsp;|&nbsp; 🇨🇳 **[中文](README.ch.md)**

</div>

---

# Termux App Store là gì?

**Termux App Store** (`termux-app-store`) là **trình quản lý gói TUI (Terminal User Interface)** và **CLI** được xây dựng bằng Python ([Textual](https://github.com/Textualize/textual)), cho phép người dùng Termux trên Android **duyệt, xây dựng, cài đặt và quản lý công cụ/gói** trực tiếp trên thiết bị — không cần tài khoản, không có telemetry, không phụ thuộc cloud, không cần root.

Dự án hoạt động như một **trình quản lý gói thay thế cho Termux**, cho phép cài đặt các công cụ cộng đồng từ source bằng các script `build.sh` đã được xác minh SHA256 — tinh thần tương tự AUR (Arch User Repository) nhưng được thiết kế riêng cho Termux trên Android.

> [!IMPORTANT]
> Termux App Store **không phải là kho binary tập trung** và **không phải là auto-installer ẩn**.
> Tất cả các build chạy **cục bộ, minh bạch và hoàn toàn dưới sự kiểm soát của người dùng**.

---

# Khác gì so với `termux-packages` và TUR?

| | `termux-packages` | TUR | **Termux App Store** |
|---|---|---|---|
| Ai quản lý | Nhóm core Termux | Người đóng góp được chọn lọc | Cộng đồng mở |
| Cần phê duyệt? | Có, nghiêm ngặt | Có | Không — PR dùng được ngay |
| Phân phối binary? | Có | Có | Không — build từ source cục bộ |
| Phù hợp công cụ cá nhân? | Không | Giới hạn | **Có** |
| Xác minh SHA256 | Có | Có | **Có** |
| Dùng offline được? | Không | Không | **Có, hoàn toàn** |

**Khi nào nên dùng Termux App Store?**
- Công cụ của bạn không được chấp nhận vào `termux-packages` hoặc TUR vì quá chuyên biệt
- Bạn muốn nhanh chóng phân phối công cụ tự làm cho cộng đồng
- Bạn muốn kiểm soát hoàn toàn — build, install, uninstall — không phụ thuộc server

---

# Dành cho ai?

| Người dùng | Trường hợp sử dụng |
|---|---|
| Người dùng Termux | Kiểm soát hoàn toàn build và gói phần mềm |
| Nhà phát triển | Phân phối công cụ qua source-based packaging |
| Người đánh giá & Kiểm toán | Xem xét và xác thực script build |
| Người bảo trì | Quản lý nhiều gói Termux cùng một lúc |

---

# Ảnh chụp màn hình

<div align="center">

<img src=".assets/0.jpeg" width="74%" alt="Termux App Store — Giao diện chính"/>

<br/><br/>
<H1>Giao diện TUI</H1>

| TUI Chính | TUI Cài đặt | Menu Palette |
|:---:|:---:|:---:|
| <img src=".assets/0main.jpg" width="220" alt="TUI Main Interface"/> | <img src=".assets/1install.jpg" width="220" alt="TUI Install Interface"/> | <img src=".assets/2pallete.jpg" width="220" alt="Menu Palette Interface"/> |
| Menu chính TUI | Quá trình cài đặt gói | Command palette |

> TUI thân thiện với người dùng, hỗ trợ **màn hình cảm ứng** hoàn toàn

---

<H1>Giao diện CLI</H1>

| Hỗ trợ công cụ khác | CLI Cài đặt | CLI Xem |
|:---:|:---:|:---:|
| <img src=".assets/0tas-and-termux-build.jpg" width="220" alt="Other tools support"/> | <img src=".assets/0cli-install.jpg" width="220" alt="CLI Install Interface"/> | <img src=".assets/0cli-view.jpg" width="220" alt="CLI View Interface"/> |
| tasctl và termux-build | Quá trình cài đặt gói | CLI help, list và show |

</div>

---

# Cách cài đặt và gỡ cài đặt

> Có sẵn trên **[PyPI](https://pypi.org/project/termux-app-store/)** — có thể tìm kiếm và cài đặt trực tiếp qua pip

### Tùy chọn 1 (Khuyến nghị)
```bash
pkg install python
pip install termux-app-store
```

### Tùy chọn 2 (Thủ công)
```bash
curl -fsSL https://raw.githubusercontent.com/djunekz/termux-app-store/master/tasctl | bash -s install
```

hoặc

```bash
git clone https://github.com/djunekz/termux-app-store
cd termux-app-store
bash install.sh
```

Sau khi cài đặt, chạy:
```bash
termux-app-store        # Mở TUI tương tác
termux-app-store -h     # Hiển thị trợ giúp CLI
```

## Gỡ cài đặt
```bash
pip uninstall termux-app-store
```
hoặc
```bash
./tasctl uninstall
```

---

# Cách sử dụng

### TUI — Giao diện tương tác
```bash
termux-app-store
```

### CLI — Lệnh trực tiếp

```bash
termux-app-store list                  # Liệt kê tất cả gói
termux-app-store show <gói>            # Xem chi tiết gói
termux-app-store install <gói>         # Build & cài đặt gói
termux-app-store update                # Kiểm tra cập nhật có sẵn
termux-app-store upgrade               # Nâng cấp tất cả gói
termux-app-store upgrade <gói>         # Nâng cấp gói cụ thể
termux-app-store version               # Kiểm tra phiên bản mới nhất
termux-app-store help                  # Trợ giúp đầy đủ
```

---

# Tính năng nổi bật

<table>
<tr>
<td width="50%">

**Trình duyệt gói (TUI)**
Duyệt gói từ thư mục `packages/` tương tác với bàn phím & màn hình cảm ứng

**Trình xác thực Build thông minh**
Phát hiện các dependency Termux không được hỗ trợ với badge trạng thái tự động

**Tìm kiếm & Lọc theo thời gian thực**
Tìm kiếm gói theo tên hoặc mô tả ngay lập tức — không cần reload

**Build một cú nhấp**
Cài đặt hoặc cập nhật gói chỉ với một cú nhấp qua `build-package.sh`

</td>
<td width="50%">

**Xác thực một cú nhấp**
Xác thực gói trước khi phân phối qua `./termux-build`

**Quản lý một cú nhấp**
Cài đặt / cập nhật / gỡ cài đặt Termux App Store qua `./tasctl`

**Tự động giải quyết đường dẫn**
Tự động phát hiện vị trí ứng dụng dù thư mục bị di chuyển hay đổi tên

**Ưu tiên quyền riêng tư**
Không tài khoản, không theo dõi, không telemetry — hoàn toàn offline

</td>
</tr>
</table>

---

# Cách tạo gói của riêng bạn

Mọi gói trong Termux App Store chỉ cần một file `build.sh` — tương tự PKGBUILD trong Arch Linux hay formula trong Homebrew, nhưng được điều chỉnh cho Termux trên Android.

```
packages/<tên-công-cụ>/build.sh
```

### Template tối thiểu của `build.sh`

```bash
TERMUX_PKG_HOMEPAGE=""
TERMUX_PKG_DESCRIPTION=""
TERMUX_PKG_LICENSE=""
TERMUX_PKG_MAINTAINER="@tên-github-của-bạn"
TERMUX_PKG_VERSION=""
TERMUX_PKG_SRCURL=""
TERMUX_PKG_SHA256=""
```

### Tạo gói với `termux-build`

```bash
cd termux-app-store
./termux-build create tên-công-cụ-của-bạn
```

---

# Cách phân phối gói tới cộng đồng Termux

```bash
# 1. Fork repo này trên GitHub
# 2. Thêm thư mục gói của bạn:
mkdir packages/tên-công-cụ-của-bạn

# 3. Tạo build.sh từ template hoặc dùng termux-build
./termux-build create tên-công-cụ-của-bạn

# 4. Xác thực trước khi submit:
./termux-build lint packages/tên-công-cụ-của-bạn

# 5. Submit Pull Request vào repo này
```

Sau khi PR được merge, bất kỳ ai cũng có thể cài đặt ngay:
```bash
termux-app-store install tên-công-cụ-của-bạn
```

> Hướng dẫn đầy đủ: [HOW_TO_UPLOAD.md](HOW_TO_UPLOAD.md)

---

## Giấy phép

Dự án này được cấp phép theo **MIT License** — xem [LICENSE](LICENSE) để biết chi tiết

---

## Người bảo trì

<div align="center">

**Djunekz** — Nhà phát triển độc lập và chính thức

[![GitHub](https://img.shields.io/badge/GitHub-djunekz-3fb950?style=for-the-badge&logo=github)](https://github.com/djunekz)

</div>

---

## Ủng hộ dự án này

Nếu Termux App Store hữu ích với bạn:

- **Star** repo này — giúp người khác khám phá
- **Chia sẻ** trong cộng đồng Termux & Android
- **Báo lỗi** qua Issues
- **Gửi PR** cho bất kỳ cải tiến nào

---

## Từ khóa tìm kiếm

> Dự án này được phát triển độc lập và **không có liên kết** với dự án [Termux](https://github.com/termux/termux-app) chính thức.

**Từ khóa tìm kiếm:** termux app store · trình quản lý gói termux · thay thế termux-packages · thay thế TUR termux · cách cài đặt công cụ termux · cách phân phối gói termux · tự tạo gói termux · termux tui android · termux không cần root · termux package manager tiếng việt · quản lý gói android terminal · termux cộng đồng · termux build từ source · termux ngoại tuyến · kho lưu trữ tùy chỉnh termux · termux-app-store djunekz

---

<div align="center">

**© Termux App Store — Được xây dựng cho mọi người, bởi cộng đồng.**

</div>
