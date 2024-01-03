# Funções de data e hora

No comando SQL SELECT, há diversas funções que foram embutidas para facilitar o manuseio de alguns tipos de dados em determinadas condições

## Função CURDATE

A função CURDATE retorna a data atual.

```sql

SELECT CURDATE();

```

O resultado será:

| CURDATE()   |
|-------------|
| 2019-10-10  |


## Função CURTIME

A função CURTIME retorna a hora atual.

```sql

SELECT CURTIME();

```

O resultado será:

| CURTIME()   |
|-------------|
| 12:00:00    |


## Função CURRENT_TIME

A função CURRENT_TIME retorna a hora atual.

```sql

SELECT CURRENT_TIME();

```

O resultado será:

| CURRENT_TIME()   |
|-------------|
| 12:00:00    |

## Função DATE_ADD (data, INTERVAL quantidade_de_tempo)

A função DATE_ADD adiciona uma quantidade de tempo a uma data.

```sql

SELECT DATE_ADD(CURDATE(), INTERVAL 1 DAY);

```

O resultado será:

| DATE_ADD(CURDATE(), INTERVAL 1 DAY)   |
|-------------|
| 2019-10-11  |

Utilizado em pagamento de boletos.

## Função DATE_SUB (data, INTERVAL quantidade_de_tempo)

A função DATE_SUB subtrai uma quantidade de tempo a uma data.

```sql

SELECT DATE_SUB(CURDATE(), INTERVAL 1 DAY);

```

O resultado será:

| DATE_SUB(CURDATE(), INTERVAL 1 DAY)   |
|-------------|
| 2019-10-09  |

## Função DATEDIFF (data1, data2)

A função DATEDIFF retorna a diferença entre duas datas.

```sql

SELECT DATEDIFF(CURDATE(), '2019-10-01');

```

O resultado será:

| DATEDIFF(CURDATE(), '2019-10-01')   |
|-------------|
| 9           |

## Função DAYNAME (data)

A função DAYNAME retorna o nome do dia da semana de uma data.

```sql

SELECT DAYNAME(CURDATE());

```

O resultado será:

| DAYNAME(CURDATE())   |
|-------------|
| Thursday    |

Colocandi em português:

```sql

SELECT DAYNAME(CURDATE()) AS 'Dia da semana';

```

O resultado será:

| Dia da semana   |
|-------------|
| Quinta-feira    |


## Função DATE_FORMAT (data, formato)

A função DATE_FORMAT retorna uma data formatada.

```sql

SELECT DATE_FORMAT(CURDATE(), '%d/%m/%Y');

```

O resultado será:

| DATE_FORMAT(CURDATE(), '%d/%m/%Y')   |
|-------------|
| 10/10/2019  |


## Funçaõ NOW

A função NOW retorna a data e hora atual.

```sql

SELECT NOW();

```

O resultado será:

| NOW()   |
|-------------|
| 2023/25/09 07:56  |