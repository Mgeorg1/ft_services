FROM alpine:3.12
RUN apk add update && apk upgrade
RUN apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl \
	 php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
	 php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom; \
	 apk add wget; mkdir /www; apk add nginx; apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache
RUN wget https://wordpress.org/latest.tar.gz; tar -svzf latest.tar.gz; rm -rf latest.tar.gz; mv wordpress /www
RUN mkdir -p /run/nginx
COPY 