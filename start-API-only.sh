#!/bin/sh

echo "--- Iniciando Banco de Dados ---"
kubectl apply -f pod-quotes-DB.yaml
sleep 2;
kubectl apply -f ClusterIP-quotesDB.yaml


echo "--- Iniciando API ---"
kubectl apply -f pod-quotes-API.yaml
sleep 2;

echo "---- Iniciando serviços ----"
kubectl apply -f NodePort-quotes-API.yaml

echo "Aplicação disponível em localhost:30000/quotes"
