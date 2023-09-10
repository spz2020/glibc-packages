TERMUX_PKG_HOMEPAGE=https://sites.google.com/site/fullycapable/
TERMUX_PKG_DESCRIPTION="POSIX 1003.1e capabilities"
TERMUX_PKG_LICENSE="BSD 3-Clause, GPL-2.0"
TERMUX_PKG_LICENSE_FILE="License"
TERMUX_PKG_MAINTAINER="@termux-pacman"
TERMUX_PKG_VERSION=2.69
TERMUX_PKG_SRCURL=https://kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=f311f8f3dad84699d0566d1d6f7ec943a9298b28f714cae3c931dfd57492d7eb
TERMUX_PKG_DEPENDS="glibc, gcc-glibc-libs-dev"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	# At the moment we don't have pam-glibc
	make CC="$CC" PREFIX="$TERMUX_PREFIX" PAM_CAP=no
}

termux_step_make_install() {
	# At the moment we don't have pam-glibc
	make CC="$CC" prefix="$TERMUX_PREFIX" RAISE_SETFCAP=no lib=/lib install PAM_CAP=no
}
