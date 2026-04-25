TERMUX_PKG_HOMEPAGE=https://gitlab.com/groups/kalilinux/packages
TERMUX_PKG_DESCRIPTION="dumpzilla packaging for Kali Linux"
TERMUX_PKG_LICENSE="UNKNOWN"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://gitlab.com/kalilinux/packages/dumpzilla/-/archive/kali/master/dumpzilla-kali/master.tar.gz
TERMUX_PKG_SHA256=53df946af387842561db5ca2bea7816a8e0870f7399fcaef4299411a04931b99

TERMUX_PKG_DEPENDS="python, python-pip, python-setuptools"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    pip install --quiet setuptools wheel --break-system-packages 2>/dev/null || true


    local libdir="$TERMUX_PREFIX/lib/dumpzilla"
    mkdir -p "$libdir"
    cp -r . "$libdir/"

    find "$libdir" -type d | while read -r _dir; do
        if ls "$_dir"/*.py &>/dev/null 2>&1 && [[ ! -f "$_dir/__init__.py" ]]; then
            touch "$_dir/__init__.py"
        fi
    done



    cat > "$TERMUX_PREFIX/bin/dumpzilla" <<'WRAPPER'
#!/usr/bin/env bash
cd "${TERMUX_PREFIX}/lib/dumpzilla" || exit 1
exec python3 "${TERMUX_PREFIX}/lib/dumpzilla/dumpzilla.py" "$@"
WRAPPER
    sed -i "s|\${TERMUX_PREFIX}|/data/data/com.termux/files/usr|g" "$TERMUX_PREFIX/bin/dumpzilla"
    chmod 0755 "$TERMUX_PREFIX/bin/dumpzilla"
}
