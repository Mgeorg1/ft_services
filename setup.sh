#!/bin/sh
minikube stop
minikube delete
minikube start --vm-driver=virtualbox --memory 4096
eval $(minikube docker-env)
docker build -t nginx_image ./srcs/nginx
docker build -t mysql_image ./srcs/mysql
minikube addons enable metallb
kubectl apply -f ./srcs/config-map.yaml
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/mysql.yaml