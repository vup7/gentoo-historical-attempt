# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-vcs/vcsh/vcsh-1.20150502.ebuild,v 1.1 2015/05/10 10:21:40 tamiko Exp $

EAPI=5

DESCRIPTION='Manage config files in $HOME via fake bare git repositories'
HOMEPAGE="https://github.com/RichiH/vcsh/"
SRC_URI="http://github.com/RichiH/vcsh/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( GPL-3 GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-vcs/git"
DEPEND=""

DOCS=( changelog README.md CONTRIBUTORS )

src_prepare() {
	default
	sed -i \
		-e 's,vendor-completions,site-functions,' \
		-e "s,\(\$(DOCDIR_PREFIX)\)/\$(self),\1/${PF}," \
		Makefile || die "sed failed"

	# remove dysfunctional tests
	sed -i -e 's,install: all,install:,' \
		Makefile || die "sed failed"
}

src_compile() {
	:
}

src_install() {
	default
	dodoc -r doc/sample_hooks
}
