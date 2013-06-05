#
#
#

EAPI="5"

inherit eutils autotools

DESCRIPTION=""
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://repository.timesys.com/buildsources/w/wma10-decode/wma10-decode-1.0/wma10-decode-1.0.tar.gz"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"

SLOT="0"

KEYWORDS="arm ~arm"
S=${WORKDIR}/${P}

src_unpack(){
	default
	epatch ${FILESDIR}/${P}-build.patch
}

src_prepare(){
	./autogen.sh > /dev/null
}

src_install(){
	default
   	find "${D}" -name '*.la' -exec rm -f {} +
   	find "${D}" -name '*.a' -exec rm -f {} +
}
