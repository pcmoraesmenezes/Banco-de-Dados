USE farmacia;

# Realizando consultas simples

-- tipos produtos

SELECT * FROM tipos_produtos;

SELECT id, tipo FROM tipos_produtos;

SELECT tipo, id FROM tipos_produtos;

SELECT id, tipo FROM tipos_produtos ORDER BY id DESC;

-- fabricantes

SELECT * FROM fabricantes;

-- médicos

SELECT * FROM medicos;

SELECT id, nome, CRM FROM medicos ORDER BY CRM DESC;

-- clientes

SELECT * FROM cliente

SELECT nome, COUNT(*) AS quantidade -- seleciona os clientes com mesmo nome
FROM cliente
GROUP BY nome
HAVING COUNT(*) > 1;

SELECT localidade, COUNT(*) AS quantidade
FROM cliente
GROUP BY localidade 
HAVING COUNT(*) > 1;

SELECT * FROM cliente WHERE localidade = "Belo Horizonte";

SELECT c.nome AS "Nome do Cliente", c.endereco AS "Endereço do Cliente", c.telefone AS "Telefone do Cliente" FROM cliente c;

SELECT * FROM cliente WHERE
id BETWEEN 3 AND 5;

SELECT * FROM cliente WHERE 
nome LIKE 'P%' ORDER  BY nome ASC;


SELECT * FROM cliente WHERE 
nome like '%r' OR nome like '%n';

SELECT * FROM cliente WHERE
nome like 'T__%' OR 
endereco LIKE '___ do_ A%';


-- Compras

SELECT * FROM compras;

SELECT id_cliente, nome FROM compras, cliente
WHERE cliente.id = compras.id_cliente 

-- Produtos compra

SELECT * FROM produtos_compra;

-- Receitas médicas

SELECT * FROM receitas_medica;

SELECT receitas_medica.receita, receitas_medica.id_medico, medicos.nome
FROM receitas_medica
INNER JOIN medicos ON medicos.id = receitas_medica.id_medico;






