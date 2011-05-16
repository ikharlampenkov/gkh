<?php

/*
 -- -----------------------------------------------------
-- Table `dnevnik_gkh_site_db`.`meters`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`meters` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NULL DEFAULT NULL ,
  `rate` DECIMAL(12,2) UNSIGNED NULL ,
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
  `value` DECIMAL(10,3) NULL DEFAULT NULL ,
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
 */

/**
 * Description of gkh_meters
 *
 * @author Administrator
 */
class gkh_meters extends gkh {
    
    protected $_personal_account;
    
    public function __construct($personal_account) {
        parent::__construct();
        
        $this->_personal_account = $personal_account;
    }
    
    public function __destruct() {
        parent::__destruct();
        
        unset($this->_personal_account);
    }
   
}

?>
