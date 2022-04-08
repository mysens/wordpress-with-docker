FROM php:7.4.28

LABEL maintainer="mysens@126.com"

RUN   mkdir -p /usr/share/nginx/html && cd /usr/share/nginx/html && wget https://wordpress.org/latest.tar.gz && \
      tar -xzvf latest.tar.gz && rm latest.tar.gz