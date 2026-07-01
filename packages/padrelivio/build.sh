TERMUX_PKG_HOMEPAGE=https://github.com/enrilinux/padrelivio
TERMUX_PKG_DESCRIPTION="ASCII art of Padre Livio Fanzaga"
TERMUX_PKG_LICENSE="Public Domain"
TERMUX_PKG_MAINTAINER="@enrilinux"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://github.com/enrilinux/padrelivio/archive/refs/tags/v1.0.0.tar.gz
TERMUX_PKG_SHA256=bb24ca52056bf8ee66b0b696d948647c19dc9c20d37e9e36fe915b254540bf10
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
<<<<<<< HEAD
    install -Dm755 "padrelivio" "$PREFIX/bin/padrelivio"
=======
    install -Dm755 "padrelivio" "$TERMUX_PREFIX/bin/padrelivio"
>>>>>>> d0aa9fa (fix(padrelivio): use tagged release v1.0.0 for stable SHA256)
}
