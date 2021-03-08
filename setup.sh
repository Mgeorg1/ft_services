#!/bin/sh

minikube start --vm-driver=virtualbox --memory 4096
eval $(minikube docker-env)
docker build -t nginx_image ./srcs/nginx
minikube addons enable metallb
kubectl apply -f ./srcs/config-map.yaml
kubectl apply -f ./srcs/nginx.yaml