-- Exercício 04 

CREATE DATABASE `app_relacionamento`;

USE `app_relacionamento`;

CREATE TABLE `usuario` (
    `id` INT PRIMARY KEY,
    `ctgPreferido` VARCHAR (255),
    `cidade` VARCHAR (255),
    `sexo` CHAR (1),
    `idade` INT,
    `nome` VARCHAR (255)
);

CREATE TABLE `foto` (
    `id` INT PRIMARY KEY,
    `arquivo` BYTEA  (255),
    `formato` VARCHAR (255),
    `idUsuario` INT,
    FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) 
);


CREATE TABLE `avaliacao_foto_usuario`(
    `id_foto` INT,
    `id_usuario` INT,
    `avaliacao` FLOAT,
    PRIMARY KEY (`id_foto`, `id_usuario`),
    FOREIGN KEY (`id_foto`) REFERENCES `foto`(`id`),
    FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id`));