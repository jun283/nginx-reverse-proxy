#!/bin/bash
#https://github.com/gp187/nginx-builder
#https://github.com/agile6v/awesome-nginx

. colors.sh

declare -A ROOT=$(eval echo ~${SUDO_USER})/
declare NGINX_PATH="/toffs/nginx/"
declare owasp_modsecurity_crs_PATH="${NGINX_PATH}conf/owasp-modsecurity-crs/"
declare -A DOWNLOAD="${SCRIPT_PATH}download/"
declare -A BUILD="${ROOT}nginx-build/" 

#create nginx user
groupadd nginx
useradd -M -s /sbin/nologin -g nginx nginx

#[ -d "$ROOT" ] || mkdir -p $ROOT
#[ -d "$DOWNLOAD" ] || mkdir -p $DOWNLOAD
#[ -d "$BUILD" ] || mkdir -p $BUILD

/sbin/ldconfig

cd ${BUILD}nginx-1.10.2	

./configure \
--user=nginx \
--group=nginx \
--prefix=${NGINX_PATH} \
--http-proxy-temp-path=${NGINX_PATH}proxy_temp \
--http-client-body-temp-path=${NGINX_PATH}client_body_temp \
--with-pcre=${BUILD}pcre-8.39 \
--with-zlib=${BUILD}zlib-1.2.11 \
--with-http_ssl_module \
--with-openssl=${BUILD}openssl-1.0.2j \
--with-stream \
--with-mail=dynamic \
--with-poll_module \
--with-http_auth_request_module \
--with-http_image_filter_module \
--with-file-aio \
--with-ipv6 \
--with-http_realip_module \
--with-http_addition_module \
--with-http_xslt_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_gzip_static_module \
--with-http_gunzip_module \
--with-http_random_index_module \
--with-pcre-jit \
--with-http_stub_status_module \
--with-http_degradation_module \
--with-http_v2_module \
--with-http_perl_module
--add-module=${BUILD}modsecurity-2.9.1/nginx/modsecurity/ \
--add-module=${BUILD}testcookie-nginx-module-master 


#--pid-path=${NGINX_PATH}sbin/nginx.pid \
#--error-log-path=$DEFV_SoftProgram_PATH"nginx/logs/error.log" 
#--http-log-path=$DEFV_SoftProgram_PATH"nginx/logs/access.log" 
#--http-client-body-temp-path=$DEFV_SoftProgram_PATH"nginx/client_body_temp" 
#--http-proxy-temp-path=$DEFV_SoftProgram_PATH"nginx/temp/" 
#--http-fastcgi-temp-path=$DEFV_SoftProgram_PATH"nginx/fastcgi_temp" 
#--http-uwsgi-temp-path=$DEFV_SoftProgram_PATH"nginx/uwsgi_temp" 
#--http-scgi-temp-path=$DEFV_SoftProgram_PATH"nginx/uwsgi_temp" 
#--sbin-path=/usr/local/nginx/sbin/nginx \
#--conf-path=/usr/local/nginx/sbin/nginx/nginx.conf \
#--sbin-path=${NGINX_PATH}sbin/nginx \
#--conf-path=${NGINX_PATH}conf/nginx.conf
#>> ${BUILD}build.log
#--with-http_geoip_module \
#--add-module=/usr/build/nginx-rtmp-module \
#--add-dynamic-module=/usr/build/3party_module \

make
make install




