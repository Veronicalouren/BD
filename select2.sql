-- 1. APAGAR O BANCO DE DADOS (Se já existir)
DROP DATABASE IF EXISTS `clinica_veterinaria`;

-- 2. CRIAR O BANCO DE DADOS
CREATE DATABASE `clinica_veterinaria`;

-- 3. USAR O BANCO DE DADOS
USE `clinica_veterinaria`;

-- 4. CRIAR AS TABELAS

-- Tabela de Tutores (Donos dos animais)
CREATE TABLE `Tutores` (
    `idTutor` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) UNIQUE,
    `telefone` VARCHAR(20),
    `cidade` VARCHAR(50)
);

-- Tabela de Veterinários
CREATE TABLE `Veterinarios` (
    `idVeterinario` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `crmv` VARCHAR(15) NOT NULL UNIQUE,
    `especialidade` VARCHAR(100) DEFAULT 'Clínico Geral'
);

-- Tabela de Animais (Foco principal dos exercícios)
CREATE TABLE `Animais` (
    `idAnimal` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `especie` VARCHAR(50), -- Ex: Cachorro, Gato, Ave
    `raca` VARCHAR(50),
    `dtNascimento` DATE,
    `peso_kg` DECIMAL(5, 2),
    `idTutor_fk` INT,
    `obs` TEXT, -- Coluna para testar IS NULL
    FOREIGN KEY (`idTutor_fk`) REFERENCES `Tutores`(`idTutor`)
);

-- Tabela de Consultas (Foco principal dos exercícios)
CREATE TABLE `Consultas` (
    `idConsulta` INT AUTO_INCREMENT PRIMARY KEY,
    `idAnimal_fk` INT,
    `idVeterinario_fk` INT,
    `dtConsulta` DATETIME,
    `motivo` VARCHAR(255),
    `diagnostico` TEXT, -- Coluna para testar IS NOT NULL
    `custo` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`idAnimal_fk`) REFERENCES `Animais`(`idAnimal`),
    FOREIGN KEY (`idVeterinario_fk`) REFERENCES `Veterinarios`(`idVeterinario`)
);


-- 5. INSERIR DADOS DE EXEMPLO

-- Inserir Tutores
INSERT INTO `Tutores` (`nome`, `email`, `telefone`, `cidade`) VALUES
('Ana Silva', 'ana.silva@email.com', '(11) 98888-1111', 'São Paulo'),
('Bruno Costa', 'bruno.costa@email.com', '(21) 97777-2222', 'Rio de Janeiro'),
('Carla Dias', 'carla.dias@email.com', '(31) 96666-3333', 'Belo Horizonte'),
('Daniel Moreira', 'daniel.moreira@email.com', '(48) 95555-4444', 'Florianópolis'),
('Elisa Fernandes', NULL, '(51) 94444-5555', 'Porto Alegre');

-- Inserir Veterinários
INSERT INTO `Veterinarios` (`nome`, `crmv`, `especialidade`) VALUES
('Dr. Ricardo Alves', 'SP-12345', 'Clínico Geral'),
('Dra. Beatriz Lima', 'RJ-54321', 'Cirurgiã'),
('Dr. Mário Sérgio', 'MG-98765', 'Dermatologista'),
('Dra. Lúcia Mendes', 'SP-11223', 'Clínico Geral');

-- Inserir Animais
INSERT INTO `Animais` (`nome`, `especie`, `raca`, `dtNascimento`, `peso_kg`, `idTutor_fk`, `obs`) VALUES
('Thor', 'Cachorro', 'Labrador', '2022-05-15', 28.50, 1, NULL),
('Mia', 'Gato', 'Siamês', '2021-10-01', 4.20, 2, 'Alérgica a frutos do mar'),
('Loki', 'Cachorro', 'Golden Retriever', '2023-01-20', 25.10, 1, 'Muito agitado'),
('Bolinha', 'Cachorro', 'Pug', '2019-03-10', 8.70, 3, NULL),
('Piu-Piu', 'Ave', 'Canário', '2023-11-30', 0.15, 4, NULL),
('Frajola', 'Gato', 'Persa', '2018-07-25', 5.50, 5, 'Necessita escovação diária'),
('Max', 'Cachorro', 'Pastor Alemão', '2020-02-12', 32.00, 2, 'Cão de guarda'),
('Nemo', 'Peixe', 'Peixe-Palhaço', '2024-01-05', 0.10, 3, NULL),
('Garfield', 'Gato', 'SRD', '2021-04-01', 6.80, 4, 'Come muito');

-- Inserir Consultas
INSERT INTO `Consultas` (`idAnimal_fk`, `idVeterinario_fk`, `dtConsulta`, `motivo`, `diagnostico`, `custo`) VALUES
(1, 1, '2025-01-10 10:30:00', 'Check-up anual', 'Saudável', 150.00),
(2, 2, '2025-01-12 14:00:00', 'Vacina V5', 'Aplicação de vacina', 80.00),
(4, 1, '2025-02-05 09:15:00', 'Problema de pele', 'Dermatite alérgica', 180.00),
(3, 3, '2025-02-15 11:00:00', 'Coceira intensa', 'Dermatite (tratamento iniciado)', 200.00),
(1, 1, '2025-03-20 16:00:00', 'Vômito', 'Gastroenterite leve', 220.00),
(5, 4, '2025-04-01 10:00:00', 'Asa machucada', NULL, 100.00),
(7, 2, '2025-04-10 12:00:00', 'Check-up e vacina', 'Saudável, vacina anti-rábica aplicada', 190.00),
(2, 1, '2025-05-05 15:30:00', 'Espirros', 'Rinotraqueíte felina', 170.00),
(6, 3, '2025-05-15 08:30:00', 'Consulta dermatológica', 'Revisão da dermatite', 120.00);

-- Exercício 01 
SELECT 
    `nome` AS 'Nome do Tutor',
    `cidade` AS 'Cidade'
FROM `Tutores`;

-- Exercício 02 
SELECT 
    `nome` AS 'Veterinário(a)',
    `especialidade` AS 'Especialidade'
FROM `Veterinarios`;

-- Exercício 03 
SELECT 
    `nome` AS 'Nome do Animal',
    `peso_kg` AS  'Peso(kg)'
FROM `Animais`; 

-- Exercício 04 
SELECT 
    `dtConsulta` AS 'Data da Consulta',
    `custo` AS 'Valor(R$)'
FROM `Consultas`;

-- Exercíco 05 
SELECT `nome` 
FROM `Tutores` ORDER BY `nome` ASC; 

-- Exercício 06 
SELECT `nome`
FROM `Animais` ORDER BY `nome` DESC; 

-- Exercício 07 
SELECT `nome`, `peso_kg`
FROM `Animais` ORDER BY `peso_kg` DESC;

-- Exercício 08 
SELECT `motivo`, `custo`
FROM `Consultas` ORDER BY `custo` ASC;

-- Exercício 09 
SELECT `nome`, `dtNascimento`
FROM `Animais` ORDER BY `dtNascimento` DESC; 

-- Exercício 10 
SELECT `nome`, `dtNascimento`
FROM `Animais` ORDER BY `dtNascimento` ASC; 

-- Exercício 11 
SELECT `motivo`, `dtConsulta`
FROM `Consultas` ORDER BY `dtConsulta` DESC; 

-- Exercício 12 
SELECT `nome`, `especie`
FROM `Animais` ORDER BY `especie` ASC, `nome` ASC;

-- Exercício 13 
SELECT *
FROM `Animais`
ORDER BY `idAnimal` ASC
LIMIT 5;

-- Exercício 14
SELECT *
FROM Consultas
ORDER BY idConsulta ASC
LIMIT 3;

-- Exercício 15 
SELECT *
FROM Tutores
ORDER BY idTutor ASC
LIMIT 2;

-- Exercício 16 
SELECT *
FROM Tutores
ORDER BY idTutor ASC
LIMIT 2, 2;

-- Exercício 17
SELECT
nome AS 'Animal Mais Pesado',
peso_kg AS 'Peso (kg)'
FROM Animais
ORDER BY peso_kg DESC
LIMIT 1;

-- Exercício 18 
SELECT
motivo AS 'Motivo',
diagnostico AS 'Diagnóstico',
custo AS 'Valor'
FROM Consultas
ORDER BY custo DESC
LIMIT 1;


-- Exercício 19 
SELECT
`nome` AS 'Nome',
`especie` AS 'Espécie',
`dtNascimento` AS 'Nascimento'
FROM Animais
ORDER BY dtNascimento DESC
LIMIT 3;

-- Exercício 20 
SELECT
dtConsulta AS 'Data',
motivo AS 'Motivo'
FROM Consultas
ORDER BY dtConsulta ASC
LIMIT 2;




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

