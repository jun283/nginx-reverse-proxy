# nginx-reverse-proxy installer
A nginx install shell for reverse-proxy base on Centos7 + Nginx 1.10.2 with many third party modules:
geoip,openssl,ngx_cache_purge-2.3,modsecurity-2.9.1,kyprizel-testcookie-nginx-module,etc.


1.) prepare:

<pre>
wget --no-check-certificate -O - https://raw.githubusercontent.com/jun283/nginx-reverse-proxy/master/prepare.sh 
sudo sh prepare.sh 
</pre>

2.) install:

<pre>
wget --no-check-certificate -O - https://raw.githubusercontent.com/jun283/nginx-reverse-proxy/master/install.sh 
sudo sh install.sh
</pre>


3.) Welcome to nginx!

<pre>
/toffs/nginx/sbin/nginx -V
</pre>

![alt tag](https://cloud.githubusercontent.com/assets/5975212/23941029/26a65f8a-09a2-11e7-822b-ad3529c621cc.png)
