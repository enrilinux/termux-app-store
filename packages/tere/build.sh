TERMUX_PKG_HOMEPAGE=https://github.com/mgunyho/tere
TERMUX_PKG_DESCRIPTION="Terminal file explorer"
TERMUX_PKG_LICENSE="EUPL-1.2"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.6.0
TERMUX_PKG_SRCURL=https://github.com/mgunyho/tere/archive/refs/tags/v1.6.0.tar.gz
TERMUX_PKG_SHA256=7db94216b94abd42f48105c90e0e777593aaf867472615eb94dc2f77bb6a3cfb

TERMUX_PKG_DEPENDS="rust"

termux_step_make_install() {
    cargo install --locked --path . --root "$TERMUX_PREFIX"
}
