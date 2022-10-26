# Copyright 2022 Leo Cassarani
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Documenting the Lattice ECP5 bit-stream format"
HOMEPAGE="https://github.com/YosysHQ/prjtrellis"

EGIT_REPO_URI="https://github.com/YosysHQ/prjtrellis.git"
EGIT_BRANCH="master"

S="${WORKDIR}/${P}/libtrellis"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-libs/boost"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-util/cmake
	dev-vcs/git"

src_configure() {
	cmake -DCURRENT_GIT_VERSION=1.2.1 -DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr" .
}
