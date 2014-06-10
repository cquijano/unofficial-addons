################################################################################
################################################################################

PKG_NAME="deleter"
PKG_VERSION="0.2"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/cquijano/deleter"
PKG_URL="https://github.com/cquijano/deleter/archive/v0.2.tar.gz"
PKG_DEPENDS=""
PKG_BUILD_DEPENDS=""
PKG_PRIORITY="optional"
PKG_SECTION="service/system"
PKG_SHORTDESC="Automatic free size keeper"
PKG_LONGDESC="Automatic delete older files to keep free space on hard disk"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.service"

PKG_AUTORECONF="no"

unpack(){
        [ -d $BUILD/$PKG_NAME-$PKG_VERSION ] && rm -rf $BUILD/$PKG_NAME-$PKG_VERSION
        mkdir -p $BUILD/$PKG_NAME-$PKG_VERSION
        tar -xzf $SOURCES/$PKG_NAME/v$PKG_VERSION.tar.gz -C $BUILD
}

make_target() {
	make all 
}
makeinstall_target() {
	: # nop
}
addon() {
	mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
	cp $BUILD/$PKG_NAME-$PKG_VERSION/deleter $ADDON_BUILD/$PKG_ADDON_ID/bin
}
