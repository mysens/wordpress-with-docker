#!/usr/bin/env bash
if [ -z "${USE_SSL:-}" ];then
echo "$0: nginx config ssl closed"
exit 0
fi
cd /etc/nginx/cert
if [ -f ".lego/certificates/_.${SERVER_NAME}.crt" ]; then
echo "$0 crt file exist, try to renew"
./lego --email $LEGO_EMAIL --dns $LEGO_DNS --domains="*.$SERVER_NAME" --domains="$SERVER_NAME" \
renew --days=30 --renew-hook="sh /etc/nginx/cert/renew_hook.sh >> renewhook.log" >> autorenew.log
else
echo "$0 crt file not exist, try to create"
echo Y | ./lego --email $LEGO_EMAIL --dns $LEGO_DNS --domains="*.$SERVER_NAME" --domains="$SERVER_NAME" run
fi