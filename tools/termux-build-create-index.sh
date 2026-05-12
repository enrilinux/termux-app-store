#!/usr/bin/env bash
# ================================================
# termux-build create-index
# Generate index.json from build.sh
# ================================================

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PACKAGES_DIR="$ROOT/packages"
TEMPLATE_DIR="$ROOT/template"

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
RESET="\033[0m"
BOLD="\033[1m"

print_usage() {
    echo -e "${BOLD}Usage:${RESET}"
    echo -e "  ${CYAN}./termux-build create-index <package-name>${RESET}"
    echo -e "  ${CYAN}./termux-build create-index all${RESET}"
    echo -e "  ${CYAN}./termux-build create-index <package-name> --binary${RESET}"
    echo ""
    echo -e "${YELLOW}Example:${RESET}"
    echo -e "  ./termux-build create-index aichat"
    echo -e "  ./termux-build create-index all"
}

if [[ $# -eq 0 ]]; then
    print_usage
    exit 1
fi

MODE="$1"
shift

USE_BINARY=false
while [[ $# -gt 0 ]]; do
    case "$1" in
        --binary|-b) USE_BINARY=true ;;
        *) echo -e "${RED}Unknown option: $1${RESET}"; print_usage; exit 1 ;;
    esac
    shift
done

generate_index() {
    local pkg_name="$1"
    local pkg_dir="$PACKAGES_DIR/$pkg_name"
    local build_sh="$pkg_dir/build.sh"
    local index_file="$pkg_dir/index.json"

    if [[ ! -f "$build_sh" ]]; then
        echo -e "${RED}✗ build.sh not found for '$pkg_name'${RESET}"
        return 1
    fi

    echo -e "${CYAN}Generating index.json for: ${RESET} ${BOLD}$pkg_name${RESET}"

    local version=$(grep -m1 "^TERMUX_PKG_VERSION=" "$build_sh" 2>/dev/null | cut -d'=' -f2 | tr -d '"')
    local description=$(grep -m1 "^TERMUX_PKG_DESCRIPTION=" "$build_sh" 2>/dev/null | cut -d'=' -f2 | tr -d '"')
    local maintainer=$(grep -m1 "^TERMUX_PKG_MAINTAINER=" "$build_sh" 2>/dev/null | cut -d'=' -f2 | tr -d '"')
    local homepage=$(grep -m1 "^TERMUX_PKG_HOMEPAGE=" "$build_sh" 2>/dev/null | cut -d'=' -f2 | tr -d '"')
    local license=$(grep -m1 "^TERMUX_PKG_LICENSE=" "$build_sh" 2>/dev/null | cut -d'=' -f2 | tr -d '"')

    [[ -z "$version" ]] && version="1.0.0"
    [[ -z "$description" ]] && description="A tool for Termux"
    [[ -z "$maintainer" ]] && maintainer="@unknown"
    [[ -z "$license" ]] && license="MIT"

    local srcurl=$(grep -m1 "^TERMUX_PKG_SRCURL=" "$build_sh" 2>/dev/null | cut -d'=' -f2- | tr -d '"')
    local sha256=$(grep -m1 "^TERMUX_PKG_SHA256=" "$build_sh" 2>/dev/null | cut -d'=' -f2 | tr -d '"')

    cat > "$index_file" << EOF
{
  "package": "$pkg_name",
  "version": "$version",
  "description": "$description",
  "maintainer": "$maintainer",
  "homepage": "$homepage",
  "license": "$license",
  "srcurl": "$srcurl",
  "sha256": "$sha256",
  "arch": ["aarch64", "arm"],

  "binary_support": $([[ "$USE_BINARY" == true ]] && echo "true" || echo "false"),
  "prebuilt": {
    "aarch64": {
      "sha256": "",
      "size": 0
    },
    "arm": {
      "sha256": "",
      "size": 0
    }
  },

  "source": {
    "url": "$srcurl",
    "sha256": "$sha256"
  },

  "dependencies": [],
  "category": "tools",
  "tags": ["termux", "cli"],
  "status": "stable"
}
EOF

    echo -e "${GREEN}✅ Created: ${RESET} $index_file"
}

if [[ "$MODE" == "all" ]]; then
    echo -e "${BOLD}Generating index.json for all packages...${RESET}"
    for dir in "$PACKAGES_DIR"/*/; do
        if [[ -d "$dir" && -f "$dir/build.sh" ]]; then
            pkg=$(basename "$dir")
            generate_index "$pkg"
        fi
    done
    echo -e "${GREEN}Done generating index.json for all packages.${RESET}"
else
    generate_index "$MODE"
fi
