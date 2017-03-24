-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `country` ;

CREATE TABLE IF NOT EXISTS `country` (
  `id` CHAR(2) NOT NULL,
  `country` VARCHAR(45) NULL,
  `capital` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state_province` VARCHAR(45) NULL,
  `postal_code` INT NULL,
  `country_id` CHAR(2) NULL,
  `phone` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`country_id` ASC),
  CONSTRAINT `fk_address_country_code`
    FOREIGN KEY (`country_id`)
    REFERENCES `country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store` ;

CREATE TABLE IF NOT EXISTS `store` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NULL,
  `manager_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`address_id` ASC),
  CONSTRAINT `fk_storeaddress_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `commissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commissions` ;

CREATE TABLE IF NOT EXISTS `commissions` (
  `id` INT(2) NOT NULL AUTO_INCREMENT,
  `amount` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salary` ;

CREATE TABLE IF NOT EXISTS `salary` (
  `level` INT NOT NULL,
  `commission_level` INT(2) NULL,
  `salary` INT NULL,
  PRIMARY KEY (`level`),
  INDEX `id_idx` (`commission_level` ASC),
  CONSTRAINT `fk_salary_commission_level`
    FOREIGN KEY (`commission_level`)
    REFERENCES `commissions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `department` ;

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` INT(2) NOT NULL AUTO_INCREMENT,
  `department_desc_function` VARCHAR(45) NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee` ;

CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` CHAR(20) NOT NULL,
  `last_name` CHAR(20) NOT NULL,
  `address_id` INT(2) NULL,
  `date_of_birth` VARCHAR(45) NULL,
  `job_title` VARCHAR(45) NULL,
  `salary_level` INT(2) NULL,
  `store_id` INT NULL,
  `department_id` INT(2) NULL,
  `supervisor_id` INT(2) NULL,
  `hire_date` DATE NULL,
  `email` VARCHAR(45) NULL,
  `active_inactive` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`emp_id`),
  INDEX `id_idx` (`address_id` ASC),
  INDEX `level_idx` (`salary_level` ASC),
  INDEX `department_id_idx` (`department_id` ASC),
  INDEX `store_id_idx` (`store_id` ASC),
  CONSTRAINT `fk_employee_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_salary_level`
    FOREIGN KEY (`salary_level`)
    REFERENCES `salary` (`level`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_department_id`
    FOREIGN KEY (`department_id`)
    REFERENCES `department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_store_id`
    FOREIGN KEY (`store_id`)
    REFERENCES `store` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO alhrmgr@localhost;
 DROP USER alhrmgr@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'alhrmgr'@'localhost' IDENTIFIED BY 'hruser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'alhrmgr'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `country`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `country` (`id`, `country`, `capital`) VALUES ('US', 'USA', 'Washington, D.C.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (21, '1 AL HR Way', 'Denver', 'Colorado', 80237, 'US', 303-030-3333);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (1, '1111 One St', 'Denver', 'Colorado', 80237, 'US', 303-303-3333);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (2, '2222 Two St', 'Denver', 'Colorado', 80237, 'US', 303-333-3333);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (3, '3333 Three St', 'Denver', 'Colorado', 80237, 'US', 303-303-0000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `store`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `store` (`id`, `address_id`, `manager_id`) VALUES (1, 21, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `commissions`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `commissions` (`id`, `amount`) VALUES (1, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `salary`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `salary` (`level`, `commission_level`, `salary`) VALUES (5, 1, 1000000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `department`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `department` (`department_id`, `department_desc_function`) VALUES (1, 'Manager Section');

COMMIT;


-- -----------------------------------------------------
-- Data for table `employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (1, 'stephen', 'chiang', 1, '1980-11-01', 'Manager', 5, 1, 1, NULL, NULL, 'stephen.e.chiang@gmail.com', '1');
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (2, 'daniel', 'balarezo', 2, '1983-12-20', 'Manager', 5, 1, 1, NULL, NULL, 'd.balarezo@gmail.com', '1');
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (3, 'will', 'roberts', 3, '1985-05-17', 'Manager', 5, 1, 1, NULL, NULL, 'will.roberts@gmail.com', '1');

COMMIT;

