TERMUX_PKG_HOMEPAGE=https://github.com/bootandy/dust
TERMUX_PKG_DESCRIPTION="A more intuitive version of du in rust"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.2.4
TERMUX_PKG_SRCURL=https://github.com/bootandy/dust/archive/refs/tags/v1.2.4.tar.gz
TERMUX_PKG_SHA256=2f6768534bd01727234e67f1dd3754c9547aa18c715f6ee52094e881ebac50e3
TERMUX_PKG_DEPENDS="rust"

termux_step_make_install() {
    cargo install --locked --path . --root "$TERMUX_PREFIX"
}
