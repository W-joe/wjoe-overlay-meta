# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Wofi is a launcher/menu program for wlroots based wayland compositors such as sway."
HOMEPAGE="https://hg.sr.ht/~scoopta/wofi"

SRC_URI="https://hg.sr.ht/~scoopta/wofi/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	dev-libs/wayland
	x11-libs/gtk+[wayland]
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	virtual/pkgconfig
"
S="${WORKDIR}/${PN}-v${PV}"
