-- DDL

-- ALTER

ALTER TABLE tipos_produto ADD peso DECIMAL (8,2); -- Aceita 8 digitos e 2 casas decimais, ex: 81234572.22

SELECT * FROM tipos_produto; 

-- DROP 

DROP TABLE tipos_produto; -- Não é possível deletar essa tabela pois ela contém um relacionamento com produtos

DROP TABLE produtos; -- Já essa tabela é possível pois nenhuma outra tabela é dependente da mesma.

ALTER TABLE tipos_produto DROP peso;

ALTER TABLE tipos_produto RENAME TO tipos;

ALTER TABLE tipos  RENAME COLUMN codigo TO id;

SELECT * FROM tipos;

