-- Exercício 01 

CREATE DATABASE `sistemaContato`;

CREATE TABLE `grupo` (
    `id` INT PRIMARY KEY,
    `nome` VARCHAR (255),
    `grauImportancia` CHAR(1)
    );

CREATE TABLE `contato`(
    `id` INT PRIMARY KEY, 
    `nome` VARCHAR (255),
    `ocupacao` VARCHAR (255),
    `endereco` VARCHAR (255),
    `email` VARCHAR (255),
    `idGrupo` INT,
    FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`id`));

CREATE TABLE `telefone` (
    `id` INT PRIMARY KEY,
    `rotulo` VARCHAR (255),
    `numero` VARCHAR(255),
    `idContato` INT, 
    FOREIGN KEY (`idContato`) REFERENCES `contato` (`id`));
