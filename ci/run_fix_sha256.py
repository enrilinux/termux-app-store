#!/usr/bin/env python3
"""
ci/fix_sha256.py
Auto-fix TERMUX_PKG_SHA256 in packages/*/build.sh
when validate-build.sh reports a mismatch.

Example:
Usage:
  python ci/run_fix_sha256.py                  # scan all packages
  python ci/run_fix_sha256.py neovim aichat    # scan specific packages
"""

import hashlib
import os
import re
import subprocess
import sys
import tempfile
import urllib.request
import urllib.error
from pathlib import Path

PACKAGES_DIR = Path("packages")

R      = "\033[0m"
B      = "\033[1m"
DIM    = "\033[2m"
GREEN  = "\033[92m"
YELLOW = "\033[93m"
CYAN   = "\033[96m"
RED    = "\033[91m"

def ok(msg):    print(f"  {GREEN}✓{R}  {msg}")
def info(msg):  print(f"  {CYAN}→{R}  {msg}")
def warn(msg):  print(f"  {YELLOW}!{R}  {msg}")
def err(msg):   print(f"  {RED}✗{R}  {msg}")
def header(msg):print(f"\n{CYAN}{B}{'─'*50}{R}\n{B}{msg}{R}")


def parse_var(build_sh: Path, var: str) -> str:
    pattern = re.compile(rf'^{var}=(.+)$', re.MULTILINE)
    content = build_sh.read_text(encoding="utf-8")
    m = pattern.search(content)
    if not m:
        return ""
    val = m.group(1).strip().strip('"').strip("'")
    return val


def resolve_srcurl(build_sh: Path) -> str:
    content = build_sh.read_text(encoding="utf-8")

    version = parse_var(build_sh, "TERMUX_PKG_VERSION")
    srcurl_raw = parse_var(build_sh, "TERMUX_PKG_SRCURL")

    if not srcurl_raw:
        return ""

    url = srcurl_raw
    url = url.replace("${TERMUX_PKG_VERSION}", version)
    url = url.replace("$TERMUX_PKG_VERSION", version)

    return url


def compute_sha256(url: str) -> tuple[str, int]:
    info(f"Downloading: {DIM}{url}{R}")
    try:
        req = urllib.request.Request(
            url,
            headers={"User-Agent": "termux-app-store-ci/1.0"},
        )
        with urllib.request.urlopen(req, timeout=120) as resp:
            h = hashlib.sha256()
            size = 0
            with tempfile.NamedTemporaryFile(delete=False) as tmp:
                while True:
                    chunk = resp.read(65536)
                    if not chunk:
                        break
                    h.update(chunk)
                    tmp.write(chunk)
                    size += len(chunk)
            return h.hexdigest(), size

    except urllib.error.HTTPError as e:
        raise RuntimeError(f"HTTP {e.code}: {url}")
    except urllib.error.URLError as e:
        raise RuntimeError(f"URL error: {e.reason}")
    except Exception as e:
        raise RuntimeError(str(e))


def update_sha256_in_build_sh(build_sh: Path, new_sha256: str) -> bool:
    content = build_sh.read_text(encoding="utf-8")
    pattern = re.compile(r'^(TERMUX_PKG_SHA256=)(.+)$', re.MULTILINE)

    m = pattern.search(content)
    if not m:
        err(f"TERMUX_PKG_SHA256 not found in {build_sh}")
        return False

    old_sha = m.group(2).strip().strip('"').strip("'")
    if old_sha == new_sha256:
        ok(f"SHA256 already up-to-date: {new_sha256[:16]}...")
        return False

    original_line = m.group(0)
    if '"' in original_line:
        new_line = f'TERMUX_PKG_SHA256="{new_sha256}"'
    elif "'" in original_line:
        new_line = f"TERMUX_PKG_SHA256='{new_sha256}'"
    else:
        new_line = f"TERMUX_PKG_SHA256={new_sha256}"

    new_content = pattern.sub(new_line, content, count=1)
    build_sh.write_text(new_content, encoding="utf-8")

    info(f"Updated SHA256:")
    print(f"    {DIM}Old: {old_sha}{R}")
    print(f"    {GREEN}New: {new_sha256}{R}")
    return True


def check_sha256_mismatch(build_sh: Path) -> tuple[bool, str, str]:
    try:
        result = subprocess.run(
            ["bash", "tools/validate-build.sh", str(build_sh)],
            capture_output=True,
            text=True,
            timeout=120,
        )
        output = result.stdout + result.stderr

        if result.returncode == 0:
            return False, "", ""

        expected_match = re.search(r'Expected:\s*([a-f0-9]{64})', output)
        got_match      = re.search(r'Got\s*:\s*([a-f0-9]{64})', output)

        if expected_match and got_match:
            expected = expected_match.group(1)
            actual   = got_match.group(1)
            return True, expected, actual

        if "SHA256 mismatch" in output or "mismatch" in output.lower():
            return True, "", ""

        return False, "", ""

    except subprocess.TimeoutExpired:
        warn("validate-build.sh timed out")
        return False, "", ""
    except FileNotFoundError:
        warn("tools/validate-build.sh not found — skipping mismatch check")
        return False, "", ""


def process_package(pkg_name: str) -> str:
    build_sh = PACKAGES_DIR / pkg_name / "build.sh"

    if not build_sh.exists():
        err(f"build.sh not found: {build_sh}")
        return "no_sh"

    srcurl = resolve_srcurl(build_sh)
    declared_sha = parse_var(build_sh, "TERMUX_PKG_SHA256")
    version      = parse_var(build_sh, "TERMUX_PKG_VERSION")

    if not srcurl:
        warn(f"{pkg_name}: no TERMUX_PKG_SRCURL — skipping")
        return "skipped"

    if not declared_sha:
        warn(f"{pkg_name}: no TERMUX_PKG_SHA256 declared — skipping")
        return "skipped"

    if srcurl.lower().endswith(".deb"):
        info(f"{pkg_name}: pre-built .deb source — skip SHA256 auto-fix")
        return "skipped"

    info(f"Checking {B}{pkg_name}{R} v{version}")
    info(f"URL: {DIM}{srcurl}{R}")
    info(f"Declared SHA256: {DIM}{declared_sha[:32]}...{R}")

    try:
        actual_sha, file_size = compute_sha256(srcurl)
    except RuntimeError as e:
        err(f"{pkg_name}: download failed — {e}")
        return "error"

    if actual_sha == declared_sha:
        ok(f"{pkg_name}: SHA256 OK ({file_size:,} bytes)")
        return "ok"

    warn(f"{pkg_name}: SHA256 mismatch!")
    print(f"    {DIM}Declared: {declared_sha}{R}")
    print(f"    {YELLOW}Actual  : {actual_sha}{R}")
    print(f"    {DIM}Size    : {file_size:,} bytes{R}")

    updated = update_sha256_in_build_sh(build_sh, actual_sha)
    if updated:
        ok(f"{pkg_name}: build.sh updated with correct SHA256")
        return "fixed"
    return "ok"


def git_commit_and_push(fixed_packages: list[str]) -> None:
    if not fixed_packages:
        return

    files_to_add = [
        f"packages/{pkg}/build.sh" for pkg in fixed_packages
    ]

    print(f"\n{CYAN}{B}Committing fixes...{R}")

    try:
        subprocess.run(
            ["git", "config", "user.email", "258516621+termux-app-store@users.noreply.github.com"],
            check=True, capture_output=True,
        )
        subprocess.run(
            ["git", "config", "user.name", "Termux App Store"],
            check=True, capture_output=True,
        )

        subprocess.run(["git", "add"] + files_to_add, check=True)

        staged = subprocess.run(
            ["git", "diff", "--staged", "--name-only"],
            capture_output=True, text=True,
        )
        if not staged.stdout.strip():
            info("Nothing to commit (files unchanged after update)")
            return

        pkg_list = ", ".join(fixed_packages)
        commit_msg = f"fix(sha256): auto-update SHA256 for {pkg_list} [skip ci]"
        subprocess.run(["git", "commit", "-m", commit_msg], check=True)

        branch = os.environ.get("GITHUB_REF_NAME", "master")
        subprocess.run(["git", "push", "origin", branch], check=True)

        ok(f"Pushed: {commit_msg}")

    except subprocess.CalledProcessError as e:
        err(f"Git operation failed: {e}")


def main():
    if len(sys.argv) > 1:
        pkg_names = sys.argv[1:]
    else:
        if not PACKAGES_DIR.is_dir():
            err(f"packages/ directory not found")
            sys.exit(1)
        pkg_names = sorted(
            d for d in os.listdir(PACKAGES_DIR)
            if (PACKAGES_DIR / d).is_dir()
        )

    print(f"\n{CYAN}{B}SHA256 Auto-Fix{R}")
    print(f"{DIM}Checking {len(pkg_names)} package(s)...{R}\n")

    results = {
        "ok":      [],
        "fixed":   [],
        "skipped": [],
        "error":   [],
        "no_sh":   [],
    }

    for pkg in pkg_names:
        header(f"Package: {pkg}")
        status = process_package(pkg)
        results[status].append(pkg)

    print(f"\n{CYAN}{B}{'═'*25}{R}")
    print(f"{CYAN}{B}Summary{R}")
    print(f"{'─'*25}")
    print(f"  {GREEN}✓  OK      : {len(results['ok'])}{R}")
    print(f"  {GREEN}✓  Fixed   : {len(results['fixed'])}{R}")
    if results["fixed"]:
        for p in results["fixed"]:
            print(f"      {DIM}• {p}{R}")
    print(f"  {DIM}○  Skipped : {len(results['skipped'])}{R}")
    print(f"  {RED}✗  Error   : {len(results['error'])}{R}")
    if results["error"]:
        for p in results["error"]:
            print(f"      {DIM}• {p}{R}")

    if results["fixed"]:
        git_commit_and_push(results["fixed"])

    if results["error"]:
        print(f"\n{RED}Some packages had download errors — check URLs{R}\n")
        sys.exit(1)

    print(f"\n{GREEN}{B}Done!{R}\n")
    sys.exit(0)


if __name__ == "__main__":
    main()
