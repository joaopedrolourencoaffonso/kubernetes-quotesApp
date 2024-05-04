#!/bin/sh

echo "Encerrando pods"
kubectl delete pod mainpage-api
kubectl delete pod quotes-api
kubectl delete pod images-api
kubectl delete pod quotes-db

echo "\nEncerrando serviços"
kubectl delete svc database
kubectl delete svc quotes-api
kubectl delete svc images-api
kubectl delete svc nodeport-mainpage-api

echo "\nDeletando variáveis de ambiente"
kubectl delete secret quotes-api-secret

echo "\nAplicação encerrada"