-- SCRIPTS NO USUARIO PRINCIPAL

CREATE TABLE empresas (

	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	quantidade_funcionarios INT NOT NULL,
	cidade VARCHAR(50) NOT NULL
);

-- DCL

CREATE USER estagiario WITH PASSWORD '123456'; -- Criando um usuario estagiario e atribuindo uma senha a ele

-- CONCEDER PRIVILEGIOS AO USUARIO

GRANT ALL ON empresas TO estagiario; -- Conceda todos os privilegios para o usuario estagiario na tabela empresas


GRANT USAGE, SELECT ON SEQUENCE empresas_id_seq TO estagiario; -- Concedendo permissão de utilização através de select para o usuario estagiario no tipo especifico que seria empresas_id_seq 

-- SCRIPTS NO USUARIO ESTAGIARIO

-- Será que o estagiario consegue inserir dados?

INSERT INTO empresas (nome, quantidade_funcionarios, cidade) VALUES 
	('Apple', 4500, 'Cuppertino'),
	('Microsoft', 20123, 'São Paulo'),
	('Amazon', 123, 'Manhattan');
	

-- Será que o estagiario consegue dar select nos dados?

SELECT * FROM empresas;

-- Será que o estagiario consegue atualizar dados?

UPDATE empresas SET quantidade_funcionarios = 124 WHERE id = 3;

-- Será que o estagiario consegue deletar dados?

DELETE FROM empresas WHERE id = 1;



-- SCRIPTS NO USUARIO PRINCIPAL

-- ATÉ AQUI O ESTAGIARIO CONSEGUE REALIZAR OPERAÇÕES DE INSERT, SELECT, UPDATE, DELETE...

-- MAS AGORA VAMOS REMOVER ESSAS PERMISSÕES!

REVOKE ALL ON empresas FROM estagiario; -- TODAS AS PERMISSÕES DA TABELA EMPRESA DO ESTAGIARIO FORAM REMOVIDAS 

-- SCRIPTS NO USUARIO ESTAGIARIO

-- APÓS A REMOÇÃO DAS PERMISSÕES

-- SELECT?

SELECT * FROM empresas; -- Permissão negada

-- Insert?

INSERT INTO empresas (nome, quantidade_funcionarios, cidade) VALUES ('teste', 123, 'teste'); -- Permissão negada

-- Update?

UPDATE empresas SET quantidade_funcionarios = 1234; -- Permissão negada!

-- Delete?

DELETE FROM empresas; -- Permissão negada!

-- É comum fornecer apenas informações de leitura a um membro novo a uma empresa, como por exemplo um estagiario
-- SCRIPTS NO USUARIO PRINCIPAL

GRANT SELECT ON empresas TO estagiario;

-- SCRIPTS NO USUARIO ESTAGIARIO

-- Após permitirmos que o estagiario tenha permissão de SELECT

SELECT * FROM empresas; -- Funciona!

-- Ele possuí apenas acesso a leitura

-- SCRIPTS NO USUARIO PRINCIPAL

DROP USER estagiario; -- Não é possível pois ele ainda tem relação com a tabela

REVOKE ALL ON empresas FROM estagiario;

-- Ainda assim não é possível...

REVOKE USAGE, SELECT ON SEQUENCE empresas_id_seq FROM estagiario;

DROP USER estagiario; -- Agora foi possível!!