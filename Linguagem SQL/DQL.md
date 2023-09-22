# DQL - Data Query Language

No subgrupo DQL tem-se apenas um comando SQL: SELECT.

O comando SELECT é utilizado para realizar consultas no banco de dados.

## Sintaxe

```sql
SELECT [DISTINCT] <colunas> FROM <tabela> [WHERE <condição>] [ORDER BY <colunas> [ASC|DESC]] [LIMIT <número>];
```

- DISTINCT: Opcional, utilizado para retornar apenas valores distintos.

- colunas: Opcional, utilizado para especificar as colunas que serão retornadas.

- tabela: Obrigatório, utilizado para especificar a tabela que será consultada.

- WHERE: Opcional, utilizado para especificar uma condição para a consulta.

- ORDER BY: Opcional, utilizado para ordenar os resultados da consulta.

- ASC|DESC: Opcional, utilizado para especificar a ordem da ordenação, ASC para ascendente e DESC para descendente.

- LIMIT: Opcional, utilizado para limitar a quantidade de resultados retornados.

## Exemplos

### Exemplo 1 

```sql

SELECT * FROM alunos;
```

### Exemplo 2

```sql
SELECT nome, idade FROM alunos;
```

### Exemplo 3

```sql

SELECT DISTINCT nome FROM alunos;
```

Embora tenha apenas um comando, o SELECT, a linguagem SQL possui muitas cláusulas que podem ser utilizadas para realizar consultas mais complexas.

Imagine a seguinte tabela alunos:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 1  | João | 20    | SP     |
| 2  | Ana  | 18    | RJ     |
| 3  | José | 20    | SP     |
| 4  | Ana  | 20    | SP     |
| 5  | Ana  | 18    | SP     |

### Exemplo 4

```sql
SELECT nome, idade FROM alunos WHERE idade = 20;
```
A saída será a seguinte:

| nome | idade |
|------|-------|
| João | 20    |
| José | 20    |
| Ana  | 20    |

### Exemplo 5

```sql
SELECT nome, idade FROM alunos WHERE idade = 20 AND cidade = 'SP';
```

A saída será a seguinte:

| nome | idade |
|------|-------|
| João | 20    |
| Ana  | 20    |

### Exemplo 6

```sql
SELECT nome, idade FROM alunos WHERE idade = 20 OR cidade = 'SP';
```

A saída será a seguinte:

| nome | idade |
|------|-------|
| João | 20    |
| José | 20    |
| Ana  | 20    |
| Ana  | 18    |
| Ana  | 18    |

### Exemplo 7

```sql
SELECT * FROM alunos ORDER BY nome;
```

A saída será a seguinte:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 2  | Ana  | 18    | RJ     |
| 4  | Ana  | 20    | SP     |
| 5  | Ana  | 18    | SP     |
| 1  | João | 20    | SP     |
| 3  | José | 20    | SP     |


Observe:

- A cláusula WHERE é utilizada para especificar uma condição para a consulta.

- A cláusula ORDER BY é utilizada para ordenar os resultados da consulta.

- A cláusula ASC é utilizada para especificar a ordem da ordenação, ASC para ascendente e DESC para descendente.

- Utilizar * no lugar das colunas é uma forma de selecionar todas as colunas da tabela.

## Apelidos:

É possível utilizar apelidos para as tabelas e colunas, para isso basta utilizar a palavra AS.

Suponha essa nova tabela de produtos:

| id | nome | preco | quantidade |
|----|------|-------|------------|
| 1  | Arroz| 10.00 | 100        |
| 2  | Feijão| 5.00 | 50        |
| 3  | Macarrão | 3.00 | 200        |

### Exemplo 8

```sql
SELECT nome AS produto, preco AS valor FROM produtos;
```

A saída será a seguinte:

| produto | valor |
|---------|-------|
| Arroz   | 10.00 |
| Feijão  | 5.00  |
| Macarrão| 3.00  |

Note a utilização da palavra AS para criar apelidos para as colunas.

Isso resultou em uma tabela com colunas de nomes diferentes a tabela original

É possível dar apelido para a tabela:

### Exemplo 9

```sql

SELECT p.nome AS produto, p.preco AS valor FROM produtos AS p;
```

A saída será a seguinte:

| produto | valor |
|---------|-------|
| Arroz   | 10.00 |
| Feijão  | 5.00  |
| Macarrão| 3.00  |
