TERMUX_PKG_HOMEPAGE=https://github.com/pystardust/ytfzf
TERMUX_PKG_DESCRIPTION="A posix script to find and watch youtube videos from the terminal. (Without API)"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=2.6.2
TERMUX_PKG_SRCURL=https://github.com/pystardust/ytfzf/archive/refs/tags/v2.6.2.tar.gz
TERMUX_PKG_SHA256=73280e4ef4f490400a42bf582b713803c523587b0b30269859eaa6f2693ec9b1
TERMUX_PKG_DEPENDS="imlib2, jack, jack2, libcaca, libid3tag, libsixel, libuchardet, luajit, mpv, openal-soft"

termux_step_make() {
    if [[ ! -f Makefile && ! -f makefile ]]; then
        echo "[ WARN ] No Makefile found in $(pwd) — skipping make step"
        return 0
    fi
    make -j"$(nproc)" PREFIX="$TERMUX_PREFIX"
}

termux_step_make_install() {
    if [[ ! -f Makefile && ! -f makefile ]]; then
        echo "[ WARN ] No Makefile found — trying pip fallback..."
        if [[ -f pyproject.toml || -f setup.py ]]; then
            pip install --quiet setuptools wheel --break-system-packages 2>/dev/null || true
            pip install . --prefix="$TERMUX_PREFIX" --no-deps --break-system-packages 2>/dev/null                 || pip install . --prefix="$TERMUX_PREFIX" --no-deps --no-build-isolation --break-system-packages                 || { echo "pip install also failed"; return 1; }
        else
            echo "[ FAIL ] No Makefile and no pyproject.toml/setup.py found"
            return 1
        fi
        return 0
    fi
    make install PREFIX="$TERMUX_PREFIX"
}
