#
#
#

EAPI="5"

inherit eutils


DESCRIPTION="Vivante xorg driver"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://download.ossystems.com.br/bsp/freescale/source/xserver-xorg-video-imx-viv-3.0.35-4.0.0.tar.gz"
DEPEND="freescale/gpu-viv-bin-mx6q"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"

SLOT="0"

KEYWORDS="arm ~arm"


#DEPEND="freescale/gpu-viv-bin-mx6q"

S=${WORKDIR}/${P}

src_configure(){
	einfo "Configuring source at `pwd`"
	cd DRI_1.10.4
	mkdir m4
	. ./viv-configure.sh
	sed -i src/drm.h  -e 's:<drm/:<libdrm/:g'
	cd ../EXA/
	mkdir m4
	sed -i viv-configure.sh  -e 's:-L${LDFLAGSVIV}: -L${LDFLAGSVIV} -I/usr/include/libdrm:g'
	. ./viv-configure.sh
}


src_compile(){
	einfo "compiling the source"
	cd DRI_1.10.4
	make
	cd ../EXA/
	make
}

src_install(){
	einfo "installing the driver.."
	mkdir -p $D/usr/lib/opengl/vivante/extensions
	mkdir -p $D/usr/lib/xorg/modules/drivers
	cp ./EXA/src/.libs/vivante_drv.so $D/usr/lib/xorg/modules/drivers
	cp ./DRI_1.10.4/src/.libs/libdri.so  ${D}/usr/lib/opengl/vivante/extensions
}

pkg_postinst(){
	eselect opengl set vivante
}

