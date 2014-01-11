#
#
#

EAPI="5"

inherit eutils


DESCRIPTION="Binary vivante gpu files"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://repository.timesys.com/buildsources/g/gpu-viv-bin-mx6q/gpu-viv-x11-bin-mx6q-1.1.0-ts/gpu-viv-x11-bin-mx6q-1.1.0-ts.tar.gz"
RESTRICT="mirror"
LICENSE="freescale"

SLOT="0"

KEYWORDS="arm ~arm"

DEPEND="freescale/firmware-imx
	<x11-base/xorg-server-1.12
 	<dev-libs/DirectFB-1.6"

S=${WORKDIR}/gpu-viv-x11-bin-mx6q-1.1.0-ts/hardfp
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
