FROM nginx:1.27.1

WORKDIR /var/www/html 

ARG mirrors

RUN sed -i "s@http://\(deb\|security\).debian.org@https://mirrors.$mirrors.com@g" /etc/apt/sources.list.d/debian.sources &&\
  apt-get update && apt-get install -y cron &&\
  apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY /etc/nginx /etc/nginx

COPY init_param.sh /docker-entrypoint.d/init_param.sh

COPY init_ssl_cert.sh /etc/nginx/cert/init_ssl_cert.sh

COPY lego /etc/nginx/cert/lego
