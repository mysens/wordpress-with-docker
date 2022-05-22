#!/usr/bin/env bash
sed -i "s/{SERVER_NAME}/$SERVER_NAME/" /etc/nginx/conf.d/default.conf;


echo "0 */12 * * * /init_ssl_cert.sh" >> cron_conf && crontab cron_conf && rm -f cron_conf;