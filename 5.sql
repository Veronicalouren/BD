-- Exercício 05

CREATE DATABASE `empresa`;

USE `empresa`;

CREATE TABLE `departamento`(
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255),
    `numero` INT);

CREATE TABLE `empregado`(
    `rg` INT PRIMARY KEY,
    `nome` VARCHAR(255),
    `sexo` CHAR(1),
    `data_nascimento` DATE,
    `data_admissao` DATE,
    `salario` FLOAT,
    `id_departamento` INT,
    FOREIGN KEY (`id_departamento`) REFERENCES `departamento`(`id`));

CREATE TABLE `dependente`(
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255),
    `sexo` CHAR(1),
    `data_nascimento` DATE,
    `grau_parentesco` VARCHAR(255),
    `rg_empregado` INT,
    FOREIGN KEY (`rg_empregado`) REFERENCES `empregado`(`rg`));

CREATE TABLE `endereco`(
    `id` INT PRIMARY KEY,
    `logradouro` VARCHAR(255),
    `numero` INT,
    `complemento` VARCHAR(255),
    `bairro` VARCHAR(255),
    `cidade` VARCHAR(255),
    `estado` CHAR(2),
    `cep` VARCHAR(10),
    `id_empregado` INT,
    FOREIGN KEY (`id_empregado`) REFERENCES `empregado`(`id`));

CREATE TABLE `gerencia`(
    `id` INT PRIMARY KEY,
    `id_empregado` INT,
    `id_departamento` INT,
    FOREIGN KEY (`id_empregado`) REFERENCES `empregado`(`id`),
    FOREIGN KEY (`id_departamento`) REFERENCES `departamento`(`id`));

CREATE TABLE `trabalha_em`(
    `id_empregado` INT,
    `id_departamento` INT,
    PRIMARY KEY (`id_empregado`, `id_departamento`),
    FOREIGN KEY (`id_empregado`) REFERENCES `empregado`(`id`),
    FOREIGN KEY (`id_departamento`) REFERENCES `departamento`(`id`));

