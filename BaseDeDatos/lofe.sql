-- MySQL Script generated by MySQL Workbench
-- Sat Sep 21 12:22:43 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lofe
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lofe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lofe` DEFAULT CHARACTER SET utf8 ;
USE `lofe` ;

-- -----------------------------------------------------
-- Table `lofe`.`emocion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lofe`.`emocion` (
  `idEmocion` INT(11) NOT NULL AUTO_INCREMENT,
  `Emo_Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmocion`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lofe`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lofe`.`usuario` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombresUsuario` VARCHAR(45) NOT NULL,
  `APAUsuario` VARCHAR(45) NOT NULL,
  `AMAUsuario` VARCHAR(45) NOT NULL,
  `correoUsuario` VARCHAR(45) NOT NULL,
  `nicknameUsuario` VARCHAR(45) NOT NULL,
  `sexoUsuario` VARCHAR(20) NULL DEFAULT NULL,
  `contrasenaUsuario` VARCHAR(45) NOT NULL,
  `NOCUENTA` INT NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lofe`.`evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lofe`.`evento` (
  `idEvento` INT(11) NOT NULL AUTO_INCREMENT,
  `Usuario` INT NOT NULL,
  `NombreEvento` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(255) NOT NULL,
  `Imagen` VARCHAR(45) NOT NULL,
  `Fecha` VARCHAR(100) NOT NULL,
  `Lugar_idLugar` VARCHAR(100) NOT NULL,
  `Emocion_idEmocion` INT(11) NOT NULL,
  `usuario_idUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`idEvento`, `Emocion_idEmocion`, `usuario_idUsuario`),
  INDEX `fk_Evento_Emocion1_idx` (`Emocion_idEmocion` ASC),
  INDEX `fk_evento_usuario1_idx` (`usuario_idUsuario` ASC),
  CONSTRAINT `fk_Evento_Emocion1`
    FOREIGN KEY (`Emocion_idEmocion`)
    REFERENCES `lofe`.`emocion` (`idEmocion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `lofe`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lofe`.`historia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lofe`.`historia` (
  `evento_idEvento` INT(11) NOT NULL,
  `evento_Emocion_idEmocion` INT(11) NOT NULL,
  `evento_usuario_idUsuario` INT(11) NOT NULL,
  INDEX `fk_Historia_evento1_idx` (`evento_idEvento` ASC, `evento_Emocion_idEmocion` ASC, `evento_usuario_idUsuario` ASC),
  CONSTRAINT `fk_Historia_evento1`
    FOREIGN KEY (`evento_idEvento` , `evento_Emocion_idEmocion` , `evento_usuario_idUsuario`)
    REFERENCES `lofe`.`evento` (`idEvento` , `Emocion_idEmocion` , `usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lofe`.`cuestionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lofe`.`cuestionario` (
  `idcuestionario` INT NOT NULL AUTO_INCREMENT,
  `usuario_idUsuario` INT(11) NOT NULL,
  `cuestionarioPParte` INT NULL,
  `cuestionarioSPartel` INT NULL,
  `cuestionarioTParte` INT NULL,
  `cuestionarioFecha` DATE NOT NULL,
  PRIMARY KEY (`idcuestionario`),
  INDEX `fk_cuestionario_usuario1_idx` (`usuario_idUsuario` ASC),
  CONSTRAINT `fk_cuestionario_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `lofe`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;