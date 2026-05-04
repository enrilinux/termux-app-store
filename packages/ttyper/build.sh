TERMUX_PKG_HOMEPAGE=https://github.com/max-niederman/ttyper
TERMUX_PKG_DESCRIPTION="Terminal-based typing test."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.6.0
TERMUX_PKG_SRCURL=https://github.com/max-niederman/ttyper/archive/refs/tags/v1.6.0.tar.gz
TERMUX_PKG_SHA256=f7e4ff2f803483b17f35aa0c02977326a0546a95f5b465b4dd34ff17e45b4021

TERMUX_PKG_DEPENDS="rust"

termux_step_make_install() {
    cargo install --locked --path . --root "$TERMUX_PREFIX"
}
