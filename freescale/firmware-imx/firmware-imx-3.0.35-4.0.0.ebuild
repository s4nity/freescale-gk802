#
#
#

EAPI="5"

inherit eutils

DESCRIPTION="imx firmware"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://repository.timesys.com/buildsources/f/firmware-imx/firmware-imx-3.0.35-4.0.0/firmware-imx-3.0.35-4.0.0.tar.gz"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"
SLOT="0"
KEYWORDS="arm ~arm"

S=${WORKDIR}/${P}

src_install(){
	mkdir ${D}/lib
	mv firmware $D/lib
}





