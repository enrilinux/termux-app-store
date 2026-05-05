TERMUX_PKG_HOMEPAGE=https://github.com/chriswalz/bit
TERMUX_PKG_DESCRIPTION="Bit is a modern Git CLI"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.1.2
TERMUX_PKG_SRCURL=https://github.com/chriswalz/bit/archive/refs/tags/v1.1.2.tar.gz
TERMUX_PKG_SHA256=563ae6b0fa279cb8ea8f66b4b455c7cb74a9e65a0edbe694505b2c8fc719b2ff
TERMUX_PKG_DEPENDS="golang"

termux_step_make_install() {
    export GOPATH="$PWD/gopath"
    export GOPROXY="https://proxy.golang.org,direct"
    go mod tidy 2>/dev/null || true
    go build -v -o "$TERMUX_PREFIX/bin/bit" .
}
