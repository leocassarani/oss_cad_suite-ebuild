# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Verilator open-source SystemVerilog simulator and lint system"
HOMEPAGE="https://www.veripool.org/verilator/"
SRC_URI="https://github.com/verilator/verilator/archive/refs/tags/v5.020.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	dev-lang/perl
	sys-libs/zlib"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/autoconf
	sys-devel/bison
	sys-devel/flex"

src_prepare() {
	default
	eautoconf
}
