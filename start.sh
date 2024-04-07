#!/bin/sh

echo "-------- Inicalizando pods --------";
kubectl apply -f pod-quotes-API.yaml
kubectl apply -f pod-quotes-DB.yaml
kubectl apply -f pod-quotes-mainpage.yaml
kubectl apply -f pod-quotes-images-API.yaml

echo "--- Inicalizando Infraestrutura ---";
kubectl apply -f ClusterIP-quotesDB.yaml
kubectl apply -f ClusterIP-quotes-api.yaml
kubectl apply -f ClusterIP-images-api.yaml

echo "--- Disponibilizando aplicação"
kubectl apply -f NodePort-quotes-mainpage.yaml


echo "--- Pods e serviços funcionando ---"
kubectl get pod
kubectl get svc
echo "-----------------------------------"

echo "Aplicação disponível em localhost:30000";