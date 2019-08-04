# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Select a region in a Wayland compositor and print it to stdout. Works on Sway. Forked from https://github.com/emersion/slurp"
HOMEPAGE="https://github.com/W-joe/slurp"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/W-joe/${PN}.git"
else
	SRC_URI="https://github.com/W-joe/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 arm64 x86"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-libs/wayland
	x11-libs/cairo
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	virtual/pkgconfig
	app-text/scdoc
"

src_configure() {
	local emesonargs=(
		"-Dwerror=false"
	)
	meson_src_configure
}
