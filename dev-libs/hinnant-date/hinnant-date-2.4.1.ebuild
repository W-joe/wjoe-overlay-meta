# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A date and time library based on the C++11/14/17 <chrono> header"
HOMEPAGE="https://github.com/HowardHinnant/date"
LICENSE="MIT"

SRC_URI="https://github.com/HowardHinnant/date/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/date-${PV}"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="system-tzdb"

BDEPEND="
	virtual/pkgconfig
"

DEPEND="
	net-misc/curl
	system-tzdb? ( net-misc/curl )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=YES
		-DWITH_USE_SYSTEM_TZ_DB="$(usex system-tzdb)"
	)
	cmake_src_configure
}

