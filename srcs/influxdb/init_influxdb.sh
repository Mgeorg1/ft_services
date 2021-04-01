openrc
touch /run/openrc/softlevel

/etc/init.d/telegraf start
/usr/sbin/influxd -config /etc/influxdb.conf