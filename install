#!/bin/bash

. colors.sh

chmod u+x *.sh 

declare SCRIPT_PATH=$PWD/
declare -A ROOT=$(eval echo ~${SUDO_USER})"/nginx-build/" #/opt
declare NGINX_PATH="/toffs/nginx/"
declare owasp_modsecurity_crs_PATH="${NGINX_PATH}conf/owasp-modsecurity-crs/"
declare -A DOWNLOAD="${ROOT}download/"
declare -A BUILD="${SCRIPT_PATH}build/" 

[ -d "$NGINX_PATH" ] || mkdir -p $NGINX_PATH
[ -d "$ROOT" ] || mkdir -p $ROOT
[ -d "$DOWNLOAD" ] || mkdir -p $DOWNLOAD
[ -d "$BUILD" ] || mkdir -p $BUILD
[ -d "$owasp_modsecurity_crs_PATH" ] || mkdir -p $owasp_modsecurity_crs_PATH

#1_prepare.sh
./3_builder.sh

#create serve
#cp nginx.service /lib/systemd/system

#start nginx
#systemctl start nginx.service
#start ngiinx when OS start
#systemctl enable nginx.service
#check state
#systemctl status nginx.service
#systemctl stop nginx
