# Copyright 2022 Leo Cassarani
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Lattice iCE40 FPGAs Bitstream Documentation"
HOMEPAGE="http://bygone.clairexen.net/icestorm/"

EGIT_REPO_URI="https://github.com/YosysHQ/icestorm.git"
EGIT_BRANCH="master"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-embedded/libftdi"
DEPEND="${RDEPEND}"
BDEPEND=""

src_compile() {
	emake PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake PREFIX="${ED}/usr" install
}
