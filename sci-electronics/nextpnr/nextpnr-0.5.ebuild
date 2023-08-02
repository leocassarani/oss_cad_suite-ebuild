# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit python-any-r1

DESCRIPTION="Portable FPGA place and route tool"
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
SRC_URI="https://github.com/YosysHQ/nextpnr/archive/refs/tags/nextpnr-0.5.tar.gz"

S="${WORKDIR}/${PN}-${P}"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	>=dev-cpp/eigen-3
	dev-libs/boost
	sci-electronics/icestorm
	sci-electronics/prjtrellis"
DEPEND="${RDEPEND}"
BDEPEND="
	${PYTHON_DEPS}
	dev-util/cmake"

src_configure() {
	cmake \
		-DCURRENT_GIT_VERSION=nextpnr-0.5 \
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr" \
		-DARCH="ice40;ecp5" \
		-DICESTORM_INSTALL_PREFIX="${EPREFIX}/usr" \
		-DTRELLIS_INSTALL_PREFIX="${EPREFIX}/usr" \
		.
}
