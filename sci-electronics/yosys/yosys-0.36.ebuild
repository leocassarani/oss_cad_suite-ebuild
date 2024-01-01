# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Yosys Open SYnthesis Suite"
HOMEPAGE="https://yosyshq.net/yosys/"

ABC_GIT_COMMIT="896e5e7dedf9b9b1459fa019f1fa8aa8101fdf43"
SRC_URI="https://github.com/YosysHQ/yosys/archive/refs/tags/yosys-0.36.tar.gz
		https://github.com/YosysHQ/abc/archive/${ABC_GIT_COMMIT}.tar.gz -> abc-${ABC_GIT_COMMIT}.tar.gz"

S="${WORKDIR}/${PN}-${P}"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE="clang"

RDEPEND="
	dev-libs/libffi
	dev-lang/tcl
	sys-libs/readline
	sys-libs/zlib"
DEPEND="${RDEPEND}"
BDEPEND="
	sys-apps/gawk
	sys-devel/bison
	sys-devel/flex
	virtual/pkgconfig
	clang? ( sys-devel/clang )"

src_prepare() {
	default
	ln -s "${S}/../abc-${ABC_GIT_COMMIT}" "${S}/abc"
}

src_configure() {
	echo "CONFIG := $(usex clang clang gcc)" >> "${S}/Makefile.conf" || die
}

src_compile() {
	emake PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake PREFIX="${ED}/usr" STRIP=echo install
}
