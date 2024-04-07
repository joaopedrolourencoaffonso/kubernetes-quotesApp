#!/bin/sh

echo "--- Iniciando pods ---"
kubectl apply -f pod-quotes-API.yaml
kubectl apply -f pod-quotes-DB.yaml


echo "--- Pods funcionando ---"
kubectl get pod
echo "------------------------"

echo "---- Iniciando serviços ----"
kubectl apply -f ClusterIP-quotesDB.yaml
kubectl apply -f NodePort-quotes-API.yaml

echo "--- Serviços funcionando ---"
kubectl get svc
echo "----------------------------"