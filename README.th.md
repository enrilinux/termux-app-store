<div align="center">

<img src=".assets/00.jpeg" width="420" alt="Termux App Store — ตัวจัดการแพ็กเกจ TUI สำหรับ Termux"/>

<br/>

<H1>
  <a href="https://djunekz.github.io/termux-app-store/">Termux App Store — ตัวจัดการแพ็กเกจ TUI & CLI สำหรับ Termux</a>
</H1>

**ตัวจัดการแพ็กเกจแบบ offline-first และ source-based ตัวแรกที่สร้างมาเพื่อ Termux บน Android โดยเฉพาะ**

[![CI](https://github.com/djunekz/termux-app-store/actions/workflows/build.yml/badge.svg)](https://github.com/djunekz/termux-app-store/actions)
[![Codecov](https://codecov.io/github/djunekz/termux-app-store/branch/master/graph/badge.svg?token=357W4EP8G0)](https://codecov.io/github/djunekz/termux-app-store)
[![PyPI](https://img.shields.io/pypi/v/termux-app-store?style=flat&logo=pypi&color=3fb950&label=pypi)](https://pypi.org/project/termux-app-store/)<br>
![เวอร์ชัน](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fdjunekz%2Ftermux-app-store%2Ftags&query=%24%5B0%5D.name&style=flat&logo=github&color=3fb950&label=รีลีส)
[![ดาวน์โหลด](https://img.shields.io/github/downloads/djunekz/termux-app-store/total?style=flat&logo=github&color=3fb950&logoColor=white)](https://github.com/djunekz/termux-app-store)
[![ใบอนุญาต](https://img.shields.io/badge/ใบอนุญาต-MIT-3fb950?style=flat&logo=opensourceinitiative&logoColor=white)](LICENSE)
<br>
<br>
[![Stars](https://img.shields.io/github/stars/djunekz/termux-app-store?style=flat&logo=github&color=white&label=stars&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/stargazers)
[![Forks](https://img.shields.io/github/forks/djunekz/termux-app-store?style=flat&logo=github&color=white&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/network)
<br>
<br>
[![Issues](https://img.shields.io/badge/issues-open-3fb950?style=flat&logo=github&logoColor=white)](https://github.com/djunekz/termux-app-store/issues)
[![PRs](https://img.shields.io/github/issues-pr/djunekz/termux-app-store?style=flat&logo=git&logoColor=white&color=3fb950)](https://github.com/djunekz/termux-app-store/pulls)
[![ชุมชน](https://img.shields.io/badge/ชุมชน-เปิด-3fb950?style=flat&logo=github)](https://github.com/djunekz/termux-app-store)

> **Offline-first &nbsp;•&nbsp; ใช้ Source Code &nbsp;•&nbsp; ปลอดภัย &nbsp;•&nbsp; Native Termux &nbsp;•&nbsp; Android Terminal**

> ติดตั้งและจัดการแพ็กเกจ Termux จาก source code — ไม่ต้องรูท ไม่ต้องสมัครสมาชิก ไม่มี telemetry

> อ่านด้วยภาษา: 🇬🇧 **[English](README.md)** &nbsp;|&nbsp; 🇮🇩 **[Indonesia](README.id.md)** &nbsp;|&nbsp; 🇯🇵 **[日本語](README.jp.md)** &nbsp;|&nbsp; 🇨🇳 **[中文](README.ch.md)** &nbsp;|&nbsp; 🇻🇳 **[Tiếng Việt](README.vi.md)**

</div>

---

# Termux App Store คืออะไร?

**Termux App Store** (`termux-app-store`) คือ **ตัวจัดการแพ็กเกจแบบ TUI (Terminal User Interface)** และ **CLI** ที่สร้างด้วย Python ([Textual](https://github.com/Textualize/textual)) ช่วยให้ผู้ใช้ Termux บน Android สามารถ **เรียกดู สร้าง ติดตั้ง และจัดการเครื่องมือ/แพ็กเกจ** ได้โดยตรงบนอุปกรณ์ — ไม่ต้องมีบัญชี ไม่มี telemetry ไม่ต้องพึ่งพาคลาวด์ ไม่ต้องรูท

โปรเจกต์นี้ทำงานเป็น **ตัวจัดการแพ็กเกจทางเลือกสำหรับ Termux** ให้คุณติดตั้งเครื่องมือชุมชนจาก source โดยใช้สคริปต์ `build.sh` ที่ผ่านการตรวจสอบ SHA256 แล้ว — คล้ายกับ AUR (Arch User Repository) แต่ออกแบบมาเพื่อ Termux บน Android โดยเฉพาะ

> [!IMPORTANT]
> Termux App Store **ไม่ใช่ repository binary แบบรวมศูนย์** และ **ไม่ใช่ auto-installer ที่ซ่อนอยู่**
> ทุก build ทำงาน **ในเครื่อง โปร่งใส และอยู่ภายใต้การควบคุมของผู้ใช้อย่างสมบูรณ์**

---

# ต่างจาก `termux-packages` และ TUR อย่างไร?

| | `termux-packages` | TUR | **Termux App Store** |
|---|---|---|---|
| ใครดูแล | ทีมหลัก Termux | ผู้มีส่วนร่วมที่คัดเลือก | ชุมชนเปิด |
| ต้องผ่านการอนุมัติ? | ใช่ เข้มงวด | ใช่ | ไม่ — PR ใช้ได้ทันที |
| แจกจ่าย binary? | ใช่ | ใช่ | ไม่ — build จาก source ในเครื่อง |
| เหมาะกับเครื่องมือส่วนตัว? | ไม่ | จำกัด | **ใช่** |
| ตรวจสอบ SHA256 | ใช่ | ใช่ | **ใช่** |
| ใช้งาน offline ได้? | ไม่ | ไม่ | **ใช่ อย่างสมบูรณ์** |

---

# เหมาะสำหรับใคร?

| ผู้ใช้ | กรณีการใช้งาน |
|---|---|
| ผู้ใช้ Termux | ควบคุม build และแพ็กเกจได้อย่างสมบูรณ์ |
| นักพัฒนา | แจกจ่ายเครื่องมือผ่าน source-based packaging |
| ผู้ตรวจสอบ | ตรวจสอบและ validate สคริปต์ build |
| ผู้ดูแลระบบ | จัดการแพ็กเกจ Termux หลายรายการพร้อมกัน |

---

# ภาพหน้าจอ

<div align="center">

<img src=".assets/0.jpeg" width="74%" alt="Termux App Store — หน้าจอหลัก"/>

<br/><br/>
<H1>อินเทอร์เฟซ TUI</H1>

| TUI หลัก | TUI ติดตั้ง | เมนู Palette |
|:---:|:---:|:---:|
| <img src=".assets/0main.jpg" width="220" alt="TUI Main Interface"/> | <img src=".assets/1install.jpg" width="220" alt="TUI Install Interface"/> | <img src=".assets/2pallete.jpg" width="220" alt="Menu Palette Interface"/> |
| เมนูหลัก TUI | กระบวนการติดตั้งแพ็กเกจ | Command palette |

> TUI ใช้งานง่ายพร้อมรองรับ **touchscreen** อย่างสมบูรณ์

---

<H1>อินเทอร์เฟซ CLI</H1>

| รองรับเครื่องมืออื่น | CLI ติดตั้ง | CLI ดูข้อมูล |
|:---:|:---:|:---:|
| <img src=".assets/0tas-and-termux-build.jpg" width="220" alt="Other tools support"/> | <img src=".assets/0cli-install.jpg" width="220" alt="CLI Install Interface"/> | <img src=".assets/0cli-view.jpg" width="220" alt="CLI View Interface"/> |
| tasctl และ termux-build | กระบวนการติดตั้ง | CLI help, list และ show |

</div>

---

# วิธีติดตั้งและถอนการติดตั้ง

> มีให้บน **[PyPI](https://pypi.org/project/termux-app-store/)** — ค้นหาและติดตั้งได้ทันทีผ่าน pip

### ตัวเลือกที่ 1 (แนะนำ)
```bash
pkg install python
pip install termux-app-store
```

### ตัวเลือกที่ 2 (Manual)
```bash
curl -fsSL https://raw.githubusercontent.com/djunekz/termux-app-store/master/tasctl | bash -s install
```

หรือ

```bash
git clone https://github.com/djunekz/termux-app-store
cd termux-app-store
bash install.sh
```

หลังติดตั้ง รันด้วยคำสั่ง:
```bash
termux-app-store        # เปิด TUI แบบโต้ตอบ
termux-app-store -h     # แสดงความช่วยเหลือ CLI
```

## ถอนการติดตั้ง
```bash
pip uninstall termux-app-store
```
หรือ
```bash
./tasctl uninstall
```

---

# วิธีใช้งาน

### TUI — อินเทอร์เฟซแบบโต้ตอบ
```bash
termux-app-store
```

### CLI — คำสั่งโดยตรง

```bash
termux-app-store list                  # แสดงแพ็กเกจทั้งหมด
termux-app-store show <package>        # ดูรายละเอียดแพ็กเกจ
termux-app-store install <package>     # Build & ติดตั้งแพ็กเกจ
termux-app-store update                # ตรวจสอบอัปเดตที่มี
termux-app-store upgrade               # อัปเกรดทุกแพ็กเกจ
termux-app-store upgrade <package>     # อัปเกรดแพ็กเกจที่ระบุ
termux-app-store version               # ตรวจสอบเวอร์ชันล่าสุด
termux-app-store help                  # ความช่วยเหลือครบถ้วน
```

---

# คุณสมบัติเด่น

<table>
<tr>
<td width="50%">

**เบราว์เซอร์แพ็กเกจ (TUI)**
เรียกดูแพ็กเกจจากโฟลเดอร์ `packages/` แบบโต้ตอบด้วยแป้นพิมพ์และ touchscreen

**ตัวตรวจสอบ Build อัจฉริยะ**
ตรวจจับ dependency ของ Termux ที่ไม่รองรับพร้อม badge สถานะอัตโนมัติ

**ค้นหาและกรองแบบ Real-time**
ค้นหาแพ็กเกจตามชื่อหรือคำอธิบายได้ทันที ไม่ต้อง reload

**Build คลิกเดียว**
ติดตั้งหรืออัปเดตแพ็กเกจในคลิกเดียวผ่าน `build-package.sh`

</td>
<td width="50%">

**ตรวจสอบคลิกเดียว**
Validate แพ็กเกจก่อนแจกจ่ายผ่าน `./termux-build`

**จัดการคลิกเดียว**
ติดตั้ง / อัปเดต / ถอนการติดตั้ง Termux App Store ผ่าน `./tasctl`

**Path Resolver อัตโนมัติ**
ตรวจจับตำแหน่ง app อัตโนมัติแม้โฟลเดอร์จะถูกย้ายหรือเปลี่ยนชื่อ

**ความเป็นส่วนตัวเป็นอันดับแรก**
ไม่มีบัญชี ไม่มี tracking ไม่มี telemetry — offline อย่างสมบูรณ์

</td>
</tr>
</table>

---

# วิธีสร้างแพ็กเกจของคุณเอง

ทุกแพ็กเกจใน Termux App Store ต้องมีไฟล์ `build.sh` — คล้ายกับ PKGBUILD ใน Arch Linux หรือ formula ใน Homebrew แต่ปรับแต่งมาเพื่อ Termux บน Android

```
packages/<ชื่อ-tool>/build.sh
```

### Template ขั้นต่ำของ `build.sh`

```bash
TERMUX_PKG_HOMEPAGE=""
TERMUX_PKG_DESCRIPTION=""
TERMUX_PKG_LICENSE=""
TERMUX_PKG_MAINTAINER="@github-username-ของคุณ"
TERMUX_PKG_VERSION=""
TERMUX_PKG_SRCURL=""
TERMUX_PKG_SHA256=""
```

### สร้างแพ็กเกจด้วย `termux-build`

```bash
cd termux-app-store
./termux-build create ชื่อ-tool-ของคุณ
```

---

# วิธีแจกจ่ายแพ็กเกจสู่ชุมชน Termux

```bash
# 1. Fork repo นี้บน GitHub
# 2. เพิ่มโฟลเดอร์แพ็กเกจของคุณ:
mkdir packages/ชื่อ-tool-ของคุณ

# 3. สร้าง build.sh จาก template หรือด้วย termux-build
./termux-build create ชื่อ-tool-ของคุณ

# 4. ตรวจสอบก่อน submit:
./termux-build lint packages/ชื่อ-tool-ของคุณ

# 5. Submit Pull Request มาที่ repo นี้
```

หลัง PR ถูก merge ผู้ใช้ทุกคนสามารถติดตั้งได้ทันที:
```bash
termux-app-store install ชื่อ-tool-ของคุณ
```

> คู่มือครบถ้วน: [HOW_TO_UPLOAD.md](HOW_TO_UPLOAD.md)

---

## ใบอนุญาต

โปรเจกต์นี้ได้รับอนุญาตภายใต้ **MIT License** — ดูรายละเอียดที่ [LICENSE](LICENSE)

---

## ผู้ดูแล

<div align="center">

**Djunekz** — นักพัฒนาอิสระและเป็นทางการ

[![GitHub](https://img.shields.io/badge/GitHub-djunekz-3fb950?style=for-the-badge&logo=github)](https://github.com/djunekz)

</div>

---

## สนับสนุนโปรเจกต์นี้

หาก Termux App Store มีประโยชน์สำหรับคุณ:

- **กดดาว** repo นี้ — ช่วยให้คนอื่นค้นพบ
- **แชร์** ในชุมชน Termux & Android
- **รายงานบั๊ก** ผ่าน Issues
- **Submit PR** สำหรับการปรับปรุงใด ๆ

---

## คำค้นหา

> โปรเจกต์นี้พัฒนาขึ้นอย่างอิสระและ **ไม่มีส่วนเกี่ยวข้อง** กับโปรเจกต์ [Termux](https://github.com/termux/termux-app) อย่างเป็นทางการ

**คำค้นหา:** termux app store ภาษาไทย · ตัวจัดการแพ็กเกจ termux · ทางเลือก termux-packages · ทางเลือก TUR termux · วิธีติดตั้ง tools termux · วิธีแจกจ่ายแพ็กเกจ termux · สร้างแพ็กเกจ termux เอง · termux tui android · termux ไม่ต้องรูท · termux package manager ไทย · ติดตั้งแอปบน termux · termux community packages · termux build จาก source · termux-app-store djunekz

---

<div align="center">

**© Termux App Store — สร้างเพื่อทุกคน โดยชุมชน**

</div>
