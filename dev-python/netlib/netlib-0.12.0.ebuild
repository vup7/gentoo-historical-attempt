# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/netlib/netlib-0.12.0.ebuild,v 1.1 2015/06/01 04:04:58 patrick Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 versionator

DESCRIPTION="Collection of network utility classes used by pathod and mitmproxy"
HOMEPAGE="https://github.com/cortesi/netlib/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-python/pyasn1-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-0.14[${PYTHON_USEDEP}]
	>=dev-python/passlib-1.6.2[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		>=dev-python/mock-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/nose-1.3.0[${PYTHON_USEDEP}]
		=www-servers/pathod-$(get_version_component_range 1-2)*[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests -v || die "Tests fail with ${EPYTHON}"
}
