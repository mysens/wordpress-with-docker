
FROM ubuntu:22.04

LABEL maintainer="mysens@126.com"

WORKDIR /var/www/html

RUN   set -x;  apt-get update && apt-get -y install wget && wget https://wordpress.org/latest.tar.gz && \
      tar -xzvf latest.tar.gz && rm latest.tar.gz

FROM nginx:stable

WORKDIR /var/www/html 

COPY --chown=www-data:www-data --from=0 /var/www/html .

RUN apt-get update && apt-get install -y cron \
  && apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx

COPY default.conf /etc/nginx/conf.d

COPY *.sh /docker-entrypoint.d

COPY lego /cert/lego