#!/bin/sh

kubectl delete pods -l app=quotes-db
kubectl delete pods -l app=addget-api
kubectl delete pods -l app=quotes-api
kubectl delete pods -l app=images-api
kubectl delete pods -l app=mainpage-api

echo "Todos os pods foram reinicializados"