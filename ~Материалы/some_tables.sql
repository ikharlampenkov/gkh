SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `dnevnik_gkh_site_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `dnevnik_gkh_site_db` ;

-- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`tech_support_ticket_state`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`tech_support_ticket_state` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NOT NULL ,
  `rating` INT UNSIGNED NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
