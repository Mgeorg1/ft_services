#!/bin/sh
openrc
touch /run/openrc/softlevel
rc-status
rc-service -v php-fpm7 start
nginx -g "daemon off;"