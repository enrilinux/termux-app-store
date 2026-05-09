TERMUX_PKG_HOMEPAGE=https://github.com/OJ/gobuster
TERMUX_PKG_DESCRIPTION="Directory/File, DNS and VHost busting tool written in Go"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=3.8.2
TERMUX_PKG_SRCURL=https://github.com/OJ/gobuster/archive/refs/tags/v3.8.2.tar.gz
TERMUX_PKG_SHA256=6919232eafbd0c4bbc9664d7f434b6a8d82133aa09f1400341ef6985ceff208a

TERMUX_PKG_DEPENDS="golang"

termux_step_make_install() {
    export GOPATH="$PWD/gopath"
    export GOPROXY="https://proxy.golang.org,direct"
    if [[ -f go.mod ]]; then
        go get ./... 2>/dev/null || true
        go build -v -o "$TERMUX_PREFIX/bin/gobuster" .
    else
        go mod init "gobuster" 2>/dev/null || true
        go get ./... 2>/dev/null || true
        go mod tidy 2>/dev/null || true
        go build -v -o "$TERMUX_PREFIX/bin/gobuster" . 2>/dev/null             || go build -v -o "$TERMUX_PREFIX/bin/gobuster" *.go
    fi
}
