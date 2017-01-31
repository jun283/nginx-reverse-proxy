#!/bin/bash

#/usr/bin/yum -y install yum-utils cmake patch make gcc gcc-c++  flex bison file libtool libtool-libs autoconf kernel-devel gd gd-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glib2 glib2-devel bzip2 bzip2-devel libevent libevent-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel  gettext gettext-devel gmp-devel pspell-devel unzip   mail sysstat net-snmp net-snmp-utils libxslt mtr iotop  'libpcap*' 'bind-utils' 'dnsutils' 'libedit*' 'net-snmp-*' 'libtidy*' 'libxml*'  'libxsl*'  'icu*' 'libicu*' 'libcurl*' 'libtidy*'  'tracer*' bc ntp httpd-devel apr apr-util-devel apr-devel

#/bin/yum -y install  gcc gcc-c++ cmake  pcre pcre-devel  zlib zlib-devel  openssl openssl-devel  
#/bin/yum -y install kernel-devel gd gd-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glib2 glib2-devel bzip2 bzip2-devel libevent libevent-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel  gettext gettext-devel gmp-devel pspell-devel unzip   mail sysstat net-snmp net-snmp-utils libxslt mtr iotop  'libpcap*' 'bind-utils' 'dnsutils' 'libedit*' 'net-snmp-*' 'libtidy*' 'libxml*'  'libxsl*'  'icu*' 'libicu*' 'libcurl*' 'libtidy*'  'tracer*' bc ntp httpd-devel apr apr-util-devel apr-devel 'libtool*' autoconf xz-devel python-devel httpd  



chmod u+x *.sh 

declare -A ROOT=$(eval echo ~${SUDO_USER})/
declare NGINX_PATH="/toffs/nginx/"
declare owasp_modsecurity_crs_PATH="${NGINX_PATH}conf/owasp-modsecurity-crs/"
declare -A DOWNLOAD="${SCRIPT_PATH}download/"
declare -A BUILD="${ROOT}nginx-build/" 
declare -A BUILD_SRC="${ROOT}nginx-build/Source/" 

[ -d "$NGINX_PATH" ] || mkdir -p $NGINX_PATH
[ -d "$ROOT" ] || mkdir -p $ROOT
[ -d "$DOWNLOAD" ] || mkdir -p $DOWNLOAD
[ -d "$BUILD" ] || mkdir -p $BUILD
[ -d "$owasp_modsecurity_crs_PATH" ] || mkdir -p $owasp_modsecurity_crs_PATH
