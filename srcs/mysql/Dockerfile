FROM alpine:3.12
RUN apk update && apk upgrade;  apk add mariadb; apk add mariadb-common; apk add mariadb-client; apk add openrc; \
apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache
COPY ./db_init.sh .
EXPOSE 3306
CMD sh db_init.sh