TERMUX_PKG_HOMEPAGE=https://github.com/Smaash/fuckshitup
TERMUX_PKG_DESCRIPTION="php-cli vulnerability scanner"
TERMUX_PKG_LICENSE="UNKNOWN"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://github.com/Smaash/fuckshitup/archive/refs/heads/master.tar.gz
TERMUX_PKG_SHA256=d9ea301d0a1c823b793a5d5d141991d04c825f5030069946dfbd29be3e050054

TERMUX_PKG_DEPENDS="php"

termux_step_make_install() {
    mkdir -p "$TERMUX_PREFIX/lib/fuckshitup"
    cp -r . "$TERMUX_PREFIX/lib/fuckshitup/"
    cat > "$TERMUX_PREFIX/bin/fuckshitup" <<'WRAPPER'
#!/usr/bin/env bash
exec php "/data/data/com.termux/files/usr/lib/fuckshitup/fsu.php" "php fuckshitup fsu.php php    3"
WRAPPER
    chmod 0755 "$TERMUX_PREFIX/bin/fuckshitup"
}
