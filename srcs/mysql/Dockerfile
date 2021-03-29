FROM alpine:3.12
RUN apk update && apk upgrade;  apk add openrc mysql mysql-client; \
apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache
COPY ./db_init.sh .
COPY my.cnf /etc/my.cnf
EXPOSE 3306
CMD sh db_init.sh