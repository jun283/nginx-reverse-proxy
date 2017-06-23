#!/bin/bash
#https://github.com/gp187/nginx-builder
#https://github.com/agile6v/awesome-nginx

source ./colors.sh

declare SCRIPT_PATH=$PWD/

declare -A ROOT=$(eval echo ~${SUDO_USER})/
declare NGINX_PATH="/toffs/nginx/"
declare owasp_modsecurity_crs_PATH="${NGINX_PATH}conf/owasp-modsecurity-crs/"
declare -A DOWNLOAD="${SCRIPT_PATH}download/"
declare -A BUILD="${ROOT}nginx-build/" 
declare -A BUILD_SRC="${ROOT}nginx-build/Source/" 

#create nginx user
groupadd nginx
useradd -M -s /sbin/nologin -g nginx nginx

#[ -d "$ROOT" ] || mkdir -p $ROOT
#[ -d "$DOWNLOAD" ] || mkdir -p $DOWNLOAD
#[ -d "$BUILD" ] || mkdir -p $BUILD

/sbin/ldconfig

cd ${BUILD_SRC}nginx-1.12.0	

./configure \
--user=nginx \
--group=nginx \
--prefix=/toffs/nginx \
--http-proxy-temp-path=${NGINX_PATH}proxy_temp \
--http-client-body-temp-path=${NGINX_PATH}client_body_temp \
--with-pcre=${BUILD_SRC}pcre-8.39 \
--with-zlib=${BUILD_SRC}zlib-1.2.11 \
--with-http_ssl_module \
--with-openssl=${BUILD_SRC}openssl-1.0.2j \
--with-stream \
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
--with-http_geoip_module \
--with-http_auth_request_module \
--with-http_secure_link_module \
--add-module=${BUILD_SRC}ngx_cache_purge-2.3 \
--add-module=${BUILD_SRC}modsecurity-2.9.1/nginx/modsecurity/ \
--add-module=${BUILD_SRC}kyprizel-testcookie-nginx-module-b20b5fd \
--add-module=${BUILD_SRC}nginx-module-vts \
--add-module=${BUILD_SRC}nginx-rtmp-module 


#--add-module=/path/to/nginx_tcp_proxy_module --with-http_ssl_module


make
make install

mkdir -p /toffs/nginx/logs
chmod 777 /toffs/nginx/logs -R

mkdir -p /toffs/nginx/proxy_cache
chmod 777 /toffs/nginx/proxy_cache -R

#create serve
cd ${SCRIPT_PATH}
cp nginx.service /lib/systemd/system

#start nginx
systemctl start nginx.service
#start ngiinx when OS start
systemctl enable nginx.service
#check state
systemctl status nginx.service

/toffs/nginx/sbin/nginx -V




