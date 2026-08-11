CREATE DATABASE `aplicativo`;

CREATE TABLE `foto` (
    `id` INT PRIMARY KEY,
    `arquivo` VARCHAR (255),
    `formato` VARCHAR (255),
    `idUsuario` INT,
    FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) 
);

CREATE TABLE `usuario` (
    `id` INT PRIMARY KEY,
    `ctgPreferido` VARCHAR (255),
    `cidade` VARCHAR (255),
    `sexo` VARCHAR (255),
    `idade` INT,
    `nome` VARCHAR (255)
);

CREATE TABLE `avaliacao` (
    `idAvaliador` INT,
    `idAvaliado` INT, 
    `avaliacao` VARCHAR (255)
    FOREIGN KEY (`idAvaliador`) REFERENCES `usuario` (`id`)
    FOREIGN KEY (`idAvaliado`) REFERENCES `usuario` (`id`)
);
