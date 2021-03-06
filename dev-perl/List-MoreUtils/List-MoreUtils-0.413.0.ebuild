# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/List-MoreUtils/List-MoreUtils-0.413.0.ebuild,v 1.1 2015/07/11 20:31:10 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=REHSACK
MODULE_VERSION=0.413
inherit perl-module

DESCRIPTION="Provide the missing functionality from List::Util"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~mips ~ppc64 ~s390 ~sh ~x86"
IUSE="test"

RDEPEND="
	>=dev-perl/Exporter-Tiny-0.38.0
	virtual/perl-XSLoader
"
DEPEND="${RDEPEND}
	virtual/perl-Carp
	virtual/perl-ExtUtils-MakeMaker
	virtual/perl-File-Path
	virtual/perl-File-Spec
	virtual/perl-IPC-Cmd
	test? ( >=virtual/perl-Test-Simple-0.960.0 )
"

SRC_TEST="do parallel"
