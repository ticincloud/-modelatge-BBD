-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ita_cul_ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ita_cul_ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ita_cul_ampolla` DEFAULT CHARACTER SET utf8 ;
USE `ita_cul_ampolla` ;

-- -----------------------------------------------------
-- Table `ita_cul_ampolla`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita_cul_ampolla`.`supplier` (
  `id_supplier` INT(11) NOT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `street` VARCHAR(100) NULL DEFAULT NULL,
  `number` VARCHAR(10) NULL DEFAULT NULL,
  `floor` VARCHAR(10) NULL DEFAULT NULL,
  `door` VARCHAR(10) NULL DEFAULT NULL,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `postal_code` VARCHAR(10) NULL DEFAULT NULL,
  `country` VARCHAR(50) NULL DEFAULT NULL,
  `phone` VARCHAR(15) NULL DEFAULT NULL,
  `fax` VARCHAR(15) NULL DEFAULT NULL,
  `NIF` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`id_supplier`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ita_cul_ampolla`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita_cul_ampolla`.`brand` (
  `id_brand` INT(11) NOT NULL,
  `id_supplier` INT(11) NOT NULL,
  `brand` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_brand`),
  INDEX `supplier_brand` (`id_supplier` ASC) VISIBLE,
  CONSTRAINT `supplier_brand`
    FOREIGN KEY (`id_supplier`)
    REFERENCES `ita_cul_ampolla`.`supplier` (`id_supplier`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ita_cul_ampolla`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita_cul_ampolla`.`customer` (
  `id_customer` INT(11) NOT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `address` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(15) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `registration_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_customer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ita_cul_ampolla`.`customer_recommendation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita_cul_ampolla`.`customer_recommendation` (
  `id_recommendation` INT(11) NOT NULL,
  `id_customer_has_recommended` INT(11) NULL DEFAULT NULL,
  `id_customer_have_recommended` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_recommendation`),
  INDEX `customer_has_recommended` (`id_customer_has_recommended` ASC) VISIBLE,
  INDEX `customer_have_recommended` (`id_customer_have_recommended` ASC) VISIBLE,
  CONSTRAINT `customer_has_recommended`
    FOREIGN KEY (`id_customer_has_recommended`)
    REFERENCES `ita_cul_ampolla`.`customer` (`id_customer`),
  CONSTRAINT `customer_have_recommended`
    FOREIGN KEY (`id_customer_have_recommended`)
    REFERENCES `ita_cul_ampolla`.`customer` (`id_customer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ita_cul_ampolla`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita_cul_ampolla`.`employee` (
  `id_employee` INT(11) NOT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_employee`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ita_cul_ampolla`.`frame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita_cul_ampolla`.`frame` (
  `id_frame` INT(11) NOT NULL,
  `description` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_frame`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ita_cul_ampolla`.`glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita_cul_ampolla`.`glasses` (
  `id_glasses` INT(11) NOT NULL,
  `id_brand` INT(11) NULL DEFAULT NULL,
  `id_frame` INT(11) NULL DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `left glass graduation` FLOAT NULL DEFAULT NULL,
  `right glass graduation` FLOAT NULL DEFAULT NULL,
  `left glass color` VARCHAR(50) NULL DEFAULT NULL,
  `right glass color` VARCHAR(50) NULL DEFAULT NULL,
  `price` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id_glasses`),
  INDEX `brand_glasses` (`id_brand` ASC) VISIBLE,
  INDEX `glasses_frame` (`id_frame` ASC) VISIBLE,
  CONSTRAINT `brand_glasses`
    FOREIGN KEY (`id_brand`)
    REFERENCES `ita_cul_ampolla`.`brand` (`id_brand`),
  CONSTRAINT `glasses_frame`
    FOREIGN KEY (`id_frame`)
    REFERENCES `ita_cul_ampolla`.`frame` (`id_frame`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ita_cul_ampolla`.`sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita_cul_ampolla`.`sale` (
  `id_sale` INT(11) NOT NULL,
  `id_glasses` INT(11) NULL DEFAULT NULL,
  `id_customer` INT(11) NULL DEFAULT NULL,
  `id_employee` INT(11) NULL DEFAULT NULL,
  `import` DOUBLE NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_sale`),
  INDEX `glasses_sale` (`id_glasses` ASC) VISIBLE,
  INDEX `customer_sale` (`id_customer` ASC) VISIBLE,
  INDEX `employee_sale` (`id_employee` ASC) VISIBLE,
  CONSTRAINT `customer_sale`
    FOREIGN KEY (`id_customer`)
    REFERENCES `ita_cul_ampolla`.`customer` (`id_customer`),
  CONSTRAINT `employee_sale`
    FOREIGN KEY (`id_employee`)
    REFERENCES `ita_cul_ampolla`.`employee` (`id_employee`),
  CONSTRAINT `glasses_sale`
    FOREIGN KEY (`id_glasses`)
    REFERENCES `ita_cul_ampolla`.`glasses` (`id_glasses`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
