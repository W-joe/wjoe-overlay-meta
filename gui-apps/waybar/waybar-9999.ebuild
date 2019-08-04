# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Highly customizable Wayland bar for Sway and Wlroots based compositors."
HOMEPAGE="https://github.com/Alexays/Waybar"
LICENSE="MIT"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Alexays/${PN}.git"
else
	SRC_URI="https://github.com/Alexays/Waybar/archive/${PV}.tar.gz -> ${P}.tar.gz"
	S=${WORKDIR}/Waybar-${PV}
fi

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
SLOT="0"
IUSE="+netlink pulseaudio +tray"

RDEPEND="sys-libs/libcap
	>=dev-libs/libfmt-5.3.0
	dev-libs/libinput
	dev-libs/wayland
	dev-cpp/gtkmm:3.0
	tray? ( dev-libs/libdbusmenu[gtk3]
		dev-libs/libappindicator )
	dev-libs/jsoncpp
	dev-libs/libsigc++
	netlink? ( dev-libs/libnl )
	pulseaudio? ( media-sound/pulseaudio )
	>=dev-libs/spdlog-1.3.1
"
DEPEND="${RDEPEND}
	dev-libs/wayland-protocols
"

src_configure() {
	local emesonargs=(
		-Dlibnl=$(usex netlink enabled disabled)
		-Dpulseaudio=$(usex pulseaudio enabled disabled)
		-Ddbusmenu-gtk=$(usex tray enabled disabled)
	)
	meson_src_configure
}

pkg_postinst() {
	elog "For a functional tray you must export XDG_CURRENT_DESKTOP=Unity"
}
