# Copyright 2022 Leo Cassarani
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="SymbiYosys (sby) - Front-end for Yosys-based formal verification flows"
HOMEPAGE="https://yosyshq.readthedocs.io/projects/sby/en/latest/"

EGIT_REPO_URI="https://github.com/YosysHQ/sby.git"
EGIT_BRANCH="master"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-python/click"
DEPEND="${RDEPEND}"
BDEPEND=""

src_compile() {
	true # Do nothing
}

src_install() {
	emake PREFIX="${ED}/usr" install
}
