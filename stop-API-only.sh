#!/bin/sh

echo "Deletando pods e serviços"
kubectl delete pod quotes-api
kubectl delete pod quotes-db
kubectl delete svc database
kubectl delete svc nodeport-quotes-api

echo "API encerrada"