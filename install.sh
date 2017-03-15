#/bin/yum -y install  gcc gcc-c++ cmake  pcre pcre-devel  zlib zlib-devel  openssl openssl-devel  
#/bin/yum -y install kernel-devel gd gd-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glib2 glib2-devel bzip2 bzip2-devel libevent libevent-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel  gettext gettext-devel gmp-devel pspell-devel unzip   mail sysstat net-snmp net-snmp-utils libxslt mtr iotop  'libpcap*' 'bind-utils' 'dnsutils' 'libedit*' 'net-snmp-*' 'libtidy*' 'libxml*'  'libxsl*'  'icu*' 'libicu*' 'libcurl*' 'libtidy*'  'tracer*' bc ntp httpd-devel apr apr-util-devel apr-devel 'libtool*' autoconf xz-devel python-devel httpd  

sudo git clone https://github.com/jun283/nginx-reverse-proxy.git

cd nginx-reverse-proxy
sudo chmod u+x *.sh 

./download.sh
./2_init.sh
./3_build.sh

systemctl stop firewalld.service
systemctl disable firewalld.service
