# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/enable/enable-4.4.1.ebuild,v 1.5 2015/04/18 12:57:55 swegener Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 virtualx flag-o-matic

DESCRIPTION="Enthought Tool Suite: Drawing and interaction packages"
HOMEPAGE="http://code.enthought.com/projects/enable/ http://pypi.python.org/pypi/enable"
SRC_URI="https://github.com/enthought/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="doc examples test"
DISTUTILS_IN_SOURCE_BUILD=1

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/reportlab[${PYTHON_USEDEP}]
	>=dev-python/traitsui-4[${PYTHON_USEDEP}]
	>=media-libs/freetype-2
	virtual/opengl
	virtual/glu
	x11-libs/libX11"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-lang/swig:0
	dev-python/cython[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		media-fonts/font-cursor-misc
		media-fonts/font-misc-misc
	)"

python_prepare_all() {
	append-cflags -fno-strict-aliasing

	sed -e 's:html_favicon = "et.ico":html_favicon = "_static/et.ico":' \
		-i docs/source/conf.py || die

	distutils-r1_python_prepare_all
}

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	pushd "${BUILD_DIR}"/lib > /dev/null
	# https://github.com/enthought/enable/issues/158
	PYTHONPATH=.:kiva \
		VIRTUALX_COMMAND="nosetests" virtualmake
	popd > /dev/null
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/build/html/. )

	use examples && local EXAMPLES=( examples/. )
	distutils-r1_python_install_all
}
