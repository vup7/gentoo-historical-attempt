# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-leechcraft/lc-devmon/lc-devmon-0.6.70.ebuild,v 1.2 2015/04/02 17:56:18 mr_bones_ Exp $

EAPI="5"

inherit leechcraft

DESCRIPTION="Non-storage USB devices manager for LeechCraft"

SLOT="0"
KEYWORDS=" ~amd64 ~x86"
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	virtual/udev"
RDEPEND="${DEPEND}"
