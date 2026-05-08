#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail

readonly OFFICIAL_REPO="djunekz/termux-app-store"
readonly OFFICIAL_API="https://api.github.com/repos/djunekz/termux-app-store/releases/latest"
readonly OFFICIAL_RELEASE_BASE="https://github.com/djunekz/termux-app-store/releases/download"
readonly OFFICIAL_URL="https://github.com/djunekz/termux-app-store"

APP_NAME="termux-app-store"
INSTALL_DIR="$PREFIX/lib/.tas"
BIN_DIR="$PREFIX/bin"

R=$'\033[0m'
B=$'\033[1m'
DIM=$'\033[2m'
RED=$'\033[31m'
BRED=$'\033[91m'
BGREEN=$'\033[92m'
BYELLOW=$'\033[93m'
BCYAN=$'\033[96m'

die()  { printf "\n %s[✗]%s %s\n\n" "$BRED$B" "$R" "$*" >&2; exit 1; }
info() { printf " %s[*]%s %s\n" "$BCYAN$B" "$R" "$*"; }
ok()   { printf " %s[✓]%s %s\n" "$BGREEN$B" "$R" "$*"; }
warn() { printf " %s[!]%s %s\n" "$BYELLOW$B" "$R" "$*"; }

show_banner() {
  printf "\n%s╔═════════════════════════════════════════════╗%s\n" "$BCYAN$B" "$R"
  printf   "%s║         Termux App Store Installer          ║%s\n" "$BCYAN$B" "$R"
  printf   "%s║ https://github.com/djunekz/termux-app-store ║%s\n" "$BCYAN$B" "$R"
  printf   "%s║               by @djunekz                   ║%s\n" "$BCYAN$B" "$R"
  printf   "%s╚═════════════════════════════════════════════╝%s\n\n" "$BCYAN$B" "$R"
}

verify_official_release() {
  info "Verifying official release source..."

  local api_full_name
  api_full_name=$(curl -fsSL \
    -H "Accept: application/vnd.github+json" \
    "https://api.github.com/repos/$OFFICIAL_REPO" 2>/dev/null \
    | grep '"full_name"' \
    | head -1 \
    | sed 's/.*"full_name": *"\([^"]*\)".*/\1/' || true)

  if [[ "$api_full_name" != "$OFFICIAL_REPO" ]]; then
    printf "\n"
    printf "%s╔══════════════════════════════════════════════════════════╗%s\n" "$BRED$B" "$R"
    printf "%s║                                                          ║%s\n" "$BRED$B" "$R"
    printf "%s║   ⚠  INSTALLATION BLOCKED — UNOFFICIAL SOURCE  ⚠         ║%s\n" "$BRED$B" "$R"
    printf "%s║                                                          ║%s\n" "$BRED$B" "$R"
    printf "%s║   This installer only works with the official project:   ║%s\n" "$BRED$B" "$R"
    printf "%s║   github.com/djunekz/termux-app-store                    ║%s\n" "$BRED$B" "$R"
    printf "%s║                                                          ║%s\n" "$BRED$B" "$R"
    printf "%s║   Any fork or copy claiming to be the original is        ║%s\n" "$BRED$B" "$R"
    printf "%s║   NOT the official Termux App Store by @djunekz.         ║%s\n" "$BRED$B" "$R"
    printf "%s║                                                          ║%s\n" "$BRED$B" "$R"
    printf "%s║   Always install from the official source:               ║%s\n" "$BRED$B" "$R"
    printf "%s║                                                          ║%s\n" "$BRED$B" "$R"
    printf "%s╚══════════════════════════════════════════════════════════╝%s\n" "$BRED$B" "$R"
    printf "%sCopy this text for installing termux-app-store:%s\n\n" "$BRED$B" "$R"
    printf "%s curl -fsSL https://raw.githubusercontent.com/djunekz/termux-app-store/master/install.sh | bash %s\n" "$BGRREN$B" "$R"
    printf "\n"
    exit 1
  fi

  ok "Official source verified: ${B}github.com/$OFFICIAL_REPO${R}"
}

check_termux() {
  [[ -n "${PREFIX:-}" ]] && command -v pkg >/dev/null 2>&1 \
    || die "This installer must be run inside Termux"
  ok "Termux environment detected"
}

install_dep() {
  local dep="$1"
  if command -v "$dep" >/dev/null 2>&1; then
    ok "Dependency satisfied: $dep"
  else
    info "Installing: $dep"
    pkg install -y "$dep" || die "Failed to install $dep"
    ok "$dep installed"
  fi
}

detect_arch() {
  local arch; arch="$(uname -m)"
  case "$arch" in
    aarch64)        ARCH="aarch64" ;;
    armv7l|armv8l)  ARCH="arm"     ;;
    x86_64)         ARCH="x86_64"  ;;
    i686)           ARCH="i686"    ;;
    *) die "Unsupported architecture: $arch" ;;
  esac
  ok "Architecture: ${B}$arch${R}"
}

check_existing() {
  [[ -f "$BIN_DIR/$APP_NAME" ]] || [[ -d "$INSTALL_DIR" ]] || return 0

  warn "Existing installation found"
  local current=""
  [[ -f "$INSTALL_DIR/.installed" ]] && \
    current=$(grep '^version=' "$INSTALL_DIR/.installed" 2>/dev/null | cut -d= -f2 || true)
  [[ -n "$current" ]] && printf "  Installed version : %sv%s%s\n" "$B" "$current" "$R"

  if ! [ -t 0 ]; then
    warn "Running via pipe — auto-overwriting existing installation"
    return 0
  fi

  printf "  Overwrite? [Y/n]: "
  read -r resp </dev/tty
  case "${resp:-Y}" in
    [nN]|[nN][oO]) die "Installation cancelled" ;;
  esac
}

cleanup() {
  info "Cleaning previous installation..."
  rm -rf "$INSTALL_DIR"
  rm -f  "$BIN_DIR/$APP_NAME"
  rm -f  "$BIN_DIR/tasctl"
}

download_release() {
  install_dep curl

  info "Fetching latest release tag..."
  local tag
  tag=$(curl -fsSL \
    -H "Accept: application/vnd.github+json" \
    "$OFFICIAL_API" 2>/dev/null \
    | grep '"tag_name"' \
    | head -1 \
    | sed 's/.*"tag_name": *"\([^"]*\)".*/\1/' || true)

  [[ -n "$tag" ]] || die "Cannot fetch release info — check your internet connection"
  VERSION="${tag#v}"
  TAG="$tag"
  ok "Latest release: ${B}$TAG${R}"

  local archive="termux-app-store-${TAG}.tar.gz"
  local url="${OFFICIAL_RELEASE_BASE}/${TAG}/${archive}"
  local sha256_url="${url}.sha256"

  local tmp_dir; tmp_dir=$(mktemp -d)
  local tmp_archive="$tmp_dir/$archive"

  info "Downloading ${B}$archive${R}..."
  info "From: ${DIM}$url${R}"
  curl -fL --progress-bar --retry 3 --retry-delay 2 \
    "$url" -o "$tmp_archive" \
    || { rm -rf "$tmp_dir"; die "Download failed"; }
  ok "Download complete"

  info "Verifying SHA256 checksum..."
  local expected actual
  expected=$(curl -fsSL "$sha256_url" 2>/dev/null | awk '{print $1}' || true)

  if [[ -n "$expected" ]]; then
    actual=$(sha256sum "$tmp_archive" | awk '{print $1}')
    if [[ "$actual" != "$expected" ]]; then
      rm -rf "$tmp_dir"
      die "SHA256 mismatch — file may be corrupted or tampered\n  Expected : $expected\n  Got      : $actual"
    fi
    ok "Checksum verified"
  else
    warn "SHA256 not available — skipping checksum verification"
  fi

  info "Extracting archive..."
  mkdir -p "$INSTALL_DIR"
  tar -xzf "$tmp_archive" -C "$INSTALL_DIR" \
    || { rm -rf "$tmp_dir"; die "Extraction failed"; }
  rm -rf "$tmp_dir"
  ok "Extracted to $INSTALL_DIR"
}

install_python_deps() {
  if ! command -v python3 >/dev/null 2>&1; then
    info "Installing Python3..."
    pkg install -y python || die "Failed to install Python3"
  fi
  ok "Python: $(python3 --version 2>&1 | awk '{print $2}')"

  if ! python3 -m pip --version >/dev/null 2>&1; then
    info "Installing pip..."
    pkg install -y python-pip || die "Failed to install pip"
  fi
  ok "pip ready"

  if ! python3 -c "import textual" >/dev/null 2>&1; then
    info "Installing Textual..."
    python3 -m pip install textual --break-system-packages \
      || die "Failed to install Textual"
  fi
  ok "Textual: v$(python3 -c "import textual; print(textual.__version__)" 2>/dev/null)"
}

create_launcher() {
  info "Creating launcher..."
  cat > "$BIN_DIR/$APP_NAME" << WRAPPER
#!/data/data/com.termux/files/usr/bin/bash
export TERMUX_APP_STORE_VERSION="${VERSION}"
export TERMUX_APP_STORE_HOME="${INSTALL_DIR}"
exec python3 "${INSTALL_DIR}/termux_app_store/main.py" "\$@"
WRAPPER
  chmod +x "$BIN_DIR/$APP_NAME"
  ok "Launcher: $BIN_DIR/$APP_NAME"
}

setup_tasctl() {
  if [[ -f "$INSTALL_DIR/tasctl" ]]; then
    chmod +x "$INSTALL_DIR/tasctl"
    ln -sf "$INSTALL_DIR/tasctl" "$BIN_DIR/tasctl"
    ok "tasctl linked: $BIN_DIR/tasctl"
  fi
}

write_sentinel() {
  cat > "$INSTALL_DIR/.installed" << EOF
version=${VERSION}
tag=${TAG}
mode=release
source=github-official-release
repo=${OFFICIAL_REPO}
installed_at=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
EOF
  ok "Install info saved"
}

show_done() {
  printf "\n"
  printf "%s╔═════════════════════════════════════════════╗%s\n" "$BGREEN$B" "$R"
  printf "%s║   Installation Completed Successfully!      ║%s\n" "$BGREEN$B" "$R"
  printf "%s╚═════════════════════════════════════════════╝%s\n" "$BGREEN$B" "$R"
  printf "\n%sDetails:%s\n" "$BCYAN$B" "$R"
  printf "  Version   : %sv%s%s\n"       "$B" "$VERSION" "$R"
  printf "  Source    : %sOfficial GitHub Release%s\n" "$B" "$R"
  printf "  Repo      : %s%s%s\n"        "$DIM" "$OFFICIAL_URL" "$R"
  printf "  Installed : %s%s/%s%s\n"     "$DIM" "$BIN_DIR" "$APP_NAME" "$R"
  printf "\n%sRun:%s\n" "$BCYAN$B" "$R"
  printf "  %s%s%s\n" "$B" "$APP_NAME" "$R"
  printf "\n%sManage with tasctl:%s\n" "$BCYAN$B" "$R"
  printf "  tasctl update    %s→ Update to latest release%s\n" "$DIM" "$R"
  printf "  tasctl uninstall %s→ Remove%s\n" "$DIM" "$R"
  printf "  tasctl doctor    %s→ Diagnose environment%s\n\n" "$DIM" "$R"
}

main() {
  show_banner
  check_termux
  verify_official_release
  detect_arch
  check_existing
  printf "\n"
  cleanup
  download_release
  install_python_deps
  write_sentinel
  create_launcher
  setup_tasctl
  show_done
}

trap 'printf "\n"; die "Installation failed at line $LINENO"' ERR

main "$@"
