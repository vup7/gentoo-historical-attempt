# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-puzzle/quadrapassel/quadrapassel-3.16.1.ebuild,v 1.1 2015/06/09 16:01:28 eva Exp $

EAPI="5"
GCONF_DEBUG="no"
VALA_MIN_API_VERSION="0.24"

inherit gnome-games vala

DESCRIPTION="Fit falling blocks together"
HOMEPAGE="https://wiki.gnome.org/Apps/Quadrapassel"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	>=gnome-base/librsvg-2.32.0:2
	>=media-libs/clutter-1:1.0
	>=media-libs/clutter-gtk-0.91.6:1.0
	>=media-libs/libcanberra-0.26[gtk3]
	>=x11-libs/gtk+-3.12:3
"
DEPEND="${RDEPEND}
	$(vala_depend)
	app-text/yelp-tools
	dev-libs/appstream-glib
	>=dev-util/intltool-0.50
	sys-devel/gettext
	virtual/pkgconfig
"

src_prepare() {
	gnome-games_src_prepare
	vala_src_prepare
}
