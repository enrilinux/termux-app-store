<div align="center">

<img src=".assets/00.jpeg" width="420" alt="Termux App Store — Termux के लिए TUI पैकेज मैनेजर"/>

<br/>

<H1>
  <a href="https://djunekz.github.io/termux-app-store/">Termux App Store — Termux के लिए TUI और CLI पैकेज मैनेजर</a>
</H1>

**Android पर Termux के लिए बनाया गया पहला offline-first, source-based TUI पैकेज मैनेजर।**

[![CI](https://github.com/djunekz/termux-app-store/actions/workflows/build.yml/badge.svg)](https://github.com/djunekz/termux-app-store/actions)
[![Codecov](https://codecov.io/github/djunekz/termux-app-store/branch/master/graph/badge.svg?token=357W4EP8G0)](https://codecov.io/github/djunekz/termux-app-store)
[![PyPI](https://img.shields.io/pypi/v/termux-app-store?style=flat&logo=pypi&color=3fb950&label=pypi)](https://pypi.org/project/termux-app-store/)<br>
![संस्करण](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fdjunekz%2Ftermux-app-store%2Ftags&query=%24%5B0%5D.name&style=flat&logo=github&color=3fb950&label=रिलीज़)
[![डाउनलोड](https://img.shields.io/github/downloads/djunekz/termux-app-store/total?style=flat&logo=github&color=3fb950&logoColor=white)](https://github.com/djunekz/termux-app-store)
[![लाइसेंस](https://img.shields.io/badge/लाइसेंस-MIT-3fb950?style=flat&logo=opensourceinitiative&logoColor=white)](LICENSE)
<br>
<br>
[![Stars](https://img.shields.io/github/stars/djunekz/termux-app-store?style=flat&logo=github&color=white&label=stars&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/stargazers)
[![Forks](https://img.shields.io/github/forks/djunekz/termux-app-store?style=flat&logo=github&color=white&cacheSeconds=3600)](https://github.com/djunekz/termux-app-store/network)
<br>
<br>
[![Issues](https://img.shields.io/badge/issues-open-3fb950?style=flat&logo=github&logoColor=white)](https://github.com/djunekz/termux-app-store/issues)
[![PRs](https://img.shields.io/github/issues-pr/djunekz/termux-app-store?style=flat&logo=git&logoColor=white&color=3fb950)](https://github.com/djunekz/termux-app-store/pulls)
[![समुदाय](https://img.shields.io/badge/समुदाय-खुला-3fb950?style=flat&logo=github)](https://github.com/djunekz/termux-app-store)

> **Offline-first &nbsp;•&nbsp; Source-based &nbsp;•&nbsp; सुरक्षित &nbsp;•&nbsp; Termux नेटिव &nbsp;•&nbsp; Android टर्मिनल**

> Source code से Termux पैकेज इंस्टॉल और प्रबंधित करें — बिना root, बिना अकाउंट, बिना telemetry

> भाषा में पढ़ें: 🇬🇧 **[English](README.md)** &nbsp;|&nbsp; 🇮🇩 **[Indonesia](README.id.md)** &nbsp;|&nbsp; 🇹🇭 **[ภาษาไทย](README.th.md)** &nbsp;|&nbsp; 🇯🇵 **[日本語](README.jp.md)** &nbsp;|&nbsp; 🇨🇳 **[中文](README.ch.md)** &nbsp;|&nbsp; 🇻🇳 **[Tiếng Việt](README.vi.md)**

</div>

---

# Termux App Store क्या है?

**Termux App Store** (`termux-app-store`) एक **TUI (Terminal User Interface)** और **CLI पैकेज मैनेजर** है जो Python ([Textual](https://github.com/Textualize/textual)) से बनाया गया है। यह Android पर Termux उपयोगकर्ताओं को सीधे डिवाइस पर **टूल्स/पैकेज ब्राउज़, बनाने, इंस्टॉल और प्रबंधित** करने की सुविधा देता है — बिना अकाउंट, बिना telemetry, बिना cloud, बिना root।

यह प्रोजेक्ट **Termux के लिए एक वैकल्पिक पैकेज मैनेजर** के रूप में काम करता है, जो SHA256 से सत्यापित `build.sh` स्क्रिप्ट का उपयोग करके source से community टूल्स इंस्टॉल करने देता है — AUR (Arch User Repository) जैसी सोच के साथ, लेकिन Android पर Termux के लिए विशेष रूप से डिज़ाइन किया गया।

> [!IMPORTANT]
> Termux App Store **कोई केंद्रीय binary रिपॉजिटरी नहीं है** और **कोई छुपा auto-installer नहीं है**।
> सभी build **लोकल रूप से, पारदर्शी तरीके से, और पूरी तरह उपयोगकर्ता के नियंत्रण में** चलते हैं।

---

# `termux-packages` और TUR से क्या अंतर है?

यह सबसे अधिक पूछा जाने वाला सवाल है। यहाँ तुलना है:

| | `termux-packages` | TUR | **Termux App Store** |
|---|---|---|---|
| कौन प्रबंधित करता है | Termux core टीम | चुने हुए योगदानकर्ता | खुला समुदाय |
| अनुमोदन जरूरी? | हाँ, कड़ा | हाँ | नहीं — PR तुरंत उपयोग योग्य |
| Binary वितरण? | हाँ | हाँ | नहीं — लोकल source से build |
| निजी टूल्स के लिए? | नहीं | सीमित | **हाँ** |
| SHA256 सत्यापन | हाँ | हाँ | **हाँ** |
| Offline उपयोग? | नहीं | नहीं | **हाँ, पूरी तरह** |

**Termux App Store कब उपयोग करें?**
- आपका टूल `termux-packages` या TUR में स्वीकार नहीं हुआ क्योंकि वह बहुत विशेष है
- आप अपना खुद का टूल जल्दी से community को वितरित करना चाहते हैं
- आप पूरा नियंत्रण चाहते हैं — build, install, uninstall — बिना server पर निर्भर हुए

---

# किसके लिए है?

| उपयोगकर्ता | उपयोग का मामला |
|---|---|
| Termux उपयोगकर्ता | build और पैकेज पर पूर्ण नियंत्रण |
| डेवलपर्स | source-based packaging के ज़रिए टूल्स वितरित करें |
| समीक्षक और ऑडिटर | build script की समीक्षा और सत्यापन |
| मेंटेनर | एक साथ कई Termux पैकेज प्रबंधित करें |

---

# स्क्रीनशॉट

<div align="center">

<img src=".assets/0.jpeg" width="74%" alt="Termux App Store — मुख्य दृश्य"/>

<br/><br/>
<H1>TUI इंटरफ़ेस</H1>

| TUI मुख्य | TUI इंस्टॉल | मेनू Palette |
|:---:|:---:|:---:|
| <img src=".assets/0main.jpg" width="220" alt="TUI Main Interface"/> | <img src=".assets/1install.jpg" width="220" alt="TUI Install Interface"/> | <img src=".assets/2pallete.jpg" width="220" alt="Menu Palette Interface"/> |
| TUI मुख्य मेनू | पैकेज इंस्टॉल प्रक्रिया | Command palette |

> पूर्ण **touchscreen** सपोर्ट के साथ उपयोगकर्ता-अनुकूल TUI

---

<H1>CLI इंटरफ़ेस</H1>

| अन्य टूल्स सपोर्ट | CLI इंस्टॉल | CLI व्यू |
|:---:|:---:|:---:|
| <img src=".assets/0tas-and-termux-build.jpg" width="220" alt="Other tools support"/> | <img src=".assets/0cli-install.jpg" width="220" alt="CLI Install Interface"/> | <img src=".assets/0cli-view.jpg" width="220" alt="CLI View Interface"/> |
| tasctl और termux-build | पैकेज इंस्टॉल प्रक्रिया | CLI help, list और show |

</div>

---

# इंस्टॉल और अनइंस्टॉल कैसे करें

> **[PyPI](https://pypi.org/project/termux-app-store/)** पर उपलब्ध — pip के ज़रिए सीधे खोजें और इंस्टॉल करें

### विकल्प 1 (अनुशंसित)
```bash
pkg install python
pip install termux-app-store
```

### विकल्प 2 (मैन्युअल)
```bash
curl -fsSL https://raw.githubusercontent.com/djunekz/termux-app-store/master/tasctl | bash -s install
```

या

```bash
git clone --single-branch --branch master https://github.com/djunekz/termux-app-store
cd termux-app-store
bash install.sh
```

इंस्टॉल के बाद चलाएं:
```bash
termux-app-store        # इंटरैक्टिव TUI खोलें
termux-app-store -h     # CLI सहायता दिखाएं
```

## अनइंस्टॉल
```bash
pip uninstall termux-app-store
```
या
```bash
./tasctl uninstall
```

---

# उपयोग कैसे करें

### TUI — इंटरैक्टिव इंटरफ़ेस
```bash
termux-app-store
```

### CLI — सीधे कमांड

```bash
termux-app-store list                  # सभी पैकेज दिखाएं
termux-app-store show <पैकेज>          # पैकेज विवरण देखें
termux-app-store install <पैकेज>       # Build और इंस्टॉल करें
termux-app-store update                # उपलब्ध अपडेट जाँचें
termux-app-store upgrade               # सभी पैकेज अपग्रेड करें
termux-app-store upgrade <पैकेज>       # विशिष्ट पैकेज अपग्रेड करें
termux-app-store version               # नवीनतम संस्करण जाँचें
termux-app-store help                  # पूरी सहायता
```

---

# मुख्य विशेषताएं

<table>
<tr>
<td width="50%">

**पैकेज ब्राउज़र (TUI)**
कीबोर्ड और touchscreen से `packages/` फ़ोल्डर को इंटरैक्टिव रूप से ब्राउज़ करें

**स्मार्ट Build Validator**
असमर्थित Termux dependencies को स्वचालित status badge के साथ पहचानता है

**Real-time खोज और फ़िल्टर**
नाम या विवरण से पैकेज तुरंत खोजें — बिना reload के

**One-Click Build**
`build-package.sh` के ज़रिए एक क्लिक में इंस्टॉल या अपडेट करें

</td>
<td width="50%">

**One-Click Validator**
`./termux-build` के ज़रिए वितरण से पहले पैकेज सत्यापित करें

**One-Click प्रबंधन**
`./tasctl` के ज़रिए Termux App Store को इंस्टॉल / अपडेट / हटाएं

**स्वचालित Path Resolver**
फ़ोल्डर स्थानांतरित या नाम बदलने पर भी app की लोकेशन स्वतः पहचाने

**Privacy-First**
कोई अकाउंट नहीं, कोई tracking नहीं, कोई telemetry नहीं — पूरी तरह offline

</td>
</tr>
</table>

---

# अपना पैकेज कैसे बनाएं

Termux App Store में हर पैकेज को सिर्फ एक `build.sh` फ़ाइल की ज़रूरत है — Arch Linux के PKGBUILD या Homebrew के formula जैसा, लेकिन Android पर Termux के लिए अनुकूलित।

```
packages/<टूल-नाम>/build.sh
```

### न्यूनतम `build.sh` टेम्पलेट

```bash
TERMUX_PKG_HOMEPAGE=""
TERMUX_PKG_DESCRIPTION=""
TERMUX_PKG_LICENSE=""
TERMUX_PKG_MAINTAINER="@आपका-github-username"
TERMUX_PKG_VERSION=""
TERMUX_PKG_SRCURL=""
TERMUX_PKG_SHA256=""
```

### `termux-build` से पैकेज बनाएं

```bash
cd termux-app-store
./termux-build create आपके-टूल-का-नाम
```

> [!NOTE]
> नाम में spaces न दें — `-` का उपयोग करें। उदाहरण: `mera-tool`

---

# Termux Community में पैकेज कैसे वितरित करें

```bash
# 1. GitHub पर इस repo को Fork करें
# 2. अपना पैकेज फ़ोल्डर जोड़ें:
mkdir packages/आपके-टूल-का-नाम

# 3. template या termux-build से build.sh बनाएं
./termux-build create आपके-टूल-का-नाम

# 4. submit से पहले सत्यापित करें:
./termux-build lint packages/आपके-टूल-का-नाम

# 5. इस repo में Pull Request भेजें
```

PR merge होने के बाद कोई भी तुरंत इंस्टॉल कर सकता है:
```bash
termux-app-store install आपके-टूल-का-नाम
```

> पूरा गाइड: [HOW_TO_UPLOAD.md](HOW_TO_UPLOAD.md)

---

## लाइसेंस

यह प्रोजेक्ट **MIT License** के तहत लाइसेंस प्राप्त है — विवरण के लिए [LICENSE](LICENSE) देखें

---

## मेंटेनर

<div align="center">

**Djunekz** — स्वतंत्र और आधिकारिक डेवलपर

[![GitHub](https://img.shields.io/badge/GitHub-djunekz-3fb950?style=for-the-badge&logo=github)](https://github.com/djunekz)

</div>

---

## इस प्रोजेक्ट को सपोर्ट करें

अगर Termux App Store आपके काम आया है:

- **Star दें** इस repo को — दूसरों को खोजने में मदद होगी
- **Share करें** Termux और Android community में
- **Bug रिपोर्ट करें** Issues के ज़रिए
- **PR भेजें** किसी भी सुधार के लिए

---

## खोज कीवर्ड

> यह प्रोजेक्ट स्वतंत्र रूप से विकसित किया गया है और आधिकारिक [Termux](https://github.com/termux/termux-app) प्रोजेक्ट से **असंबद्ध** है।

**खोज कीवर्ड:** termux app store हिंदी · termux पैकेज मैनेजर · termux-packages का विकल्प · TUR का विकल्प · termux में tools कैसे इंस्टॉल करें · termux पैकेज कैसे बनाएं · termux में अपना tool कैसे share करें · termux tui android · termux बिना root · android terminal पैकेज मैनेजर · termux community packages · termux source से build · termux offline उपयोग · termux custom repository · termux-app-store djunekz

---

<div align="center">

**© Termux App Store — सबके लिए बनाया, समुदाय द्वारा।**

</div>
