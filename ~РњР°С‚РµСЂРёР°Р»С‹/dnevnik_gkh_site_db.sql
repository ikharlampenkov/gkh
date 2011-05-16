SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `dnevnik_gkh_site_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `dnevnik_gkh_site_db` ;

-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`management_company`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`management_company` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `domen` VARCHAR(45) NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `version` VARCHAR(10) NOT NULL ,
  `password` VARCHAR(16) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'управляющая компания' ;


-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`module`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`module` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NOT NULL ,
  `eng_title` VARCHAR(255) NOT NULL ,
  `files` TEXT NULL ,
  `db_tables` TEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`menu`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`menu` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `module_id` INT UNSIGNED NOT NULL ,
  `management_company_id` INT UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `eng_title` VARCHAR(45) NOT NULL ,
  `param_name` VARCHAR(45) NULL ,
  `param_value` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_menu_module` (`module_id` ASC) ,
  INDEX `fk_menu_management_company1` (`management_company_id` ASC) ,
  CONSTRAINT `fk_menu_module`
    FOREIGN KEY (`module_id` )
    REFERENCES `dnevnik_gkh_site_db`.`module` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_management_company1`
    FOREIGN KEY (`management_company_id` )
    REFERENCES `dnevnik_gkh_site_db`.`management_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`license`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`license` (
  `id` INT NOT NULL ,
  `management_company_id` INT UNSIGNED NOT NULL ,
  `description` VARCHAR(255) NOT NULL ,
  `img` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_license_management_company1` (`management_company_id` ASC) ,
  CONSTRAINT `fk_license_management_company1`
    FOREIGN KEY (`management_company_id` )
    REFERENCES `dnevnik_gkh_site_db`.`management_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`personal_account`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`personal_account` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `management_company_id` INT UNSIGNED NOT NULL ,
  `fio` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_personal_account_management_company1` (`management_company_id` ASC) ,
  CONSTRAINT `fk_personal_account_management_company1`
    FOREIGN KEY (`management_company_id` )
    REFERENCES `dnevnik_gkh_site_db`.`management_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`tech_support_ticket_state`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`tech_support_ticket_state` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NOT NULL ,
  `rating` INT UNSIGNED NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`tech_support_ticket`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`tech_support_ticket` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `management_company_id` INT UNSIGNED NOT NULL ,
  `personal_account_id` INT(10) UNSIGNED NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `date` DATETIME NOT NULL ,
  `category` INT NULL ,
  `ticket_state_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_tech_support_ticket_management_company1` (`management_company_id` ASC) ,
  INDEX `fk_tech_support_ticket_personal_account1` (`personal_account_id` ASC) ,
  INDEX `fk_tech_support_ticket_ticket_state1` (`ticket_state_id` ASC) ,
  CONSTRAINT `fk_tech_support_ticket_management_company1`
    FOREIGN KEY (`management_company_id` )
    REFERENCES `dnevnik_gkh_site_db`.`management_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tech_support_ticket_personal_account1`
    FOREIGN KEY (`personal_account_id` )
    REFERENCES `dnevnik_gkh_site_db`.`personal_account` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tech_support_ticket_ticket_state1`
    FOREIGN KEY (`ticket_state_id` )
    REFERENCES `dnevnik_gkh_site_db`.`tech_support_ticket_state` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`tech_support_post`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`tech_support_post` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `ticket_id` INT(10) UNSIGNED NOT NULL ,
  `question` TEXT NOT NULL ,
  `date_question` DATETIME NOT NULL ,
  `answer` TEXT NULL DEFAULT NULL ,
  `date_answer` DATETIME NULL DEFAULT NULL ,
  `file` TEXT NULL DEFAULT NULL ,
  `answer_file` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_tech_support_post_tech_support_ticket1` (`ticket_id` ASC) ,
  CONSTRAINT `fk_tech_support_post_tech_support_ticket1`
    FOREIGN KEY (`ticket_id` )
    REFERENCES `dnevnik_gkh_site_db`.`tech_support_ticket` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`meters`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`meters` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`meters_to_account`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`meters_to_account` (
  `personal_account_id` INT(10) UNSIGNED NOT NULL ,
  `meters_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`personal_account_id`, `meters_id`) ,
  INDEX `fk_meters_to_account_meters1` (`meters_id` ASC) ,
  CONSTRAINT `fk_meters_to_account_personal_account1`
    FOREIGN KEY (`personal_account_id` )
    REFERENCES `dnevnik_gkh_site_db`.`personal_account` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meters_to_account_meters1`
    FOREIGN KEY (`meters_id` )
    REFERENCES `dnevnik_gkh_site_db`.`meters` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`meters_value`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`meters_value` (
  `personal_account_id` INT(10) UNSIGNED NOT NULL ,
  `meters_id` INT UNSIGNED NOT NULL ,
  `date` DATE NOT NULL ,
  `value` DECIMAL(10,3) NULL ,
  PRIMARY KEY (`personal_account_id`, `meters_id`, `date`) ,
  INDEX `fk_meters_value_meters1` (`meters_id` ASC) ,
  CONSTRAINT `fk_meters_value_personal_account1`
    FOREIGN KEY (`personal_account_id` )
    REFERENCES `dnevnik_gkh_site_db`.`personal_account` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meters_value_meters1`
    FOREIGN KEY (`meters_id` )
    REFERENCES `dnevnik_gkh_site_db`.`meters` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
