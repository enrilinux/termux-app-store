TERMUX_PKG_HOMEPAGE=https://github.com/atanunq/viu
TERMUX_PKG_DESCRIPTION="Terminal image viewer with native support for iTerm and Kitty"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.6.1
TERMUX_PKG_SRCURL=https://github.com/atanunq/viu/archive/refs/tags/v1.6.1.tar.gz
TERMUX_PKG_SHA256=639c1fe14aee5e34b635de041ac77177e2959cf26072d8ef69c444b15c8273bd

TERMUX_PKG_DEPENDS="rust"

termux_step_make_install() {
    cargo install --locked --path . --root "$TERMUX_PREFIX"
}
