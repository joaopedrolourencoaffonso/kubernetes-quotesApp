#!/bin/sh

echo "Encerrando pods"
kubectl delete deploy mainpage-api-deployment
kubectl delete deploy quotes-api-deployment
kubectl delete deploy addget-api-deployment
kubectl delete deploy images-api-deployment
kubectl delete deploy quotes-db-deployment

echo "\nEncerrando serviços"
kubectl delete svc database
kubectl delete svc quotes-api
kubectl delete svc images-api
kubectl delete svc nodeport-mainpage-api
kubectl delete svc nodeport-addget-api

echo "\nDeletando variáveis de ambiente"
kubectl delete configmap quotes-api-config

read -p "Deseja deletar o volume e o pvc (y/n)?  - " answer

if [ "$answer" = "y" ]; then
    kubectl delete pvc quotes-db-pvc;
    kubectl delete pv quotes-db-pv;
else
    echo "\nOs dados serão preservados!\n"
fi

echo "\nAplicação encerrada"