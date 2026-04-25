TERMUX_PKG_HOMEPAGE=https://github.com/wireghoul/doona
TERMUX_PKG_DESCRIPTION="Network based protocol fuzzer"
TERMUX_PKG_LICENSE="UNKNOWN"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://github.com/wireghoul/doona/archive/refs/heads/master.tar.gz
TERMUX_PKG_SHA256=7802a60981a80a53a1598e61943b564ecc937c4550a713fc354d02e8cec924e8

TERMUX_PKG_DEPENDS="perl"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    local libdir="$TERMUX_PREFIX/lib/doona"
    mkdir -p "$libdir"

    cp -r . "$libdir/"

    if command -v cpanm >/dev/null 2>&1 || command -v cpan >/dev/null 2>&1; then
        echo "  Installing CPAN dependencies..."
        local _cpanm
        command -v cpanm &>/dev/null && _cpanm="cpanm --quiet" || _cpanm="cpan -T"
        local _mods="lib"
        for _mod in $_mods; do
            perl -e "require $_mod; 1" 2>/dev/null && continue
            echo "    + $_mod"
            $_cpanm "$_mod" 2>/dev/null || true
        done
    else
        echo "  TIP: Install cpanm for automatic CPAN dep install: pkg install perl-app-cpanminus"
    fi

    if [[ -f "$libdir/Makefile.PL" ]]; then
        cd "$libdir"
        perl Makefile.PL PREFIX="$TERMUX_PREFIX" 2>/dev/null && make && make install || true
    elif [[ -f "$libdir/Build.PL" ]]; then
        cd "$libdir"
        perl Build.PL --install_base="$TERMUX_PREFIX" 2>/dev/null &&             perl Build && perl Build install || true
    fi

    if [[ -f "$libdir/doona.pl" ]]; then
        chmod 0755 "$libdir/doona.pl"
        mkdir -p "$TERMUX_PREFIX/bin"
        cat > "$TERMUX_PREFIX/bin/doona" <<'WRAPPER'
#!/data/data/com.termux/files/usr/bin/bash
cd "/data/data/com.termux/files/usr/lib/doona" || exit 1
exec perl "/data/data/com.termux/files/usr/lib/doona/doona.pl" "$@"
WRAPPER
        chmod 0755 "$TERMUX_PREFIX/bin/doona"
    fi
}
