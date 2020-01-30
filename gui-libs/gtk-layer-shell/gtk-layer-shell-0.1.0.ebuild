# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A library to create panels and other desktop components for Wayland using the Layer Shell protocol."
HOMEPAGE="https://github.com/wmww/gtk-layer-shell"
LICENSE="MIT"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wmww/${PN^}.git"
else
	SRC_URI="https://github.com/wmww/gtk-layer-shell/archive/v${PV}/${PN^}-${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN^}-${PV}"
fi

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
SLOT="0"
IUSE="doc examples"

BDEPEND="
	virtual/pkgconfig
"

DEPEND="
	x11-libs/gtk+:3
	dev-libs/wayland
"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_feature docs)
		$(meson_feature examples)
	)
	meson_src_configure
}

