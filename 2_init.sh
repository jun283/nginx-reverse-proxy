#!/bin/bash

#/usr/bin/yum -y install yum-utils cmake patch make gcc gcc-c++  flex bison file libtool libtool-libs autoconf kernel-devel libjpeg libjpeg-devel libpng libpng-devel libpng10 libpng10-devel gd gd-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glib2 glib2-devel bzip2 bzip2-devel libevent libevent-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel vim-minimal nano fonts-chinese gettext gettext-devel ncurses-devel gmp-devel pspell-devel unzip libjpeg-devel libpng-devel curl-devel mail wget curl git sysstat net-snmp net-snmp-utils libxslt mtr iotop  'pcre*' 'libpcap*' 'bind-utils' 'dnsutils' 'libedit*' 'net-snmp-*' 'libtidy*' 'libxml*' 'libpng*' 'libxsl*' 'openssl-*'  'icu*' 'libicu*' 'libcurl*' 'libtidy*'  'tracer*' bc ntp httpd-devel apr apr-util-devel apr-devel


. colors.sh

declare SCRIPT_PATH=$PWD/

declare -A ROOT=$(eval echo ~${SUDO_USER})/
declare NGINX_PATH="/toffs/nginx/"
declare owasp_modsecurity_crs_PATH="${NGINX_PATH}conf/owasp-modsecurity-crs/"
declare -A DOWNLOAD="${SCRIPT_PATH}download/"
declare -A BUILD="${ROOT}nginx-build/" 
declare -A BUILD_SRC="${ROOT}nginx-build/Source/" 

cd $BUILD_SRC
chmod 755 ./ -R
chown -R root.root ./

/sbin/ldconfig


show_blue_bg "build" "pcre-8.39"
cd ${BUILD_SRC}pcre-8.39
./configure --prefix=${BUILD}pcre  --enable-utf8  --enable-unicode-properties
sudo make
sudo make install
libtool --finish /usr/local/lib
/sbin/ldconfig -n /usr/local/lib

show_blue_bg "build" "zlib-1.2.11"
cd ${BUILD_SRC}zlib-1.2.11
./configure --static --prefix=${BUILD}zlib
sudo make
sudo make install
libtool --finish /usr/local/lib
/sbin/ldconfig -n /usr/local/lib

show_blue_bg "build" "apr"
cd ${BUILD_SRC}apr-1.5.2
./configure --prefix=${BUILD}apr --with-pcre=${BUILD}"pcre-8.39/bin/pcre-config"
make
sudo make install
libtool --finish /usr/local/lib
/sbin/ldconfig -n /usr/local/lib

show_blue_bg "build" "apr-util"
cd ${BUILD_SRC}apr-util-1.5.4
./configure --prefix=${BUILD}apr-util --with-apr=${BUILD}"apr/bin/apr-1-config"
make
sudo make install
libtool --finish /usr/local/lib
/sbin/ldconfig -n /usr/local/lib

show_blue_bg "build" "openssl-1.0.2j"
cd ${BUILD_SRC}openssl-1.0.2j
./config --prefix=${BUILD} shared zlib-dynamic enable-camellia     # from colby
make
sudo make install

show_blue_bg "build" "modsecurity-2.9.1"
#  --with-apxs=FILE        FILE is the path to apxs; defaults to "apxs".
#  --with-pcre=PATH        Path to pcre prefix or config script
#  --with-apr=PATH         Path to apr prefix or config script
#  --with-apu=PATH         Path to apu prefix or config script
#  --with-libxml=PATH      Path to libxml2 prefix or config script
#  --with-lua=PATH         Path to lua prefix or config script

cd ${BUILD_SRC}modsecurity-2.9.1
chmod u+x *.sh 
/sbin/ldconfig
./autogen.sh
#./configure --enable-standalone-module --disable-mlogc --prefix=${BUILD}pcre-8.39 --libdir=/usr/local/lib/pcre --includedir=/usr/local/include/pcre
#./configure --prefix=${BUILD}modsecurity --enable-standalone-module --disable-mlogc  --disable-apache2-module --with-pcre=${BUILD}pcre --with-apr=${BUILD}apr --with-apu=${BUILD}apr-util --with-apxs=no
./configure --prefix=${BUILD}modsecurity --enable-standalone-module --disable-mlogc  --disable-apache2-module --with-pcre=${BUILD}pcre --with-apr=${BUILD}apr --with-apu=${BUILD}apr-util --with-apxs=no
sudo make

