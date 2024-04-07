#!/bin/sh

echo "-------- Inicalizando pods --------";
kubectl apply -f pod-quotes-API.yaml
sleep 10;
kubectl apply -f pod-quotes-DB.yaml
sleep 10;
kubectl apply -f pod-quotes-mainpage.yaml
sleep 10;
kubectl apply -f pod-quotes-images-API.yaml

echo "\n--- Inicalizando Infraestrutura ---";
sleep 10;
kubectl apply -f ClusterIP-quotesDB.yaml
sleep 10;
kubectl apply -f ClusterIP-quotes-api.yaml
sleep 10;
kubectl apply -f ClusterIP-images-api.yaml

echo "\n--- Disponibilizando aplicação"
sleep 10;
kubectl apply -f NodePort-quotes-mainpage.yaml


sleep 10;
echo "\n--- Pods e serviços funcionando ---"
kubectl get pod
kubectl get svc
echo "-----------------------------------"

echo "\nAplicação disponível em localhost:30000";