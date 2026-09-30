SELECT * FROM `produtos` WHERE `nome` LIKE '%Laptop%'

SELECT 
    `nome` AS 'Nome do Produto',
    `fabricante` AS 'Marca',
    `dtCadastro` AS 'Data de Cadastro'
FROM `produtos`;


-- Ordem alfabética (A-Z ou 0-9)
-- Listar os produtos em ordem alfabética
SELECT `nome`, `preco`
FROM `produtos` ORDER BY `nome` ASC; 

-- Ordenar pelo preço (alto --> baixo)
SELECT
    `nome` AS 'Nome',
    `preco` AS 'Preço'
FROM `produtos` ORDER BY `preco` DESC; 

-- Top 5 produtos mais caros 
SELECT `nome`, `preco`
FROM `prodtutos` ORDER BY `preco` LIMIT 5;

-- Paginação 
-- Página 1 
SELECT `idProduto`, `nome`, `preco`
FROM `produtos` LIMIT 0,5;
-- Página 2 
SELECT `idProduto`, `nome`, `preco`
FROM `produtos` LIMIT 5,5;
-- Página 3 
SELECT `idProduto`, `nome`, `preco`
FROM `produtos` LIMIT 10,5;
