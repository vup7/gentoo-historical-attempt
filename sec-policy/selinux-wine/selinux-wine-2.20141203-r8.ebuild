# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-wine/selinux-wine-2.20141203-r8.ebuild,v 1.1 2015/08/04 17:42:04 perfinion Exp $
EAPI="5"

IUSE=""
MODS="wine"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for wine"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi
