#!/bin/sh/
openrc
touch run/openrc/softlevel
/etc/init.d/telegraf start
nginx -g 'daemon off;'
