FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add nginx; apk add openssl

COPY ./nginx.conf /etc/nginx/

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=ecole42/OU=21Kazan/CN=aemustaf" \
	-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;
EXPOSE 80 443

RUN adduser -D -g 'www' www
RUN mkdir /www; chown -R www:www /var/lib/nginx; chown -R www:www /www

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx
COPY ./index.html /www/index.html

COPY ./init_nginx.sh .
RUN chmod +x init_nginx.sh
CMD sh init_nginx.sh