<div align="center">

<img src=".assets/00.jpeg" width="420" alt="Termux App Store — Termux用TUIパッケージマネージャー"/>

<br/>

<H1>
  <a href="https://djunekz.github.io/termux-app-store/">Termux App Store — Termux用TUI・CLIパッケージマネージャー</a>
</H1>

**Android の Termux 向けに作られた、初のオフラインファースト・ソースベースTUIパッケージマネージャー。**

[![CI](https://github.com/djunekz/termux-app-store/actions/workflows/build.yml/badge.svg)](https://github.com/djunekz/termux-app-store/actions)
[![Codecov](https://codecov.io/github/djunekz/termux-app-store/branch/master/graph/badge.svg?token=357W4EP8G0)](https://codecov.io/github/djunekz/termux-app-store)
[![PyPI](https://img.shields.io/pypi/v/termux-app-store?style=flat&logo=pypi&color=3fb950&label=pypi)](https://pypi.org/project/termux-app-store/)<br>
![バージョン](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fdjunekz%2Ftermux-app-store%2Ftags&query=%24%5B0%5D.name&style=flat&logo=github&color=3fb950&label=リリース)
[![ダウンロード](https://img.shields.io/github/downloads/djunekz/termux-app-store/total?style=flat&logo=github&color=3fb950&logoColor=white)](https://github.com/djunekz/termux-app-store)
[![ライセンス](https://img.shields.io/badge/ライセンス-MIT-3fb950?style=flat&logo=opensourceinitiative&logoColor=white)](LICENSE)
<br>
<br>
[![Stars](https://img.shields.io/github/stars/djunekz/termux-app-store?style=flat&logo=github&color=white&label=stars&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/stargazers)
[![Forks](https://img.shields.io/github/forks/djunekz/termux-app-store?style=flat&logo=github&color=white&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/network)
<br>
<br>
[![Issues](https://img.shields.io/badge/issues-open-3fb950?style=flat&logo=github&logoColor=white)](https://github.com/djunekz/termux-app-store/issues)
[![PRs](https://img.shields.io/github/issues-pr/djunekz/termux-app-store?style=flat&logo=git&logoColor=white&color=3fb950)](https://github.com/djunekz/termux-app-store/pulls)
[![コミュニティ](https://img.shields.io/badge/コミュニティ-オープン-3fb950?style=flat&logo=github)](https://github.com/djunekz/termux-app-store)

> **オフラインファースト &nbsp;•&nbsp; ソースベース &nbsp;•&nbsp; 安全 &nbsp;•&nbsp; Termuxネイティブ &nbsp;•&nbsp; Androidターミナル**

> ソースコードからTermuxパッケージをインストール・管理 — root不要、アカウント不要、テレメトリなし

> 言語で読む: 🇬🇧 **[English](README.md)** &nbsp;|&nbsp; 🇮🇩 **[Indonesia](README.id.md)** &nbsp;|&nbsp; 🇹🇭 **[ภาษาไทย](README.th.md)** &nbsp;|&nbsp; 🇨🇳 **[中文](README.ch.md)** &nbsp;|&nbsp; 🇻🇳 **[Tiếng Việt](README.vi.md)**

</div>

---

# Termux App Storeとは？

**Termux App Store** (`termux-app-store`) は、Python ([Textual](https://github.com/Textualize/textual)) で作られた **TUI（ターミナルユーザーインターフェース）** および **CLIパッケージマネージャー** です。Android上のTermuxユーザーが **ツール/パッケージの閲覧・ビルド・インストール・管理** をデバイス上で直接行えます — アカウント不要、テレメトリなし、クラウド依存なし、root不要。

このプロジェクトは **Termuxの代替パッケージマネージャー** として機能し、SHA256で検証済みの `build.sh` スクリプトを使ってコミュニティのツールをソースからインストールできます — AUR（Arch User Repository）に近い思想ですが、Android上のTermux専用に設計されています。

> [!IMPORTANT]
> Termux App Storeは **中央集権的なバイナリリポジトリではなく**、**隠れたオートインストーラーでもありません**。
> すべてのビルドは **ローカルで、透明に、完全にユーザーの管理下で** 実行されます。

---

# `termux-packages` や TUR との違いは？

| | `termux-packages` | TUR | **Termux App Store** |
|---|---|---|---|
| 管理者 | Termuxコアチーム | 選ばれた貢献者 | オープンなコミュニティ |
| 承認が必要? | はい、厳格 | はい | いいえ — PRですぐ利用可能 |
| バイナリ配布? | はい | はい | いいえ — ローカルでソースからビルド |
| 個人ツールに適してる? | いいえ | 限定的 | **はい** |
| SHA256検証 | はい | はい | **はい** |
| オフライン利用可能? | いいえ | いいえ | **はい、完全に** |

---

# 対象ユーザー

| ユーザー | ユースケース |
|---|---|
| Termuxユーザー | ビルドとパッケージの完全なコントロール |
| 開発者 | ソースベースパッケージングでツールを配布 |
| レビュアー・監査者 | ビルドスクリプトのレビューと検証 |
| メンテナー | 複数のTermuxパッケージを一括管理 |

---

# スクリーンショット

<div align="center">

<img src=".assets/0.jpeg" width="74%" alt="Termux App Store — メイン画面"/>

<br/><br/>
<H1>TUIインターフェース</H1>

| TUIメイン | TUIインストール | メニューパレット |
|:---:|:---:|:---:|
| <img src=".assets/0main.jpg" width="220" alt="TUI Main Interface"/> | <img src=".assets/1install.jpg" width="220" alt="TUI Install Interface"/> | <img src=".assets/2pallete.jpg" width="220" alt="Menu Palette Interface"/> |
| TUIメインメニュー | パッケージインストール | コマンドパレット |

> **タッチスクリーン** 完全対応の使いやすいTUI

---

<H1>CLIインターフェース</H1>

| 他ツールサポート | CLIインストール | CLI表示 |
|:---:|:---:|:---:|
| <img src=".assets/0tas-and-termux-build.jpg" width="220" alt="Other tools support"/> | <img src=".assets/0cli-install.jpg" width="220" alt="CLI Install Interface"/> | <img src=".assets/0cli-view.jpg" width="220" alt="CLI View Interface"/> |
| tasctlとtermux-build | パッケージインストール | CLI help、list、show |

</div>

---

# インストールとアンインストール

> **[PyPI](https://pypi.org/project/termux-app-store/)** で公開中 — pipで検索・インストール可能

### オプション1（推奨）
```bash
pkg install python
pip install termux-app-store
```

### オプション2（手動）
```bash
curl -fsSL https://raw.githubusercontent.com/djunekz/termux-app-store/master/tasctl | bash -s install
```

または

```bash
git clone https://github.com/djunekz/termux-app-store
cd termux-app-store
bash install.sh
```

インストール後の起動:
```bash
termux-app-store        # インタラクティブTUIを開く
termux-app-store -h     # CLIヘルプを表示
```

## アンインストール
```bash
pip uninstall termux-app-store
```
または
```bash
./tasctl uninstall
```

---

# 使い方

### TUI — インタラクティブインターフェース
```bash
termux-app-store
```

### CLI — 直接コマンド

```bash
termux-app-store list                  # 全パッケージを表示
termux-app-store show <パッケージ>     # パッケージ詳細を表示
termux-app-store install <パッケージ>  # ビルド & インストール
termux-app-store update                # 利用可能なアップデートを確認
termux-app-store upgrade               # 全パッケージをアップグレード
termux-app-store upgrade <パッケージ>  # 特定パッケージをアップグレード
termux-app-store version               # 最新バージョンを確認
termux-app-store help                  # 完全なヘルプ
```

---

# 主な機能

<table>
<tr>
<td width="50%">

**パッケージブラウザ（TUI）**
キーボードとタッチスクリーンで`packages/`フォルダをインタラクティブに閲覧

**スマートビルドバリデーター**
サポートされていないTermux依存関係を自動ステータスバッジで検出

**リアルタイム検索・フィルター**
名前や説明でパッケージを即座に検索 — リロード不要

**ワンクリックビルド**
`build-package.sh`でワンクリックでインストールまたは更新

</td>
<td width="50%">

**ワンクリック検証**
`./termux-build`で配布前にパッケージを検証

**ワンクリック管理**
`./tasctl`でTermux App Store自体をインストール/更新/削除

**自動パスリゾルバー**
フォルダを移動・リネームしてもアプリの場所を自動検出

**プライバシーファースト**
アカウントなし、トラッキングなし、テレメトリなし — 完全オフライン

</td>
</tr>
</table>

---

# 自分でパッケージを作る方法

Termux App Storeの全パッケージは1つの`build.sh`ファイルで定義されます — Arch LinuxのPKGBUILDやHomebrewのformulaに似た仕組みですが、Android上のTermux用に設計されています。

```
packages/<ツール名>/build.sh
```

### 最小限の`build.sh`テンプレート

```bash
TERMUX_PKG_HOMEPAGE=""
TERMUX_PKG_DESCRIPTION=""
TERMUX_PKG_LICENSE=""
TERMUX_PKG_MAINTAINER="@あなたのgithubユーザー名"
TERMUX_PKG_VERSION=""
TERMUX_PKG_SRCURL=""
TERMUX_PKG_SHA256=""
```

### `termux-build`でパッケージを作成

```bash
cd termux-app-store
./termux-build create あなたのツール名
```

---

# Termuxコミュニティへのパッケージ配布方法

```bash
# 1. GitHubでこのリポジトリをFork
# 2. パッケージフォルダを追加:
mkdir packages/あなたのツール名

# 3. templateまたはtermux-buildでbuild.shを作成
./termux-build create あなたのツール名

# 4. submit前に検証:
./termux-build lint packages/あなたのツール名

# 5. このリポジトリにPull Requestを送信
```

PRがmergeされると、誰でも即座にインストール可能:
```bash
termux-app-store install あなたのツール名
```

> 完全なガイド: [HOW_TO_UPLOAD.md](HOW_TO_UPLOAD.md)

---

## ライセンス

このプロジェクトは **MITライセンス** の下でライセンスされています — 詳細は [LICENSE](LICENSE) を参照

---

## メンテナー

<div align="center">

**Djunekz** — 独立した公式開発者

[![GitHub](https://img.shields.io/badge/GitHub-djunekz-3fb950?style=for-the-badge&logo=github)](https://github.com/djunekz)

</div>

---

## このプロジェクトをサポート

Termux App Storeが役に立ったら:

- **スターを付ける** — 他の人が見つけやすくなります
- **シェアする** — Termux & Androidコミュニティで
- **バグ報告** — Issuesから
- **PR送信** — 改善のために

---

## 検索キーワード

> このプロジェクトは独立して開発されており、公式の [Termux](https://github.com/termux/termux-app) プロジェクトとは **無関係** です。

**検索キーワード:** termux アプリストア · termux パッケージマネージャー · termux-packages の代替 · TUR の代替 · termux ツールのインストール方法 · termux パッケージの配布方法 · termux tui android · termux rootなし · termux パッケージマネージャー 日本語 · android ターミナル パッケージ管理 · termux カスタムリポジトリ · termux ソースからビルド · termux-app-store djunekz

---

<div align="center">

**© Termux App Store — みんなのために、コミュニティによって作られました。**

</div>
