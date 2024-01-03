# Funções de Agrupamento e Ordenação

Tabelas que servirão como exemplos:

Tabela tipos:

|id|nome|
|----|----|
|1|A|
|2|B|
|3|C|
|4|D|
|5|E|

Tabela funcionarios:

|id|nome|tipo_id|salario|
|----|----|----|----|
|1|Rafael|1|60000|
|2|Paulo|1|50000|
|3|Jonas|2|30000|
|4|Lua|2|40000|
|5|Guilherme|3|50500|

Tabela projetos:

|id|nome|tipo_id|funcionario_id|
|----|----|----|----|
|1|Projeto 1|1|1|
|2|Projeto 2|1|1|
|3|Projeto 3|2|3|
|4|Projeto 4|2|3|
|5|Projeto 5|3|5|


## Group By

A clausula GROUP BY é utilizada para agrupar os resultados de uma consulta que contenha funções de agregação.

```sql
SELECT tipo_id, SUM(salario) FROM funcionarios GROUP BY tipo_id;
```

O resultado será:

|tipo_id|SUM(salario)|
|----|----|
|1|110000|
|2|70000|
|3|50500|


Outro exemplo:

```sql

SELECT tipo_id, SUM(salario) FROM funcionarios GROUP BY tipo_id HAVING SUM(salario) > 100000;

```

O resultado será:

|tipo_id|SUM(salario)|
|----|----|
|1|110000|

Outro exemplo:

```sql

SELECT tipo_projeto_id, SUM(salario) FROM funcionarios INNER JOIN projetos ON funcionarios.id = projetos.funcionario_id GROUP BY tipo_projeto_id;

```

O resultado será:

|tipo_projeto_id|SUM(salario)|
|----|----|
|1|110000|
|2|70000|
|3|50500|

### Explicação detalhada do Group By

```sql

SELECT tipo_projeto_id, SUM(salario) FROM funcionarios INNER JOIN projetos ON funcionarios.id = projetos.funcionario_id GROUP BY tipo_projeto_id;

```

O resultado será:

|tipo_projeto_id|SUM(salario)|
|----|----|

Primeiro, o banco de dados irá fazer o join entre as tabelas funcionarios e projetos, e o resultado será:

|id|nome|tipo_id|salario|id|nome|tipo_id|funcionario_id|
|----|----|----|----|----|----|----|----|
|1|Rafael|1|60000|1|Projeto 1|1|1|
|1|Rafael|1|60000|2|Projeto 2|1|1|
|3|Jonas|2|30000|3|Projeto 3|2|3|
|3|Jonas|2|30000|4|Projeto 4|2|3|
|5|Guilherme|3|50500|5|Projeto 5|3|5|

Depois, o banco de dados irá agrupar os resultados pelo tipo_projeto_id, e o resultado será:

|tipo_projeto_id|SUM(salario)|
|----|----|
|1|110000|
|2|70000|
|3|50500|

O group by é utilizado para agrupar os resultados de uma consulta que contenha funções de agregação.

```sql

CREATE DATABASE agrupamento;

USE agrupamento;

CREATE TABLE tipos(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE fabricantes(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE produtos(
	id INT NOT NULL AUTO_INCREMENT, 
	nome VARCHAR(60) NOT NULL,
	id_fabricante INT NOT NULL,
	quantidade INT NOT NULL,
	id_tipo int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id),
	FOREIGN KEY (id_tipo) REFERENCES tipos(id)
);

``` 
``` sql
INSERT INTO tipos (nome) VALUES ('Console');
INSERT INTO tipos (nome) VALUES ('Notebook');
INSERT INTO tipos (nome) VALUES ('Celular');
INSERT INTO tipos (nome) VALUES ('Smartphone');
INSERT INTO tipos (nome) VALUES ('Sofá');
INSERT INTO tipos (nome) VALUES ('Armário');
INSERT INTO tipos (nome) VALUES ('Refrigerador');

INSERT INTO fabricantes (nome) VALUES ('Sony');
INSERT INTO fabricantes (nome) VALUES ('Dell');
INSERT INTO fabricantes (nome) VALUES ('Microsoft');
INSERT INTO fabricantes (nome) VALUES ('Samsung');
INSERT INTO fabricantes (nome) VALUES ('Apple');
INSERT INTO fabricantes (nome) VALUES ('Beline');
INSERT INTO fabricantes (nome) VALUES ('Magno');
INSERT INTO fabricantes (nome) VALUES ('CCE');
INSERT INTO fabricantes (nome) VALUES ('Nintendo');

INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Playstation 3', 1, 100, 1);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Core 2 Duo 4GB RAM 500GB HD', 2, 200, 2);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Xbox 360 120GB', 3, 350, 1);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('GT-I6220 Quad band', 4, 300, 3);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('iPhone 4 32GB', 5, 50, 4);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Playstation 2', 1, 100, 1);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Sofá Estofado', 6, 200, 5);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Armário de Serviço', 7, 50, 6);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Refrigerador 420L', 8, 200, 7);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Wii 120GB', 8, 250, 1);

```

```sql

-- Group By
SELECT t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS 'Quantidade em Estoque' 
	FROM tipos AS t, fabricantes AS f, produtos AS p 
    	WHERE t.id = p.id_tipo AND f.id = p.id_fabricante 
    	GROUP BY t.nome, f.nome;
``` 

```sql


-- Having
SELECT t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS 'Quantidade em Estoque' 
	FROM tipos AS t, fabricantes AS f, produtos AS p 
    	WHERE t.id = p.id_tipo AND f.id = p.id_fabricante 
    	GROUP BY t.nome, f.nome
    	HAVING SUM(p.quantidade) > 200;
``` 

```sql

-- Order By ASC
SELECT * FROM produtos;

``` 

```sql
SELECT id, nome, id_tipo, id_fabricante, quantidade  FROM produtos ORDER BY id ASC;


``` 

```sql

-- Order by DESC
SELECT id, nome, id_tipo, id_fabricante, quantidade FROM produtos ORDER BY quantidade DESC;

``` 


Com essa nova tabela, vamos fazer um exemplo de Group By, Order By e Having

```sql

SELECT t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS 'Quantidade em Estoque' 
    FROM tipos AS t, fabricantes AS f, produtos AS p 
    	WHERE t.id = p.id_tipo AND f.id = p.id_fabricante 
    	GROUP BY t.nome, f.nome
    	HAVING SUM(p.quantidade) > 200
    	ORDER BY SUM(p.quantidade) DESC;
``` 

A tabela resultante será:

|Tipo|Fabricante|Quantidade em Estoque|
|----|----|----|
|Console|Sony|450|
|Notebook|Dell|200|
|Celular|Samsung|300|
|Sofá|Beline|200|
|Refrigerador|Magno|200|
|Console|Microsoft|100|
|Celular|Apple|50|
|Console|Nintendo|50|


Por padrão a ordenação é feita em ordem crescente, mas podemos alterar isso utilizando a palavra reservada DESC.

```sql

SELECT t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS 'Quantidade em Estoque' 
    FROM tipos AS t, fabricantes AS f, produtos AS p 
    	WHERE t.id = p.id_tipo AND f.id = p.id_fabricante 
    	GROUP BY t.nome, f.nome
    	HAVING SUM(p.quantidade) > 200
    	ORDER BY SUM(p.quantidade) DESC;
```

O resultado será:

|Tipo|Fabricante|Quantidade em Estoque|
|----|----|----|
|Console|Sony|450|
|Celular|Samsung|300|
|Notebook|Dell|200|
|Sofá|Beline|200|
|Refrigerador|Magno|200|
|Console|Microsoft|100|
|Celular|Apple|50|
|Console|Nintendo|50|

