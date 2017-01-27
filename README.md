# nginx-reverse-proxy installer
A nginx install shell for reverse-proxy base on Centos7 + Nginx 1.10.2

1.) prepare:
<pre>
sed -i /etc/selinux/config -r -e 's/^SELINUX=.*/SELINUX=disabled/g'   
yum -y install epel-release   # Install EPEL repo
yum -y update && systemctl reboot   # Run all updates before starting, and apply new SELinux settings
</pre>

2.) prerequisites:

<pre>
yum install gc gcc gcc-c++ pcre-devel zlib-devel make wget openssl-devel libxml2-devel libxslt-devel gd-devel perl-ExtUtils-Embed GeoIP-devel gperftools gperftools-devel libatomic_ops-devel perl-ExtUtils-Embed wget git unzip
</pre>

<pre>
useradd nginx
usermod -s /sbin/nologin nginx
</pre>
