CREATE DATABASE `gravadora`;

CREATE TABLE `cantor` (
    `id` INT PRIMARY KEY,
    `nome` VARCHAR (255)
);

CREATE TABLE `musica` (
    `id` INT PRIMARY KEY,
    `titulo` VARCHAR (255),
    `letra` VARCHAR (1000)
);

CREATE TABLE `gravacao` (
    `id` INT PRIMARY KEY,
    `duracao` INT,
    `idCantor` INT,
    `idMusica` INT,
    FOREIGN KEY (`idCantor`) REFERENCES `cantor` (`id`)
    FOREIGN KEY (`idMusica`) REFERENCES `musica`(`id`)
);

CREATE TABLE `compositor` (
    `cpf` VARCHAR (14) PRIMARY KEY,
    `nome` VARCHAR (255)
);

CREATE TABLE `musicaCompositor` (
    `cpfCompositor` INT,
    `idMusica` INT,
    FOREIGN KEY (`cpfCompositor`) REFERENCES `compositor` (`cpf`)
    FOREIGN KEY (`idMusica`) REFERENCES `musica` (`id`)
);

