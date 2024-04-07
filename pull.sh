#!/bin/sh

echo "--- Baixando Imagens ---";

docker pull clusterminator/quotes-db:1.0
docker pull clusterminator/quotes-api:1.0
docker pull clusterminator/images-api:latest
docker pull clusterminator/mainpage-api:1.0

echo "--- Imagens instaladas ---";

docker images | grep "clusterminator" | grep "quotes-db\|quotes-api\|images-api\|mainpage-api"