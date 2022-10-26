# Copyright 2022 Leo Cassarani
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Verilator open-source SystemVerilog simulator and lint system"
HOMEPAGE="https://www.veripool.org/verilator/"
SRC_URI="https://github.com/verilator/verilator/archive/refs/tags/v4.228.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	dev-lang/perl
	sys-libs/zlib"
RDEPEND="${DEPEND}"
BDEPEND="
	sys-devel/autoconf
	sys-devel/bison
	sys-devel/flex"

src_prepare() {
	default
	eautoconf
}
