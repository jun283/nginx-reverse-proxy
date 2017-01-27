#!/bin/bash

#/usr/bin/yum -y install yum-utils cmake patch make gcc gcc-c++  flex bison file libtool libtool-libs autoconf kernel-devel libjpeg libjpeg-devel libpng libpng-devel libpng10 libpng10-devel gd gd-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glib2 glib2-devel bzip2 bzip2-devel libevent libevent-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel vim-minimal nano fonts-chinese gettext gettext-devel ncurses-devel gmp-devel pspell-devel unzip libjpeg-devel libpng-devel curl-devel mail wget curl git sysstat net-snmp net-snmp-utils libxslt mtr iotop  'pcre*' 'libpcap*' 'bind-utils' 'dnsutils' 'libedit*' 'net-snmp-*' 'libtidy*' 'libxml*' 'libpng*' 'libxsl*' 'openssl-*'  'icu*' 'libicu*' 'libcurl*' 'libtidy*'  'tracer*' bc ntp httpd-devel apr apr-util-devel apr-devel


. colors.sh

declare SCRIPT_PATH=$PWD/

declare -A ROOT=$(eval echo ~${SUDO_USER})/
declare NGINX_PATH="/toffs/nginx/"
declare owasp_modsecurity_crs_PATH="${NGINX_PATH}conf/owasp-modsecurity-crs/"
declare -A DOWNLOAD="${SCRIPT_PATH}download/"
declare -A BUILD="${ROOT}nginx-build/" 

/sbin/ldconfig

show_blue_bg "build" "pcre-8.39"
cd ${DOWNLOAD}pcre-8.39
./configure --prefix=${BUILD}pcre  --enable-utf8  --enable-unicode-properties
sudo make
sudo make install
libtool --finish /usr/local/lib
/sbin/ldconfig -n /usr/local/lib

show_blue_bg "build" "zlib-1.2.11"
cd ${DOWNLOAD}zlib-1.2.11
./configure --static --prefix=${BUILD}zlib
sudo make
sudo make install
libtool --finish /usr/local/lib
/sbin/ldconfig -n /usr/local/lib

show_blue_bg "build" "apr"
cd ${DOWNLOAD}apr-1.5.2
./configure --prefix=${BUILD}apr --with-pcre=${BUILD}"pcre-8.39/bin/pcre-config"
make
sudo make install
libtool --finish /usr/local/lib
/sbin/ldconfig -n /usr/local/lib

show_blue_bg "build" "apr-util"
cd ${DOWNLOAD}apr-util-1.5.4
./configure --prefix=${BUILD}apr-util --with-apr=${BUILD}"apr/bin/apr-1-config"
make
sudo make install
libtool --finish /usr/local/lib
/sbin/ldconfig -n /usr/local/lib

show_blue_bg "build" "openssl-1.0.2j"
cd ${DOWNLOAD}openssl-1.0.2j
./config shared zlib-dynamic enable-camellia  # from colby
sudo make
sudo make install

show_blue_bg "build" "modsecurity-2.9.1"
cd ${DOWNLOAD}modsecurity-2.9.1
chmod u+x *.sh 
/sbin/ldconfig
./autogen.sh
#./configure --enable-standalone-module --disable-mlogc --prefix=${BUILD}pcre-8.39 --libdir=/usr/local/lib/pcre --includedir=/usr/local/include/pcre
./configure --prefix=${BUILD}modsecurity --enable-standalone-module --disable-mlogc --includedir=/usr/local/include/apr-1 --disable-apache2-module
sudo make

