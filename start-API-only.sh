#!/bin/sh

echo "--- Iniciando pods ---"
kubectl apply -f pod-quotes-DB.yaml
sleep 10;
kubectl apply -f pod-quotes-API.yaml

sleep 10;
echo "--- Pods funcionando ---"
kubectl get pod
echo "------------------------"

echo "---- Iniciando serviços ----"
sleep 10;
kubectl apply -f ClusterIP-quotesDB.yaml
sleep 10;
kubectl apply -f NodePort-quotes-API.yaml

echo "--- Serviços funcionando ---"
kubectl get svc
echo "----------------------------"