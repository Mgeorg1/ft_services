openrc
touch /run/openrc/softlevel

/etc/init.d/telegraf start
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf