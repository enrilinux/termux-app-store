TERMUX_PKG_HOMEPAGE=https://github.com/darkoperator/dnsrecon
TERMUX_PKG_DESCRIPTION="DNS Enumeration Script"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.6.0
TERMUX_PKG_SRCURL=https://github.com/darkoperator/dnsrecon/archive/refs/tags/1.6.0.tar.gz
TERMUX_PKG_SHA256=21b83c22e4dcf684b623c824a678c371d803952d99d4758c9b1c45bce409eb3d

TERMUX_PKG_DEPENDS="python, python-pip, python-setuptools"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    pip install --quiet setuptools wheel --break-system-packages 2>/dev/null || true
    pip install --quiet dns dnspython fastapi httpx loguru netaddr pydantic pytest pytest-asyncio pyupgrade ruff slowapi stamina types-ujson uvicorn --break-system-packages 2>/dev/null || true
    local libdir="$TERMUX_PREFIX/lib/dnsrecon"
    pip install . --prefix="$TERMUX_PREFIX" --no-deps --break-system-packages 2>/dev/null \
        || pip install . --prefix="$TERMUX_PREFIX" --no-deps --no-build-isolation --break-system-packages || {
            echo "pip failed — falling back to manual install"
            mkdir -p "$libdir"
            cp -r . "$libdir/"
        }

    find "$libdir" -type d 2>/dev/null | while read -r _dir; do
        if ls "$_dir"/*.py &>/dev/null 2>&1 && [[ ! -f "$_dir/__init__.py" ]]; then
            touch "$_dir/__init__.py"
        fi
    done


}
