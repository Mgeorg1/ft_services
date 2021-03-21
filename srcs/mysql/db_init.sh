#!bin/sh/
openrc
touch run/openrc/softlevel
rc-status
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

echo "CREATE DATABASE wordpress;"| mysql
echo "CREATE USER 'admin'@'%' identified by 'admin'" | mysql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' identified by 'admin' WITH GRANT OPTION;"| mysql
echo "FLUSH PRIVILEGES;"| mysql
echo "update mysql.user set plugin='' where user='root';"| mysql 
sh usr/share/mariadb/mysql.server start
tail -f dev/null