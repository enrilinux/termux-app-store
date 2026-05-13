TERMUX_PKG_HOMEPAGE=https://github.com/opsonusdh/Termux-TUI
TERMUX_PKG_DESCRIPTION="A futuristic Jarvis-style terminal dashboard for Termux"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@opsonusdh"
TERMUX_PKG_VERSION=2.4.0
TERMUX_PKG_SRCURL=https://github.com/djunekz/termux-tui/archive/refs/heads/main.tar.gz
TERMUX_PKG_SHA256=9f84312a1cfa645af345079a48fdbcd26ef30cf02e060d10241021e43d029ce6

TERMUX_PKG_DEPENDS="python, python-pip, python-setuptools"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    pip install --quiet setuptools wheel --break-system-packages 2>/dev/null || true
    pip install --quiet rich speedtest-cli textual --break-system-packages 2>/dev/null || true

    local libdir="$TERMUX_PREFIX/lib/termux-tui"
    mkdir -p "$libdir"
    cp -r . "$libdir/"

    find "$libdir" -type d | while read -r _dir; do
        if ls "$_dir"/*.py &>/dev/null 2>&1 && [[ ! -f "$_dir/__init__.py" ]]; then
            touch "$_dir/__init__.py"
        fi
    done

    cat > "$TERMUX_PREFIX/bin/termux-tui" <<'WRAPPER'
#!/usr/bin/env bash
cd "${TERMUX_PREFIX}/lib/termux-tui" || exit 1
exec python3 "${TERMUX_PREFIX}/lib/termux-tui/main.py" "$@"
WRAPPER
    sed -i "s|\${TERMUX_PREFIX}|/data/data/com.termux/files/usr|g" "$TERMUX_PREFIX/bin/termux-tui"
    chmod 0755 "$TERMUX_PREFIX/bin/termux-tui"
}
