#
#
#

EAPI="5"

inherit eutils


DESCRIPTION=""
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://download.ossystems.com.br/bsp/freescale/source/gst-fsl-plugins-3.0.7.tar.gz"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"
RESTRICT="mirror"
SLOT="0"

KEYWORDS="arm ~arm"

#MERGE_TYPE="binary"

#RESTRICT=""
DEPEND="=freescale/libfslvpuwrap-1.0.28
	=freescale/libfslaacpcodec-3.0.5
	freescale/libfslcodec
	freescale/libfslparser"

src_prepare(){
	epatch "${FILESDIR}"/systypes_include.patch 
}


src_configure(){
	econf PLATFORM=MX6
}
