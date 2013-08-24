#!/bin/sh

VERSION=$1
BUILD_DIR="/usr/local/src/php5-build"
INSTALL_DIR="/opt/php5.5"
TAR_FILE=php-$VERSION.tar.gz
CURRENT_USER=`id -u $USER`
CURRENT_GROUP=`id -g $USER`

if [ ! -d "$INSTALL_DIR" ]; then
	`sudo mkdir -p $INSTALL_DIR`
fi
`sudo chown $CURRENT_USER:$CURRENT_GROUP $INSTALL_DIR`

if [ ! -d "$BUILD_DIR" ]; then
	`sudo mkdir $BUILD_DIR`
fi
`sudo chown $CURRENT_USER:$CURRENT_GROUP $BUILD_DIR`

if [ ! -d "$BUILD_DIR/php-$VERSION" ];then
	if [ ! -f "/tmp/$TAR_FILE" ];then
		`(cd /tmp && wget http://ch1.php.net/distributions/$TAR_FILE)`
	fi
 	`tar zxf /tmp/$TAR_FILE -C $BUILD_DIR`
 fi

`( cd $BUILD_DIR/php-$VERSION && ./configure \
--prefix=$INSTALL_DIR \
--with-zlib-dir \
--with-freetype-dir \
--enable-cgi \
--enable-mbstring \
--with-libxml-dir=/usr \
--enable-soap \
--enable-calendar \
--with-curl \
--with-mcrypt \
--with-zlib \
--with-gd \
--disable-rpath \
--enable-inline-optimization \
--with-bz2 \
--with-zlib \
--enable-sockets \
--enable-sysvsem \
--enable-sysvshm \
--enable-pcntl \
--enable-mbregex \
--with-mhash \
--enable-zip \
--with-pcre-regex \
--with-mysql \
--with-pdo-mysql \
--with-mysqli \
--with-jpeg-dir=/usr \
--with-png-dir=/usr \
--enable-gd-native-ttf \
--with-openssl \
--with-libdir=lib64 \
--with-libxml-dir=/usr \
--enable-exif \
--enable-dba \
--with-gettext \
--enable-shmop \
--enable-sysvmsg \
--enable-wddx \
--with-kerberos \
--enable-bcmath \
--enable-ftp \
--enable-intl \
--with-pspell && make && sudo checkinstall --pkgname="php5.5" -y -D make install) > /dev/null`
