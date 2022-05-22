#!/usr/bin/env bash
sed -i "s/{SERVER_NAME}/$SERVER_NAME/g" /etc/nginx/conf.d/default.conf;
if [ -z "${USE_SSL:-}" ];then
echo "$0: nginx config port 80"
sed -i "s/{PORT}/80/g" /etc/nginx/conf.d/default.conf;
else
echo "$0: nginx config port 443"
sed -i "s/{PORT}/443/g" /etc/nginx/conf.d/default.conf;
sed -i "s/# ssl_certificate/ssl_certificate/g" /etc/nginx/conf.d/default.conf; 

echo "# 把所有HTTP请求重定向到HTTPS上
server {
    listen 80;
    server_name $SERVER_NAME *.$SERVER_NAME;
    return 301 https://\$host\$request_uri;
}"  > /etc/nginx/conf.d/${SERVER_NAME}_ssl_redirect.conf


echo "0 */12 * * * /docker-entrypoint.d/init_ssl_cert.sh" >> cron_conf && crontab cron_conf && rm -f cron_conf;
fi

