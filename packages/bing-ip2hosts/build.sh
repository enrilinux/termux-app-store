TERMUX_PKG_HOMEPAGE=https://github.com/urbanadventurer/bing-ip2hosts
TERMUX_PKG_DESCRIPTION="bingip2hosts is a Bing.com web scraper that discovers websites by IP address"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.0.5
TERMUX_PKG_SRCURL=https://github.com/urbanadventurer/bing-ip2hosts/archive/refs/tags/v1.0.5.tar.gz
TERMUX_PKG_SHA256=0a198af8d7876d7adb9c0517025bd6443d13399a188615a078cf3e45e120f19e

TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    local libdir="$TERMUX_PREFIX/lib/bing-ip2hosts"

    local _has_support=false
    for _dir in core lib modules plugins data assets resources config; do
        [[ -d "$_dir" ]] && _has_support=true && break
    done

    if [[ "$_has_support" == true ]]; then
        mkdir -p "$libdir"
        cp -r . "$libdir/"
        chmod 0755 "$libdir/bing-ip2hosts"

        mkdir -p "$TERMUX_PREFIX/bin"
        printf '#!/data/data/com.termux/files/usr/bin/bash\nexec bash "%s" "$@"\n'             "$libdir/bing-ip2hosts" > "$TERMUX_PREFIX/bin/bing-ip2hosts"
        chmod 0755 "$TERMUX_PREFIX/bin/bing-ip2hosts"
    else
        install -Dm755 "bing-ip2hosts" "$TERMUX_PREFIX/bin/bing-ip2hosts"
    fi
}
