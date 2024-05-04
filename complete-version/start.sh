#!/bin/sh

echo "-------- Inicializando Volumes do Banco de Dados --------";
kubectl apply -f ./complete-version/quotes-db-volume.yaml
sleep 5;
kubectl apply -f ./complete-version/quotes-db-pvc.yaml
sleep 5;

echo "\n-------- Inicializando Banco de Dados --------";
kubectl apply -f ./complete-version/deployment-quotes-DB.yaml
sleep 5;
kubectl apply -f ./ClusterIP-quotesDB.yaml

echo "\n-------- Inicalizando API de Imagem --------"
kubectl apply -f ./deployment-images.yaml
kubectl apply -f ./ClusterIP-images-api.yaml
sleep 10;

echo "\n-------- Inicalizando API da página principal --------"
kubectl apply -f ./deployment-mainpage.yaml
kubectl apply -f ./NodePort-quotes-mainpage.yaml
sleep 10;

echo "\n-------- Inicalizando ConfigMap --------"
kubectl apply -f ./configmap-version/configmap.yaml
sleep 5;

echo "\n-------- Inicalizando API de citações --------"
kubectl apply -f ./configmap-version/deployment-quotes-API.yaml
kubectl apply -f ./ClusterIP-quotes-api.yaml
sleep 5;

echo "\n-------- Inicalizando API de add e get --------"
kubectl apply -f ./configmap-version/deployment-addget-API.yaml
kubectl apply -f ./configmap-version/NodePort-addget-API.yaml
sleep 5;


echo "\n--- Pods e serviços funcionando ---"
kubectl get all
echo "-----------------------------------"

echo "\nAplicação disponível em localhost:30000";