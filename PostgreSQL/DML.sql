-- SELECT * FROM tipos_produto;

SELECT * FROM produtos;

 -- Update
 UPDATE tipos_produto SET descricao = 'Nobreak' WHERE codigo = 2;

 UPDATE produtos set descricao = 'Notebook', preco = '2800' WHERE codigo = 2;

-- Cuidado Update (sem o WHERE)

 -- O pgAdmin4 irá permitir utilizar de forma errada o UPDATE
 UPDATE produtos SET descricao = 'Notebook', preco = '2800';

 -- Delete
 DELETE FROM tipos_produto WHERE codigo = 1;

 DELETE FROM produtos WHERE codigo = 2;

 -- Cuidado Delete (sem o WHERE)

 -- O pgAdmin4 não irá impedir a remocao incorreta dos elementos
 DELETE FROM produtos;