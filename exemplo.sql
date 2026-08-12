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