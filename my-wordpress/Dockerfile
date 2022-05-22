
FROM ubuntu:22.04

LABEL maintainer="mysens@126.com"

WORKDIR /var/www/html

ARG mirrors

RUN   set -x; sed -i s@/archive.ubuntu.com/@/mirrors.$mirrors.com/@g /etc/apt/sources.list &&\
      sed -i s@/security.ubuntu.com/@/mirrors.$mirrors.com/@g /etc/apt/sources.list &&\
      apt-get update && apt-get -y install wget && wget https://wordpress.org/latest.tar.gz &&\
      tar -xzvf latest.tar.gz && rm latest.tar.gz && apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* &&\
      chown www-data:www-data . 