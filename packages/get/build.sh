TERMUX_PKG_HOMEPAGE=https://github.com/peterpt/get
TERMUX_PKG_DESCRIPTION="Get is a simple script to retrieve an ip from hostname or vice-versa ."
TERMUX_PKG_LICENSE="UNKNOWN"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://github.com/peterpt/get/archive/refs/heads/master.tar.gz
TERMUX_PKG_SHA256=e028dcbe1ae7809db24e6bcfda4159847adcfcdf28b3eb166a3329533b27d34a

TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    local libdir="$TERMUX_PREFIX/lib/get"

    local _has_support=false
    for _dir in core lib modules plugins data assets resources config; do
        [[ -d "$_dir" ]] && _has_support=true && break
    done

    if [[ "$_has_support" == true ]]; then
        mkdir -p "$libdir"
        cp -r . "$libdir/"
        chmod 0755 "$libdir/get"

        mkdir -p "$TERMUX_PREFIX/bin"
        printf '#!/data/data/com.termux/files/usr/bin/bash\nexec bash "%s" "$@"\n'             "$libdir/get" > "$TERMUX_PREFIX/bin/get"
        chmod 0755 "$TERMUX_PREFIX/bin/get"
    else
        install -Dm755 "get" "$TERMUX_PREFIX/bin/get"
    fi
}
