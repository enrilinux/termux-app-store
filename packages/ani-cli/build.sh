TERMUX_PKG_HOMEPAGE=https://github.com/pystardust/ani-cli
TERMUX_PKG_DESCRIPTION="A cli tool to browse and play anime"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=4.13
TERMUX_PKG_SRCURL=https://github.com/pystardust/ani-cli/releases/download/v${TERMUX_PKG_VERSION}/ani-cli
TERMUX_PKG_SHA256=17c8a97b034d3e48ba4663d538a5705adfbbffb951fa67650a57f7e4414959e2
TERMUX_PKG_DEPENDS="nodejs, aria2, ffmpeg, fzf, grep, sed, wget"

termux_step_make_install() {
    npm install -g --prefix "$TERMUX_PREFIX" "$TERMUX_PKG_SRCDIR"

    if [ ! -f "$TERMUX_PREFIX/bin/ani-cli" ]; then
        cd "$TERMUX_PKG_SRCDIR"
        npm install --production
        npm link
    fi
}
