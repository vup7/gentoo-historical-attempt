# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libsixel/libsixel-1.4.13.ebuild,v 1.1 2015/07/20 14:09:06 hattya Exp $

EAPI="5"

inherit bash-completion-r1

DESCRIPTION="A lightweight, fast implementation of DEC SIXEL graphics codec"
HOMEPAGE="https://github.com/saitoha/libsixel"
SRC_URI="https://github.com/saitoha/libsixel/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT public-domain"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86"
IUSE="curl gd gtk jpeg png"

RDEPEND="curl? ( net-misc/curl )
	gd? ( media-libs/gd )
	gtk? ( x11-libs/gdk-pixbuf:2 )
	jpeg? ( virtual/jpeg:0 )
	png? ( media-libs/libpng:0 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	econf \
		--with-bashcompletiondir=$(get_bashcompdir) \
		$(use_with curl libcurl) \
		$(use_with gd) \
		$(use_with gtk gdk-pixbuf2) \
		$(use_with jpeg) \
		$(use_with png)
}

src_test() {
	emake test
}

src_install() {
	default

	docompress -x /usr/share/doc/${PF}/images
	dodoc -r images
}
