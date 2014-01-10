#
# Could not force to build this against servers <1.14
# Read some compilation clues at the end.

EAPI="5"

inherit eutils


DESCRIPTION="Vivante xorg driver"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://download.ossystems.com.br/bsp/freescale/source/xserver-xorg-video-imx-viv-3.5.7-1.0.0.tar.gz"
DEPEND="=freescale/gpu-viv-bin-mx6q-3.10.9
	>=x11-base/xorg-server-1.14"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"
RESTRICT="mirror"
SLOT="0"

KEYWORDS="arm ~arm"


S=${WORKDIR}/xserver-xorg-video-imx-viv-3.5.7-1.0.0

src_configure(){
	einfo "Configuring source at `pwd`"
#	cd DRI_1.10.4
#	mkdir m4
#	. ./viv-configure.sh
#	sed -i src/drm.h  -e 's:<drm/:<libdrm/:g'
#	cd ../EXA/
#	mkdir m4
#	sed -i viv-configure.sh  -e 's:-L${LDFLAGSVIV}: -I/usr/include/libdrm:g'
#	. ./viv-configure.sh

	ln -s $Dusr/lib/opengl/vivante/include/HAL ./EXA/src/vivante_gal/
	ln -s $Dusr/include/libdrm/* ./EXA/src/vivante_extension/
	ln -s $Dusr/include/libdrm $Dusr/include/drm
	epatch ${FILESDIR}/dri.patch
	epatch ${FILESDIR}/exa.patch
	export BUILD_HARD_VFP=1 SWAP_SINGLE_PARAMETER=1 NEW_FBDEV_API=1 BUSID_HAS_NUMBER=1
}


src_compile(){
	
einfo "Compiling sources"
	make -C EXA/src/ -f makefile.linux $* || die
	make -C DRI_1.10.4/src/ -f makefile.linux $* || die

}

src_install(){
einfo "Installing the driver.."
einfo "WARNING!!! \nIf you get an ACCESS DENIED error, emerge -C the previous package before trying again!"

	mkdir -p $D/usr/lib/opengl/vivante/extensions
	mkdir -p $D/usr/lib/xorg/modules/drivers
	mkdir -p $D/usr/lib/xorg/modules/extensions
	
#	rm $Dusr/lib/xorg/modules/drivers/vivante_drv.so
#	rm $Dusr/lib/xorg/modules/extensions/libdri.so
#	rm $Dusr/lib/opengl/vivante/extensions/libdri.so

	cp ./EXA/src/vivante_drv.so   $D/usr/lib/xorg/modules/drivers/ 
	cp ./DRI_1.10.4/src/libdri.so $D/usr/lib/xorg/modules/extensions/
	cp ./DRI_1.10.4/src/libdri.so  $D/usr/lib/opengl/vivante/extensions/

}

pkg_postinst(){
	eselect opengl set vivante
}

# This Fastbuild's thingy info..
# options
# [NODRI=1] [SWAP_SINGLE_PARAMETER=1] [NEW_FBDEV_API=1] [BUSID_HAS_NUMBER=1] [clean] [install]
# examples:
# for clean, use "./fastbuild clean"
# for make, use "./fastbuild"
# for make non-dri version, use "./fastbuild NODRI=1"
# for install, use "sudo ./fastbuild.sh install". Default path: /usr.
#   To change to other place, use "prefix=<absolute dir>"
#
# for xorg-1.14, use "SWAP_SINGLE_PARAMETER=1 NEW_FBDEV_API=1"
# for kernel 3.5.7, use "BUSID_HAS_NUMBER=1"
