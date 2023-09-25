# Funções de Agregação

Ao desenvolver sistemas é muito comum que uma aplicação necesside de informações resumidas, como por exemplo obter a menor ou maior venda do dia.

A linguagem SQL contém diversas funções nativas para esse fim, que são chamadas de funções de agregação.

Imagine a seguinte tabela que servirá de exemplo para as funções de agregação:

| id | nome | valor |
|----|------|-------|
| 1  | A    | 10    |
| 2  | B    | 20    |
| 3  | C    | 30    |
| 4  | D    | 40    |
| 5  | E    | 50    |


## Função MAX

A função MAX retorna o maior valor de uma coluna.

```sql
SELECT MAX(valor) FROM tabela;
```

O resultado será:

| MAX(valor) |
|------------|
| 50         |


### Clausula HAVING

A clausula HAVING é utilizada para filtrar os resultados de uma consulta que contenha funções de agregação.

```sql

SELECT MAX(valor) FROM tabela HAVING MAX(valor) > 30;

```

O resultado será:

| MAX(valor) |
|------------|
| 50         |

### Clausula GROUP BY

A clausula GROUP BY é utilizada para agrupar os resultados de uma consulta que contenha funções de agregação.

```sql

SELECT MAX(valor) FROM tabela GROUP BY nome;

```

O resultado será:

| MAX(valor) |
|------------|
| 10         |
| 20         |
| 30         |
| 40         |
| 50         |


## Função MIN

A função MIN retorna o menor valor de uma coluna.

```sql

SELECT MIN(valor) FROM tabela;

```

O resultado será:

| MIN(valor) |
|------------|
| 10         |


## Função SUM

A função SUM retorna a soma dos valores de uma coluna.

```sql

SELECT SUM(valor) FROM tabela;

```

O resultado será:

| SUM(valor) |
|------------|
| 150        |


## Função AVG

A função AVG retorna a média dos valores de uma coluna.

```sql

SELECT AVG(valor) FROM tabela;

```

O resultado será:

| AVG(valor) |
|------------|
| 30         |


## Função ROUND

A função ROUND retorna o valor arredondado de uma coluna.

```sql

SELECT ROUND(valor, 2) FROM tabela;

```

O resultado será:

| ROUND(valor) |
|--------------|
| 10.00        |
| 20.00        |
| 30.00        |
| 40.00        |
| 50.00        |

## Função COUNT

A função COUNT retorna a quantidade de registros de uma coluna.

```sql

SELECT COUNT(valor) FROM tabela;

```

O resultado será:

| COUNT(valor) |
|--------------|
| 5            |
    
