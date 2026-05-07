<div align="center">

<img src=".assets/00.jpeg" width="420" alt="Termux App Store — Package Manager TUI untuk Termux"/>

<br/>

<H1>
  <a href="https://djunekz.github.io/termux-app-store/">Termux App Store — Package Manager TUI & CLI untuk Termux</a>
</H1>

**Package manager berbasis source pertama yang offline-first, dibangun khusus untuk Termux di Android.**

[![CI](https://github.com/djunekz/termux-app-store/actions/workflows/build.yml/badge.svg)](https://github.com/djunekz/termux-app-store/actions)
[![Codecov](https://codecov.io/github/djunekz/termux-app-store/branch/master/graph/badge.svg?token=357W4EP8G0)](https://codecov.io/github/djunekz/termux-app-store)
[![PyPI](https://img.shields.io/pypi/v/termux-app-store?style=flat&logo=pypi&color=3fb950&label=pypi)](https://pypi.org/project/termux-app-store/)<br>
![Versi](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fdjunekz%2Ftermux-app-store%2Ftags&query=%24%5B0%5D.name&style=flat&logo=github&color=3fb950&label=rilis)
[![Unduhan](https://img.shields.io/github/downloads/djunekz/termux-app-store/total?style=flat&logo=github&color=3fb950&logoColor=white)](https://github.com/djunekz/termux-app-store)
[![Lisensi](https://img.shields.io/badge/Lisensi-MIT-3fb950?style=flat&logo=opensourceinitiative&logoColor=white)](LICENSE)
<br>
<br>
[![Stars](https://img.shields.io/github/stars/djunekz/termux-app-store?style=flat&logo=github&color=white&label=stars&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/stargazers)
[![Forks](https://img.shields.io/github/forks/djunekz/termux-app-store?style=flat&logo=github&color=white&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/network)
<br>
<br>
[![Issues](https://img.shields.io/badge/issues-open-3fb950?style=flat&logo=github&logoColor=white)](https://github.com/djunekz/termux-app-store/issues)
[![PRs](https://img.shields.io/github/issues-pr/djunekz/termux-app-store?style=flat&logo=git&logoColor=white&color=3fb950)](https://github.com/djunekz/termux-app-store/pulls)
[![Community Ready](https://img.shields.io/badge/Komunitas-Terbuka-3fb950?style=flat&logo=github)](https://github.com/djunekz/termux-app-store)

> **Offline-first &nbsp;•&nbsp; Berbasis Source &nbsp;•&nbsp; Aman &nbsp;•&nbsp; Native Termux &nbsp;•&nbsp; Android Terminal**

> Install dan kelola package Termux dari source code — tanpa root, tanpa akun, tanpa telemetri.

> Baca dengan bahasa: 🇬🇧 **[English](README.md)** &nbsp;|&nbsp; 🇹🇭 **[ภาษาไทย](README.th.md)** &nbsp;|&nbsp; 🇯🇵 **[日本語](README.jp.md)** &nbsp;|&nbsp; 🇨🇳 **[中文](README.ch.md)** &nbsp;|&nbsp; 🇻🇳 **[Tiếng Việt](README.vi.md)** &nbsp;|&nbsp; 🇮🇳 **[हिन्दी](README.in.md)**

</div>

---

# Apa itu Termux App Store?

**Termux App Store** (`termux-app-store`) adalah **package manager TUI (Terminal User Interface)** dan **CLI** yang dibangun dengan Python ([Textual](https://github.com/Textualize/textual)). Memungkinkan pengguna Termux di Android untuk **menjelajah, membangun, menginstal, dan mengelola tools/paket** langsung di perangkat — tanpa akun, tanpa telemetri, tanpa koneksi cloud, tanpa root.

Proyek ini bekerja sebagai **alternatif package manager untuk Termux**, memungkinkan kamu menginstal tools komunitas dari source menggunakan skrip `build.sh` yang terverifikasi SHA256 — mirip semangat AUR (Arch User Repository) tapi dirancang khusus untuk Termux di Android.

> [!IMPORTANT]
> Termux App Store **bukan repositori binary terpusat** dan **bukan auto-installer tersembunyi**.
> Semua build berjalan **secara lokal, transparan, dan sepenuhnya di bawah kendali pengguna**.

---

# Apa Bedanya dengan `termux-packages` dan TUR?

Ini pertanyaan yang sering muncul. Berikut perbandingannya:

| | `termux-packages` | TUR | **Termux App Store** |
|---|---|---|---|
| Siapa yang kelola | Tim inti Termux | Kontributor terpilih | Komunitas terbuka |
| Perlu approval? | Ya, ketat | Ya | Tidak — PR langsung bisa dipakai |
| Distribusi binary? | Ya | Ya | Tidak — build dari source lokal |
| Cocok untuk tools pribadi? | Tidak | Terbatas | **Ya** |
| Verifikasi SHA256 | Ya | Ya | **Ya** |
| Bisa dipakai offline? | Tidak | Tidak | **Ya, sepenuhnya** |

**Kapan pakai Termux App Store?**
- Tool kamu tidak diterima di `termux-packages` atau TUR karena terlalu spesifik
- Kamu ingin distribusi tool buatan sendiri ke komunitas dengan cepat
- Kamu ingin full kontrol — build, install, uninstall — tanpa bergantung server

---

# Untuk Siapa?

| Pengguna | Kebutuhan |
|---|---|
| Pengguna Termux | Kontrol penuh atas build & paket |
| Developer | Distribusi tools via source-based packaging |
| Reviewer & Auditor | Memeriksa dan memvalidasi skrip build |
| Maintainer | Mengelola banyak paket Termux sekaligus |

---

# Tangkapan Layar

<div align="center">

<img src=".assets/0.jpeg" width="74%" alt="Termux App Store — Tampilan Utama"/>

<br/><br/>
<H1>Antarmuka TUI</H1>

| TUI Utama | TUI Install | Menu Palette |
|:---:|:---:|:---:|
| <img src=".assets/0main.jpg" width="220" alt="TUI Main Interface"/> | <img src=".assets/1install.jpg" width="220" alt="TUI Install Interface"/> | <img src=".assets/2pallete.jpg" width="220" alt="Menu Palette Interface"/> |
| Menu utama TUI | Proses install paket | Command palette |

> TUI ramah pengguna dengan dukungan **touchscreen** penuh

---

<H1>Antarmuka CLI</H1>

| Dukungan tools lain | CLI Install | CLI View |
|:---:|:---:|:---:|
| <img src=".assets/0tas-and-termux-build.jpg" width="220" alt="Other tools support"/> | <img src=".assets/0cli-install.jpg" width="220" alt="CLI Install Interface"/> | <img src=".assets/0cli-view.jpg" width="220" alt="CLI View Interface"/> |
| tasctl dan termux-build | Proses install paket | CLI help, list dan show |

---

<H1>GuideBook</H1>

| Daftar menu | Menu tentang | Menu cara upload |
|:---:|:---:|:---:|
| <img src=".assets/0guide-menu.png" width="220" alt="List menu"/> | <img src=".assets/0guide-about.png" width="220" alt="Menu about"/> | <img src=".assets/0guide-upload.png" width="220" alt="Menu how to upload"/> |
| Menu utama GuideBook | Informasi termux-app-store | Panduan cara upload |

> GuideBook adalah panduan informasi, jalankan: `python guidebook.py`

</div>

---

# Cara Install dan Uninstall

> Tersedia di **[PyPI](https://pypi.org/project/termux-app-store/)** — bisa langsung dicari dan diinstall via pip.

### Pilihan 1 (Direkomendasikan)
```bash
pkg install python
pip install termux-app-store
```

### Pilihan 2 (Manual)
> Sederhana (cocok jika memori terbatas)
```bash
curl -fsSL https://raw.githubusercontent.com/djunekz/termux-app-store/master/tasctl | bash -s install
```

atau

> Dengan git clone (untuk download semua file repository)
```bash
git clone https://github.com/djunekz/termux-app-store
cd termux-app-store
bash install.sh
```

Setelah install, jalankan:
```bash
termux-app-store        # Buka TUI interaktif
termux-app-store -h     # Tampilkan bantuan CLI
```

## Uninstall
```bash
pip uninstall termux-app-store
```
atau
```bash
./tasctl uninstall
```

---

# Cara Penggunaan

### TUI — Antarmuka Interaktif
```bash
termux-app-store
```

### CLI — Perintah Langsung

```bash
termux-app-store list                  # Tampilkan semua paket
termux-app-store show <paket>          # Lihat detail paket
termux-app-store install <paket>       # Build & install paket
termux-app-store update                # Cek pembaruan yang tersedia
termux-app-store upgrade               # Upgrade semua paket
termux-app-store upgrade <paket>       # Upgrade paket tertentu
termux-app-store version               # Cek versi terbaru
termux-app-store help                  # Bantuan lengkap
```

---

# Fitur Unggulan

<table>
<tr>
<td width="50%">

**Browser Paket (TUI)**
Jelajahi paket dari folder `packages/` secara interaktif dengan navigasi keyboard & touchscreen.

**Validator Build Cerdas**
Mendeteksi dependensi Termux yang tidak didukung dengan badge status otomatis.

**Pencarian & Filter Real-time**
Cari paket berdasarkan nama atau deskripsi secara instan — tanpa perlu reload.

**Build Satu Klik**
Install atau update paket dalam satu klik via `build-package.sh`.

</td>
<td width="50%">

**Validator Satu Klik**
Validasi paket sebelum distribusi via `./termux-build`.

**Kelola Satu Klik**
Install / update / uninstall Termux App Store sendiri via `./tasctl`.

**Path Resolver Otomatis**
Mendeteksi lokasi app otomatis meski folder dipindah atau diganti nama.

**Privasi Utama**
Tanpa akun, tanpa tracking, tanpa telemetri — sepenuhnya offline.

</td>
</tr>
</table>

---

# Badge Status Paket

| Badge | Keterangan |
|---|---|
| **NEW** | Paket baru ditambahkan (< 7 hari) |
| **UPDATE** | Versi baru tersedia |
| **INSTALLED** | Versi terpasang sudah terbaru |
| **UNSUPPORTED** | Dependensi tidak tersedia di Termux |

---

# Cara Membuat Paket Sendiri

Ingin membuat paket Termux sendiri dan mendistribusikannya ke komunitas? Setiap paket di Termux App Store hanya butuh satu file `build.sh` — mirip cara kerja PKGBUILD di Arch Linux atau formula di Homebrew, tapi disesuaikan untuk Termux di Android.

Setiap paket **wajib** memiliki file `build.sh`:

```
packages/<nama-tool>/build.sh
```

### Template Minimal `build.sh`

```bash
TERMUX_PKG_HOMEPAGE=""
TERMUX_PKG_DESCRIPTION=""
TERMUX_PKG_LICENSE=""
TERMUX_PKG_MAINTAINER="@username-github-kamu"
TERMUX_PKG_VERSION=""
TERMUX_PKG_SRCURL=""
TERMUX_PKG_SHA256=""
```

> [!NOTE]
> Lihat template lengkap di `template/build.sh`
> atau jalankan: `./termux-build template`

### Cara Membuat Paket dengan `termux-build`

```bash
cd termux-app-store
./termux-build create nama-tool-kamu
```

> [!NOTE]
> Saat penamaan, jangan gunakan spasi — gunakan tanda `-`. Contoh: `tool-buatan-saya`

---

# Cara Distribusi Package ke Komunitas Termux

Mau tool buatan kamu bisa diinstall oleh semua pengguna Termux di seluruh dunia? Begini caranya:

```bash
# 1. Fork repo ini di GitHub
# 2. Tambahkan folder paket kamu:
mkdir packages/nama-tool-kamu

# 3. Buat build.sh dari template atau dengan termux-build:
./termux-build create nama-tool-kamu

# 4. Validasi dulu sebelum submit:
./termux-build lint packages/nama-tool-kamu

# 5. Submit Pull Request ke repo ini
```

Setelah PR di-merge, tool kamu langsung bisa diinstall siapa saja via:
```bash
termux-app-store install nama-tool-kamu
```

> Panduan lengkap: [HOW_TO_UPLOAD.md](HOW_TO_UPLOAD.md)

---

## termux-build — Tool Validasi dan Build Paket

`termux-build` adalah tool bantu validasi dan review — bukan auto-upload atau auto-publish.

```bash
./termux-build create <paket>      # Buat paket untuk distribusi
./termux-build lint <paket>        # Lint skrip build
./termux-build init <url-repo>     # Auto buat dan build paket untuk distribusi
./termux-build check-pr <paket>    # Cek kesiapan PR
./termux-build doctor              # Diagnosa environment
./termux-build suggest <paket>     # Saran perbaikan paket
./termux-build explain <paket>     # Penjelasan detail paket
./termux-build template            # Generate template build.sh
./termux-build guide               # Panduan kontribusi
```

> [!NOTE]
> termux-build **hanya membaca dan memvalidasi** — tidak memodifikasi file atau upload ke GitHub.

## tasctl — Termux App Store Controller

`tasctl` adalah pengendali sistem termux-app-store.

```bash
./tasctl install       # Install Termux App Store (terbaru)
./tasctl update        # Update ke versi terbaru
./tasctl uninstall     # Hapus Termux App Store
./tasctl doctor        # Diagnosa environment
./tasctl self-update   # Update tasctl itu sendiri
./tasctl help          # Tampilkan bantuan
```

## guidebook — Panduan Lengkap Termux App Store

`guidebook.py` adalah panduan penggunaan, build, dan kontribusi ke Termux App Store.

```bash
python guidebook.py
```

> [!NOTE]
> guidebook saat ini mendukung dua bahasa: Bahasa Indonesia dan English.

---

# Arsitektur

```
termux-app-store/
├── packages/              # Direktori semua paket
│   └── <nama-tool>/
│       └── build.sh       # Metadata & skrip build
├── template/
│   └── build.sh           # Template paket
├── tasctl                 # Installer/updater/uninstaller TAS
├── termux-build           # Tool validasi & review
└── install.sh             # Installer utama
```

> Detail lengkap: [ARCHITECTURE](ARCHITECTURE.md)

---

# Keamanan & Privasi

<table>
<tr>
<td width="50%">

**Keamanan**
- Tidak butuh izin tambahan
- Tidak membuka port jaringan
- Tidak ada layanan berjalan di background
- Build hanya berjalan atas perintah eksplisit pengguna

</td>
<td width="50%">

**Privasi**
- Tanpa akun atau registrasi
- Tanpa analitik atau tracking
- Tanpa telemetri apapun
- Offline-first by design

</td>
</tr>
</table>

> Detail lengkap: [SECURITY](SECURITY.md) &nbsp;|&nbsp; [PRIVACY](PRIVACY.md) &nbsp;|&nbsp; [DISCLAIMER](DISCLAIMER.md)

---

## Kontribusi

Semua kontribusi sangat disambut!

| Cara Berkontribusi | Keterangan |
|---|---|
| Tambah paket | Submit tool paket baru |
| Laporkan bug | Buka issue di GitHub |
| Kirim PR | Perbaikan kode atau dokumentasi |
| Review PR | Bantu validasi kontribusi orang lain |
| Audit keamanan | Review keamanan skrip build |
| Perbaiki dokumentasi | Perjelas atau terjemahkan dokumentasi |

> Panduan lengkap: [CONTRIBUTING](CONTRIBUTING.md)

---

## Bantuan & Dokumentasi

| Dokumen | Keterangan |
|---|---|
| [FAQ](FAQ.md) | Pertanyaan yang sering ditanyakan |
| [TROUBLESHOOTING](TROUBLESHOOTING.md) | Solusi masalah umum |
| [HOW TO UPLOAD](HOW_TO_UPLOAD.md) | Cara upload tool kamu |
| [CONTRIBUTING](CONTRIBUTING.md) | Panduan kontribusi |
| [SUPPORT](SUPPORT.md) | Cara mendapat bantuan |

---

## Filosofi

> *"Lokal lebih utama. Kontrol di atas kemudahan. Transparansi di atas keajaiban."*

Termux App Store dibangun untuk pengguna yang ingin:
- Benar-benar memahami apa yang berjalan di perangkat mereka
- Mengontrol build dan sumber secara langsung
- Menghindari ketergantungan vendor dan cloud
- Berbagi tools secara terbuka dengan komunitas Termux

---

## Lisensi

Proyek ini dilisensikan di bawah **MIT License** — lihat [LICENSE](LICENSE) untuk detail.

---

## Maintainer

<div align="center">

**Djunekz** — Developer Independen & Resmi

[![GitHub](https://img.shields.io/badge/GitHub-djunekz-3fb950?style=for-the-badge&logo=github)](https://github.com/djunekz)

</div>

---

## Dukung Proyek Ini

Jika Termux App Store bermanfaat untukmu:

- **Beri bintang** repo ini — membantu orang lain menemukannya
- **Bagikan** di komunitas Termux & Android Indonesia
- **Laporkan bug** via Issues
- **Submit PR** untuk perbaikan apapun

---

## Kata Kunci Pencarian

> Proyek ini dikembangkan secara independen dan **tidak berafiliasi** dengan proyek resmi [Termux](https://github.com/termux/termux-app).

**Kata kunci pencarian:** termux app store · package manager termux · alternatif termux-packages · alternatif TUR termux · cara install tools termux · cara distribusi package termux · cara share tool di termux · bikin paket termux sendiri · termux tui android · termux cli android · termux tools tanpa root · termux package manager Indonesia · install aplikasi di termux · termux community packages · termux build dari source · termux offline · custom repo termux · termux-app-store djunekz

---

<div align="center">

**© Termux App Store — Dibuat untuk semua, oleh komunitas.**

</div>
