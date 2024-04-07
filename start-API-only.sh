#!/bin/sh

echo "--- Iniciando Banco de Dados ---"
kubectl apply -f pod-quotes-DB.yaml
sleep 2;
kubectl apply -f ClusterIP-quotesDB.yaml


echo "\n--- Iniciando API ---"
kubectl apply -f pod-quotes-API.yaml
sleep 2;

echo "\n---- Iniciando serviços ----"
kubectl apply -f NodePort-quotes-API.yaml

echo "\n-> Aplicação disponível em localhost:30000/quotes"
