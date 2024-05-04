#!/bin/sh

echo "Encerrando pods"
kubectl delete deploy mainpage-api-deployment
kubectl delete deploy quotes-api-deployment
kubectl delete deploy images-api-deployment
kubectl delete deploy quotes-db-deployment

echo "\nEncerrando serviços"
kubectl delete svc database
kubectl delete svc quotes-api
kubectl delete svc images-api
kubectl delete svc nodeport-mainpage-api

echo "\nDeletando variáveis de ambiente"
kubectl delete secret quotes-api-secret

echo "\nAplicação encerrada"