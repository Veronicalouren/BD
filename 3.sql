CREATE DATABASE `escola`;

CREATE TABLE `trabalho` (
    `id` INT PRIMARY KEY,
    `titulo` VARCHAR (255),
    `arquivo` VARCHAR (255),
    `dataEntrega` DATE,
    `nota` FLOAT,
    `idDisciplina` INT,
    FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`id`));

CREATE TABLE `disciplina` (
    `id` INT PRIMARY KEY,
    `nome` VARCHAR (255),
    `cargaHoraria` VARCHAR (255),
    `anoSemestre` VARCHAR (255)
);

CREATE TABLE `autor` (
    `matricula` INT PRIMARY KEY,
    `email` VARCHAR (255),
    `nome` VARCHAR (255)
);

CREATE TABLE `trabalhoAutor` (
    `idTrabalho` INT,
    `matricula`INT,
    FOREIGN KEY (`idTrabalho`) REFERENCES `trabalho` (`id`)
    FOREIGN KEY (`matricula`) REFERENCES `autor`(`matricula`)
);