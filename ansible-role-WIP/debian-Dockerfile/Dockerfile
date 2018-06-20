# Latest version of centos 
FROM debian
MAINTAINER Sourav De 
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install ansible -y --allow-unauthenticated
WORKDIR /usr/bin/
