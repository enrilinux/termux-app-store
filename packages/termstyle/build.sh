TERMUX_PKG_HOMEPAGE=https://github.com/djunekz/termstyle
TERMUX_PKG_DESCRIPTION="Simple tool for change color, command prompt, and cursor termux"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@djunekz"
TERMUX_PKG_VERSION=2.0.0
TERMUX_PKG_SRCURL=https://github.com/djunekz/termstyle/releases/download/${TERMUX_PKG_VERSION}/termstyle_${TERMUX_PKG_VERSION}_all.deb
TERMUX_PKG_SHA256=d747df182b4e3a899ae95ac5bef0e834f61783cc9bf12c26d9166ba84957963f
TERMUX_PKG_DEPENDS="python"

termux_step_make_install() {
    _TERMSET=$(find "$TERMUX_PKG_SRCDIR" -name "termset.py" | head -n1)
    mkdir -p "$TERMUX_PREFIX/lib/termstyle"
    cp "$_TERMSET" "$TERMUX_PREFIX/lib/termstyle/termset.py"
    chmod +x "$TERMUX_PREFIX/lib/termstyle/termset.py"

    mkdir -p "$TERMUX_PREFIX/bin"
    cat > "$TERMUX_PREFIX/bin/termstyle" <<'WRAPPER'
#!/data/data/com.termux/files/usr/bin/bash
exec python3 "/data/data/com.termux/files/usr/lib/termstyle/termset.py" "$@"
WRAPPER
    chmod +x "$TERMUX_PREFIX/bin/termstyle"
}
