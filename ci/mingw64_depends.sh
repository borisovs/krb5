#!/bin/sh -e

SELF_BIN="$(realpath $0)"
SELF_DIR="$(dirname ${SELF_BIN})"

PACKAGE_RUN_DEPENDS="
        $MINGW_PACKAGE_PREFIX-openssl
        $MINGW_PACKAGE_PREFIX-toolchain
        $MINGW_PACKAGE_PREFIX-autotools 
        $MINGW_PACKAGE_PREFIX-cmake
        $MINGW_PACKAGE_PREFIX-make
	"

PACMAN_BIN=$(which pacman)
PACMAN_INSTALL="${PACMAN_BIN} -S --noconfirm"
${PACMAN_INSTALL} ${PACKAGE_RUN_DEPENDS}
