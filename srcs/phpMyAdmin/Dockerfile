FROM alpine:3.12
EXPOSE 5000
RUN apk add openrc openssl \
		php7 php7-fpm php7-mysqli php7-xml php7-simplexml php7-json \
    	php7-iconv php7-tokenizer php7-xmlwriter php7-session php7-mbstring; \
	 	apk add wget; mkdir /www; apk add nginx; apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz; \
	tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz; \
	mv phpMyAdmin-5.0.1-english /var/www/phpmyadmin;
COPY	./config.inc.php /var/www/phpmyadmin
COPY ./nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /run/nginx; mkdir -p /run/php-fpm7/;
RUN 	openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=ecole42/OU=21Kazan/CN=aemustaf" \
		-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;
COPY ./init.sh ./
ENTRYPOINT sh init.sh