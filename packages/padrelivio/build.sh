TERMUX_PKG_HOMEPAGE=https://github.com/enrilinux/padrelivio
TERMUX_PKG_DESCRIPTION="ASCII art of Padre Livio Fanzaga"
TERMUX_PKG_LICENSE="Public Domain"
TERMUX_PKG_MAINTAINER="@enrilinux"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://github.com/enrilinux/padrelivio/archive/refs/heads/main.tar.gz
TERMUX_PKG_SHA256=55b45fa1c7abbe6acc5ef5c62640ca845abd1055158fa578ca10c12208591469
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    install -Dm755 "./padrelivio" "$TERMUX_PREFIX/bin/padrelivio"
}
