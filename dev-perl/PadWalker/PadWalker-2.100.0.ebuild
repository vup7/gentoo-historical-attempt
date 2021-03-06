# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/PadWalker/PadWalker-2.100.0.ebuild,v 1.1 2015/07/11 21:50:44 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=ROBIN
MODULE_VERSION=2.1
inherit perl-module

DESCRIPTION="play with other peoples' lexical variables"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc ~ppc64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""

DEPEND="virtual/perl-ExtUtils-MakeMaker"

SRC_TEST="do parallel"
