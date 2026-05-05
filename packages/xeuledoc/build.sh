TERMUX_PKG_HOMEPAGE=https://malfrats.industries/
TERMUX_PKG_DESCRIPTION="Fetch information about a public Google document."
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://github.com/Malfrats/xeuledoc/archive/refs/heads/master.tar.gz
TERMUX_PKG_SHA256=c78abd48c03a7103806f54f90716f6337f7af3b90b7ca68dd10d85e3ce53bec4

TERMUX_PKG_DEPENDS="python, python-pip, python-setuptools"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    pip install --quiet setuptools wheel --break-system-packages 2>/dev/null || true
    pip install --quiet FetchinformationaboutapublicGoogledocument. --break-system-packages 2>/dev/null || echo "[ WARN ] pip install FetchinformationaboutapublicGoogledocument. failed — may be missing at runtime"
    pip install --quiet console_scripts --break-system-packages 2>/dev/null || echo "[ WARN ] pip install console_scripts failed — may be missing at runtime"
    pip install --quiet https://github.com/Malfrats/xeuledoc --break-system-packages 2>/dev/null || echo "[ WARN ] pip install https://github.com/Malfrats/xeuledoc failed — may be missing at runtime"
    pip install --quiet httpx --break-system-packages 2>/dev/null || echo "[ WARN ] pip install httpx failed — may be missing at runtime"
    pip install --quiet setuptools --break-system-packages 2>/dev/null || echo "[ WARN ] pip install setuptools failed — may be missing at runtime"
    pip install --quiet xeuledoc --break-system-packages 2>/dev/null || echo "[ WARN ] pip install xeuledoc failed — may be missing at runtime"
    local libdir="$TERMUX_PREFIX/lib/xeuledoc"
    # Install with deps first (reads pyproject.toml/setup.py dependencies automatically)
    pip install . --prefix="$TERMUX_PREFIX" --break-system-packages 2>/dev/null \
        || pip install . --prefix="$TERMUX_PREFIX" --no-build-isolation --break-system-packages 2>/dev/null \
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
