-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema EmployeeDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `EmployeeDB` ;

-- -----------------------------------------------------
-- Schema EmployeeDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EmployeeDB` DEFAULT CHARACTER SET utf8 ;
USE `EmployeeDB` ;

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
  `id` INT(2) NOT NULL AUTO_INCREMENT,
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
  `id` INT(2) NOT NULL,
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
  `level` INT(2) NOT NULL,
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
  `emp_id` INT(2) NOT NULL AUTO_INCREMENT, 
  `first_name` CHAR(20) NOT NULL,
  `last_name` CHAR(20) NOT NULL,
  `address_id` INT(2) NULL,
  `date_of_birth` VARCHAR(45) NULL,
  `job_title` VARCHAR(45) NULL,
  `salary_level` INT(2) NULL,
  `store_id` INT(2) NULL,
  `department_id` INT(2) NULL,
  `supervisor_id` INT(2) NULL,
  `hire_date` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `active_inactive` INT(1) NOT NULL DEFAULT 1,
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
USE `EmployeeDB`;
INSERT INTO `country` (`id`, `country`, `capital`) VALUES ('US', 'USA', 'Washington, D.C.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `EmployeeDB`;
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (26, '1701 WynKop', 'Denver', 'Colorado', 80202, 'US', 303-592-6712);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (27, '2500 Larimer St', 'Denver', 'Colorado', 80205, 'US', 303-954-8420);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (1, '2222 Two St', 'Denver', 'Colorado', 80237, 'US', 303-333-3333);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (2, '3333 Three St', 'Denver', 'Colorado', 80237, 'US', 303-303-0000);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (3, '1111 One St', 'Denver', 'Colorado', 80237, 'US', 303-333-9987);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (4, '1055 New Street', 'Denver', 'Colorado', 80622, 'US', 541-294-6650);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (5, '2643 Leo Street', 'Denver', 'Colorado', 80218, 'US', 720-947-9343);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (6, '605 Davis Lane', 'Denver', 'Colorado', 80239, 'US', 720-275-7385);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (7, '3471 Leo Street', 'Denver', 'Colorado', 80239, 'US', 720-947-0084);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (8, '2079 Davis Lane', 'Denver', 'Colorado', 80239, 'US', 720-364-5832);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (9, '304 Schevront Drive', 'Denver', 'Colorado', 80211, 'US', 303-455-1170);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (10, '4459 Davis Lane', 'Denver', 'Colorado', 80202, 'US', 720-356-5550);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (11, '171 Roy Alley', 'Denver', 'Colorado', 80202, 'US', 303-898-0634);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (12, '2810 Lowndes Hill Park Road', 'Denver', 'Colorado', 80201, 'US', 661-468-7142);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (13, '2831 Sampson St', 'Denver', 'Colorado', 80221, 'US', 303-599-6748);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (14, '4911 McKinley Avenue', 'Denver', 'Colorado', 80211, 'US', 303-827-4202);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (15, '2008 Pick Street', 'Denver', 'Colorado', 80239, 'US', 970-545-3189);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (16, '631 Pick Street', 'Denver', 'Colorado', 80239, 'US', 970-545-9722);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (17, '3526 Cherry Tree Drive', 'Denver', 'Colorado', 80201, 'US', 904-361-0770);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (18, '4759 Clearview Drive', 'Denver', 'Colorado', 80209, 'US', 303-722-2115);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (19, '4287 Davis Lane', 'Denver', 'Colorado', 80202, 'US', 720-382-5411);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (20, '903 Sampson Street', 'Denver', 'Colorado', 80202, 'US', 303-602-8994);
INSERT INTO `address` (`id`, `address`, `city`, `state_province`, `postal_code`, `country_id`, `phone`) VALUES (21, '2428 Davis Lane', 'Denver', 'Colorado', 80216, 'US', 720-427-4576);

COMMIT;


-- -----------------------------------------------------
-- Data for table `store`
-- -----------------------------------------------------
START TRANSACTION;
USE `EmployeeDB`;
INSERT INTO `store` (`id`, `address_id`, `manager_id`) VALUES (1, 26, 7);
INSERT INTO `store` (`id`, `address_id`, `manager_id`) VALUES (2, 27, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `commissions`
-- -----------------------------------------------------
START TRANSACTION;
USE `EmployeeDB`;
INSERT INTO `commissions` (`id`, `amount`) VALUES (1, 10);
INSERT INTO `commissions` (`id`, `amount`) VALUES (2, 15);
INSERT INTO `commissions` (`id`, `amount`) VALUES (3, 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `salary`
-- -----------------------------------------------------
START TRANSACTION;
USE `EmployeeDB`;
INSERT INTO `salary` (`level`, `commission_level`, `salary`) VALUES (6, 1, 1000000);
INSERT INTO `salary` (`level`, `commission_level`, `salary`) VALUES (5, 1, 90000);
INSERT INTO `salary` (`level`, `commission_level`, `salary`) VALUES (4, 2, 60000);
INSERT INTO `salary` (`level`, `commission_level`, `salary`) VALUES (3, 2, 45000);
INSERT INTO `salary` (`level`, `commission_level`, `salary`) VALUES (2, 3, 35000);
INSERT INTO `salary` (`level`, `commission_level`, `salary`) VALUES (1, 3, 18000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `department`
-- -----------------------------------------------------
START TRANSACTION;
USE `EmployeeDB`;
INSERT INTO `department` (`department_id`, `department_desc_function`) VALUES (1, 'Executive Members');
INSERT INTO `department` (`department_id`, `department_desc_function`) VALUES (2, 'General Manager');
INSERT INTO `department` (`department_id`, `department_desc_function`) VALUES (3, 'Store Manager');
INSERT INTO `department` (`department_id`, `department_desc_function`) VALUES (4, 'Store Assistant Manager');
INSERT INTO `department` (`department_id`, `department_desc_function`) VALUES (5 , 'Full Time Employee');
INSERT INTO `department` (`department_id`, `department_desc_function`) VALUES (6, 'Part Time Employee');

COMMIT;


-- -----------------------------------------------------
-- Data for table `employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `EmployeeDB`;
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (1, 'Stephen', 'Chiang', 1, '1980-11-01', 'CEO', 6, 1, 1, NULL, '2016-02-01', 'stephen.e.chiang@gmail.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (2, 'Daniel', 'Balarezo', 2, '1985-04-10', 'CMO', 6, 1, 1, NULL, '2016-02-01', 'd.balarezo@gmail.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (3, 'Will', 'Roberts', 3, '1987-05-17', 'COO', 6, 1, 1, NULL, '2016-02-01', 'will.roberts@gmail.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (4, 'Pamela', 'Almanzar', 4, '1975-04-27', 'Marketing Manager', 5, 1, 1, 2, '2016-02-01', 'Pamela@AL.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (5, 'Johnny', 'Gonzalez', 5, '1974-01-30', 'Accounting', 5, 1, 1, 1, '2016-02-01', 'JohhnyG@Al.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (6, 'Lucille ', 'Bishop', 6, '1983-11-04', 'General Manager', 5, 1, 2, 3, '2016-02-14', 'Lucille@AL.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (7, 'Eva ', 'Wagner', 7, '1992-04-17', 'Store Manager', 4, 1, 3, 6, '2016-02-17', 'Eva@AL.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (8, 'Phyllis', 'Padilla', 8, '1990-03-25', 'Store Manager', 4, 2, 3, 6, '2017-01-18', 'PhylP@AL.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (9, 'Daryl', 'Lombardo', 9, '1989-07-18', 'Assistant Store Manager', 3, 1, 4, 7, '2016-03-11', 'dLombardo@AL.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (10, 'Kay ', 'Goff', 10, '1994-07-27', 'Assistant Strore Manager', 3, 2, 4, 8, '2017-01-19', 'kGoff@AL.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (11, 'Wayne', 'Hunsinger', 11, '1987-09-11', 'Full Time Employee', 2, 1, 5, 9, '2016-03-11', 'wayneHunny@me.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (12, 'Dori', 'Pierre', 12, '1999-03-18', 'Full Time Employee', 2, 1, 5, 9, '2016-03-11', 'hunkyDORI@yahoo.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (13, 'Karey', 'Campos', 13, '1998-01-01', 'Part Time Employee', 1, 1, 6, 9, '2017-02-14', 'newyearsbaby@aol.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (14, 'September', 'Clifford', 14, '1983-07-16', 'Part Time Employee', 1, 1, 6, 9, '2016-10-07', 'moonchild@hotmail.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (15, 'Ryan ', 'Charlton', 15, '1988-01-31', 'Part TIme Employee', 1, 2, 6, 10, '2017-01-18', 'charltoncarlton@google.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (16, 'Brooke', 'Bryant', 16, '1988-04-10', 'Part Time Employee', 1, 2, 6, 10, '2017-02-28', 'bbPrincess@icloud.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (17, 'Tony', 'Mann', 17, '1996-05-31', 'Full Time Employee', 2, 2, 5, 10, '2017-01-18', 'daMann@icloud.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (18, 'Jo', 'Cox', 18, '1986-06-23', 'Part Time Employee', 1, 2, 6, 10, '2017-03-01', 'JOJOcox@outlook.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (19, 'Bobby', 'Tables', 19, '1987-05-11', 'Assistant Store Manager', 3, 1, 6, 9, '2016-04-10', 'littleBobbyTables@DropItLikeItHot.com', 0);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (20, 'Rob', 'Dobbs', 20, '1991-08-24', 'Full Time Employee', 2, 2, 5, 10, '2017-01-30', 'dobbs@yahoo.com', 1);
INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `address_id`, `date_of_birth`, `job_title`, `salary_level`, `store_id`, `department_id`, `supervisor_id`, `hire_date`, `email`, `active_inactive`) VALUES (21, 'Elsie', 'Neal', 21, '1992-05-30', 'Store Manager', 4, 1, 3, 6, '2016-02-01', 'OneilNeil@yahoo.com', 0);

COMMIT;