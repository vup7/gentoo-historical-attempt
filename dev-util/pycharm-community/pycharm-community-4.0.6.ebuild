# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/pycharm-community/pycharm-community-4.0.6.ebuild,v 1.2 2015/06/01 12:52:12 xmw Exp $

EAPI=5

inherit eutils readme.gentoo

DESCRIPTION="Intelligent Python IDE with unique code assistance and analysis"
HOMEPAGE="http://www.jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/${P}.tar.gz"

LICENSE="Apache-2.0 BSD CDDL MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=virtual/jre-1.6"
DEPEND=""

RESTRICT="mirror strip"
QA_PREBUILT="/opt/${PN}/bin/fsnotifier
	/opt/${PN}/bin/fsnotifier64"

MY_PN=${PN/-community/}

src_install() {
	insinto /opt/${PN}
	doins -r *

	fperms a+x /opt/${PN}/bin/{pycharm.sh,fsnotifier{,64},inspect.sh}

	dosym /opt/${PN}/bin/pycharm.sh /usr/bin/${PN}
	newicon "bin/${MY_PN}.png" ${PN}.png
	make_desktop_entry ${PN} "${PN}" "${PN}"

	readme.gentoo_src_install
}
