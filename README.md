# nginx-reverse-proxy installer
A nginx install shell for reverse-proxy base on Centos7 + Nginx 1.10.2 with many third party modules:

./configure \
--user=nginx \
--group=nginx \
--prefix=${NGINX_PATH} \
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
--add-module=${BUILD_SRC}ngx_cache_purge-2.3 \
--add-module=${BUILD_SRC}modsecurity-2.9.1/nginx/modsecurity/ \
--add-module=${BUILD_SRC}kyprizel-testcookie-nginx-module-b20b5fd




1.) prepare:

<pre>
wget --no-check-certificate -O - https://raw.githubusercontent.com/jun283/nginx-reverse-proxy/master/prepare.sh | sh
</pre>

2.) install:

<pre>
wget --no-check-certificate -O - https://raw.githubusercontent.com/jun283/nginx-reverse-proxy/master/install.sh | sh
</pre>


3.) Welcome to nginx!

<pre>
/toffs/nginx/sbin/nginx -V
</pre>

![alt tag](https://cloud.githubusercontent.com/assets/5975212/23941029/26a65f8a-09a2-11e7-822b-ad3529c621cc.png)
