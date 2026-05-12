TERMUX_PKG_HOMEPAGE=https://github.com/bower/bower
TERMUX_PKG_DESCRIPTION="A package manager for the web"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=1.8.12
TERMUX_PKG_SRCURL=https://api.github.com/repos/bower/bower/tarball/v${TERMUX_PKG_VERSION}
TERMUX_PKG_SHA256=d54d92c4a12c674e79ed38742bd82b797098c24e67391c963555cf4a23855e01
TERMUX_PKG_DEPENDS="nodejs"

termux_step_make_install() {
    local src="${TERMUX_PKG_SRCDIR:-$PWD}"
    local dest="$TERMUX_PREFIX/lib/node_modules/bower"

    cd "$src"
    npm install --production --no-optional 2>&1 || {
        echo "npm install failed — trying with legacy-peer-deps"
        npm install --production --legacy-peer-deps 2>&1 || true
    }

    npm install q --save 2>&1 || true

    rm -rf "$dest"
    mkdir -p "$dest"
    cp -r "$src/." "$dest/"

    mkdir -p "$TERMUX_PREFIX/bin"
    cat > "$TERMUX_PREFIX/bin/bower" <<'EOF'
#!/data/data/com.termux/files/usr/bin/node
require('/data/data/com.termux/files/usr/lib/node_modules/bower/lib/bin/bower');
EOF
    chmod +x "$TERMUX_PREFIX/bin/bower"
}
