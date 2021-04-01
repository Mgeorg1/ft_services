FROM alpine:3.12
EXPOSE 5050
RUN apk update && apk upgrade
RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl \
	 php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-fpm php7-mbstring\
	 php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom; \
	 apk add openrc; \
	 apk add wget; mkdir /www; apk add nginx; apk add telegraf
RUN wget https://wordpress.org/latest.tar.gz; tar -xzvf latest.tar.gz; rm -rf latest.tar.gz;
RUN mkdir -p /run/nginx; mkdir -p /run/php-fpm7/;  mkdir -p /usr/share/webapps/ ; mv wordpress /usr/share/webapps/ ; ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY	./telegraf.conf /etc/
COPY ./wp-config.php /usr/share/webapps/wordpress
COPY ./init_wp.sh ./
RUN chmod +x init_wp.sh
ENTRYPOINT sh init_wp.sh