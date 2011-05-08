SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `gkh_db` ;
CREATE SCHEMA IF NOT EXISTS `gkh_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `gkh_db` ;

-- -----------------------------------------------------
-- Table `gkh_db`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gkh_db`.`user` ;

CREATE  TABLE IF NOT EXISTS `gkh_db`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `role` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gkh_db`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gkh_db`.`city` ;

CREATE  TABLE IF NOT EXISTS `gkh_db`.`city` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NOT NULL ,
  `phone_code` VARCHAR(5) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gkh_db`.`reu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gkh_db`.`reu` ;

CREATE  TABLE IF NOT EXISTS `gkh_db`.`reu` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NOT NULL ,
  `email` VARCHAR(255) NULL ,
  `user_id` INT UNSIGNED NOT NULL ,
  `city_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_reu_user` (`user_id` ASC) ,
  INDEX `fk_reu_city1` (`city_id` ASC) ,
  CONSTRAINT `fk_reu_user`
    FOREIGN KEY (`user_id` )
    REFERENCES `gkh_db`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reu_city1`
    FOREIGN KEY (`city_id` )
    REFERENCES `gkh_db`.`city` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gkh_db`.`content_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gkh_db`.`content_page` ;

CREATE  TABLE IF NOT EXISTS `gkh_db`.`content_page` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `page_title` VARCHAR(40) NOT NULL COMMENT 'английское название для системы' ,
  `title` VARCHAR(255) NOT NULL ,
  `content` TEXT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `page_title_UNIQUE` (`page_title` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gkh_db`.`contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gkh_db`.`contact` ;

CREATE  TABLE IF NOT EXISTS `gkh_db`.`contact` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `reu_id` INT UNSIGNED NOT NULL ,
  `address` VARCHAR(255) NOT NULL ,
  `phone_number` VARCHAR(255) NULL ,
  INDEX `fk_contact_reu1` (`reu_id` ASC) ,
  PRIMARY KEY (`id`, `reu_id`) ,
  CONSTRAINT `fk_contact_reu1`
    FOREIGN KEY (`reu_id` )
    REFERENCES `gkh_db`.`reu` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gkh_db`.`announcement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gkh_db`.`announcement` ;

CREATE  TABLE IF NOT EXISTS `gkh_db`.`announcement` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `reu_id` INT UNSIGNED NOT NULL ,
  `date` DATETIME NOT NULL ,
  `title` VARCHAR(255) NULL ,
  `content` TEXT NULL ,
  INDEX `fk_announcement_reu1` (`reu_id` ASC) ,
  PRIMARY KEY (`id`, `reu_id`) ,
  CONSTRAINT `fk_announcement_reu1`
    FOREIGN KEY (`reu_id` )
    REFERENCES `gkh_db`.`reu` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gkh_db`.`update_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gkh_db`.`update_history` ;

CREATE  TABLE IF NOT EXISTS `gkh_db`.`update_history` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `reu_id` INT UNSIGNED NOT NULL ,
  `date` DATETIME NOT NULL ,
  `content` TEXT NULL ,
  PRIMARY KEY (`id`, `reu_id`) ,
  CONSTRAINT `fk_update_history_reu1`
    FOREIGN KEY (`reu_id` )
    REFERENCES `gkh_db`.`reu` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gkh_db`.`tech_support_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gkh_db`.`tech_support_post` ;

CREATE  TABLE IF NOT EXISTS `gkh_db`.`tech_support_post` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `reu_id` INT UNSIGNED NOT NULL ,
  `question` VARCHAR(255) NOT NULL ,
  `date_question` DATETIME NOT NULL ,
  `answer` VARCHAR(255) NULL ,
  `date_answer` DATETIME NULL ,
  `file` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_tech_support_post_reu1` (`reu_id` ASC) ,
  CONSTRAINT `fk_tech_support_post_reu1`
    FOREIGN KEY (`reu_id` )
    REFERENCES `gkh_db`.`reu` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gkh_db`.`information_on_debt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gkh_db`.`information_on_debt` ;

CREATE  TABLE IF NOT EXISTS `gkh_db`.`information_on_debt` (
  `reu_id` INT UNSIGNED NOT NULL ,
  `sector` INT UNSIGNED NOT NULL COMMENT 'сектор' ,
  `street` VARCHAR(100) NOT NULL COMMENT 'улица' ,
  `house` VARCHAR(10) NOT NULL COMMENT 'дом' ,
  `apartment` INT UNSIGNED NOT NULL COMMENT 'квартира' ,
  `fio` VARCHAR(255) NULL COMMENT 'фио' ,
  `phone_number` VARCHAR(10) NULL COMMENT 'телефон' ,
  `personal_account` VARCHAR(20) NULL COMMENT 'лицевой_счет' ,
  `amount_debt` DECIMAL(12,2) NULL COMMENT 'сумма_долга' ,
  `amount_penalty` DECIMAL(12,2) NULL COMMENT 'сумма_пени' ,
  `amount_debt_w_penalties` DECIMAL(12,2) NULL COMMENT 'сумма_долга_c_пеней' ,
  `number_months` INT NULL COMMENT 'кол_во_мес' ,
  `status_housing` VARCHAR(255) NULL COMMENT 'статус_жилья' ,
  `total_area` DECIMAL(12,2) UNSIGNED NULL COMMENT 'общая_площадь' ,
  `number_persons` INT UNSIGNED NULL COMMENT 'кол_во_прожив' ,
  `number_personal_accounts` INT UNSIGNED NULL COMMENT 'кол_л_сч' ,
  `reu` VARCHAR(10) NULL COMMENT 'рэу' ,
  `allowance` VARCHAR(255) NULL COMMENT 'льгота' ,
  PRIMARY KEY (`reu_id`, `sector`, `street`, `house`, `apartment`) ,
  INDEX `fk_information on debt_reu1` (`reu_id` ASC) ,
  CONSTRAINT `fk_information on debt_reu1`
    FOREIGN KEY (`reu_id` )
    REFERENCES `gkh_db`.`reu` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE USER `gkx_user` IDENTIFIED BY '123456';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
