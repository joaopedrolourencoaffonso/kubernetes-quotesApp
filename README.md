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
$ sh start-API-only.sh
```

A aplicação estará disponível em [localhost:30000/quotes](http://localhost:30000/quotes)

Para encerrar, basta usar:

```bash
$ sh stop-API-only.sh
```

## Inicializando a API completa

Basta fazer:

```bash
$ sh full-start.sh
```

A aplicação estará disponível em [localhost:30000](http://localhost:30000/quotes)

Para finalizar, basta usar:

```bash
$ sh full-stop.sh
```