exercícios com INNER JOIN (O Básico)
1 - Listar Produto e Categoria: Mostre o nome de cada produto ao lado do nome da sua respectiva categoria.
2 - Filtrar por Categoria Específica: Mostre o nome e o preço apenas dos produtos que pertencem à categoria 'Periféricos'.
3 - Filtrar por Fabricante e Categoria: Mostre o nome e o fabricante apenas dos produtos da categoria 'Notebooks'.
4 - Listar Produtos com Preço Alto: Mostre o nome do produto, o nome da categoria e o preço dos produtos que custam mais de R$ 2000,00.

/* Roteiro de Aula: Comandos SELECT (Sintaxe MariaDB)
Banco de Dados: loja_eletronicos
*/

-- 1. APAGAR O BANCO DE DADOS (Se já existir)
DROP DATABASE IF EXISTS `loja_eletronicos`;

-- 2. CRIAR O BANCO DE DADOS
CREATE DATABASE `loja_eletronicos`;

-- 3. USAR O BANCO DE DADOS
USE `loja_eletronicos`;

-- 4. CRIAR AS TABELAS

-- Tabela de Categorias
CREATE TABLE `categorias` (
`idCategoria` INT AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de Produtos
CREATE TABLE `produtos` (
`idProduto` INT AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(150) NOT NULL,
`fabricante` VARCHAR(100),
`preco` DECIMAL(10, 2) NOT NULL,
`estoque` INT DEFAULT 0,
`idCategoria_fk` INT,
`dtCadastro` DATE,
FOREIGN KEY (`idCategoria_fk`) REFERENCES `categorias`(`idCategoria`)
);

-- 5. INSERIR DADOS DE EXEMPLO

-- Inserir Categorias
INSERT INTO `categorias` (`nome`) VALUES
('Notebooks'), -- ID 1
('Smartphones'), -- ID 2
('Periféricos'), -- ID 3
('Monitores'); -- ID 4

-- Inserir Produtos
INSERT INTO `produtos` (`nome`, `fabricante`, `preco`, `estoque`, `idCategoria_fk`, `dtCadastro`) VALUES
('Laptop Pro', 'TechCorp', 4500.00, 15, 1, '2024-01-10'),
('Smartphone X', 'MobileInc', 3200.00, 30, 2, '2024-02-15'),
('Mouse Gamer', 'GamerGear', 250.00, 100, 3, '2024-03-05'),
('Teclado Mecânico', 'GamerGear', 450.00, 50, 3, '2024-03-05'),
('Monitor UltraWide', 'ViewMax', 1800.00, 20, 4, '2024-01-20'),
('Laptop Gamer', 'TechCorp', 6500.00, 10, 1, '2024-02-25'),
('Smartphone Y', 'MobileInc', 1900.00, 40, 2, '2024-04-10'),
('Webcam HD', 'Perifex', 150.00, 0, 3, '2024-05-01'),
('Mouse Pad', NULL, 50.00, 200, 3, '2024-03-06'),
('Monitor 4K', 'ViewMax', 2700.00, 12, 4, '2024-05-15');


-- Exercício 01 
SELECT 
    produtos.nome AS Produto,
    categorias.nome AS Categoria
FROM produtos
INNER JOIN categorias
    ON produtos.idCategoria_fk = categorias.idCategoria;

-- Exercício 02 
SELECT 
    produtos.nome AS Produto,
    produtos.preco AS Preco
FROM produtos
INNER JOIN categorias
    ON produtos.idCategoria_fk = categorias.idCategoria
WHERE categorias.nome = 'Periféricos';

-- Exercício 03 
SELECT 
    produtos.nome AS Produto,
    produtos.fabricante AS Fabricante
FROM produtos
INNER JOIN categorias
    ON produtos.idCategoria_fk = categorias.idCategoria
WHERE categorias.nome = 'Notebooks';

-- Exercício 04 
SELECT 
    produtos.nome AS Produto,
    categorias.nome AS Categoria,
    produtos.preco AS Preco
FROM produtos
INNER JOIN categorias
    ON produtos.idCategoria_fk = categorias.idCategoria
WHERE produtos.preco > 2000;

