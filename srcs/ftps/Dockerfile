FROM	alpine:3.12
RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN		apk update && apk upgrade; apk add vsftpd openssl openrc telegraf
RUN 	adduser -D admin && echo admin:admin | chpasswd

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=ecole42/OU=21Kazan/CN=aemustaf" \
	-newkey rsa:2048 -keyout /etc/ssl/ftps.key -out /etc/ssl/ftps.crt;
EXPOSE 21 20 21010

COPY	./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./init_ftps.sh ./
COPY	./telegraf.conf /etc/
RUN		chmod +x init_ftps.sh

ENTRYPOINT sh init_ftps.sh