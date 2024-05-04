#!/bin/sh

echo "-------- Inicializando Banco de Dados --------";
kubectl apply -f ./pod-quotes-DB.yaml
sleep 5;
kubectl apply -f ./ClusterIP-quotesDB.yaml

echo "\n-------- Inicalizando API de Imagem --------"
kubectl apply -f ./pod-quotes-images-API.yaml
kubectl apply -f ./ClusterIP-images-api.yaml
sleep 10;

echo "\n-------- Inicalizando API da página principal --------"
kubectl apply -f ./pod-quotes-mainpage.yaml
kubectl apply -f ./NodePort-quotes-mainpage.yaml
sleep 10;

echo "\n-------- Inicalizando API de citações --------"
kubectl apply -f ./quotes-api-secret.yaml
kubectl apply -f ./pod-quotes-API.yaml
kubectl apply -f ./ClusterIP-quotes-api.yaml

sleep 5;
echo "\n--- Pods e serviços funcionando ---"
kubectl get pod
kubectl get svc
echo "-----------------------------------"

echo "\nAplicação disponível em localhost:30000";