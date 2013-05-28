#
#
#

EAPI="5"

inherit eutils

DESCRIPTION="imx library"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://download.ossystems.com.br/bsp/freescale/source/${P}.tar.gz"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"
SLOT="0"

KEYWORDS="arm ~arm"

#MERGE_TYPE="binary"

S=${WORKDIR}/${P}


#src_install() {
#        emake DESTDIR="${D}" install || die
#}

src_compile(){
	emake PLATFORM=MX6 INCLUDE="-I/usr/src/linux/include" pxp
	emake PLATFORM=IMX6Q INCLUDE="-I/usr/src/linux/include" vpu
}


src_install(){
	mkdir -p ${D}/usr/include ${D}/usr/include/linux ${D}/usr/lib
	cd vpu
	cp vpu_lib.h ${D}/usr/include
	cp vpu_io.h  ${D}/usr/include
	cp -P libvpu.* ${D}/usr/lib

	cd ../pxp
	cp pxp_lib.h ${D}/usr/include
	cp -P libpxp.* ${D}/usr/lib

	cd ..
	cp ipu/ipu.h ipu/mxc_ipu_hl_lib.h ${D}/usr/include
	cp ${FILESDIR}/headers/* ${D}/usr/include/linux/
}
