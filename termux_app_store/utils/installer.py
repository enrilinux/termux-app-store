import subprocess
from pathlib import Path
from typing import Optional

from ..core.package import Package
import logging

logger = logging.getLogger(__name__)


async def install_from_binary(binary_path: Path, package: Package) -> bool:
    try:
        logger.info(f"Extracting binary: {binary_path.name}")

        cmd = ["tar", "-xJf", str(binary_path), "-C", "/"]

        result = subprocess.run(cmd, capture_output=True, text=True)

        if result.returncode == 0:
            logger.info(f"✅ Successfully installed {package.name} from binary cache")
            return True
        else:
            logger.error(f"Extraction failed:\n{result.stderr}")
            return False

    except FileNotFoundError:
        logger.error("tar command not found")
        return False
    except Exception as e:
        logger.error(f"Binary installation error: {e}")
        return False


async def install_from_source(package: Package) -> bool:
    logger.info(f"Building {package.name} from source...")

    build_sh = Path(__file__).parent.parent.parent / "build-package.sh"

    if not build_sh.exists():
        logger.error("build-package.sh not found!")
        return False

    try:
        result = subprocess.run([str(build_sh), package.name], cwd=build_sh.parent)
        return result.returncode == 0
    except Exception as e:
        logger.error(f"Source build failed: {e}")
        return False
