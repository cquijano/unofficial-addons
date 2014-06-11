################################################################################
################################################################################

PKG_NAME="Automatic"
PKG_VERSION="0.8.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://kylek.is-a-geek.org:31337/Automatic"
PKG_URL="https://github.com/1100101/Automatic/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS="pcre libxml2 curl"
PKG_BUILD_DEPENDS="toolchain pcre libxml2 curl"
PKG_PRIORITY="optional"
PKG_SECTION="service/downloadmanager"
PKG_SHORTDESC="Automatic torrent downloader"
PKG_LONGDESC="Automatic torrent downloader"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.service"

PKG_AUTORECONF="no"
unpack(){
        [ -d $BUILD/$PKG_NAME-$PKG_VERSION ] && rm -rf $BUILD/$PKG_NAME-$PKG_VERSION
        tar -xzf $SOURCES/$PKG_NAME/v$PKG_VERSION.tar.gz -C $BUILD
}

pre_configure_target() {
	./autogen.sh --host=$TARGET_NAME \
		--build=$HOST_NAME \
		--target=$TARGET_NAME

	export gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes 
	export ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes 
	./configure --host=$TARGET_NAME \
		--build=$HOST_NAME \
		--target=$TARGET_NAME 
}

make_target() {
  make
}

post_install() {
	mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
	pwd
	  cp $BUILD/$PKG_NAME-$PKG_VERSION/src/automatic $ADDON_BUILD/$PKG_ADDON_ID/bin
	mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/etc
	  cp $BUILD/$PKG_NAME-$PKG_VERSION/src/automatic.conf-sample $ADDON_BUILD/$PKG_ADDON_ID/etc/automatic.conf
        cp $BUILD/$PKG_NAME-$PKG_VERSION/src/automatic $INSTALL/bin
        cp $BUILD/$PKG_NAME-$PKG_VERSION/src/automatic.conf-sample $INSTALL/etc/automatic.conf
}
