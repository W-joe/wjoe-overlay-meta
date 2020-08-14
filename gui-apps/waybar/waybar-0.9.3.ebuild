# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Highly customizable Wayland bar for Sway and Wlroots based compositors."
HOMEPAGE="https://github.com/Alexays/Waybar"
LICENSE="MIT"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Alexays/${PN^}.git"
else
	SRC_URI="https://github.com/Alexays/Waybar/archive/${PV}.tar.gz -> ${P}.tar.gz"
	S=${WORKDIR}/${PN^}-${PV}
fi

KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
SLOT="0"
IUSE="doc +gtklayershell mpd +netlink pulseaudio systemd +tray +udev"

BDEPEND="
	>=app-text/scdoc-1.9.2
	virtual/pkgconfig
"

DEPEND="
	dev-cpp/gtkmm:3.0
	dev-libs/jsoncpp:=
	>=dev-libs/libfmt-5.3.0:=
	dev-libs/libinput:=
	dev-libs/libdbusmenu:=
	dev-libs/libsigc++:2
	>=dev-libs/spdlog-1.3.1:=
	dev-libs/hinnant-date
	dev-libs/wayland
	dev-libs/wayland-protocols
	gui-libs/wlroots
	gtklayershell? ( >=gui-libs/gtk-layer-shell-0.1.0:= )
	mpd? ( media-libs/libmpdclient )
	netlink? ( dev-libs/libnl:3 )
	pulseaudio? ( media-sound/pulseaudio )
	systemd? ( sys-apps/systemd )
	tray? ( dev-libs/libdbusmenu[gtk3]
		dev-libs/libappindicator )
	udev? ( virtual/libudev:= )
"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_feature doc man-pages)
		$(meson_feature gtklayershell gtk-layer-shell)
		$(meson_feature mpd)
		$(meson_feature netlink libnl)
		$(meson_feature pulseaudio)
		$(meson_feature systemd)
		$(meson_feature tray dbusmenu-gtk)
		$(meson_feature udev libudev)
	)
	meson_src_configure
}

pkg_postinst() {
	elog "For a functional tray you must export XDG_CURRENT_DESKTOP=Unity"
}
