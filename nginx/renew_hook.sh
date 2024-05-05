#!/usr/bin/env bash

cd `dirname $0`

/etc/init.d/nginx reload

./renewer -ak $QINNIU_SECRET_ID -sk $QINNIU_SECRET_KEY -d $QINNIU_DOMAIN -pri /etc/nginx/cert/.lego/certificates/_.${SERVER_NAME}.key -ca /etc/nginx/cert/.lego/certificates/_.${SERVER_NAME}.crt