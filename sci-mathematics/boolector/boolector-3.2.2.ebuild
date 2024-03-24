# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A Satisfiability Modulo Theories (SMT) solver"
HOMEPAGE="https://boolector.github.io"
SRC_URI="https://github.com/Boolector/boolector/archive/refs/tags/3.2.2.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	sci-mathematics/btor2tools
	sci-mathematics/lingeling"
RDEPEND="${DEPEND}"
BDEPEND="
	=dev-cpp/gtest-1.11.0
	>=dev-build/cmake-3.3 "

src_configure() {
	sed -i 's/1.10.0/1.11.0/g' cmake/FindGoogleTest.cmake

	rm -rf ./build || die
	mkdir -p build || die
	cd build || die
	cmake .. \
		-DBtor2Tools_INCLUDE_DIR=/usr/include \
		-DBtor2Tools_LIBRARIES=/usr/lib64/libbtor2parser.so \
		-DLingeling_INCLUDE_DIR=/usr/include \
		-DLingeling_LIBRARIES=/usr/lib64/liblgl.a || die
}

src_compile() {
	cd build || die
	emake
}
