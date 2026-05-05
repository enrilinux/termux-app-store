TERMUX_PKG_HOMEPAGE=https://github.com/megadose/holehe
TERMUX_PKG_DESCRIPTION="holehe allows you to check if the mail is used on different sites like twitter, instagram and will retrieve information on sites with the forgotten password function."
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://github.com/megadose/holehe/archive/refs/heads/master.tar.gz
TERMUX_PKG_SHA256=08327f53626ac6bc83a99f10ea0dfe9f0d2953d7c8c8d0fc2e170000670775b8

TERMUX_PKG_DEPENDS="python, python-pip, python-setuptools"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    pip install --quiet setuptools wheel --break-system-packages 2>/dev/null || true
    pip install --quiet beautifulsoup4 --break-system-packages 2>/dev/null || echo "[ WARN ] pip install beautifulsoup4 failed — may be missing at runtime"
    pip install --quiet colorama --break-system-packages 2>/dev/null || echo "[ WARN ] pip install colorama failed — may be missing at runtime"
    pip install --quiet console_scripts --break-system-packages 2>/dev/null || echo "[ WARN ] pip install console_scripts failed — may be missing at runtime"
    pip install --quiet holehe --break-system-packages 2>/dev/null || echo "[ WARN ] pip install holehe failed — may be missing at runtime"
    pip install --quiet holeheallowsyoutocheckifthemailisusedondifferentsitesliketwitter,instagram,snapchatandwillretrieveinformationonsiteswiththeforgottenpasswordfunction. --break-system-packages 2>/dev/null || echo "[ WARN ] pip install holeheallowsyoutocheckifthemailisusedondifferentsitesliketwitter,instagram,snapchatandwillretrieveinformationonsiteswiththeforgottenpasswordfunction. failed — may be missing at runtime"
    pip install --quiet http://github.com/megadose/holehe --break-system-packages 2>/dev/null || echo "[ WARN ] pip install http://github.com/megadose/holehe failed — may be missing at runtime"
    pip install --quiet httpx --break-system-packages 2>/dev/null || echo "[ WARN ] pip install httpx failed — may be missing at runtime"
    pip install --quiet setuptools --break-system-packages 2>/dev/null || echo "[ WARN ] pip install setuptools failed — may be missing at runtime"
    pip install --quiet termcolor --break-system-packages 2>/dev/null || echo "[ WARN ] pip install termcolor failed — may be missing at runtime"
    pip install --quiet tqdm --break-system-packages 2>/dev/null || echo "[ WARN ] pip install tqdm failed — may be missing at runtime"
    pip install --quiet trio --break-system-packages 2>/dev/null || echo "[ WARN ] pip install trio failed — may be missing at runtime"
    local libdir="$TERMUX_PREFIX/lib/holehe"
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
