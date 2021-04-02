FROM	alpine:3.12

RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN 	apk update && apk upgrade; apk add influxdb openrc telegraf

COPY	./telegraf.conf /etc/

COPY	./init_influxdb.sh .

RUN		chmod +x init_influxdb.sh

EXPOSE 	8086

CMD		sh init_influxdb.sh