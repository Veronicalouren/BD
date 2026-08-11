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


-- Exercìcio 01 

CREATE DATABASE `sistemaContato`;

CREATE TABLE `grupo` (
    `id` INT PRIMARY KEY,
    `nome` VARCHAR (255),
    `grauImportancia` INT
    );

CREATE TABLE `contato`(
    `id` INT PRIMARY KEY, 
    `nome` VARCHAR (255),
    `ocupacao` VARCHAR (255),
    `endereco` VARCHAR (255),
    `email` VARCHAR (255),
    `idGrupo` INT,
    FOREIGN KEY (idGrupo) REFERENCES `grupo` (`id`));

CREATE TABLE `telefone` (
    `id` INT PRIMARY KEY,
    `rotulo` VARCHAR (255),
    `numero` INT,
    `idContato` INT, 
    FOREIGN KEY (idContato) REFERENCES `contato` (`id`));
