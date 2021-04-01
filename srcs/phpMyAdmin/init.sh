#!/bin/sh
openrc
touch /run/openrc/softlevel
rc-status
/etc/init.d/telegraf start
rc-service php-fpm7 start
nginx -g "daemon off;"