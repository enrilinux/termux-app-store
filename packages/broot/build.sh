TERMUX_PKG_HOMEPAGE=https://github.com/Canop/broot
TERMUX_PKG_DESCRIPTION="A new way to see and navigate directory trees : https://dystroy.org/broot"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.56.2
TERMUX_PKG_SRCURL=https://github.com/Canop/broot/archive/refs/tags/v1.56.2.tar.gz
TERMUX_PKG_SHA256=3e7be4252c76565f6d71b34bd07d26e1444b9ac2e1c8271c724f6e866fe75565
TERMUX_PKG_DEPENDS="rust"

termux_step_make_install() {
    cargo install --locked --path . --root "$TERMUX_PREFIX"
}
