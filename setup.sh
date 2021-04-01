#!/bin/sh
minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory 4096
eval $(minikube docker-env)
docker build -t nginx_image ./srcs/nginx
docker build -t mysql_image ./srcs/mysql
docker build -t wordpress_image ./srcs/wp
docker build -t phpmyadmin_image ./srcs/phpMyAdmin
docker build -t ftps_image ./srcs/ftps
docker build -t influxdb_image ./srcs/influxdb
docker build -t grafana_image ./srcs/grafana

minikube addons enable metallb
minikube addons enable dashboard

kubectl apply -f ./srcs/config-map.yaml
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/wp.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/influxdb.yaml
kubectl apply -f ./srcs/grafana.yaml