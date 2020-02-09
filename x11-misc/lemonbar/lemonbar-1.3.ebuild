# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A featherweight, lemon-scented, bar based on XCB."
HOMEPAGE="https://github.com/LemonBoy/bar"
LICENSE="MIT"

SRC_URI="https://github.com/LemonBoy/bar/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/bar-${PV}

KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
SLOT="0"
IUSE="doc"

BDEPEND="
	virtual/pkgconfig
"

DEPEND="
	x11-libs/libxcb:=
"
RDEPEND="${DEPEND}"

