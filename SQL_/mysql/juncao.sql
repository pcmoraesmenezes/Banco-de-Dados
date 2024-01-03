CREATE DATABASE juncao;
USE juncao;


CREATE TABLE profissoes(
id INT NOT NULL AUTO_INCREMENT,
cargo VARCHAR(60) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE clientes(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,
data_nascimento DATE NOT NULL,
telefone VARCHAR(11) NOT NULL,
id_profissao INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (id_profissao) REFERENCES profissoes(id)
);

CREATE TABLE consumidor (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
contato VARCHAR(50) NOT NULL,
endereco VARCHAR(100) NOT NULL,
cidade VARCHAR(100) NOT NULL,
cep VARCHAR(20) NOT NULL,
pais VARCHAR(50) NOT NULL
);

INSERT INTO profissoes (cargo ) VALUES 
('Programador'),
('Analista de Sistemas'),
('Suporte'),
('Gerente');


INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('João Pereira', '1981-06-15', '1234-5688', 1);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Ricardo da Silva', '1973-10-10', '2234-5669', 2);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Felipe Oliveira', '1987-08-01', '4234-5640', 3);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Mário Pirez', '1991-02-05', '5234-5621', 1);

INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Alfredo Nunes', 'Maria Nunes', 'Rua da paz, 47', 'São Paulo', '123.456-87', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Ana Trujillo', 'Guilherme Souza', 'Rua Dourada, 452', 'Goiânia', '232.984-23', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Leandro Veloz', 'Pedro Siqueira', 'Rua Vazia, 72', 'São Paulo', '936.738-23', 'Brasil');


# JUNÇÃO DE TABELAS


-- PLANO CARTESIANO COM ESSE TIPO DE CONSULTA SE CONSEGUE FAZER QUALQUER TIPO DE JUNÇÃO
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo AS 'Profissão'
FROM clientes AS c, profissoes AS p
WHERE c.id_profissao = p.id;

-- INNER JOIN 

SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo AS 'Profissão'
FROM clientes AS c
INNER JOIN profissoes AS p 
ON c.id_profissao  = p.id ;

-- LEFT OUTER JOIN

SELECT * FROM clientes 
LEFT OUTER JOIN profissoes 
ON clientes.id_profissao = profissoes.id;

-- RIGHT OUTER JOIN

SELECT * FROM clientes 
RIGHT OUTER JOIN profissoes 
ON clientes.id_profissao = profissoes.id ;

-- FULL OUTER JOIN DO MYSQL

SELECT * FROM clientes 
LEFT OUTER JOIN profissoes 
ON clientes.id_profissao = profissoes.id 
UNION 
SELECT * FROM clientes 
RIGHT OUTER JOIN profissoes 
ON clientes.id_profissao = profissoes.id ;

-- CROSS JOIN 
SELECT c.id , c.nome, c.data_nascimento, c.telefone, p.cargo
FROM clientes AS c
CROSS JOIN profissoes AS p;

-- SELF JOIN 

SELECT a.nome AS Consumidor1, b.nome AS Consumidor2, a.cidade
FROM consumidor AS a
INNER JOIN consumidor AS b
ON a.id <> b.id 
AND a.cidade = b.cidade 
ORDER BY a.cidade;