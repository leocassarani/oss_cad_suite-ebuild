# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Lingeling SAT Solver"
HOMEPAGE="http://fmv.jku.at/lingeling/"

EGIT_REPO_URI="https://github.com/arminbiere/lingeling.git"
EGIT_BRANCH="master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	./configure.sh || die
}

src_install() {
	dobin lingeling
	dobin plingeling
	dobin treengeling
	dobin ilingeling
	doheader lglib.h
	dolib.a liblgl.a
}
