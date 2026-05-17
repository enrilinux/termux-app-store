TERMUX_PKG_HOMEPAGE=https://github.com/djunekz/merlin
TERMUX_PKG_DESCRIPTION="Analyst website vulnerabillity scanner"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.1.2
TERMUX_PKG_SRCURL=https://github.com/djunekz/merlin/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=aa406a27b7b7468d93dd645c82313d797680b6b14067e5ed87af437721689a07

TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    local libdir="$TERMUX_PREFIX/lib/merlin"

    local _has_support=false
    for _dir in core lib modules plugins data assets resources config; do
        [[ -d "$_dir" ]] && _has_support=true && break
    done

    if [[ "$_has_support" == true ]]; then
        mkdir -p "$libdir"
        cp -r . "$libdir/"
        chmod 0755 "$libdir/merlin.sh"

        mkdir -p "$TERMUX_PREFIX/bin"
        printf '#!/data/data/com.termux/files/usr/bin/bash\nexec bash "%s" "$@"\n'             "$libdir/merlin.sh" > "$TERMUX_PREFIX/bin/merlin"
        chmod 0755 "$TERMUX_PREFIX/bin/merlin"
    else
        install -Dm755 "merlin.sh" "$TERMUX_PREFIX/bin/merlin"
    fi
}
