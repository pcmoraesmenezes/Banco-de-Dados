# Comandos do Redis

## Tabela de conteúdos

- [Comandos do Redis](#comandos-do-redis)
  - [Básicos](#básicos)
    - [Inserção](#inserção)
    - [Recuperação](#recuperação)
    - [Atualização](#atualização)
    - [Deleção](#deleção)

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