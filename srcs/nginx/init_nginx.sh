#!/bin/sh/
openrc
touch run/openrc/softlevel
rc-status
usr/bin/telegraf start
nginx -g 'daemon off;'
tail -f /dev/null