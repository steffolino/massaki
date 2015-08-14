-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Rechnungstool
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Rechnungstool
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Rechnungstool` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Rechnungstool` ;

-- -----------------------------------------------------
-- Table `Rechnungstool`.`col_def`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rechnungstool`.`col_def` (
  `colDefId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `colName` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`colDefId`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rechnungstool`.`default_col_config`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rechnungstool`.`default_col_config` (
  `colConfigId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `col1` INT NULL COMMENT '',
  `col2` INT NULL COMMENT '',
  `col3` INT NULL COMMENT '',
  `col4` INT NULL COMMENT '',
  `col5` INT NULL COMMENT '',
  `col6` INT NULL COMMENT '',
  `col7` INT NULL COMMENT '',
  `col8` INT NULL COMMENT '',
  `col9` INT NULL COMMENT '',
  `col10` INT NULL COMMENT '',
  `col11` INT NULL COMMENT '',
  `col12` INT NULL COMMENT '',
  PRIMARY KEY (`colConfigId`)  COMMENT '',
  INDEX `col1_idx` (`col1` ASC)  COMMENT '',
  INDEX `col2_idx` (`col2` ASC)  COMMENT '',
  INDEX `col3_idx` (`col3` ASC)  COMMENT '',
  INDEX `col4_idx` (`col4` ASC)  COMMENT '',
  INDEX `col5_idx` (`col5` ASC)  COMMENT '',
  INDEX `col6_idx` (`col6` ASC)  COMMENT '',
  INDEX `col7_idx` (`col7` ASC)  COMMENT '',
  INDEX `col8_idx` (`col8` ASC)  COMMENT '',
  INDEX `col9_idx` (`col9` ASC)  COMMENT '',
  INDEX `col10_idx` (`col10` ASC)  COMMENT '',
  INDEX `col11_idx` (`col11` ASC)  COMMENT '',
  INDEX `col12_idx` (`col12` ASC)  COMMENT '',
  CONSTRAINT `col1`
    FOREIGN KEY (`col1`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `col2`
    FOREIGN KEY (`col2`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `col3`
    FOREIGN KEY (`col3`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `col4`
    FOREIGN KEY (`col4`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `col5`
    FOREIGN KEY (`col5`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `col6`
    FOREIGN KEY (`col6`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `col7`
    FOREIGN KEY (`col7`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `col8`
    FOREIGN KEY (`col8`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `col9`
    FOREIGN KEY (`col9`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `col10`
    FOREIGN KEY (`col10`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `col11`
    FOREIGN KEY (`col11`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `col12`
    FOREIGN KEY (`col12`)
    REFERENCES `Rechnungstool`.`col_def` (`colDefId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rechnungstool`.`jva_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rechnungstool`.`jva_data` (
  `jvaDataId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `jvaName` VARCHAR(255) NOT NULL COMMENT '',
  `jvaAddress` VARCHAR(255) NOT NULL COMMENT '',
  `jvaColConfig` INT NOT NULL COMMENT '',
  `jvaNameExt` VARCHAR(45) NULL COMMENT '',
  `jvaFooter` TEXT(255) NULL COMMENT '',
  PRIMARY KEY (`jvaDataId`)  COMMENT '',
  INDEX `jvaColConfig_idx` (`jvaColConfig` ASC)  COMMENT '',
  CONSTRAINT `jvaColConfig`
    FOREIGN KEY (`jvaColConfig`)
    REFERENCES `Rechnungstool`.`default_col_config` (`colConfigId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rechnungstool`.`counter_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rechnungstool`.`counter_type` (
  `counterTypeId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `counterType` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`counterTypeId`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rechnungstool`.`document`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rechnungstool`.`document` (
  `documentId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `counterTypeId` INT NOT NULL COMMENT '',
  `counter` VARCHAR(45) NOT NULL COMMENT '',
  `yearCounter` INT NOT NULL COMMENT '',
  `jvaId` INT NOT NULL COMMENT '',
  `docType` VARCHAR(45) NOT NULL COMMENT '',
  `pdf_location` VARCHAR(255) NULL COMMENT '',
  `contact_person` VARCHAR(255) NULL COMMENT '',
  `printed` VARCHAR(1) NULL COMMENT '',
  PRIMARY KEY (`documentId`)  COMMENT '',
  INDEX `counterTypeId_idx` (`counterTypeId` ASC)  COMMENT '',
  INDEX `jvaId_idx` (`jvaId` ASC)  COMMENT '',
  CONSTRAINT `counterTypeId`
    FOREIGN KEY (`counterTypeId`)
    REFERENCES `Rechnungstool`.`counter_type` (`counterTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `jvaId`
    FOREIGN KEY (`jvaId`)
    REFERENCES `Rechnungstool`.`jva_data` (`jvaDataId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rechnungstool`.`collective_invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rechnungstool`.`collective_invoice` (
  `collectInvoiceId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `deliveryNoteId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`collectInvoiceId`)  COMMENT '',
  INDEX `deliveryNoteId_idx` (`deliveryNoteId` ASC)  COMMENT '',
  CONSTRAINT `deliveryNoteId`
    FOREIGN KEY (`deliveryNoteId`)
    REFERENCES `Rechnungstool`.`document` (`documentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rechnungstool`.`last_used_counter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rechnungstool`.`last_used_counter` (
  `lastUsedCounterId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `lastUsedCounterTypeId` INT NOT NULL COMMENT '',
  `lastUsedCounterStatus` INT NOT NULL COMMENT '',
  PRIMARY KEY (`lastUsedCounterId`)  COMMENT '',
  INDEX `lastUsedCounterTypeId_idx` (`lastUsedCounterTypeId` ASC)  COMMENT '',
  CONSTRAINT `lastUsedCounterTypeId`
    FOREIGN KEY (`lastUsedCounterTypeId`)
    REFERENCES `Rechnungstool`.`counter_type` (`counterTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rechnungstool`.`document_values`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rechnungstool`.`document_values` (
  `valueId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `documentId` INT NOT NULL COMMENT '',
  `value1` VARCHAR(255) NULL COMMENT '',
  `value2` VARCHAR(255) NULL COMMENT '',
  `value3` VARCHAR(255) NULL COMMENT '',
  `value4` VARCHAR(255) NULL COMMENT '',
  `value5` VARCHAR(255) NULL COMMENT '',
  `value6` VARCHAR(255) NULL COMMENT '',
  `value7` VARCHAR(255) NULL COMMENT '',
  `value8` VARCHAR(255) NULL COMMENT '',
  `value9` VARCHAR(255) NULL COMMENT '',
  `value10` VARCHAR(255) NULL COMMENT '',
  `value11` VARCHAR(255) NULL COMMENT '',
  `value12` VARCHAR(255) NULL COMMENT '',
  `header6` VARCHAR(45) NULL COMMENT '',
  `header1` VARCHAR(45) NULL COMMENT '',
  `header2` VARCHAR(45) NULL COMMENT '',
  `header3` VARCHAR(45) NULL COMMENT '',
  `header4` VARCHAR(45) NULL COMMENT '',
  `header5` VARCHAR(45) NULL COMMENT '',
  `header7` VARCHAR(45) NULL COMMENT '',
  `header8` VARCHAR(45) NULL COMMENT '',
  `header9` VARCHAR(45) NULL COMMENT '',
  `header10` VARCHAR(45) NULL COMMENT '',
  `header11` VARCHAR(45) NULL COMMENT '',
  `header12` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`valueId`)  COMMENT '',
  INDEX `documentId_idx` (`documentId` ASC)  COMMENT '',
  CONSTRAINT `documentId`
    FOREIGN KEY (`documentId`)
    REFERENCES `Rechnungstool`.`document` (`documentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
