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


## Filtrando consultas com WHERE

A cláusula WHERE é utilizada para especificar uma condição para a consulta.

Imagine a seguinte tabela de dados:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 1  | João | 20    | SP     |
| 2  | Ana  | 18    | RJ     |
| 3  | José | 20    | SP     |
| 4  | Lua  | 20    | SP     |

### Exemplo 10

```sql

SELECT * FROM alunos WHERE idade = 20;
```

A saída será a seguinte:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 1  | João | 20    | SP     |
| 3  | José | 20    | SP     |
| 4  | Lua  | 20    | SP     |

É possível utilizasr operadores lógicos e aritmeticos para filtrar os resultados.

## Filtrando consultas com LIKE

O operador LIKE é utilizado para filtrar os resultados de acordo com um padrão.

Imagine a seguinte tabela de dados:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 1  | João | 20    | SP     |
| 2  | Ana  | 18    | RJ     |
| 3  | José | 20    | SP     |
| 4  | Lua  | 24    | SP     |

### Exemplo 11

```sql

SELECT * FROM alunos WHERE nome LIKE 'L%';
```

A saída será a seguinte:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 4  | Lua  | 24    | SP     |

Note que o operador LIKE é utilizado para filtrar os resultados de acordo com um padrão, no exemplo acima o padrão é a letra L seguida de qualquer coisa.

### Exemplo 12

```sql

SELECT * FROM alunos WHERE nome LIKE '%a';
```

A saída será a seguinte:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 2  | Ana  | 18    | RJ     |
| 4  | Lua  | 24    | SP     |

Note que o operador LIKE é utilizado para filtrar os resultados de acordo com um padrão, no exemplo acima o padrão é qualquer coisa seguida da letra a.

### Exemplo 13

```sql

SELECT * FROM alunos WHERE nome LIKE '%a%';
```

A saída será a seguinte:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 2  | Ana  | 18    | RJ     |
| 4  | Lua  | 24    | SP     |

Note que o operador LIKE é utilizado para filtrar os resultados de acordo com um padrão, no exemplo acima o padrão é qualquer coisa seguida da letra a seguida de qualquer coisa.

```sql

-- Operador LIke Funciona como uma busca, excelente quando se deseja buscar por  terminações de nomes, endereços, ruas
SELECT * FROM users
WHERE 
first_name LIKE('%is')
-- No exemplo acima, exibimos todos os nomes terminados em 'is', a porcentagem indica que ele deve ignorar tudo que vem antes DELAYED 
-- É possivel também fazer uma pesquisa por inicias de nomes, tendo em vista que a porcentagem ignora o que vem antes

SELECT * FROM users u 
WHERE first_name LIKE 'i%a'; -- EXIBE TODOS OS NOMES INICIADOS COM I E TERMINADOS COM A 

-- É possivel procurar por caracteres dentro de palavras que desejamos, por exemplo, se quisermos verificar se existe o caracter 's' no nome 'isa'
SELECT  * FROM users 
WHERE first_name LIKE '%s%'; -- ENTRETANTO NOTE QUE VARIOS NOMES APARECERAM, ISSO SE DEVE POIS ELE ESTÁ EXIBINDO TODOS OS NOMES QUE POSSUEM 'S', PARA LIMITAR ISSO É BEM SIMPLES

SELECT  * FROM  users u 
WHERE  first_name LIKE 'I%s%a';
-- É Possivel usar o _ para preencher dados que você não tem o conhecimento, exemplo
SELECT  * FROM users
WHERE first_name LIKE 'i__'; -- EXIBE TODOS OS NOMES INICIADOS COM I, QUE TENHAM 3 CARACTERES 

SELECT  * FROM users
WHERE first_name LIKE '___'; -- EXIBE TODOS OS NOMES COM 3 CARACTERES

SELECT  * FROM users
WHERE first_name LIKE 'i_a'; -- EXIBE TODOS NOMES INICIADOS COM I, COM TRES CARACTERES E TERMINADOS EM A

```

## Consultas com Múltiplas Tabelas

Imagine a seguinte tabela de dados:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 1  | João | 20    | SP     |
| 2  | Ana  | 18    | RJ     |
| 3  | José | 20    | SP     |
| 4  | Lua  | 24    | SP     |

Imagine a seguinte tabela de cursos:

| id | nome | carga_horaria |
|----|------|---------------|
| 1  | PHP  | 20            |
| 2  | Java | 30            |
| 3  | C#   | 40            |

Imagine a seguinte tabela de alunos_cursos:

| id | id_aluno | id_curso |
|----|----------|----------|
| 1  | 1        | 1        |
| 2  | 1        | 2        |
| 3  | 2        | 1        |
| 4  | 3        | 3        |
| 5  | 4        | 2        |

### Exemplo 14

```sql

SELECT * FROM alunos_cursos;
```

A saída será a seguinte:

| id | id_aluno | id_curso |
|----|----------|----------|
| 1  | 1        | 1        |
| 2  | 1        | 2        |
| 3  | 2        | 1        |
| 4  | 3        | 3        |
| 5  | 4        | 2        |

### Exemplo 15

```sql

SELECT a.nome, c.nome FROM dados.alunos a, dados.cursos c, dados.alunos_cursos ac WHERE a.id = ac.id_aluno AND c.id = ac.id_curso;
```

A saída será a seguinte:

| nome | nome |
|------|------|
| João | PHP  |
| João | Java |
| Ana  | PHP  |
| José | C#   |
| Lua  | Java |

Só é possível fazer consultas em múltiplas tabelas se houver uma relação entre elas.
A consula está selecionando o nome do aluno e o nome do curso, para isso é necessário relacionar as tabelas alunos, cursos e alunos_cursos.


A condição é que o id do aluno seja igual ao id_aluno da tabela alunos_cursos e que o id do curso seja igual ao id_curso da tabela alunos_cursos.

### Exemplo 16

```sql

SELECT a.nome, c.nome FROM dados.alunos a, dados.cursos c, dados.alunos_cursos ac WHERE a.id = ac.id_aluno AND c.id = ac.id_curso AND c.nome = 'Java';
```

A saída será a seguinte:

| nome | nome |
|------|------|
| João | Java |
| Lua  | Java |

### Exemplo 17

```sql

SELECT a.nome, c.nome FROM dados.alunos a, dados.cursos c, dados.alunos_cursos ac WHERE a.id = ac.id_aluno AND c.id = ac.id_curso AND a.nome = 'Lua';
```

A saída será a seguinte:

| nome | nome |
|------|------|
| Lua  | Java |

### Exemplo 18

```sql

SELECT a.nome, c.nome FROM dados.alunos a, dados.cursos c, dados.alunos_cursos ac WHERE a.id = ac.id_aluno AND c.id = ac.id_curso AND a.nome = 'Lua' AND c.nome = 'Java';
```

A saída será a seguinte:

| nome | nome |
|------|------|
| Lua  | Java |

### Exemplo 19

```sql

SELECT a.nome, a.cidade c.nome FROM dados.alunos a, dados.cursos c, dados.alunos_cursos ac WHERE a.id = ac.id_aluno AND c.id = ac.id_curso AND a.cidade = 'SP';
```

A saída será a seguinte:

| nome | nome |
|------|------|
| João | Java |
| João | PHP  |
| José | C#   |
| Lua  | Java |

