-- MySQL Script generated by MySQL Workbench
-- Tue Jun 20 19:30:50 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProyectoFinal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProyectoFinal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProyectoFinal` DEFAULT CHARACTER SET utf8 ;
USE `ProyectoFinal` ;

-- -----------------------------------------------------
-- Table `ProyectoFinal`.`Categoria_Norma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProyectoFinal`.`Categoria_Norma` ;

CREATE TABLE IF NOT EXISTS `ProyectoFinal`.`Categoria_Norma` (
  `idCategoria` INT NOT NULL,
  `Descripción` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoFinal`.`Tipo_Normativa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProyectoFinal`.`Tipo_Normativa` ;

CREATE TABLE IF NOT EXISTS `ProyectoFinal`.`Tipo_Normativa` (
  `idTipo_Normativa` INT NOT NULL,
  `Descripción` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipo_Normativa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoFinal`.`Organo_Publico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProyectoFinal`.`Organo_Publico` ;

CREATE TABLE IF NOT EXISTS `ProyectoFinal`.`Organo_Publico` (
  `idOrganos` INT NOT NULL,
  `Organos_Legislativos` VARCHAR(45) NOT NULL,
  `ambito_Aplicacion` INT NOT NULL,
  PRIMARY KEY (`idOrganos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoFinal`.`Descripcion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProyectoFinal`.`Descripcion` ;

CREATE TABLE IF NOT EXISTS `ProyectoFinal`.`Descripcion` (
  `idDescripcion` INT NOT NULL,
  `Descripcion_Norma` VARCHAR(120) NULL,
  `Palabras_Claves` VARCHAR(45) NULL,
  PRIMARY KEY (`idDescripcion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoFinal`.`Normativa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProyectoFinal`.`Normativa` ;

CREATE TABLE IF NOT EXISTS `ProyectoFinal`.`Normativa` (
  `idNormativa` INT NOT NULL,
  `Numero_Normativa` VARCHAR(45) NULL,
  `idCategoria` INT NOT NULL,
  `Tipo_Normativa_idTipo_Normativa` INT NOT NULL,
  `Organos` INT NOT NULL,
  `idDescripcion` INT NOT NULL,
  PRIMARY KEY (`idNormativa`, `Tipo_Normativa_idTipo_Normativa`, `Organos`, `idCategoria`, `idDescripcion`),
  INDEX `idCategoria_idx` (`idCategoria` ASC) VISIBLE,
  INDEX `fk_Normativa_Tipo_Normativa1_idx` (`Tipo_Normativa_idTipo_Normativa` ASC) VISIBLE,
  INDEX `idOrganos_idx` (`Organos` ASC) VISIBLE,
  INDEX `idDescripcion_idx` (`idDescripcion` ASC) VISIBLE,
  CONSTRAINT `idCategoria`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `ProyectoFinal`.`Categoria_Norma` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Normativa_Tipo_Normativa1`
    FOREIGN KEY (`Tipo_Normativa_idTipo_Normativa`)
    REFERENCES `ProyectoFinal`.`Tipo_Normativa` (`idTipo_Normativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idOrganos`
    FOREIGN KEY (`Organos`)
    REFERENCES `ProyectoFinal`.`Organo_Publico` (`idOrganos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idDescripcion`
    FOREIGN KEY (`idDescripcion`)
    REFERENCES `ProyectoFinal`.`Descripcion` (`idDescripcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
