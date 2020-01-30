# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A date and time library based on the C++11/14/17 <chrono> header"
HOMEPAGE="https://github.com/HowardHinnant/date"
LICENSE="MIT"

SRC_URI="https://github.com/HowardHinnant/date/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN^}-${PV}"

SLOT="0"
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
	local emesonargs=(
		$(meson_feature system-tzdb use-system-tzdb)
	)
	meson_src_configure
}

