#!/bin/sh/
openrc
touch run/openrc/softlevel
usr/bin/telegraf start
nginx -g 'daemon off;'
