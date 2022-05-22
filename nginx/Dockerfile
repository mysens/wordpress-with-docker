FROM nginx:stable

WORKDIR /var/www/html 

RUN apt-get update && apt-get install -y cron \
  && apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY /etc/nginx /etc/nginx

COPY *.sh /docker-entrypoint.d

COPY lego /etc/nginx/cert/lego