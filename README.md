## wordpress depoly
docker + LNMP + wordpress

Docker version 20.10.14
Docker Compose version v2.2.3
Wordpress 5.9.3
PHP 7.4
Mysql 8.0
Nginx stable

### before run add .env file like
```
MYSQL_ROOT_PASSWORD=example
MYSQL_DATABASE=example
MYSQL_USER=example
MYSQL_PASSWORD=example
SERVER_NAME=example.com
TENCENTCLOUD_SECRET_ID=example
TENCENTCLOUD_SECRET_KEY=example
LEGO_EMAIL=example@example.com
LEGO_DNS=tencentcloud
USE_SSL=1
mirrors=cloud.tencent
```
TENCENTCLOUD_SECRET_ID, TENCENTCLOUD_SECRET_KEY,LEGO_DNS is used for LEGO, you can change it with other dns provider(https://go-acme.github.io/lego/dns/)

### run it
```
docker compose up -d
```
