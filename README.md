# kubernetes-quotesApp

Uma aplicação simples baseada em flask para demonstrar a utilização do kubernetes.

<p align="center"><a href="https://github.com/joaopedrolourencoaffonso/quotes_bot/tree/main"><img src="https://github.com/joaopedrolourencoaffonso/quotes_bot/blob/main/watermark.jpg" width="250" height="250"></a></p>

Para ver como as imagens foram criadas utilizando o Docker, assim como uma forma de executar apenas usando Docker, veja o repositório [docker-quotesApp](https://github.com/joaopedrolourencoaffonso/docker-quotesApp/tree/main). Para as imagens em si, acesse: https://hub.docker.com/u/clusterminator.


Cada tópico abaixo se refere a uma versão gradativamente mais complexa da aplicação, reciclando boa parte do código usado na versão anterior. Para ver a aplicação completa, isto é, utilizando `configmap`, `volumes`, etc, [VEJA AQUI](#api-completa).

## Download das Imagens

Basta usar o pull.sh:

```bash
$ sh pull.sh
```

## Inicializando apenas a API de citações aleatórias

**O que é?** 

Essa é a versão mais simples, uma api flask que faz requisições para um banco de dados. São utilizados: `CluterIP`, `pod` e `NodePort`.

Para inicializar, basta usar:

```bash
$ sh ./api-only-version/start.sh
```

A aplicação estará disponível em [localhost:30000/quotes](http://localhost:30000/quotes)

Para encerrar, basta usar:

```bash
$ sh ./api-only-version/stop.sh
```

## Inicializando a API de citações aleatórias e criando os Pods diretamente

**O que é?** 

Essa versão usa os mesmos componentes que a acima, porém é mais complexa, com um serviço para prover imagens de fundos e uma API específica para prover a página principal, assim como servir de proxy para as demais APIs.

Para inicializar, basta fazer:

```bash
$ sh ./pod-version/start.sh
```

A aplicação estará disponível em [localhost:30000](http://localhost:30000/)

Para finalizar, basta usar:

```bash
$ sh ./pod-version/stop.sh
```


## Inicializando a API  de citações aleatórias e criando os Pods com deployments

**O que é?** 

Essa versão utiliza `deployments` para reinicializar pods deletados e `secrets` para permitir o acesso ao banco de dados sem arriscar as credenciais.

Para inicializar, basta fazer:

```bash
$ sh ./deployment-version/start.sh
```

A aplicação estará disponível em [localhost:30000](http://localhost:30000/)

Para finalizar, basta usar:

```bash
$ sh ./deployment-version/stop.sh
```

## API completa inicializada com configmap

Utiliza-se um `configmap` para permitir o compartilhamento de credenciais de acesso entre `quotes-api` e `addget-api`, uma API que permite requisitar uma citações específica com base em seu id e adicionar novas. Os endpoints são explicados em maior detalhe [abaixo](#usando-a-api).

Para inicializar, basta fazer:

```bash
$ sh ./configmap-version/start.sh
```

A página de citações aleatórias estará disponível em [localhost:30000](http://localhost:30000/), a API para adicionar novas citações e requisitar citações pelo id está disponível em [localhost:30001](http://localhost:30001/).

Para finalizar, basta usar:

```bash
$ sh ./configmap-version/stop.sh
```


## API completa

Essa versão usa `volumes` para preservar citações adicionadas.

Para inicializar, basta


Para inicializar, basta fazer:

```bash
$ sh ./complete-version/start.sh
```

A página de citações aleatórias estará disponível em [localhost:30000](http://localhost:30000/), a API para adicionar novas citações e requisitar citações pelo id está disponível em [localhost:30001](http://localhost:30001/).

Como os servidores flask são simplórios (esse é um projeto exemplificativo) o restart do banco de dados vai quebrar a conexão deles com o banco de dados e eles não serão capazes de se conectar sozinhos. Caso deseje reiniciar o servidor do banco de dados, use o script abaixo que irá deletar todos os pods:

```bash
$ sh ./complete-version/restart-pods.sh
```

Para finalizar a aplicação, basta usar:

```bash
$ sh ./configmap-version/stop.sh
```

O script irá perguntar se você deseja apagar os volumes também, caso deseja, basta digitar "y" e depois `ENTER`.


## Usando a API

Em [localhost:30000](http://localhost:30000/), você irá encontrar a página principal da API, é uma simples página HTML que usa a função `fetch` do javascript para requisitar as APIs do backend. Ele deverá ter [essa aparência](https://joaopedrolourencoaffonso.github.io/quotes_bot/).

Em localhost:30001, você irá encontrar os endpoints: `getQuote` e `addQuote`.

Para adicionar uma citação, basta fazer:

```bash
$ curl -X POST   -H "Content-Type: application/json"   -d '{"author": "Maurice Switzer", "quote": "É melhor calar-se e deixar que as pessoas pensem que você é um idiota do que falar e acabar com a dúvida."}'   http://127.0.0.1:30001/addQuote
{
  "id": 1127,
  "message": "Nova cita\u00e7\u00e3o adicionada!"
}
```

Você pode consultar uma citação diretamente pelo seu browser: http://localhost:30001/getQuote/1127 ou com o comando curl acima, em ambos os casos, passando o id da citação na própria URL.

```bash
$ curl http://localhost:30001/getQuote/1127
{
  "author": "Maurice Switzer",
  "quote": "\u00c9 melhor calar-se e deixar que as pessoas pensem que voc\u00ea \u00e9 um idiota do que falar e acabar com a d\u00favida."
```


### Observações

- A nova imagem do [quotes-api](https://hub.docker.com/layers/clusterminator/quotes-api/3.0/images/sha256-74d1138957d5ac4b9c25221d9feaad06773ce6ad010734c07dbb5a5321a57fb5?context=explore) utiliza [essa versão do servidor flask](https://github.com/joaopedrolourencoaffonso/docker-quotesApp/blob/main/quotes-api/app-secrets.py) a qual importa variáveis de ambiente estabelecidas com o arquivo [`quotes-api-secret.yaml`](https://github.com/joaopedrolourencoaffonso/kubernetes-quotesApp/blob/main/quotes-api-secret.yaml).

- Para codificar variáveis do secret você pode utilizar [esse site](https://www.base64decode.org/) ou [esse script](./base64-converter.sh).
