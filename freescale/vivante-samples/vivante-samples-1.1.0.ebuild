#
#
#

EAPI="5"

inherit eutils


DESCRIPTION="Binary vivante examples"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://repository.timesys.com/buildsources/g//gpu-viv-x11-bin-mx6q-1.1.0-ts/gpu-viv-x11-bin-mx6q-1.1.0-ts.tar.gz"

LICENSE="freescale"

SLOT="0"

KEYWORDS="arm ~arm"

S=${WORKDIR}/gpu-viv-x11-bin-mx6q-1.1.0-ts/hardfp

src_compile(){
	rm -rf usr
}

src_install(){
	mv * $D
}

