# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson

DESCRIPTION="A program for screen recording of wlroots-based compositors"
HOMEPAGE="https://github.com/ammen99/wf-recorder"
EGIT_REPO_URI="https://github.com/ammen99/wf-recorder.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

DEPEND="
		media-video/ffmpeg
		dev-libs/wayland
		"
RDEPEND="${DEPEND}"
BDEPEND="
		virtual/pkgconfig
		>=dev-libs/wayland-protocols-1.18
		"
