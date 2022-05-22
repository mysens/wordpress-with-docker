#!/usr/bin/env bash
if [ $USE_SSL -le 0 ];then
echo "$0: nginx config ssl closed"
exit 0
fi
cd `dirname $0`
if [ -d "/etc/nginx/cert/.lego" ]; then
/etc/nginx/cert/lego --email $LEGO_EMAIL --dns $LEGO_DNS --domains="*.$SERVER_NAME" --domains="$SERVER_NAME" \
renew --days=30 --renew-hook="nginx -s reload" >> autorenew.log
else
echo Y | /etc/nginx/cert/lego --email $LEGO_EMAIL --dns $LEGO_DNS --domains="*.$SERVER_NAME" --domains="$SERVER_NAME" run
fi