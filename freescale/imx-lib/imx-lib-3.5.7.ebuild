#
#
#

EAPI="5"

inherit eutils

DESCRIPTION="imx library"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://repository.timesys.com/buildsources/i/imx-lib/imx-lib-3.5.7-1.0.0/imx-lib-3.5.7-1.0.0.tar.gz"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"
SLOT="0"
RESTRICT="mirror"
KEYWORDS="arm ~arm"

#MERGE_TYPE="binary"

S=${WORKDIR}/imx-lib-3.5.7-1.0.0


src_compile(){
	cp -av ${FILESDIR}/linux  linux
	cp -av ${FILESDIR}/linux  linux
	emake PLATFORM=MX6 INCLUDE=-I${FILESDIR}/headers pxp 
	emake PLATFORM=IMX6Q INCLUDE=-I${FILESDIR}/headers vpu
}


src_install(){
	mkdir -p ${D}/usr/include ${D}/usr/lib
	cd vpu
	cp vpu_lib.h ${D}/usr/include
	cp vpu_io.h  ${D}/usr/include
	cp -P libvpu.* ${D}/usr/lib

	cd ../pxp
	cp pxp_lib.h ${D}/usr/include
	cp -P libpxp.* ${D}/usr/lib

	cd ..
	cp ipu/ipu.h ipu/mxc_ipu_hl_lib.h ${D}/usr/include
	cp -pr ${FILESDIR}/headers/*  ${D}/usr/include/
}
