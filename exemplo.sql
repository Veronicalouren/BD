banco de dados 
-- Data: 04/08/26
-- Lista de Exercícios 4 

-- Exercício Teste

CREATE TABLE `departamento` (
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255);

CREATE TABLE `departamento` (
    `id` INT,
    `nome` VARCHAR (255),
    CONSTRAINT `departamento_pk` PRIMARY KEY (`id`)
);
    
CREATE TABLE `empregado`(
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255),
    `id_depto` INT,
    FOREIGN KEY (`id_depto`) REFERENCES `departamento` (`id`));




-------------------------------------------------------

CREATE DATABASE `test`;

CREATE TABLE  `cliente` (
    `cpf` CHAR(14) PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `telefone` BIGINT NOT NULL
);
INSERT INTO `cliente` (cpf, nome, telefone) VALUES
('111.111.111-11', 'Ana Carolina Souza', 48991234567),
('222.222.222-22', 'Bruno Costa', 47988765432),
('333.333.333-33', 'Ana Clara Ferreira', 48999998888),
('444.444.444-44', 'Carlos de Souza', 51981817171),
('555.555.555-55', 'Cliente Teste Antigo', 99999999999);

-- DELETE
DELETE FROM `cliente` WHERE 
`cpf` = '111.111.111-11';

DELETE FROM `cliente`
WHERE `nome` LIKE 'Ana %';

-- UPDATE 
UPDATE `cliente`
SET `telefone` = '48991708067'
WHERE `cpf` = '222.222.222-22'

UPDATE `cliente`
SET `nome` = 'Ricardo Alves', `telefone` = '11976543210'
WHERE `cpf` = '555.555.555-55';