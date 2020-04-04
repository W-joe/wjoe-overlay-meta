# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3

DESCRIPTION="A date and time library based on the C++11/14/17 <chrono> header"
HOMEPAGE="https://github.com/HowardHinnant/date"
LICENSE="MIT"

EGIT_REPO_URI="https://github.com/HowardHinnant/date.git"
EGIT_COMMIT="9a0ee2542848ab8625984fc8cdbfb9b5414c0082"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

BDEPEND="
	virtual/pkgconfig
"

DEPEND="
	net-misc/curl
"
RDEPEND="${DEPEND}"

src_prepare()
{
	eapply "${FILESDIR}/pkg-config.patch"
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		"-DBUILD_SHARED_LIBS=TRUE"
		"-DBUILD_TZ_LIB=TRUE"
		"-DUSE_SYSTEM_TZ_DB=TRUE"
	)
	cmake-utils_src_configure
}

