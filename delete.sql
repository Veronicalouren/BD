DROP DATABASE IF EXISTS `empresa`; -- Apaga o database, se ele já existir
CREATE DATABASE `empresa`;
USE `empresa`;
CREATE TABLE `cliente` (
 `cpf` CHAR(14) PRIMARY KEY,
 `nome` VARCHAR(100) NOT NULL,
 `telefone` BIGINT NOT NULL
);
CREATE TABLE `empregado` (
 `cpf` CHAR(14) PRIMARY KEY,
 `nome` VARCHAR(100) NOT NULL,
 `cargo` VARCHAR(100) NOT NULL
);
CREATE TABLE `projeto` (
 `codProj` INT PRIMARY KEY AUTO_INCREMENT,
 `nome` VARCHAR(100) NOT NULL,
 `descricao` VARCHAR(100) NOT NULL,
 `preco` DECIMAL(10,2) NOT NULL,
 `dtFim` DATE NOT NULL,
 `dtEstimada` DATE NOT NULL,
 `dtSolicitacao` DATE NOT NULL,
 `cpfGerente` CHAR(14) NOT NULL,
 `cpfCliente` CHAR(14) NOT NULL,
 FOREIGN KEY (`cpfCliente`) REFERENCES `cliente`(`cpf`),
 FOREIGN KEY (`cpfGerente`) REFERENCES `empregado`(`cpf`)
);
CREATE TABLE `projEmp` (
 `codProj` INT,
 `cpfEmpregado` CHAR(14),
 `hrTrab` FLOAT
);
ALTER TABLE `projEmp` 
ADD CONSTRAINT PRIMARY KEY (`codProj`, `cpfEmpregado`);
ALTER TABLE `projEmp` 
ADD CONSTRAINT FOREIGN KEY (`cpfEmpregado`) REFERENCES `empregado`(`cpf`);
ALTER TABLE `projEmp` 
ADD CONSTRAINT FOREIGN KEY (`codProj`) REFERENCES `projeto`(`codProj`);


-- Exercício 01
UPDATE `cliente`
SET `telefone` = '48998765432'
WHERE `cpf` = '111.111.111-11';

-- Exercício 02
UPDATE `empregado`
SET `cargo` = 'Desenvolvedor Sênior'
WHERE `cpf`= '333.333.333-33';

-- Exercício 03
DELETE FROM `cliente`
WHERE `cpf` = '555.555.555-55';

-- Exercício 04 
UPDATE `projeto`
SET `preco` = `preco` * 1.10 

-- Exercício 05
DELETE `projEmp` 
