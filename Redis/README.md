# Redis

## Tabela de conteúdos

- [Redis](#redis)
  - [Introdução](#introdução)
  - [Benefícios do Redis](#benefícios-do-redis)
  - [Casos de uso](#casos-de-uso)
  - [Quem usa Redis](#quem-usa-redis)
  - [Instalação](#instalação)
  - [Inicialização](#inicialização)



## Introdução

REmote DIctionary Server (Redis) é um banco de dados NoSQL open source, que armazena dados na memória, e é utilizado como banco de dados, cache e message broker. O Redis é um banco de dados chave-valor, onde cada chave é associada a um valor, e o valor pode ser de diversos tipos, como string, listas, conjuntos, etc.

```bash

{"nome": "João"}

```

nome é a chave, e João é o valor.

Bem semelhante com o formato dict do Python.

```python

{"nome": "João"} # dicionário


```

O Redis foi escrito na linguagem C.

Ele trabalha com armazenamento de dados na memória não em disco, por isso ele é muito rápido, pois não precisa acessar o disco para recuperar os dados, e sim a memória RAM. Em memória os dados já estão prontos para a utilização, e não precisam ser processados, como no disco. Graças a essa característica, o Redis é muito utilizado como cache, pois ele é muito rápido, e pode ser utilizado para armazenar dados que são acessados com frequência, e que não precisam ser armazenados em disco, como por exemplo, dados de sessão de um usuário.

Além disso uma outra grande caracteristica do Redis é o gerenciamento de sessão, pois ele possui um tempo de expiração para os dados, ou seja, os dados são armazenados na memória, e após um determinado tempo, eles são removidos, e liberam espaço para novos dados. Isso é muito útil para armazenar dados de sessão, pois após um determinado tempo, os dados da sessão são removidos, e liberam espaço para novos dados de sessão.

O Redis também é muito utilizado como message broker, pois ele possui um sistema de pub/sub, onde um cliente pode publicar uma mensagem em um canal, e outros clientes podem se inscrever nesse canal, e receber as mensagens publicadas.

## Benefícios do Redis

- Desempenho muito rápido: Todos os dados do Redis residem na memória principal, o que permite acesso rápido a dados, em contraste com a maioria dos bancos de dados tradicionais no disco. Ao eliminar a necessidade de acessar discos, o Redis evita a latência de I/O e é capaz de alcançar milhões de solicitações por segundo.

- Estruturas de dados na memória: O Redis permite que os usuários armazenem chaves que fazem o mapeamento para vários tipos de dados. Os tipos de dados suportados incluem strings, hashes, listas, conjuntos e conjuntos classificados. O Redis também suporta estruturas de dados geoespaciais com raios e índices de hashes geoespaciais. O Redis também é compatível com listas de strings de bits, hiperloglogs, fluxos de entrada e saída e índices de pesquisa de texto completo.

- Versatilidade e facilidade de uso: O Redis é um banco de dados versátil que pode ser usado como um banco de dados, cache, mecanismo de mensagens e fila de tarefas. O Redis é fácil de usar e pode ser facilmente integrado a aplicativos. O Redis também é compatível com várias linguagens de programação.

- Replicação e persistência: O Redis oferece suporte à replicação de dados para alta disponibilidade e persistência de dados para recuperação de desastres. Os usuários podem configurar o Redis para replicar dados em várias réplicas. Os usuários também podem configurar o Redis para persistir dados em disco para recuperação de desastres.

- Compatibilidade com a linguagem de desenvolvimento preferencial: O Redis é compatível com várias linguagens de programação, incluindo Java, C, C++, C#, PHP, Python, Ruby, JavaScript, Go, Objective-C, Swift, R, Erlang, Rust, Scala, Clojure, Haskell, Perl, Tcl e Elixir.

## Casos de uso

- Cache: O Redis é um banco de dados de cache de alto desempenho. O Redis é usado como um banco de dados de cache porque é muito rápido e pode armazenar dados em cache na memória. O Redis também oferece suporte a vários tipos de dados, o que permite que os usuários armazenem dados em cache de várias maneiras. O Redis também oferece suporte a vários recursos de cache, como expiração de cache, cache de página inteira e cache de objeto.

- Gerenciamento de sessão: O Redis é usado para gerenciar sessões de usuários.

- Classificações em tempo real: O Redis é usado para classificações em tempo real, como classificações de jogos, classificações de produtos e classificações de usuários.

- Limite de taxa: O Redis é usado para limitar a taxa de solicitações de API.

- Filas de mensagens: O Redis é usado como um mecanismo de mensagens para filas de mensagens e filas de tarefas.

- Chat e sistemas de mensagens: O Redis é usado para criar sistemas de mensagens e chat.

## Quem usa Redis

- Twitter

- GitHub

- Pinterest

- Snapchat

- Craigslist

É comum que o Redis seja utilizado em conjunto com outros bancos de dados, como o MySQL, MongoDB, etc.

## Instalação

Dentro do diretório `Redis` digite `make` para executar o container do Redis.

O `make` irá compilar o software, pois o redis não é baixado em formato de executavel, ele é baixado o código fonte, para que seja compilado no servidor, na máquina que ele será utilizado. O redis oferece performance e segurança, pois o código fonte é aberto, e pode ser analisado por qualquer pessoa.

É recomendavel utilizar o `make test`  após a execução do `make`, para verificar se o container está funcionando corretamente.

## Inicialização

Para inicializar o Redis, basta digitar `redis-server` no terminal.

```bash

redis-server

```

passando a flag `--daemonize yes` o Redis irá rodar em background.

```bash

redis-server --daemonize yes

```

Para acessar o console do Redis, basta digitar `redis-cli` no terminal.

```bash

redis-cli

```

Para desligar o Redis, basta digitar `redis-cli shutdown` no terminal.

```bash

redis-cli shutdown

```

Para ecoar uma mensagem no console do Redis, basta digitar `echo "mensagem"` no terminal.

```bash

echo "mensagem"

```


A porta padrão do Redis é a 6379.

#### **Importante**: Quando se desliga o Redis, os dados são perdidos, pois eles são armazenados na memória RAM, e não em disco.

## Comandos

Para acessar os conteudos relacionados aos comandos do Redis, basta acessar [aqui](/Redis/comandos.md)


