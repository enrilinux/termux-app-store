<div align="center">

<img src=".assets/00.jpeg" width="420" alt="Termux App Store — TUI Package Manager for Termux"/>

<br/>

<H1>
  <a href="https://djunekz.github.io/termux-app-store/">Termux App Store — TUI & CLI Package Manager for Termux</a>
</H1>

**The first offline-first, source-based TUI package manager built natively for Termux on Android.**

> Read in: 🇮🇩 **[Bahasa Indonesia](README.id.md)** &nbsp;|&nbsp; 🇹🇭 **[ภาษาไทย](README.th.md)** &nbsp;|&nbsp; 🇯🇵 **[日本語](README.jp.md)** &nbsp;|&nbsp; 🇨🇳 **[中文](README.ch.md)** &nbsp;|&nbsp; 🇻🇳 **[Tiếng Việt](README.vi.md)**

[![CI](https://github.com/djunekz/termux-app-store/actions/workflows/build.yml/badge.svg)](https://github.com/djunekz/termux-app-store/actions)
[![Codecov](https://codecov.io/github/djunekz/termux-app-store/branch/master/graph/badge.svg?token=357W4EP8G0)](https://codecov.io/github/djunekz/termux-app-store)
[![PyPI](https://img.shields.io/pypi/v/termux-app-store?style=flat&logo=pypi&color=3fb950&label=pypi)](https://pypi.org/project/termux-app-store/)<br>
![Version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fdjunekz%2Ftermux-app-store%2Ftags&query=%24%5B0%5D.name&style=flat&logo=github&color=3fb950&label=release)
[![Downloads](https://img.shields.io/github/downloads/djunekz/termux-app-store/total?style=flat&logo=github&color=3fb950&logoColor=white)](https://github.com/djunekz/termux-app-store)
[![License](https://img.shields.io/badge/License-MIT-3fb950?style=flat&logo=opensourceinitiative&logoColor=white)](LICENSE)
<br>
<br>
[![Stars](https://img.shields.io/github/stars/djunekz/termux-app-store?style=flat&logo=github&color=white&label=stars&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/stargazers)
[![Forks](https://img.shields.io/github/forks/djunekz/termux-app-store?style=flat&logo=github&color=white&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/network)
<br>
<br>
[![Issues](https://img.shields.io/badge/issues-open-3fb950?style=flat&logo=github&logoColor=white)](https://github.com/djunekz/termux-app-store/issues)
[![PRs](https://img.shields.io/github/issues-pr/djunekz/termux-app-store?style=flat&logo=git&logoColor=white&color=3fb950)](https://github.com/djunekz/termux-app-store/pulls)
[![Community Ready](https://img.shields.io/badge/Community-Ready-3fb950?style=flat&logo=github)](https://github.com/djunekz/termux-app-store)

> **Offline-first &nbsp;•&nbsp; Source-based &nbsp;•&nbsp; Binary-safe &nbsp;•&nbsp; Termux-native &nbsp;•&nbsp; Android Terminal**

> Install and manage Termux packages from source with a beautiful TUI or CLI — no root, no account, no telemetry.

</div>

---

# What is Termux App Store?

**Termux App Store** (`termux-app-store`) is a **TUI (Terminal User Interface)** and **CLI package manager** built with Python ([Textual](https://github.com/Textualize/textual)) that lets Termux users on Android **browse, build, install, and manage tools/packages** directly on-device — no account, no telemetry, no cloud dependency, no root required.

It works as an **alternative package manager for Termux**, letting you install community tools from source using verified `build.sh` scripts — similar in spirit to the AUR (Arch User Repository) but designed specifically for Termux on Android.

> **How is this different from `termux-packages` or TUR (Termux User Repository)?**
> - `termux-packages` is the official Termux repo — maintained by the core team, requires PR approval, and only accepts widely-used tools.
> - TUR (Termux User Repository) is a curated extension, still requires contributor review.
> - **Termux App Store** is fully community-driven: anyone can submit a `build.sh`, all builds run locally on your device, and there is no centralized approval gate. Think of it as a personal + community package layer on top of Termux.

> [!IMPORTANT]
> Termux App Store is **not a centralized binary repository** and **not a hidden auto-installer**.
> All builds run **locally, transparently, and under full user control**.

---

# Who Is It For?

| User | Use Case |
|---|---|
| Termux Users | Full control over builds & packages |
| Developers | Distribute tools via source-based packaging |
| Reviewers & Auditors | Review and validate build scripts |
| Maintainers | Manage multiple Termux packages at once |

---

# Screenshots

<div align="center">

<img src=".assets/0.jpeg" width="74%" alt="Termux App Store — Main View"/>

<br/><br/>
<H1>Tui Interface</H1>

| TUI Main Interface | TUI Install Interface | Menu Palette |
|:---:|:---:|:---:|
| <img src=".assets/0main.jpg" width="220" alt="TUI Main Interface"/> | <img src=".assets/1install.jpg" width="220" alt="TUI Install Interface"/> | <img src=".assets/2pallete.jpg" width="220" alt="Menu Palette Interface"/> |
| TUI main menu | Package install process | Command palette |

> TUI User-friendly with full **touchscreen** support

---

<H1>CLI Interface</H1>

| Other tools support | CLI Install Interface | CLI View Interface |
|:---:|:---:|:---:|
| <img src=".assets/0tas-and-termux-build.jpg" width="220" alt="Other tools support"/> | <img src=".assets/0cli-install.jpg" width="220" alt="CLI Install Interface"/> | <img src=".assets/0cli-view.jpg" width="220" alt="CLI View Interface"/> |
| tasctl and termux-build | Package install process | CLI help, list and show |

---

<H1>GuideBook</H1>

| List menu | Menu about | Menu how to upload |
|:---:|:---:|:---:|
| <img src=".assets/0guide-menu.png" width="220" alt="List menu"/> | <img src=".assets/0guide-about.png" width="220" alt="Menu about"/> | <img src=".assets/0guide-upload.png" width="220" alt="Menu how to upload"/> |
| GuideBook main menu | Information termux-app-store | Guide how to upload |

> GuideBook is a information, run: `python guidebook.py`

---

<H1>Screenrecord</H1>

| Record `termux-app-store` TUI, CLI, Other tool `tasctl`, `termux-build`, `guidebook.py` |
|:---:|
| <img src=".assets/demo.gif" width="74%" alt="termux-app-store"/> | termux-app-store

</div>

---

# Quick Install and Uninstall

> Available on **[PyPI](https://pypi.org/project/termux-app-store/)** — searchable via `pip search` and indexed by PyPI, making it easier to discover.

### Option 1 (Recommended)
```bash
pkg install python
pip install termux-app-store
```

### Option 2 (Manual)
> Simple (Recommended for not download high memory)
```bash
curl -fsSL https://raw.githubusercontent.com/djunekz/termux-app-store/master/tasctl | bash -s install
```

or

> With git clone (For download full files repository)
```bash
git clone https://github.com/djunekz/termux-app-store
cd termux-app-store
bash install.sh
```

or

```bash
git clone https://github.com/djunekz/termux-app-store
cd termux-app-store
./tasctl install
```

After download and install then run:

```bash
termux-app-store        # Open interactive TUI
termux-app-store -h     # Show CLI help
```

---

## Uninstall
```bash
pip uninstall termux-app-store
```

or

```bash
./tasctl uninstall
```

---

# Usage

### TUI — Interactive Interface
```bash
termux-app-store
```

### CLI — Direct Commands

```bash
termux-app-store list                  # List all packages
termux-app-store show <package>        # Show package details
termux-app-store install <package>     # Build & install a package
termux-app-store update                # Check for available updates
termux-app-store upgrade               # Upgrade all packages
termux-app-store upgrade <package>     # Upgrade a specific package
termux-app-store version               # Check latest version
termux-app-store help                  # Full help
```

---

# Features

<table>
<tr>
<td width="50%">

**Package Browser (TUI)**
Browse packages from the `packages/` folder interactively with keyboard & touchscreen navigation.

**Smart Build Validator**
Detects unsupported Termux dependencies with automatic status badges.

**Real-time Search & Filter**
Instantly search packages by name or description — no reload needed.

**One-Click Build**
Install or update a package in one click via `build-package.sh`.

</td>
<td width="50%">

**One-Click Validator**
Validate packages before distribution via `./termux-build`.

**One-Click Manage**
Install / update / uninstall Termux App Store itself via `./tasctl`.

**Self-Healing Path Resolver**
Auto-detects app location even if the folder is moved or renamed.

**Privacy-First**
No account, no tracking, no telemetry — fully offline.

</td>
</tr>
</table>

---

# Package Status Badges

| Badge | Description |
|---|---|
| **NEW** | Newly added package (< 7 days) |
| **UPDATE** | A newer version is available |
| **INSTALLED** | Installed version is up-to-date |
| **UNSUPPORTED** | Dependency not available in Termux |

---

# Adding a Package

Want to create your own Termux package and distribute it? Every package in Termux App Store is defined by a single `build.sh` file — similar to how PKGBUILD works in Arch Linux or formula works in Homebrew, but adapted for Termux on Android.

Every package **must** have a `build.sh` file:

```
packages/<tool-name>/build.sh
```

### Minimal `build.sh` Template

```bash
TERMUX_PKG_HOMEPAGE=""
TERMUX_PKG_DESCRIPTION=""
TERMUX_PKG_LICENSE=""
TERMUX_PKG_MAINTAINER="@your-github-username"
TERMUX_PKG_VERSION=""
TERMUX_PKG_SRCURL=""
TERMUX_PKG_SHA256=""
```

> [!NOTE]
> See the full template in `template/build.sh`
> or run: `./termux-build template`

# Adding a Package using termux-build

Open directory termux-app-store
```bash
cd termux-app-store
```
Then run
```bash
./termux-build create nameyourtool
```

> [!NOTE]
> When naming, do not use spaces, use the - sign in the name. For example: this-is-my-tool

---

## termux-build — Build package and Validation Tool

`termux-build` is a validation and reviewer helper tool — not an auto-upload or auto-publish tool.

```bash
./termux-build create <package>      # Create package for distribution
./termux-build lint <package>        # Lint a build script
./termux-build init <url-repo>       # Auto create and build package for distribution
./termux-build check-pr <package>    # Check PR readiness
./termux-build doctor                # Diagnose environment
./termux-build suggest <package>     # Get improvement suggestions
./termux-build explain <package>     # Detailed package explanation
./termux-build template              # Generate build.sh template
./termux-build guide                 # Contribution guide
```

> [!NOTE]
> termux-build **only reads and validates** — it does not modify files, or upload to GitHub.

## tasctl — Termux App Store Controller

`tasctl` is a controller termux-app-store system

```bash
./tasctl install       # Install Termux App Store (latest)
./tasctl update        # Update to latest version
./tasctl uninstall     # Remove Termux App Store
./tasctl doctor        # Diagnose environment
./tasctl self-update   # Update tasctl itself
./tasctl help          # Show this help
```

## guidebook — All Information Termux App Store

`guidebook.py` is a information use, build, contributing to Termux App Store

```bash
python guidebook.py
```

> [!NOTE]
> guidebook currently only supports two languages: English and Indonesia
---

# Architecture

```
termux-app-store/
├── packages/              # All packages directory
│   └── <tool-name>/
│       └── build.sh       # Metadata & build script
├── template/
│   └── build.sh           # Package template
├── tasctl                 # TAS installer/updater/uninstaller
├── termux-build           # Validation & review tool
└── install.sh             # Main installer
```

> Full details: [ARCHITECTURE](ARCHITECTURE.md)

---

# Security & Privacy

<table>
<tr>
<td width="50%">

**Security**
- No extra permissions required
- No network ports opened
- No background services running
- Builds only run on explicit user command

</td>
<td width="50%">

**Privacy**
- No account or registration
- No analytics or tracking
- No telemetry of any kind
- Offline-first by design

</td>
</tr>
</table>

> Full details: [SECURITY](SECURITY.md) &nbsp;|&nbsp; [PRIVACY](PRIVACY.md) &nbsp;|&nbsp; [DISCLAIMER](DISCLAIMER.md)

---

# How to Distribute Your Package to the Termux Community

Want to share your tool with the Termux community? Distributing a package to Termux App Store means anyone running Termux on Android can install it with one command — no server needed, no binary hosting required.

**Why distribute here instead of a standalone repo?**
- Users can discover your tool via the TUI browser without knowing your GitHub URL
- Updates only require changing `version` and `sha256` in `build.sh`
- Your tool appears in the TUI with automatic status badges
- No approval gate — submit a PR and the community can use it immediately

**How to distribute / upload your package:**

```bash
# 1. Fork this repo
# 2. Add your package folder:
mkdir packages/your-tool-name
# 3. Create build.sh from the template or with termux-build
# 4. Validate with termux-build:
./termux-build lint packages/your-tool-name
# 5. Submit a Pull Request
```

> Full guide: [How to upload package in termux-app-store](HOW_TO_UPLOAD.md)

---

## Contributing

All contributions are welcome!

| How to Contribute | Description |
|---|---|
| Add a package | Submit a new tool package |
| Report a bug | Open an issue on GitHub |
| Send a PR | Code or documentation improvements |
| Review PRs | Help validate others' contributions |
| Security audit | Review build script security |
| Improve docs | Clarify or translate documentation |

> Full guide: [CONTRIBUTING](CONTRIBUTING.md)

---

## Help & Documentation

| Document | Description |
|---|---|
| [FAQ](FAQ.md) | Frequently asked questions |
| [TROUBLESHOOTING](TROUBLESHOOTING.md) | Solutions to common problems |
| [HOW TO UPLOAD](HOW_TO_UPLOAD.md) | How to upload your tool |
| [CONTRIBUTING](CONTRIBUTING.md) | Contribution guide |
| [SUPPORT](SUPPORT.md) | How to get support |

---

## Philosophy

> *"Local first. Control over convenience. Transparency over magic."*

Termux App Store is built for users who want to:
- Fully understand what runs on their device
- Control builds and sources directly
- Avoid vendor lock-in and cloud dependency
- Share tools openly with the Termux community

---

## License

This project is licensed under the **MIT License** — see [LICENSE](LICENSE) for details.

---

## Maintainer

<div align="center">

**Djunekz** — Independent & Official Developer

[![GitHub](https://img.shields.io/badge/GitHub-djunekz-3fb950?style=for-the-badge&logo=github)](https://github.com/djunekz)

</div>

---

## Support This Project

If Termux App Store has been useful to you:

- **Star** this repo — helps others discover it
- **Share** it in Termux & Android communities
- **Report bugs** via Issues
- **Submit a PR** for any improvement

---

## Star History

[![Star History Chart](https://api.star-history.com/image?repos=djunekz/termux-app-store&type=date&legend=top-left)](https://www.star-history.com/?repos=djunekz%2Ftermux-app-store&type=date&legend=top-left)

---

## Related Projects & Keywords

> This project is independently developed and is **not affiliated with** the official [Termux](https://github.com/termux/termux-app) project.

**Search terms:** termux app store · termux package manager · termux tui · termux cli · termux tools · android terminal package manager · termux custom packages · termux source build · termux alternative · termux community packages · termux offline installer · termux-app-store djunekz · install packages termux android · alternative to termux-packages · alternative to TUR termux · how to distribute package termux · termux community repo · termux build from source android · create termux package · custom repo termux

---

<div align="center">

**© Termux App Store — Built for everyone, by the community.**

</div>
