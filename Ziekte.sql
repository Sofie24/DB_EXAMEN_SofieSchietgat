-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `Gene_ID` INT UNSIGNED NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Location` VARCHAR(45) NOT NULL,
  `Information` TEXT(200) NOT NULL,
  PRIMARY KEY (`Gene_ID`),
  UNIQUE INDEX `Gene_ID_UNIQUE` (`Gene_ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `Diagnose` INT UNSIGNED NOT NULL,
  `Chromosomal location` VARCHAR(45) NOT NULL,
  `Gene_ID` INT UNSIGNED NOT NULL,
  `Patient_idPatient` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Diagnose`),
  INDEX `Diagnose_idx` (`Gene_ID` ASC),
  CONSTRAINT `Diagnose`
    FOREIGN KEY (`Gene_ID`)
    REFERENCES `mydb`.`Gene` (`Gene_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT UNSIGNED NOT NULL,
  `Patient_name` VARCHAR(45) NOT NULL,
  `Sex` VARCHAR(6) NOT NULL DEFAULT 'Male',
  `Age` INT UNSIGNED NOT NULL,
  `Diagnose` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idPatient`),
  UNIQUE INDEX `idPatient_UNIQUE` (`idPatient` ASC),
  INDEX `fk_Patient_1_idx` (`Diagnose` ASC),
  CONSTRAINT `fk_Patient_1`
    FOREIGN KEY (`Diagnose`)
    REFERENCES `mydb`.`Mutation` (`Diagnose`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
