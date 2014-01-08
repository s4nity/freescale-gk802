#
#
#

EAPI="5"

inherit eutils

DESCRIPTION="fslvpuwrap library"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="/mnt/distfiles/fsl-alsa-plugins-1.0.25.tar.gz"
#SRC_URI="http://download.ossystems.com.br/bsp/freescale/source/fsl-alsa-plugins-1.0.25.tar.gz"

# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"
SLOT="0"

KEYWORDS="arm ~arm"

#MERGE_TYPE="binary"

#RESTRICT=""
DEPEND="freescale/imx-lib"
#RDEPEND=""
#S=${WORKDIR}


#src_install() {
#        emake DESTDIR="${D}" install || die
#}



