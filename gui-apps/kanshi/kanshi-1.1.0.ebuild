# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Dynamic display configuration."
HOMEPAGE="https://github.com/emersion/kanshi"

SRC_URI="https://github.com/emersion/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 arm64"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	dev-libs/wayland
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	virtual/pkgconfig
	app-text/scdoc
"
