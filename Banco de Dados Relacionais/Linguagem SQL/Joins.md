# Joins 

Em um banco de dados podemos ter várias tabelas, e em alguns casos precisamos fazer consultas que envolvem mais de uma tabela. Para isso, usamos o comando JOIN.

O comando JOIN é usado para combinar linhas de duas ou mais tabelas, com base em uma coluna relacionada entre elas.

Para criaresta seleção de dados devemos criar os criterios de agrupamento para trazer estes dados. Estes criterios são chamados de Junções (Joins).

Uma junção de tabela cria uma pseudo-tabela derivada de duas ou mais tabelas de acordo com as regras especificadas, e que são parecidas com as regras da teoria dos conjuntos

Imagine o seguinte comando sql para criar a tabela:

```sql

-- Usando SQL padrão
CREATE TABLE profissoes (
    id INT AUTO_INCREMENT,
    cargo VARCHAR(60) NOT NULL,
    PRIMARY KEY (id)
);
```

```sql

CREATE TABLE clientes (
    id INT AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(10) NOT NULL,
    id_profissao INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_profissao) REFERENCES profissoes(id)
);

```

```sql

INSERT INTO profissoes (cargo) VALUES 
('Programador');

INSERT INTO profissoes (cargo) VALUES ('Analista de Sistemas');

INSERT INTO profissoes (cargo) VALUES ('Suporte');

INSERT INTO profissoes (cargo) VALUES ('Gerente');

```

```sql

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES 
('Jõao Pereira', '1981-06-15', '1234-5678', 1);

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES 
('Ricardo da Silva', '1973-10-10', '2234-5698', 2);

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES 
('Felipe Oliveira', '1987-03-10', '1221-4341', 3);

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES 
('Mario Pirez', '1999-04-07', '1212-1314', 1);

```

A tabela está dessa forma até o momento:

| id | cargo                 |
|----|-----------------------|
| 1  | Programador           |
| 2  | Analista de Sistemas  |
| 3  | Suporte               |
| 4  | Gerente               |

| id | nome              | data_nascimento | telefone  | id_profissao |
|----|-------------------|-----------------|-----------|--------------|
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | 1            |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | 2            |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | 3            |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | 1            |

### Junção de produto cartesiano (CROSS JOIN)

A junção de produto cartesiano, ou CROSS JOIN, é uma junção implícita que produz o produto cartesiano de duas tabelas especificadas. O produto cartesiano é o conjunto de todos os registros resultantes da combinação de todos os registros da primeira tabela com todos os registros da segunda tabela.

```sql

SELECT * FROM clientes CROSS JOIN profissoes;

```

| id | nome              | data_nascimento | telefone  | id_profissao | id | cargo                 |
|----|-------------------|-----------------|-----------|--------------|----|-----------------------|
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | 1            | 1  | Programador           |
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | 1            | 2  | Analista de Sistemas  |
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | 1            | 3  | Suporte               |
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | 1            | 4  | Gerente               |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | 2            | 1  | Programador           |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | 2            | 2  | Analista de Sistemas  |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | 2            | 3  | Suporte               |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | 2            | 4  | Gerente               |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | 3            | 1  | Programador           |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | 3            | 2  | Analista de Sistemas  |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | 3            | 3  | Suporte               |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | 3            | 4  | Gerente               |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | 1            | 1  | Programador           |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | 1            | 2  | Analista de Sistemas  |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | 1            | 3  | Suporte               |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | 1            | 4  | Gerente               |


É o mesmo que fazer:

```sql

SELECT * FROM clientes, profissoes;

```

Note que temos um total de 16 registros, pois temos 4 registros na tabela clientes e 4 registros na tabela profissoes, e 4 x 4 = 16.

Cada cliente foi repetido os nomes para cada profissão, e cada profissão foi repetida para cada cliente.

Isso é um problema, pois não queremos que isso aconteça.

Podemos fazer o seguinte para resolver:

```sql

SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo FROM clientes AS c, profissoes AS p, WHERE c.id_profissao = p.id;

```

| id | nome              | data_nascimento | telefone  | cargo                 |
|----|-------------------|-----------------|-----------|-----------------------|
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | Programador           |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | Analista de Sistemas  |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | Suporte               |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | Programador           |

Note que agora temos apenas 4 registros, que é o que queremos.

Cada cliente está relacionado com a sua profissão.

### Junção interna (INNER JOIN)

A junção interna é caracterizada por uma consulta que retorna apenas os dados que antem ás condições de junção, isto é, quais linhas de uma tabela se relacionam com as linhas de outras tabelas.

Para isso utilizamos a clausula ON.

```sql

SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo FROM clientes AS c INNER JOIN profissoes AS p ON c.id_profissao = p.id;

```

| id | nome              | data_nascimento | telefone  | cargo                 |
|----|-------------------|-----------------|-----------|-----------------------|
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | Programador           |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | Analista de Sistemas  |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | Suporte               |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | Programador           |

A clausula ON é usada para especificar as condições de junção, é semelhante ao WHERE, mas é usada para especificar as condições de junção entre as tabelas.

### Junção externa (OUTER JOIN)

A junção externa é caracterizada por uma consulta que retorna todos os dados de uma tabela, mesmo que não haja correspondência com a outra tabela.

Ela não requer que haja correspondência entre as tabelas, mas se houver, ela será exibida.

Esse tipo de junção é dividido em 3 tipos:

- LEFT OUTER JOIN

- RIGHT OUTER JOIN

- FULL OUTER JOIN

#### LEFT OUTER JOIN

A junção externa esquerda, ou LEFT OUTER JOIN, é uma junção que retorna todos os registros da tabela à esquerda, mesmo que não haja correspondência com a tabela à direita.

Desta forma, esta consulta todos os valores da tabela esquerda com os valores da tabela direita correspondente, ou seja, se não houver correspondência, os valores da tabela direita serão nulos.

```sql

SELECT * FROM clientes
LEFT OUTER JOIN profissoes ON clientes.id_profissao = profissoes.id;

```

| id | nome              | data_nascimento | telefone  | id_profissao | id | cargo                 |
|----|-------------------|-----------------|-----------|--------------|----|-----------------------|
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | 1            | 1  | Programador           |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | 2            | 2  | Analista de Sistemas  |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | 3            | 3  | Suporte               |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | 1            | 1  | Programador           |


#### RIGHT OUTER JOIN

A junção externa direita, ou RIGHT OUTER JOIN, é uma junção que retorna todos os registros da tabela à direita, mesmo que não haja correspondência com a tabela à esquerda.

Esta consula é inversa da anterior, ou seja, todos os valores da tabela direita com os valores da tabela esquerda correspondente, ou seja, se não houver correspondência, os valores da tabela esquerda serão nulos.

```sql

SELECT * FROM clientes
RIGHT OUTER JOIN profissoes ON clientes.id_profissao = profissoes.id;

```

| id | nome              | data_nascimento | telefone  | id_profissao | id | cargo                 |
|----|-------------------|-----------------|-----------|--------------|----|-----------------------|
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | 1            | 1  | Programador           |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | 2            | 2  | Analista de Sistemas  |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | 3            | 3  | Suporte               |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | 1            | 1  | Programador           |
| NULL | NULL            | NULL            | NULL      | NULL         | 4  | Gerente               |

#### FULL OUTER JOIN

A junção externa completa, ou FULL OUTER JOIN, é uma junção que retorna todos os registros de ambas as tabelas, mesmo que não haja correspondência entre elas.

Esta consulta retorna todos os valores da tabela esquerda com os valores da tabela direita correspondente, ou seja, se não houver correspondência, os valores da tabela direita serão nulos.

```sql

SELECT * FROM clientes
FULL OUTER JOIN profissoes ON clientes.id_profissao = profissoes.id;

```

| id | nome              | data_nascimento | telefone  | id_profissao | id | cargo                 |
|----|-------------------|-----------------|-----------|--------------|----|-----------------------|
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | 1            | 1  | Programador           |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | 2            | 2  | Analista de Sistemas  |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | 3            | 3  | Suporte               |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | 1            | 1  | Programador           |
| NULL | NULL            | NULL            | NULL      | NULL         | 4  | Gerente               |

Está junção não funciona no MySQL, mas pode ser simulado utilizando um LEFT JOIN e um RIGHT JOIN.

```sql

SELECT * FROM clientes
LEFT OUTER JOIN profissoes ON clientes.id_profissao = profissoes.id
UNION
SELECT * FROM clientes
RIGHT OUTER JOIN profissoes ON clientes.id_profissao = profissoes.id;

```

| id | nome              | data_nascimento | telefone  | id_profissao | id | cargo                 |
|----|-------------------|-----------------|-----------|--------------|----|-----------------------|
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | 1            | 1  | Programador           |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | 2            | 2  | Analista de Sistemas  |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | 3            | 3  | Suporte               |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | 1            | 1  | Programador           |
| NULL | NULL            | NULL            | NULL      | NULL         | 4  | Gerente               |


### Auto Junção (SELF JOIN)

A auto junção, ou SELF JOIN, é uma junção que é usada para combinar uma tabela com ela mesma.

```sql

CREATE TABLE consumidor(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    contato VARCHAR(60) NOT NULL,
    endereco VARCHAR(60) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    cep VARCHAR(60) NOT NULL,
    pais VARCHAR(60) NOT NULL
)

```

```sql

INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES 
('Alfredo Nunes', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany');


INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES 
('Ana Trujillo', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico');


INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES 
('Antonio Moreno', 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico');

``` 

A tabela está dessa forma até o momento:

| id | nome              | contato                          | endereco                       | cidade      | cep   | pais    |
|----|-------------------|----------------------------------|--------------------------------|-------------|-------|---------|
| 1  | Alfredo Nunes     | Maria Anders                     | Obere Str. 57                  | Berlin      | 12209 | Germany |
| 2  | Ana Trujillo      | Ana Trujillo Emparedados y helados | Avda. de la Constitución 2222 | México D.F. | 05021 | Mexico  |
| 3  | Antonio Moreno    | Antonio Moreno Taquería          | Mataderos 2312                 | México D.F. | 05023 | Mexico  |

```sql

SELECT a.nome AS Consumidor1, b.nome AS Consumidor2, a.cidade FROM consumidor AS a,
INNER JOIN consumidor AS b
ON a.id <> b.id
AND a.cidade = b.cidade;

```

| Consumidor1        | Consumidor2                       | cidade      |
|--------------------|-----------------------------------|-------------|
| Ana Trujillo       | Antonio Moreno                    | México D.F. |
| Antonio Moreno     | Ana Trujillo                      | México D.F. |

IDS diferentes, mas cidades iguais.

### Junção Baseada em Comparador (Equi-Join)

A junção baseada em comparador, ou Equi-Join, é uma junção que usa o operador de igualdade para combinar colunas de tabelas.

```sql

SELECT * FROM clientes
JOIN profissoes
ON clientes.id_profissao = profissoes.id;

```

| id | nome              | data_nascimento | telefone  | id_profissao | id | cargo                 |
|----|-------------------|-----------------|-----------|--------------|----|-----------------------|
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | 1            | 1  | Programador           |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | 2            | 2  | Analista de Sistemas  |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | 3            | 3  | Suporte               |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | 1            | 1  | Programador           |


### Junção Natural (Natural Join)

A junção natural, ou Natural Join, é uma junção que é usada para combinar tabelas usando colunas com o mesmo nome de ambas as tabelas.

```sql

SELECT * FROM clientes
NATURAL JOIN profissoes;

```

| id | nome              | data_nascimento | telefone  | id_profissao | cargo                 |
|----|-------------------|-----------------|-----------|--------------|-----------------------|
| 1  | Jõao Pereira      | 1981-06-15      | 1234-5678 | 1            | Programador           |
| 2  | Ricardo da Silva  | 1973-10-10      | 2234-5698 | 2            | Analista de Sistemas  |
| 3  | Felipe Oliveira   | 1987-03-10      | 1221-4341 | 3            | Suporte               |
| 4  | Mario Pirez       | 1999-04-07      | 1212-1314 | 1            | Gerente           |

Observação: O unico campo comum entre as duas tabelas é o campo 'id'. Dessa forma, o resultado está errado, ja que Jõao Pereira e Mario Pirez são programadores, mas Ricardo da Silva e Felipe Oliveira não são Analistas de Sistemas e Suporte, respectivamente.

Esta junção só funciona se as tabelas tiverem colunas com o mesmo nome.

Na tabela de id 1, o campo 'id_profissao' é igual a 1, e na tabela de id 4, o campo 'id_profissao' é igual a 1, por isso o campo 'cargo' é igual a 'Programador' para os dois.

Iguala-se as ids das duas tabelas, e depois pega-se o campo 'cargo' da tabela 'profissoes'.

Uma imagem que ajudará a compreender os joins:

![image](/Linguagem%20SQL/JOINS.png)