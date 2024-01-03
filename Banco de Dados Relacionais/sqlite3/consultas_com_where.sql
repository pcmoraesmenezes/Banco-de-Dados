-- Filtrando consultas com where

SELECT * FROM tipos_produto WHERE id = 1;

SELECT id, descricao FROM tipos_produto WHERE descricao = 'Sony';

SELECT * FROM produtos WHERE preco < 300;

SELECT nome, preco, codigo_tipo FROM produtos WHERE nome LIKE "%Playstation%";