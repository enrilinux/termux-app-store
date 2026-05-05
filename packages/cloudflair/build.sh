TERMUX_PKG_HOMEPAGE=https://blog.christophetd.fr/bypassing-cloudflare-using-internet-wide-scan-data/
TERMUX_PKG_DESCRIPTION="🔎 Find origin servers of websites behind CloudFlare by using Internet-wide scan data from Censys."
TERMUX_PKG_LICENSE="UNKNOWN"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://github.com/christophetd/CloudFlair/archive/refs/heads/master.tar.gz
TERMUX_PKG_SHA256=7d25c983530e7d91fd78504966625aa021083c75d81362893961fc76abf46893

TERMUX_PKG_DEPENDS="python, python-pip, python-setuptools"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    pip install --quiet setuptools wheel --break-system-packages 2>/dev/null || true
    pip install --quiet censys --break-system-packages 2>/dev/null || echo "[ WARN ] pip install censys failed — may be missing at runtime"
    pip install --quiet dns --break-system-packages 2>/dev/null || echo "[ WARN ] pip install dns failed — may be missing at runtime"
    pip install --quiet dnspython --break-system-packages 2>/dev/null || echo "[ WARN ] pip install dnspython failed — may be missing at runtime"
    pip install --quiet html-similarity --break-system-packages 2>/dev/null || echo "[ WARN ] pip install html-similarity failed — may be missing at runtime"
    pip install --quiet html_similarity --break-system-packages 2>/dev/null || echo "[ WARN ] pip install html_similarity failed — may be missing at runtime"
    pip install --quiet requests --break-system-packages 2>/dev/null || echo "[ WARN ] pip install requests failed — may be missing at runtime"
    pip install --quiet urllib3 --break-system-packages 2>/dev/null || echo "[ WARN ] pip install urllib3 failed — may be missing at runtime"
    pip install --quiet "cssselect<1.3" --break-system-packages 2>/dev/null || true
    pip install --quiet "parsel" --break-system-packages 2>/dev/null || true
    pip install --quiet html-similarity --break-system-packages 2>/dev/null || true

    local libdir="$TERMUX_PREFIX/lib/cloudflair"
    mkdir -p "$libdir"
    cp -r . "$libdir/"

    find "$libdir" -type d | while read -r _dir; do
        if ls "$_dir"/*.py &>/dev/null 2>&1 && [[ ! -f "$_dir/__init__.py" ]]; then
            touch "$_dir/__init__.py"
        fi
    done



    cat > "$TERMUX_PREFIX/bin/cloudflair" <<'WRAPPER'
#!/usr/bin/env bash
cd "${TERMUX_PREFIX}/lib/cloudflair" || exit 1
exec python3 "${TERMUX_PREFIX}/lib/cloudflair/cloudflair.py" "$@"
WRAPPER
    sed -i "s|\${TERMUX_PREFIX}|/data/data/com.termux/files/usr|g" "$TERMUX_PREFIX/bin/cloudflair"
    chmod 0755 "$TERMUX_PREFIX/bin/cloudflair"
}
