# kubernetes-quotesApp

Uma aplicação simples baseada em flask para demonstrar a utilização do kubernetes.

Para ver como as imagens foram criadas utilizando o Docker, assim como uma forma de executar apenas usando Docker, veja o repositório [docker-quotesApp](https://github.com/joaopedrolourencoaffonso/docker-quotesApp/tree/main). Para as imagens em si, acesse: https://hub.docker.com/u/clusterminator.

> No momento, todos os pods são inicializados diretamente, no futuro, pretendo implementar deployments e secrets

## Download das Imagens

Basta usar o pull.sh:

```bash
$ sh pull.sh
```

## Inicializando apenas a API de citações

Basta usar:

```bash
$ sh ./api-only-version/start.sh
```

A aplicação estará disponível em [localhost:30000/quotes](http://localhost:30000/quotes)

Para encerrar, basta usar:

```bash
$ sh ./api-only-version/stop.sh
```

## Inicializando a API completa criando os Pods diretamente

Basta fazer:

```bash
$ sh ./pod-version/start.sh
```

A aplicação estará disponível em [localhost:30000](http://localhost:30000/)

Para finalizar, basta usar:

```bash
$ sh ./pod-version/stop.sh
```


## Inicializando a API completa criando os Pods com deployments

Basta fazer:

```bash
$ sh ./deployment-version/start.sh
```

A aplicação estará disponível em [localhost:30000](http://localhost:30000/)

Para finalizar, basta usar:

```bash
$ sh ./deployment-version/stop.sh
```

### Observações

- A nova imagem do [quotes-api](https://hub.docker.com/layers/clusterminator/quotes-api/3.0/images/sha256-74d1138957d5ac4b9c25221d9feaad06773ce6ad010734c07dbb5a5321a57fb5?context=explore) utiliza [essa versão do servidor flask](https://github.com/joaopedrolourencoaffonso/docker-quotesApp/blob/main/quotes-api/app-secrets.py) a qual importa variáveis de ambiente estabelecidas com o arquivo [`quotes-api-secret.yaml`](https://github.com/joaopedrolourencoaffonso/kubernetes-quotesApp/blob/main/quotes-api-secret.yaml).

- Para codificar variáveis do secret você pode utilizar [esse site](https://www.base64decode.org/) ou [esse script](./base64-converter.sh).
