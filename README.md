# nginx-reverse-proxy installer
A nginx install shell for reverse-proxy base on Centos7 + Nginx 1.10.2

1.) prepare:
<pre>
sed -i /etc/selinux/config -r -e 's/^SELINUX=.*/SELINUX=disabled/g'   
yum -y install epel-release   # Install EPEL repo
yum -y update && systemctl reboot   # Run all updates before starting, and apply new SELinux settings
</pre>

2.) install:

<pre>
wget https://raw.githubusercontent.com/jun283/nginx-reverse-proxy/master/install.sh
sh install.sh
</pre>
