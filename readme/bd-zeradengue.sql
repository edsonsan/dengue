-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema zeradengue_banco_dados
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `zeradengue_banco_dados` ;

-- -----------------------------------------------------
-- Schema zeradengue_banco_dados
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zeradengue_banco_dados` ;
USE `zeradengue_banco_dados` ;

-- -----------------------------------------------------
-- Table `usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuarios` ;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `data_cadastro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` TINYINT(1) NOT NULL DEFAULT 1,
  `nome` VARCHAR(45) NOT NULL DEFAULT 'Anônimo',
  `imagem` VARCHAR(200) NOT NULL DEFAULT 'no_image.png',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `status` ;

CREATE TABLE IF NOT EXISTS `status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estados` ;

CREATE TABLE IF NOT EXISTS `estados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sigla` VARCHAR(2) NOT NULL,
  `estadoscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cidades` ;

CREATE TABLE IF NOT EXISTS `cidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(80) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `estados_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cidades_estados1_idx` (`estados_id` ASC) VISIBLE,
  CONSTRAINT `fk_cidades_estados1`
    FOREIGN KEY (`estados_id`)
    REFERENCES `estados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ocorrencias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocorrencias` ;

CREATE TABLE IF NOT EXISTS `ocorrencias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `imagem` VARCHAR(200) NOT NULL DEFAULT 'no_image.png',
  `descricao` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(80) NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `data_hora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarios_id` INT NOT NULL,
  `status_id` INT NOT NULL DEFAULT 1,
  `cidades_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ocorrencias_usuarios_idx` (`usuarios_id` ASC) VISIBLE,
  INDEX `fk_ocorrencias_status1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_ocorrencias_cidades1_idx` (`cidades_id` ASC) VISIBLE,
  CONSTRAINT `fk_ocorrencias_usuarios`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ocorrencias_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ocorrencias_cidades1`
    FOREIGN KEY (`cidades_id`)
    REFERENCES `cidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
