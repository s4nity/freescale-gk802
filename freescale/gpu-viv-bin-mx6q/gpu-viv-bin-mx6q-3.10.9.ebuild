#
#
#

EAPI="5"

inherit eutils


DESCRIPTION="Binary vivante gpu files"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
#SRC_URI="http://download.ossystems.com.br/bsp/freescale/source/gpu-viv-bin-mx6q-1.1.0.bin"
SRC_URI="http://repository.timesys.com/buildsources/g/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-3.10.9-1.0.0/${P}-1.0.0.tar.gz"
RESTRICT="mirror"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"

SLOT="0"

KEYWORDS="arm ~arm"

DEPEND=">freescale/firmware-imx-3.0.35
 	>=dev-libs/DirectFB-1.6"
# blah	>=x11-base/xorg-server-1.12"

S=${WORKDIR}/${P}-1.0.0/hardfp
OPENGLDIR=usr/lib/opengl/vivante

src_compile(){
	rm -rf opt
	mkdir -p $OPENGLDIR/include $OPENGLDIR/lib $OPENGLDIR/extensions
	mv usr/include/CL $OPENGLDIR/include/
	mv usr/include/EGL $OPENGLDIR/include/
	mv usr/include/GLES $OPENGLDIR/include/
	mv usr/include/GLES2 $OPENGLDIR/include/
	mv usr/include/HAL $OPENGLDIR/include/
	mv usr/include/KHR $OPENGLDIR/include/
	mv usr/include/VG $OPENGLDIR/include/
	mv usr/include/wayland-viv $OPENGLDIR/include/
	mv usr/include/* $OPENGLDIR/include/
	
	mv usr/lib/pkgconfig $OPENGLDIR/lib/
 	mv usr/lib/dri	$OPENGLDIR/lib/
	mv usr/lib/directfb-1.6.0 $OPENGLDIR/lib/
	mv usr/lib/*	$OPENGLDIR/lib/

#	rm usr/lib/libGLESv2.so.2
# 	rm usr/lib/libGLESv1_CM.so.1
# 	rm usr/lib/libGL.so
# 	rm usr/lib/libEGL.so
# 	rm usr/lib/libGLESv2.so
# 	rm usr/lib/libGLESv1_CM.so
# 	rm usr/lib/libEGL.so.1
# 	rm usr/lib/libGL.so.1

#        ln -sf libGL.so.1.2 $(DESTDIR)/usr/lib/libGL.so.1
#        ln -sf libGL.so.1.2 $(DESTDIR)/usr/lib/libGL.so
#        ln -sf libEGL.so.1.0 $(DESTDIR)/usr/lib/libEGL.so.1
#        ln -sf libEGL.so.1.0 $(DESTDIR)/usr/lib/libEGL.so
}
#pre_install(){	
#	mkdir -p $Dusr/lib/backup
# mv      $Dusr/lib/pkgconfig/glesv1_cm.pc $Dusr/lib/backup/
# mv      $Dusr/lib/pkgconfig/egl.pc $Dusr/lib/backup/
# mv      $Dusr/lib/pkgconfig/glesv2.pc $Dusr/lib/backup/
# mv      $Dusr/lib/libGLESv2.so.2 $Dusr/lib/backup/
# mv      $Dusr/lib/libGLESv1_CM.so.1 $Dusr/lib/backup/
# mv      $Dusr/lib/libGL.so $Dusr/lib/backup/
# mv      $Dusr/lib/libEGL.so $Dusr/lib/backup/
# mv      $Dusr/lib/libGLESv2.so $Dusr/lib/backup/
# mv      $Dusr/lib/libGLESv1_CM.so $Dusr/lib/backup/
# mv      $Dusr/lib/libEGL.so.1 $Dusr/lib/backup/
# mv      $Dusr/lib/libGL.so.1 $Dusr/lib/backup/
#}

src_install(){
	mv * $D
}

pkg_postinst(){
	eselect opengl set vivante
}
