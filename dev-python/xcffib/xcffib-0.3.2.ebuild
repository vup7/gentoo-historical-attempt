# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/xcffib/xcffib-0.3.2.ebuild,v 1.1 2015/06/15 17:43:37 jlec Exp $

EAPI="5"

PYTHON_COMPAT=( python2_7 python3_{3,4} pypy )

inherit distutils-r1

DESCRIPTION="A drop in replacement for xpyb, an XCB python binding"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="http://github.com/tych0/xcffib"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

COMMON_DEPEND="x11-libs/libxcb"

RDEPEND="
	>=dev-python/cffi-0.1.1:=[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	${COMMON_DEPEND}"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${COMMON_DEPEND}
	test? ( dev-python/nose[${PYTHON_USEDEP}] )"

python_test() {
	nosetests -d -v || die
}
