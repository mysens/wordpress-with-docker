
FROM ubuntu:22.04

WORKDIR /usr/share/nginx/html

RUN   set -x;  apt-get update && apt-get -y install wget && wget https://wordpress.org/latest.tar.gz && \
      tar -xzvf latest.tar.gz && rm latest.tar.gz

FROM php:7.4.28-fpm

LABEL maintainer="mysens@126.com"

WORKDIR /usr/share/nginx/html 

COPY --from=0 /usr/share/nginx/html .