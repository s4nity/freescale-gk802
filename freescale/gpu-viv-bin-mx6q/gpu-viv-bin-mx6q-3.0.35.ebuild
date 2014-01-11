#
#
#

EAPI="5"

inherit eutils


DESCRIPTION="Binary vivante gpu files"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
#SRC_URI="http://download.ossystems.com.br/bsp/freescale/source/gpu-viv-bin-mx6q-1.1.0.bin"
SRC_URI="http://repository.timesys.com/buildsources/g/gpu-viv-x11-bin-mx6q/gpu-viv-x11-bin-mx6q-3.0.35-4.0.0/gpu-viv-x11-bin-mx6q-3.0.35-4.0.0.tar.gz"
RESTRICT="mirror"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"

SLOT="0"

KEYWORDS="arm ~arm"

DEPEND="=freescale/firmware-imx-3.0.35
 	<dev-libs/DirectFB-1.6"
# for now	<x11-base/xorg-server-1.12

S=${WORKDIR}/gpu-viv-x11-bin-mx6q-3.0.35-4.0.0/hardfp
OPENGLDIR=usr/lib/opengl/vivante

src_compile(){
	rm -rf opt
	mkdir -p $OPENGLDIR/include $OPENGLDIR/lib $OPENGLDIR/extensions
	mv usr/include/CL $OPENGLDIR/include/
	mv usr/include/EGL $OPENGLDIR/include/
	mv usr/include/GL $OPENGLDIR/include/
	mv usr/include/GLES $OPENGLDIR/include/
	mv usr/include/GLES2 $OPENGLDIR/include/
	mv usr/include/HAL $OPENGLDIR/include/
	mv usr/include/KHR $OPENGLDIR/include/
	mv usr/include/VG $OPENGLDIR/include/
	mv usr/include/* $OPENGLDIR/include/

#	mv usr/lib/*  $OPENGLDIR/lib/  #doesnt make no sense -/-
#	mv usr/lib/libGL*  $OPENGLDIR/lib/
#	mv usr/lib/libOpenVG.so  $OPENGLDIR/lib/
	cd $OPENGLDIR/lib
# the following is just a temporary hack [<>]
	ln -sf libGL.so.1 libGL.so.1.2 
	ln -sf libGL.so libGL.so.1.2
#	cd ../extensions
#	ln -sf ../../xorg-x11/extensions/libglx.so  .	
#	cd ../../../
#	rm libOpenVG_3D.so

# Those were in the sample Makefile atop of 
#	ln -sf libOpenVG.so libOpenVG_3D.so
#        ln -sf libEGL.so libEGL.so.1

}

src_install(){
	mv * $D
}

pkg_postinst(){
	eselect opengl set xorg-x11   
}
