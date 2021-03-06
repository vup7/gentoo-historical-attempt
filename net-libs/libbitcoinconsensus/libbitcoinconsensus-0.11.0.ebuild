# Copyright 2010-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libbitcoinconsensus/libbitcoinconsensus-0.11.0.ebuild,v 1.1 2015/07/17 22:12:40 blueness Exp $

EAPI=5

BITCOINCORE_COMMITHASH="d26f951802c762de04fb68e1a112d611929920ba"
BITCOINCORE_LJR_DATE="20150711"
BITCOINCORE_IUSE="ljr test"
inherit bitcoincore eutils

DESCRIPTION="Bitcoin Core consensus library"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"

src_configure() {
	bitcoincore_conf \
		--with-libs
}

src_install() {
	bitcoincore_src_install
	dodoc doc/bips.md
	prune_libtool_files
}
