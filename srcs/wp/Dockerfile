FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl \
	 php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-fpm php7-mbstring\
	 php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom; \
	 apk add openrc; \
	 apk add wget; mkdir /www; apk add nginx; apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache
RUN wget https://wordpress.org/latest.tar.gz; tar -xzvf latest.tar.gz; rm -rf latest.tar.gz;
RUN mkdir -p /run/nginx; mkdir -p /run/php-fpm7/;  mkdir -p /usr/share/webapps/ ; mv wordpress /usr/share/webapps/ ; ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
RUN 	chown -R www-data:www-data /var/www/ ; chmod -R 755 /var/www/*
COPY ./nginx.conf /etc/nginx/nginx.conf
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
RUN apk add glibc-2.33-r0.apk
COPY ./wp-config.php /usr/share/webapps/wordpress
COPY ./init_wp.sh ./
EXPOSE 5050
RUN chmod +x init_wp.sh
ENTRYPOINT sh init_wp.sh