#
#
#

EAPI="5"

inherit eutils


DESCRIPTION="Binary vivante gpu files"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
#SRC_URI="http://download.ossystems.com.br/bsp/freescale/source/gpu-viv-bin-mx6q-1.1.0.bin"
SRC_URI="http://repository.timesys.com/buildsources/g/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-1.1.0/gpu-viv-bin-mx6q-3.0.35-4.0.0-ts.tar.gz"

# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"

SLOT="0"

KEYWORDS="arm ~arm"

DEPEND="=freescale/firmware-imx-1.1.0
# for now	<x11-base/xorg-server-1.12
 	<dev-libs/DirectFB-1.6"

S=${WORKDIR}/${P}/hardfp
OPENGLDIR=usr/lib/opengl/vivante

src_compile(){
	rm -rf opt
	mkdir -p $OPENGLDIR/include $OPENGLDIR/lib $OPENGLDIR/extensions
	mv usr/include/CL $OPENGLDIR/include/
	mv usr/include/EGL $OPENGLDIR/include/
	mv usr/include/GL $OPENGLDIR/include/
	mv usr/include/GLES $OPENGLDIR/include/
	mv usr/include/GLES2 $OPENGLDIR/include/
	mv usr/lib/libEGL*  $OPENGLDIR/lib/
	mv usr/lib/libGL*  $OPENGLDIR/lib/
	mv usr/lib/libOpenVG.so  $OPENGLDIR/lib/
	cd $OPENGLDIR/lib
	ln -sf libGL.so.1.2 libGL.so.1
	ln -sf libGL.so.1.2 libGL.so
	cd ../extensions
	ln -sf ../../xorg-x11/extensions/libglx.so  .
	
	cd ../../../
	rm libOpenVG_3D.so
	ln -sf libOpenVG.so libOpenVG_3D.so
        ln -sf libEGL.so libEGL.so.1

}

src_install(){
	mv * $D
}

pkg_postinst(){
	eselect opengl set vivante
}
