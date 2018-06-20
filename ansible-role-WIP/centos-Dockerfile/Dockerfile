# Latest version of centos 
FROM centos:centos7
MAINTAINER Sourav De 
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip
RUN mkdir /etc/ansible/
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
RUN yum install ansible -y
WORKDIR /usr/bin/
