#!/usr/bin/env bash
if [ $USE_SSL -le 0 ];then
echo "$0: nginx config ssl closed"
exit 0
fi
cd `dirname $0`
if [ -d "/cert/.lego" ]; then
TENCENTCLOUD_SECRET_ID=$LEGO_SECRET_ID \
TENCENTCLOUD_SECRET_KEY=$LEGO_SECRET_KEY \
/etc/nginx/cert/lego --email $LEGO_EMAIL --dns tencentcloud --domains="*.$SERVER_NAME" --domains="$SERVER_NAME" \
renew --days=30 --renew-hook="nginx -s reload" >> autorenew.log
else
TENCENTCLOUD_SECRET_ID=$LEGO_SECRET_ID \
TENCENTCLOUD_SECRET_KEY=$LEGO_SECRET_KEY \
echo Y | /etc/nginx/cert/lego --email $LEGO_EMAIL --dns tencentcloud --domains="$SERVER_NAME" run
fi