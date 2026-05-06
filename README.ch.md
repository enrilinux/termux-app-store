<div align="center">

<img src=".assets/00.jpeg" width="420" alt="Termux App Store — Termux的TUI包管理器"/>

<br/>

<H1>
  <a href="https://djunekz.github.io/termux-app-store/">Termux App Store — Termux的TUI和CLI包管理器</a>
</H1>

**首个专为Android Termux打造的离线优先、基于源码的TUI包管理器。**

[![CI](https://github.com/djunekz/termux-app-store/actions/workflows/build.yml/badge.svg)](https://github.com/djunekz/termux-app-store/actions)
[![Codecov](https://codecov.io/github/djunekz/termux-app-store/branch/master/graph/badge.svg?token=357W4EP8G0)](https://codecov.io/github/djunekz/termux-app-store)
[![PyPI](https://img.shields.io/pypi/v/termux-app-store?style=flat&logo=pypi&color=3fb950&label=pypi)](https://pypi.org/project/termux-app-store/)<br>
![版本](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fdjunekz%2Ftermux-app-store%2Ftags&query=%24%5B0%5D.name&style=flat&logo=github&color=3fb950&label=发布)
[![下载量](https://img.shields.io/github/downloads/djunekz/termux-app-store/total?style=flat&logo=github&color=3fb950&logoColor=white)](https://github.com/djunekz/termux-app-store)
[![许可证](https://img.shields.io/badge/许可证-MIT-3fb950?style=flat&logo=opensourceinitiative&logoColor=white)](LICENSE)
<br>
<br>
[![Stars](https://img.shields.io/github/stars/djunekz/termux-app-store?style=flat&logo=github&color=white&label=stars&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/stargazers)
[![Forks](https://img.shields.io/github/forks/djunekz/termux-app-store?style=flat&logo=github&color=white&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/network)
<br>
<br>
[![Issues](https://img.shields.io/badge/issues-open-3fb950?style=flat&logo=github&logoColor=white)](https://github.com/djunekz/termux-app-store/issues)
[![PRs](https://img.shields.io/github/issues-pr/djunekz/termux-app-store?style=flat&logo=git&logoColor=white&color=3fb950)](https://github.com/djunekz/termux-app-store/pulls)
[![社区](https://img.shields.io/badge/社区-开放-3fb950?style=flat&logo=github)](https://github.com/djunekz/termux-app-store)

> **离线优先 &nbsp;•&nbsp; 基于源码 &nbsp;•&nbsp; 安全可靠 &nbsp;•&nbsp; Termux原生 &nbsp;•&nbsp; Android终端**

> 从源码安装和管理Termux软件包 — 无需root、无需账号、无遥测数据

> 阅读语言: 🇬🇧 **[English](README.md)** &nbsp;|&nbsp; 🇮🇩 **[Indonesia](README.id.md) &nbsp;|&nbsp; 🇹🇭 **[ภาษาไทย](README.th.md)** &nbsp;|&nbsp; 🇯🇵 **[日本語](README.jp.md)** &nbsp;|&nbsp; 🇻🇳 **[Tiếng Việt](README.vi.md)**

</div>

---

# 什么是Termux App Store？

**Termux App Store** (`termux-app-store`) 是一个用Python ([Textual](https://github.com/Textualize/textual)) 构建的 **TUI（终端用户界面）** 和 **CLI包管理器**，让Android上的Termux用户可以直接在设备上 **浏览、构建、安装和管理工具/软件包** — 无需账号、无遥测、无云依赖、无需root。

本项目作为 **Termux的替代包管理器**，允许您使用经SHA256验证的`build.sh`脚本从源码安装社区工具 — 精神上类似于AUR（Arch用户仓库），但专为Android上的Termux设计。

> [!IMPORTANT]
> Termux App Store **不是集中式二进制仓库**，也**不是隐藏的自动安装器**。
> 所有构建都在**本地、透明地、完全在用户控制下**运行。

---

# 与`termux-packages`和TUR有什么区别？

| | `termux-packages` | TUR | **Termux App Store** |
|---|---|---|---|
| 由谁维护 | Termux核心团队 | 精选贡献者 | 开放社区 |
| 需要审批? | 是，严格 | 是 | 否 — PR可立即使用 |
| 分发二进制文件? | 是 | 是 | 否 — 本地从源码构建 |
| 适合个人工具? | 否 | 有限 | **是** |
| SHA256验证 | 是 | 是 | **是** |
| 可离线使用? | 否 | 否 | **是，完全离线** |

**何时使用Termux App Store？**
- 您的工具因太过专用而无法被`termux-packages`或TUR接受
- 您想快速将自制工具分发给社区
- 您想要完全控制 — 构建、安装、卸载 — 不依赖服务器

---

# 适合哪些用户？

| 用户 | 使用场景 |
|---|---|
| Termux用户 | 完全控制构建和软件包 |
| 开发者 | 通过基于源码的打包分发工具 |
| 审查员和审计员 | 审查和验证构建脚本 |
| 维护者 | 同时管理多个Termux软件包 |

---

# 截图

<div align="center">

<img src=".assets/0.jpeg" width="74%" alt="Termux App Store — 主界面"/>

<br/><br/>
<H1>TUI界面</H1>

| TUI主界面 | TUI安装界面 | 菜单面板 |
|:---:|:---:|:---:|
| <img src=".assets/0main.jpg" width="220" alt="TUI Main Interface"/> | <img src=".assets/1install.jpg" width="220" alt="TUI Install Interface"/> | <img src=".assets/2pallete.jpg" width="220" alt="Menu Palette Interface"/> |
| TUI主菜单 | 软件包安装过程 | 命令面板 |

> TUI界面友好，完全支持**触摸屏**操作

---

<H1>CLI界面</H1>

| 其他工具支持 | CLI安装界面 | CLI查看界面 |
|:---:|:---:|:---:|
| <img src=".assets/0tas-and-termux-build.jpg" width="220" alt="Other tools support"/> | <img src=".assets/0cli-install.jpg" width="220" alt="CLI Install Interface"/> | <img src=".assets/0cli-view.jpg" width="220" alt="CLI View Interface"/> |
| tasctl和termux-build | 软件包安装过程 | CLI帮助、列表和显示 |

</div>

---

# 安装和卸载

> 可在 **[PyPI](https://pypi.org/project/termux-app-store/)** 上获取 — 可通过pip直接搜索和安装

### 方式一（推荐）
```bash
pkg install python
pip install termux-app-store
```

### 方式二（手动）
```bash
curl -fsSL https://raw.githubusercontent.com/djunekz/termux-app-store/master/tasctl | bash -s install
```

或者

```bash
git clone https://github.com/djunekz/termux-app-store
cd termux-app-store
bash install.sh
```

安装后运行：
```bash
termux-app-store        # 打开交互式TUI
termux-app-store -h     # 显示CLI帮助
```

## 卸载
```bash
pip uninstall termux-app-store
```
或者
```bash
./tasctl uninstall
```

---

# 使用方法

### TUI — 交互式界面
```bash
termux-app-store
```

### CLI — 直接命令

```bash
termux-app-store list                  # 列出所有软件包
termux-app-store show <软件包>         # 显示软件包详情
termux-app-store install <软件包>      # 构建并安装软件包
termux-app-store update                # 检查可用更新
termux-app-store upgrade               # 升级所有软件包
termux-app-store upgrade <软件包>      # 升级指定软件包
termux-app-store version               # 检查最新版本
termux-app-store help                  # 完整帮助
```

---

# 主要功能

<table>
<tr>
<td width="50%">

**软件包浏览器（TUI）**
通过键盘和触摸屏交互式浏览`packages/`文件夹中的软件包

**智能构建验证器**
自动检测不支持的Termux依赖项并显示状态徽章

**实时搜索和过滤**
按名称或描述即时搜索软件包 — 无需重新加载

**一键构建**
通过`build-package.sh`一键安装或更新软件包

</td>
<td width="50%">

**一键验证**
通过`./termux-build`在分发前验证软件包

**一键管理**
通过`./tasctl`安装/更新/卸载Termux App Store本身

**自动路径解析器**
即使文件夹被移动或重命名也能自动检测应用位置

**隐私优先**
无账号、无追踪、无遥测 — 完全离线

</td>
</tr>
</table>

---

# 如何创建自己的软件包

Termux App Store中的每个软件包只需要一个`build.sh`文件 — 类似于Arch Linux的PKGBUILD或Homebrew的formula，但专为Android上的Termux设计。

```
packages/<工具名称>/build.sh
```

### 最小`build.sh`模板

```bash
TERMUX_PKG_HOMEPAGE=""
TERMUX_PKG_DESCRIPTION=""
TERMUX_PKG_LICENSE=""
TERMUX_PKG_MAINTAINER="@您的github用户名"
TERMUX_PKG_VERSION=""
TERMUX_PKG_SRCURL=""
TERMUX_PKG_SHA256=""
```

### 使用`termux-build`创建软件包

```bash
cd termux-app-store
./termux-build create 您的工具名称
```

---

# 如何向Termux社区分发软件包

```bash
# 1. 在GitHub上Fork本仓库
# 2. 添加您的软件包文件夹：
mkdir packages/您的工具名称

# 3. 从模板或用termux-build创建build.sh
./termux-build create 您的工具名称

# 4. 提交前先验证：
./termux-build lint packages/您的工具名称

# 5. 向本仓库提交Pull Request
```

PR合并后，任何人都可以立即安装：
```bash
termux-app-store install 您的工具名称
```

> 完整指南: [HOW_TO_UPLOAD.md](HOW_TO_UPLOAD.md)

---

## 许可证

本项目采用 **MIT许可证** — 详情见 [LICENSE](LICENSE)

---

## 维护者

<div align="center">

**Djunekz** — 独立官方开发者

[![GitHub](https://img.shields.io/badge/GitHub-djunekz-3fb950?style=for-the-badge&logo=github)](https://github.com/djunekz)

</div>

---

## 支持本项目

如果Termux App Store对您有帮助：

- **给仓库点Star** — 帮助其他人发现它
- **分享** — 在Termux和Android社区
- **报告Bug** — 通过Issues
- **提交PR** — 进行任何改进

---

## 搜索关键词

> 本项目独立开发，与官方 [Termux](https://github.com/termux/termux-app) 项目**无关联**。

**搜索关键词:** termux 应用商店 · termux 包管理器 · termux-packages 替代品 · TUR 替代品 · 如何安装 termux 工具 · 如何分发 termux 包 · 自制 termux 包 · termux tui android · termux 无需root · termux 包管理器 中文 · android 终端包管理 · termux 社区软件包 · termux 从源码构建 · termux 离线使用 · termux 自定义仓库 · termux-app-store djunekz

---

<div align="center">

**© Termux App Store — 为所有人而建，由社区共创。**

</div>
