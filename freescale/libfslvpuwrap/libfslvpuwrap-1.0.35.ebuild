#
#
#

EAPI="5"

inherit eutils

DESCRIPTION="fslvpuwrap library"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://repository.timesys.com/buildsources/l/libfslvpuwrap/libfslvpuwrap-1.0.35/${P}.tar.gz"
RESTRICT="mirror"
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



