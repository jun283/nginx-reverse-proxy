#!/bin/bash

#stop firewall
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service
sudo sed -i /etc/selinux/config -r -e 's/^SELINUX=.*/SELINUX=disabled/g' 

yum -y install epel-release   
yum -y install  gcc gcc-c++ cmake  pcre pcre-devel  zlib zlib-devel  openssl openssl-devel  
yum -y install kernel-devel gd gd-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glib2 glib2-devel bzip2 bzip2-devel libevent libevent-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel  gettext gettext-devel gmp-devel pspell-devel unzip   mail sysstat net-snmp net-snmp-utils libxslt mtr iotop  'libpcap*' 'bind-utils' 'dnsutils' 'libedit*' 'net-snmp-*' 'libtidy*' 'libxml*'  'libxsl*'  'icu*' 'libicu*' 'libcurl*' 'libtidy*'  'tracer*' bc ntp httpd-devel apr apr-util-devel apr-devel 'libtool*' autoconf xz-devel python-devel httpd nano net-tools git 
yum -y update 
systemctl reboot   
