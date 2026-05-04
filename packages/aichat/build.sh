TERMUX_PKG_HOMEPAGE=https://github.com/sigoden/aichat
TERMUX_PKG_DESCRIPTION="All-in-one LLM CLI tool featuring Shell Assistant, Chat-REPL, RAG, AI Tools & Agents, with access to OpenAI, Claude, Gemini, Ollama, Groq, and more."
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux-app-store"
TERMUX_PKG_VERSION=0.30.0
TERMUX_PKG_SRCURL=https://github.com/sigoden/aichat/archive/refs/tags/v0.30.0.tar.gz
TERMUX_PKG_SHA256=e194cc89afc213a6e3169738221cae641c347421c4f2aacd5d6f4f7cc6edb387

TERMUX_PKG_DEPENDS="rust"

termux_step_make_install() {
    cargo install --locked --path . --root "$TERMUX_PREFIX"
}
