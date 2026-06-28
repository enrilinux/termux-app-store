PKG_NAME="padrelivio"
PKG_VERSION="1.0.0"
PKG_REVISION="1"
PKG_DESCRIPTION="ASCII art di Padre Livio Fanzaga"
PKG_HOMEPAGE="https://github.com/enrilinux/padrelivio"
PKG_LICENSE="Public Domain"
PKG_MAINTAINER="enrilinux"
PKG_PLATFORM_INDEPENDENT=true
PKG_SRC_URL="https://raw.githubusercontent.com/enrilinux/padrelivio/main/padrelivio"
PKG_SHA256="$(curl -sL $PKG_SRC_URL | sha256sum | cut -d' ' -f1)"

build() {
      mkdir -p "$TERMUX_PREFIX/bin"
      cp "$TERMUX_PKG_BUILDER_DIR/padrelivio" "$TERMUX_PREFIX/bin/padrelivio"
      chmod +x "$TERMUX_PREFIX/bin/padrelivio"
}
