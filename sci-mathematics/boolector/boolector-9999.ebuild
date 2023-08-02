# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A Satisfiability Modulo Theories (SMT) solver"
HOMEPAGE="https://boolector.github.io"

EGIT_REPO_URI="https://github.com/Boolector/boolector.git"
EGIT_BRANCH="master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	sci-mathematics/btor2tools
	sci-mathematics/lingeling"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-util/cmake-3.3"

HEADERS="
	boolector.h
	btortypes.h"

src_configure() {
	rm -rf ./build || die
	mkdir -p build || die
	cd build || die
	cmake .. \
		-DBtor2Tools_INCLUDE_DIR=/usr/include \
		-DBtor2Tools_LIBRARIES=/usr/lib64/libbtor2parser.a \
		-DLingeling_INCLUDE_DIR=/usr/include \
		-DLingeling_LIBRARIES=/usr/lib64/liblgl.a || die
}

src_compile() {
	cd build || die
	emake
}

src_install() {
	dobin build/bin/boolector
	dobin build/bin/btorimc
	dobin build/bin/btormbt
	dobin build/bin/btormc
	dobin build/bin/btoruntrace
	dolib.a build/lib/libboolector.a

	# https://github.com/phlo/fmv-portage/blob/bfe4381f2534646c1a38b7320a2fa2fda8849aec/sci-mathematics/boolector/boolector-9999.ebuild
	INCLUDE="${S}/${PN}"
	mkdir -p "${INCLUDE}"
	for h in ${HEADERS}
	do
		[ ! -d "${INCLUDE}/$(dirname $h)" ] && mkdir -p "${INCLUDE}/$(dirname $h)"
		sed \
			-e "s,#include \"\(.\+\)\",#include <${PN}/\1>,g" \
			"${S}/src/${h}" > "${INCLUDE}/${h}"
	done
	doheader -r "${INCLUDE}"
}
