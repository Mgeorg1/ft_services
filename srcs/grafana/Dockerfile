FROM	alpine:3.12
EXPOSE	3000
RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN 	apk update && apk upgrade
RUN		apk add openrc grafana telegraf
COPY 	./telegraf.conf /etc/
COPY 	./grafana.ini /etc/
COPY	./init_grafana.sh ./
RUN     rm /usr/share/grafana/data/grafana.db
COPY 	./grafana.db /usr/share/grafana/data
RUN		chmod +x init_grafana.sh
CMD		sh init_grafana.sh