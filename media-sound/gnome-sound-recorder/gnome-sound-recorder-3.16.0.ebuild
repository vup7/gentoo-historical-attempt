# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/gnome-sound-recorder/gnome-sound-recorder-3.16.0.ebuild,v 1.1 2015/06/09 16:35:31 eva Exp $

EAPI="5"
GCONF_DEBUG="no"

inherit gnome2

DESCRIPTION="Simple sound recorder"
HOMEPAGE="https://wiki.gnome.org/ThreePointEleven/Features/SoundRecorder"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# For the list of plugins, see src/audioProfile.js
COMMON_DEPEND="
	dev-libs/gjs
	dev-libs/glib:2
	x11-libs/gdk-pixbuf:2
	>=x11-libs/gtk+-3.12:3[introspection]
"
RDEPEND="${COMMON_DEPEND}
	media-libs/gstreamer:1.0[introspection]
	media-libs/gst-plugins-base:1.0[introspection]
"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.26
	virtual/pkgconfig
"
