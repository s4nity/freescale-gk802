#
#
#

EAPI="5"

inherit eutils

DESCRIPTION="aacplus codec"
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://repository.timesys.com/buildsources/l/libfslaacpcodec/${P}/${P}.tar.gz"
RESTRICT="mirror"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"
SLOT="0"

KEYWORDS="arm ~arm"
DEPEND="freescale/libfslcodec"
#MERGE_TYPE="binary"

src_prepare(){
	epatch "${FILESDIR}"/fixlibrary.patch
}


