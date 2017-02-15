#!/bin/bash

. colors.sh

declare SCRIPT_PATH=$PWD/

declare -A ROOT=$(eval echo ~${SUDO_USER})/
declare NGINX_PATH="/toffs/nginx/"
declare owasp_modsecurity_crs_PATH="${NGINX_PATH}conf/owasp-modsecurity-crs/"
declare -A DOWNLOAD="${SCRIPT_PATH}download/"
declare -A BUILD="${ROOT}nginx-build/" 
declare -A BUILD_SRC="${ROOT}nginx-build/Source/" 
declare NGINX_AUTOCONFIG=${NGINX_PATH}/conf/autoconfig/


[ -d "$NGINX_PATH" ] || mkdir -p $NGINX_PATH
[ -d "$ROOT" ] || mkdir -p $ROOT
[ -d "$DOWNLOAD" ] || mkdir -p $DOWNLOAD
[ -d "$BUILD" ] || mkdir -p $BUILD
[ -d "$BUILD_SRC" ] || mkdir -p $BUILD_SRC
[ -d "$owasp_modsecurity_crs_PATH" ] || mkdir -p $owasp_modsecurity_crs_PATH
[ -d "$NGINX_AUTOCONFIG" ] || mkdir -p $NGINX_AUTOCONFIG

chmod u+x *.sh 

#1_prepare.sh
#./3_builder.sh


#cp files
cp install_src/_c_default.conf  ${NGINX_PATH}conf
cp install_src/_c_proxy.conf ${NGINX_PATH}conf
cp install_src/modsecurity.conf ${NGINX_PATH}conf
cp install_src/unicode.mapping ${NGINX_PATH}conf


##create serve
#cp nginx.service /lib/systemd/system

##start nginx
#systemctl start nginx.service
##start ngiinx when OS start
#systemctl enable nginx.service
##check state
#systemctl status nginx.service
#systemctl stop nginx
##check config
#${NGINX_PATH}/nginx/sbin/nginx -t



