FROM centos:latest
#F ROM ansible/centos7-ansible:latest

MAINTAINER Takuzo Isami <isamit@toki.co.jp>

RUN yum update -y
RUN yum install httpd -y

# ansible設定ファイルがおかしいので修正版コピー
#COPY ansible/hosts /etc/ansible/

# Playbookをコピー
#ADD ansible /tmp/ansible
#WORKDIR /tmp/ansible

#RUN ansible-playbook gs_ajp.yml -v -c local

# apahce設定ファイルを追加
COPY ./ajp.conf /etc/httpd/conf.d/ajp.conf

ENTRYPOINT ["/usr/sbin/httpd" , "-D" , "FOREGROUND"]
