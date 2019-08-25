# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit font

DESCRIPTION="Linux Console Fonts from The ZAP Group"
HOMEPAGE="https://www.zap.org.au/software/fonts/console-fonts-zap/"
SRC_URI="https://www.zap.org.au/software/fonts/console-fonts-zap/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm ~arm64 x86"
IUSE=""

DOCS=( NEWS README )

FONT_SUFFIX="psf"
