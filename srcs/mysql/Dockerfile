FROM alpine:3.12
RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk upgrade;  apk add openrc mysql mysql-client; \
	apk add telegraf
COPY ./db_init.sh .
COPY my.cnf /etc/my.cnf
COPY mysql-svc.sql ./
COPY	./telegraf.conf /etc/telegraf/
EXPOSE 3306
CMD sh db_init.sh