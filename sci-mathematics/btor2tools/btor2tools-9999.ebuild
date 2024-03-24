# Copyright 2022 Leo Cassarani
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A generic parser and tool package for the BTOR2 format"
HOMEPAGE="https://github.com/boolector/btor2tools"

EGIT_REPO_URI="https://github.com/boolector/btor2tools.git"
EGIT_BRANCH="master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-build/cmake"

src_configure() {
	rm -rf ./build || die
	mkdir -p build || die
	cd build || die
	cmake .. -DCMAKE_SKIP_RPATH=ON -DBUILD_SHARED_LIBS=OFF || die
}

src_compile() {
	cd build || die
	emake
}

src_install() {
	dobin ./build/bin/btorsim
	dobin ./build/bin/btorsplit
	dobin ./build/bin/catbtor
	doheader ./src/btor2parser/btor2parser.h
	dolib.a ./build/lib/libbtor2parser.a
}
