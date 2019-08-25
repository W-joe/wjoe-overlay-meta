# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit font

DESCRIPTION="2100+ free icons to spice up your creative designs."
HOMEPAGE="https://icofont.com/"
SRC_URI="https://icofont.com/process/download?type=1&uid=1566713212 -> ${P}.zip"

LICENSE="OFL MIT CC-BY-4.0"
SLOT="0"
KEYWORDS="amd64 arm ~arm64 x86"
IUSE=""

FONT_SUFFIX="ttf woff woff2"

