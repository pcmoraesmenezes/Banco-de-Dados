# Comandos do Redis

## Tabela de conteúdos

- [Comandos do Redis](#comandos-do-redis)
  - [Básicos](#básicos)
    - [Inserção](#inserção)
        - [Inserção única](#inserção-única)
        - [Inserção múltipla](#inserção-múltipla)
        - [Inserção Única de Hashes](#inserção-única-de-hashes)
    - [Recuperação](#recuperação)
        - [Buscas com *](#buscas-com-)
        - [Buscas com ?](#buscas-com-1)
        - [Buscas de hashes](#buscas-de-hashes)
    - [Atualização](#atualização)
    - [Deleção](#deleção)
        - [Deletar uma chave](#deletar-uma-chave)
        - [Deletar múltiplas chaves](#deletar-múltiplas-chaves)
        - [Deletar um hash](#deletar-um-hash)
  - [Listas](#listas)
    - [Inserção](#inserção-1)
        - [Inserção à esquerda](#inserção-à-esquerda)
        - [Inserção à direita](#inserção-à-direita)
    - [Recuperação](#recuperação-1)
    - [Deleção](#deleção-1)
        

## Básicos

### Inserção 
Setar uma chave e um valor no Redis, basta digitar `set chave valor` no terminal.

#### Inserção única
```bash

set chave valor

```

Setar serve para criar uma chave e um valor no Redis, ou atualizar o valor de uma chave já existente.

#### Inserção múltipla

Para inserir múltiplas chaves, basta digitar `mset chave1 valor1 chave2 valor2` no terminal.

```bash
MSET "nota:03-07-2023:portugues" 6 "nota:05-07-2023:fisica" 9.0 "nota:10-07-2023:quimica" 3
```

#### Inserção Única de Hashes

Um hash é um conjunto de múltiplas chaves e valores, que podem ser recuperados de uma só vez. Para inserir um hash, basta digitar `hmset chave campo1 valor1 campo2 valor2` no terminal.

```bash
 HSET "prova:23-10-2023:Luana" "historia" 9.3 "geografia" 8.1 "matematica" 10 "fisica" 9.1 "ingles" 8
```

### Recuperação

Para recuperar o valor de uma chave, basta digitar `get chave` no terminal.

```bash
get chave
```
#### Buscas com *

Para recuperar todas as chaves, basta digitar `keys *` no terminal.

```bash
keys *
```

É interessante manter um padrão na criação das chaves, para que seja possível recuperar todas as chaves de um determinado padrão. Por exemplo, recuperar todas as chaves com o prefixo `usuario`:

```bash
keys usuario*
```

É possível especificar ainda mais a consulta, como por exemplo recuperar todas as chaves de notas com a data do mês 6:

```bash
keys notas:*-06-*
```

O * seria o equivalente ao `LIKE` do SQL.

Passando os valores dentro de um `[]` é possível recuperar todas as chaves que contenham os caracteres dentro do `[]`. Por exemplo, recuperar todas as chaves de notas do mês 4 ou 6:
    
```bash
keys nota:*-0[46]-*
```

#### Buscas com ?

As buscas com `?` são ainda mais especificas, pois o `?` representa um caractere, e não um conjunto de caracteres como o `*`.

Por exemplo, recuperar todas as notas das disciplinas de 6 caracteres:

```bash
keys notas:*:??????
```
Essas consultas só são possíveis mantendo um padrão na criação das chaves.

#### Buscas de hashes

Para recuperar um hash, basta digitar `hget chave campo` no terminal.

```bash
HGET "prova:23-10-2023:Luana" "ingles"
```

Para recuperar todos os campos de um hash, basta digitar `hgetall chave` no terminal.

```bash
Hgetall "prova:23-10-2023:Luana"
```

Para buscar todas as chaves de um hash, basta digitar `hkeys chave` no terminal.

```bash
Hkeys "prova:23-10-2023:Luana"
```

### Atualização

Para atualizar o valor de uma chave, basta digitar `set chave valor` no terminal.

```bash

set chave valor

```
### Deleção

#### Deletar uma chave

Para deletar uma chave, basta digitar `del chave` no terminal.

```bash

del chave

```
#### Deletar múltiplas chaves

Para deletar múltiplas chaves, basta digitar `del chave1 chave2` no terminal.

```bash
del chave1 chave2
```

#### Deletar um hash

Para deletar um hash, basta digitar `hdel chave` no terminal.

```bash
hdel "prova:23-10-2023:Luana" "ingles"
```

## Listas

No Redis, é possível criar listas, que são conjuntos de valores.

### Inserção

#### Inserção à esquerda

A inserção à esquerda implica que o último elemento inserido será o primeiro a ser recuperado.

Para inserir um elemento em uma lista, basta digitar `lpush chave valor` no terminal.

```bash
lpush "streaming" "Up: Altas Aventuras"
```

É possível inserir múltiplos valores em uma lista, basta digitar `lpush chave valor1 valor2` no terminal.

```bash
lpush "streaming" "Up: Altas Aventuras" "Toy Story"
```

#### Inserção à direita

A inserção à direita implica que o último elemento inserido será o último a ser recuperado.

Para inserir um elemento em uma lista, basta digitar `rpush chave valor` no terminal.

```bash
rpush "streaming" "Star Wars I - A ameaça fantasma"
```

É possível inserir múltiplos valores em uma lista, basta digitar `rpush chave valor1 valor2` no terminal.

```bash
rpush "streaming" "Clube da Luta" "The Big Bang Theory"
```

#### Recuperação

Para recuperar um indice de uma lista, basta digitar `lindex chave indice` no terminal.

```bash
lindex "streaming" 0
```
Lembrando que a inserção de novos elementos é feita a esquerda, então o indice 0 é o último elemento inserido, que nesse caso seria o último lançamento do serviço de streaming.

Para recuperar o último valor de uma lista, basta substituir o indice por `-1`.

```bash
lindex "streaming" -1
```

Para recuperar todos os elementos de uma lista, basta digitar `lrange chave 0 -1` no terminal.

```bash
lrange "streaming" 0 -1
```

Para recuperar o tamanho de uma lista, basta digitar `llen chave` no terminal.

```bash
llen "streaming"
```

### Deleção

Para deletar o último elemento de uma lista, basta digitar `rpop chave` no terminal.

```bash
rpop "streaming" 0
```

Para deletar o primeiro elemento de uma lista, basta digitar `lpop chave` no terminal.

```bash
lpop "streaming" 0
```

Para deletar um elemento de uma lista, basta digitar `lrem chave 0 valor` no terminal.

```bash
lrem "streaming" 0 "Up: Altas Aventuras"
```

Para aparar uma lista, basta digitar `ltrim chave 0 1` no terminal.

Esse comando irá manter apenas os elementos de indice 0 e 1, deletando os demais.

```bash
ltrim "streaming" 0 1
```

## Filas

No Redis, é possível criar filas, que são conjuntos de valores. As filas são muito utilizadas para armazenar mensagens, e são muito utilizadas em sistemas de mensagens e chat.

Não há implementação direta de filas no Redis, mas é possível implementar filas utilizando listas.

### Inserção

Para inserir um elemento em uma fila, basta digitar `rpush chave valor` no terminal.

```bash
RPUSH "fila:confirma-celular" "12312312313"
```

### Recuperação

Para recuperar um elemento de uma fila, basta digitar `lindex chave indice` no terminal.

```bash
lindex "fila:confirma-celular" 0
```

### Deleção

Para deletar um elemento de uma fila, basta digitar `lpop chave` no terminal.

```bash

lpop "fila:confirma-celular"

```

O `lpop` irá recuperar o primeiro elemento da fila, e deletá-lo.

Para remover o ultimo elemento da fila, basta digitar `rpop chave` no terminal.

```bash

rpop "fila:confirma-celular"

```

O `rpop` irá recuperar o último elemento da fila, e deletá-lo.

### Busy Waiting

O busy waiting é uma técnica utilizada para verificar se uma determinada condição é verdadeira, e caso não seja, o programa fica em um loop infinito até que a condição seja verdadeira. O sistema fica esperando até que haja uma mensagem na fila, e quando houver, o sistema irá processar a mensagem. Isso é um problema, pois o sistema fica em um loop infinito, consumindo recursos do servidor.

Há uma forma de resolver esse problema, que é utilizando o `blpop`, que é um comando que irá bloquear o sistema até que haja uma mensagem na fila, e quando houver, o sistema irá processar a mensagem.

```bash
blpop "fila:confirma-celular" 0
```

O `blpop` irá bloquear o sistema pela quantidade de segundos passada como parâmetro, e quando houver uma mensagem na fila, o sistema irá processar a mensagem. Caso tenha elementos para serem processados, o sistema irá processar todos os elementos, e quando não houver mais elementos, o sistema irá bloquear novamente.

A saída é um valor que representa a quantidade de tempo que o sistema ficou bloqueado.

Definindo o timeout como 0, o sistema irá ficar bloqueado até que haja uma mensagem na fila.

Também existe o `brpop`, que funciona da mesma forma que o `blpop`, mas irá recuperar o último elemento da fila.

## Hashes

Como menciona anteriormente, um hash é um conjunto de múltiplas chaves e valores, que podem ser recuperados de uma só vez.

### Incremento Interativo


Imagine o seguinte armazenamento de dados:

```bash
1) "Luana"
2) "750"
3) "Rafael"
4) "800"
5) "Matheus"
6) "470"
7) "Eduardo"
8) "500"
```

Esse sistema está armazenando pontos de um jogo, e o sistema precisa atualizar os pontos de um jogador. Para isso, o sistema precisa recuperar o valor atual de pontos do jogador, e somar com o valor que o jogador fez na última partida. 

Para incrementar um valor, basta digitar `hincrby chave campo valor` no terminal.

```bash
hincrby "pontos" "Rafael" 100
```

Para incrementar um valor de ponto flutuante, basta digitar `hincrbyfloat chave campo valor` no terminal.

```bash
hincrbyfloat "pontos" "Luana" 23.47
```

Observe como está a distribuição de pontos:

```bash
1) "Luana"
2) "750"
3) "Rafael"
4) "900"
5) "Matheus"
6) "470"
7) "Eduardo"
8) "500"
```
### Ordenação

Como mencionado esse sistema está armazenando pontos de um jogo. O ideal seria se ele fosse capaz de armazenar ordenadamente os pontos, ou seja quem possui mais pontos, estaria no topo da lista, e quem possui menos pontos, estaria no final da lista.

É possível ordenar valores com hashes? Sim, é possível, mas não é recomendado. O ideal seria utilizar o `zadd`, que é um comando específico para ordenação.


## Ordenação - (ZSET)

Para recuperar os pontos de forma ordenada, basta digitar `zrange chave 0 -1` no terminal.

Para ordenar, basta digitar `zadd chave valor campo` no terminal.

Essa inserção é feita de forma diferente, pois o `zadd` irá ordenar os valores de acordo com o valor passado como parâmetro, e não de acordo com o indice.

Por padrão, o `zadd` irá ordenar os valores de forma crescente, mas é possível ordenar de forma decrescente, basta digitar `zadd chave valor campo desc` no terminal.

```bash
zadd "pontos" 750 "Luana" 800 "Rafael" 470 "Matheus" 500 "Eduardo"
```

Para recuperar os campos, mas invertendo a ordem, basta digitar `zrevrange chave 0 -1` no terminal.

```bash
zrevrange "pontos" 0 -1
```

Para recuperar o intervalo de valores, basta digitar `zrange chave valor1 valor2` no terminal.

```bash
zrange "pontos" 0 1
```

Para trazer a pontuação basta passar o parâmetro `withscores` no final do comando.

```bash

zrange "pontos" 0 1 withscores

```

O `zscore` irá trazer a pontuação de um determinado campo.

```bash

zscore "pontos" "Luana"

```

O `zrank` irá trazer o indice de um determinado campo.

```bash

zrank "pontos" "Luana"

```

O `zrevrank` irá trazer o indice de um determinado campo, mas invertendo a ordem.

```bash

zrevrank "pontos" "Luana"

```

### Incremento Interativo

Para incrementar um valor, basta digitar `zincrby chave valor campo` no terminal.

```bash
zincrby "pontos" 100 "Rafael"
```

Para incrementar um valor de ponto flutuante, basta digitar `zincrbyfloat chave valor campo` no terminal.

```bash

zincrbyfloat "pontos" 23.47 "Luana"

```