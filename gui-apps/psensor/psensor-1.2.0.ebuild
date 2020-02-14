# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools gnome2-utils xdg-utils

DESCRIPTION="psensor is a graphical hardware temperature monitor for Linux."
HOMEPAGE="https://gitlab.com/jeanfi/psensor"
LICENSE="GPL-2"

SRC_URI="https://gitlab.com/jeanfi/psensor/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${PN}-v${PV}
PATCHES=(
	"${FILESDIR}"/${PN}-${PV}-configure.ac.patch
	"${FILESDIR}"/${PN}-${PV}-makefile.am.patch
)

KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
SLOT="0"
IUSE="appindicator +cpu doc +hddtemp nls nvidia remote server udisks X"
# cppcheck
BDEPEND="
	doc? ( app-text/asciidoc
			sys-apps/help2man )
	virtual/pkgconfig
	=sys-devel/automake-1.15*
"

DEPEND="
	sys-apps/lm-sensors:=
	gnome-base/dconf:=
	appindicator? ( dev-libs/libappindicator:= )
	cpu? ( >=gnome-base/libgtop-2.0:2 )
	hddtemp? ( dev-libs/libatasmart:= )
	nls? ( sys-devel/gettext )
	remote? ( >=dev-libs/json-c-0.11.99:=
				net-misc/curl:= )
	server? ( >=dev-libs/json-c-0.11.99:=
				net-libs/libmicrohttpd:= )
	udisks? ( sys-fs/udisks:2 )
	X? ( dev-libs/glib:2
			>=x11-libs/gtk+-3.4:3
			x11-libs/libnotify:=
			x11-libs/libX11:=
			x11-libs/libXext:=
			x11-libs/cairo:= )
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply "${FILESDIR}/${PN}-${PV}-configure.ac.patch"
	eapply "${FILESDIR}/${PN}-${PV}-makefile.am.patch"
	eapply_user

	einfo "Regenerating autotools files..."
	WANT_AUTOCONF=1.15.1 eautomake
	WANT_AUTOMAKE=1.15.1 eautomake
}

src_configure() {
	local econfargs=(
			$(use_with cpu gtop)
			$(use_enable nls)
			$(use_with remote)
			$(use_with X x)
	)
	econf "${econfargs[@]}" || die
}

pkg_preinst() {
	gnome2_schemas_savelist
	gnome2_icons_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	gnome2_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	gnome2_schemas_update
}

