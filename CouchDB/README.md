# CouchDB

O CouchDB é um banco de dados não relacional (NoSql) opensource, oriedado a documentos, escrito na linguagem Erlang.

Apesar da tradução literal de cocuh ser sofá e esse ser a logo, CouchDB é - Cluster Of Unreliable Commodity Hardware (CouchDB)

Damien Katz o criador do CouchDB, definiu o CouchDB como sistema de armazenamento de banco de dados para objetos de larga escala, seu objetivo era tornar o CouchDB um banco de dados para a internet, que pudesse ser acessado e compartilhado por vários usuários.

## Principais Características

- Armazenamento em Documento: Os dados são armazenados em documentos JSON, que podem ser acessados por meio de uma API HTTP.

- Semântica ACID (Atomicidade, Consistência, Isolamento e Durabilidade): O CouchDB é um banco de dados transacional, que garante a integridade dos dados.

- Views e índices com MapReduce: O CouchDB utiliza o MapReduce para criar views e índices, que são armazenados em disco e atualizados automaticamente.

- Arquitetura distribuida com replicação: O CouchDB é um banco de dados distribuido, que permite a replicação de dados entre servidores.

- API REST: Todos os items tem uma URL única que são acessadas através do HTTP. O REST utiliza os métodos POST, GET, PUT e DELETE para criar, ler, atualizar e deletar dados.

- Consistência Eventual: O CouchDB utiliza o modelo de consistência eventual, que permite que os dados sejam replicados entre os servidores, mesmo que eles não estejam conectados.

### API REST

Ao se tratar de principalmente aplicações web/mobile, geralmente essas aplicações consomem recursos através da internet. Esses recursos de forma geral são feitos de uma API REST.

REST é um padrão do protocolo HTTP.

Esse protocolo HTTP possuí verbos, que são padrão de conversação entre cliente e servidor. Os principais verbos são:

- GET: Obter dados de um recurso.

- POST: Criar um novo recurso.

- PUT: Atualizar um recurso.

- DELETE: Deletar um recurso.

Essas operações são chamadas de CRUD (Create, Read, Update e Delete).

Geralmente tem-se um sistema backend que é responsável por fornecer esses recursos, e um sistema frontend que é responsável por consumir esses recursos.

## Apliações

Utilizando o PostMAN para fazer requisições HTTP:

### GET

Utilizando o método GET para obter os dados de um recurso:

Iremos fazer a requisição para o localhost, na porta 5984, que é a porta padrão do CouchDB.

```http

GET http://localhost:5984/

```

O CouchDB irá retornar um JSON com as informações do banco de dados.

```json
{
    "couchdb": "Welcome",
    "version": "3.3.3",
    "git_sha": "40afbcfc7",
    "uuid": "f1274d35de3d6f44f7b44491f20b6431",
    "features": [
        "access-ready",
        "partitioned",
        "pluggable-storage-engines",
        "reshard",
        "scheduler"
    ],
    "vendor": {
        "name": "The Apache Software Foundation"
    }
}
```

Ao clicar em `Send` o PostMAN irá fazer uma requisição e retornar o JSON.

Toda vez que se faz uma requisição, há um retorno de um status code, que é um código que indica o status da requisição.

`GET` é para trazer algo

Para alguns casos é preciso fornecer o login e senha para acessar o recurso, para isso é preciso fornecer o login e senha no PostMAN.

Para acessar um banco de dados especifico, é preciso fornecer o nome do banco de dados na URL.

```http

GET http://localhost:5984/nome_do_banco_de_dados

```

E para fazer a requisição é preciso fornecer o login e senha.

```json
{
    "error": "unauthorized",
    "reason": "You are not a server admin."
}
```

Para verificar um documento especifico, é preciso fornecer o nome do banco de dados e o id do documento.

```http

GET http://localhost:5984/nome_do_banco_de_dados/id_do_documento

```

### PUT

O CouchDB possuí um banco de dados internos que facilita a criação de um banco de dados. Entretanto, esse banco de dados precisa ser alterado para que possa ser utilizado.

Para criar um banco de dados, é preciso fazer uma requisição PUT, e fornecer o nome do banco de dados na URL.

```http
PUT http://localhost:5984/produtos
```

O retorno será um JSON com as informações do banco de dados.

```json
{
    "ok": true
}
```