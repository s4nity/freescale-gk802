#
#
#

EAPI="5"

inherit eutils


DESCRIPTION=""
HOMEPAGE="http://homepage_to_some_wiki_about_this_stuff"
SRC_URI="http://repository.timesys.com/buildsources/g/gst-fsl-plugin/gst-fsl-plugin-3.0.5/gst-fsl-plugins-3.0.5.tar.gz"
RESTRICT="mirror"
# need to get user to accept the license ? .. where does the license go?
LICENSE="freescale"

SLOT="0"

KEYWORDS="arm ~arm"

#MERGE_TYPE="binary"

#RESTRICT=""
DEPEND="=freescale/libfslvpuwrap-1.0.28
	=freescale/libfslaacpcodec-${PV}
	freescale/libfslcodec
	freescale/libfslparser"

src_prepare(){
	epatch "${FILESDIR}"/systypes_include.patch 
}


src_configure(){
	econf PLATFORM=MX6
}
