#!/bin/bash

. colors.sh

chmod u+x *.sh 

#1_prepare.sh
#./3_builder.sh

#create serve
cp nginx.service /lib/systemd/system

#start nginx
systemctl start nginx.service
#start ngiinx when OS start
systemctl enable nginx.service
#check state
systemctl status nginx.service
#systemctl stop nginx

