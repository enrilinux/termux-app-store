TERMUX_PKG_HOMEPAGE=https://commixproject.com
TERMUX_PKG_DESCRIPTION="Automated All-in-One OS Command Injection Exploitation Tool"
TERMUX_PKG_LICENSE="NOASSERTION"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=4.1
TERMUX_PKG_SRCURL=https://github.com/commixproject/commix/archive/refs/tags/v4.1.tar.gz
TERMUX_PKG_SHA256=d71e6a98231c2eb434eb9cc1b835523ad5618578309e2f835c40d767f2af79de

TERMUX_PKG_DEPENDS="python, python-pip, python-setuptools"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    pip install --quiet setuptools wheel --break-system-packages 2>/dev/null || true
    pip install --quiet errno setuptools --break-system-packages 2>/dev/null || true
    local libdir="$TERMUX_PREFIX/lib/commix"
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
