#!/bin/bash
#OS: Amazon-Linux
#Purpose:Automated deployment of Pritunl
#Owner:cloudelligent.com

rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

yum update -y

yum -y install docker-io

service docker start

chkconfig docker on


docker run --name pritunl --privileged -v ~/pritunl/mondodb:/var/lib/mongodb -v ~/pritunl/pritunl:/var/lib/pritunl -p 12323:1194/udp -p 12323:1194/tcp -p 80:80/tcp -p 443:443/tcp --restart unless-stopped -d jippi/pritunl

# Username & Password ---> Start
# Username: pritunl Password: pritunl


#END