TERMUX_PKG_HOMEPAGE=https://github.com/muneebwanee/InstaReporter
TERMUX_PKG_DESCRIPTION="Instagram Mass Reporting Tool"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.0.1
TERMUX_PKG_SRCURL=https://github.com/muneebwanee/InstaReporter/archive/refs/heads/main.tar.gz
TERMUX_PKG_SHA256=7dbfe627db9b30f6e5a0522b846e9ee4e2594c618661520477b6951145440b44

TERMUX_PKG_DEPENDS="python, python-pip, python-setuptools"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    pip install --quiet setuptools wheel --break-system-packages 2>/dev/null || true
    pip install --quiet asyncio colorama libs proxybroker requests --break-system-packages 2>/dev/null || true

    local libdir="$TERMUX_PREFIX/lib/instareporter"
    mkdir -p "$libdir"
    cp -r . "$libdir/"

    find "$libdir" -type d | while read -r _dir; do
        if ls "$_dir"/*.py &>/dev/null 2>&1 && [[ ! -f "$_dir/__init__.py" ]]; then
            touch "$_dir/__init__.py"
        fi
    done

    cat > "$TERMUX_PREFIX/bin/instareporter" <<'WRAPPER'
#!/usr/bin/env bash
cd "${TERMUX_PREFIX}/lib/instareporter" || exit 1
exec python3 "${TERMUX_PREFIX}/lib/instareporter/InstaReporter.py" "$@"
WRAPPER
    sed -i "s|\${TERMUX_PREFIX}|/data/data/com.termux/files/usr|g" "$TERMUX_PREFIX/bin/instareporter"
    chmod 0755 "$TERMUX_PREFIX/bin/instareporter"
}
