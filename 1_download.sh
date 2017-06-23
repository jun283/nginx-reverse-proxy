#!/bin/bash

source ./colors.sh

chmod u+x *.sh 

declare SCRIPT_PATH=$PWD/
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
[ -d "$BUILD_SRC" ] || mkdir -p $BUILD_SRC
[ -d "$owasp_modsecurity_crs_PATH" ] || mkdir -p $owasp_modsecurity_crs_PATH

show_blue_bg "GIT" "git clone https://github.com/SpiderLabs/owasp-modsecurity-crs"
cd ${NGINX_PATH}conf
git clone https://github.com/SpiderLabs/owasp-modsecurity-crs

cd ${BUILD_SRC}
#Clone Nginx RTMP module source code from Github:
show_blue_bg "Download" "RTMP module"
git clone https://github.com/arut/nginx-rtmp-module

#local WORKDIR="${CACHE}"
cd ${DOWNLOAD}

show_blue_bg "Download" "GeoIP.tar.gz"
#wget -q --no-check-certificate http://geolite.maxmind.com/download/geoip/api/c/GeoIP.tar.gz
tar  -zxf GeoIP.tar.gz -C $BUILD_SRC

show_blue_bg "Download" "apr-1.5.2.tar.gz"
#wget -q --no-check-certificate http://www-us.apache.org/dist//apr/apr-1.5.2.tar.gz
tar  -zxf apr-1.5.2.tar.gz -C $BUILD_SRC

show_blue_bg "Download" "apr-util-1.5.4.tar.gz"
#wget -q --no-check-certificate http://www-us.apache.org/dist//apr/apr-util-1.5.4.tar.gz 
tar  -zxf apr-util-1.5.4.tar.gz -C $BUILD_SRC


show_blue_bg "Download" "nginx-upstream-fair"
#wget -q --no-check-certificate  https://github.com/gnosek/nginx-upstream-fair/tarball/master -O nginx-upstream-fair.tar.gz
tar  -zxf nginx-upstream-fair.tar.gz -C $BUILD_SRC
#unzip -q -o "nginx-upstream-fair.zip" -d $BUILD

show_blue_bg "Download" "ngx_cache_purge-2.3"
#wget -q --no-check-certificate http://labs.frickle.com/files/ngx_cache_purge-2.3.tar.gz
tar  -zxf ngx_cache_purge-2.3.tar.gz -C $BUILD_SRC

show_blue_bg "Download" "testcookie"
#wget -q --no-check-certificate  https://github.com/kyprizel/testcookie-nginx-module/tarball/master -O testcookie-v1.2.tar.gz
tar  -zxf testcookie-v1.2.tar.gz -C $BUILD_SRC

show_blue_bg "Download" "nginx-1.12.0.tar.gz"
#wget -q --no-check-certificate http://nginx.org/download/nginx-1.10.2.tar.gz  #--no-same-owner 
tar  -zxf nginx-1.12.0.tar.gz -C $BUILD_SRC

show_blue_bg "Download" "pcre-8.39"
#wget  --no-check-certificate ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.39.tar.gz
tar   -xzf pcre-8.39.tar.gz -C $BUILD_SRC

show_blue_bg "Download" "zlib-1.2.11"
#wget -q --no-check-certificate http://zlib.net/zlib-1.2.11.tar.gz
tar  -xzf zlib-1.2.11.tar.gz -C $BUILD_SRC

show_blue_bg "Download" "openssl-1.0.2j.tar.gz"
#wget -q --no-check-certificate http://www.openssl.org/source/openssl-1.0.2j.tar.gz
tar  -xzf openssl-1.0.2j.tar.gz -C $BUILD_SRC

show_blue_bg "Download" "modsecurity-2.9.1.tar.gz"
#wget -q --no-check-certificate https://www.modsecurity.org/tarball/2.9.1/modsecurity-2.9.1.tar.gz
tar  -xzf modsecurity-2.9.1.tar.gz -C $BUILD_SRC


show_blue_bg "VTS" "VTS Status modules"


