#
#
#

EAPI="5"

inherit eutils


DESCRIPTION=""
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://repository.timesys.com/buildsources/l/libfslcodec/libfslcodec-3.0.7/${P}.tar.gz"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"
RESTRICT="mirror"
SLOT="0"

KEYWORDS="arm ~arm"

src_prepare(){
	epatch ${FILESDIR}/fix_library_path.patch
}
