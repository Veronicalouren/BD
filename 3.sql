-- Exercício 03 

CREATE DATABASE `sistemaTrabalho`;

USE `sistemaTrabalho`;

CREATE TABLE `disciplina` (
    `id` INT PRIMARY KEY,
    `nome` VARCHAR (255),
    `cargaHoraria` INT,
    `anoSemestre` VARCHAR (255)
);

CREATE TABLE `trabalho` (
    `id` INT PRIMARY KEY,
    `titulo` VARCHAR (255),
    `arquivo` VARCHAR (255),
    `dataEntrega` DATE,
    `nota` FLOAT,
    `idDisciplina` INT,
    FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`id`));


CREATE TABLE `autor` (
    `id` INT PRIMARY KEY,
    `email` VARCHAR (255),
    `nome` VARCHAR (255)
);

CREATE TABLE `trabalhoAutor` (
    `idTrabalho` INT,
    `idAutor`INT,
    PRIMARY KEY (`idTrabalho`, `idAutor`)
    FOREIGN KEY (`idTrabalho`) REFERENCES `trabalho` (`id`)
    FOREIGN KEY (`idAutor`) REFERENCES `autor`(`id`)
);