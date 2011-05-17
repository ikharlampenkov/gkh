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


id, title, rate

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

    public function getMetersByUser($date) {
        try {
            $sql = 'SELECT id, title, rate  
                    FROM meters, meters_to_account 
                    WHERE meters.id=meters_to_account.meters_id AND personal_account_id=' . $this->_personal_account;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (!empty($result[0])) {
                $temp_date = date_parse($date);
                $prev_date = date('Y-m-d', mktime(0, 0, 0, $temp_date['month'] - 1, $temp_date['day'], $temp_date['year']));
                
                foreach ($result as &$meter) {
                    $meter['cur_value'] = $this->_getMeterValueByDate($meter['id'], $date);
                    
                    $meter['prev_value'] = $this->_getMeterValueByDate($meter['id'], $prev_date); 
                }   
                return $result;
            } else {
                return false;    
            }            
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }
    
    public function setMetersValue($data) {
        try {
            $data = $this->_db->prepareArray($data);
            
            foreach ($data as $meter_id => $value) {
                $value['date'] = date('Y-m-d', strtotime($value['date']));
                $sql = 'REPLACE meters_value(personal_account_id, meters_id, date, value) 
                                      VALUES(' . $this->_personal_account . ', ' . $meter_id . ', "' . $value['date'] . '", ' . $value['value'] . ')';
                $this->_db->query($sql);
            }         
            
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }
    
    protected function _getMeterValueByDate($meter_id, $date) {
        try {
            $sql = 'SELECT * FROM meters_value 
                    WHERE personal_account_id=' . $this->_personal_account . ' AND meters_id=' . $meter_id . ' AND DATE_FORMAT(date, "%Y-%m")=DATE_FORMAT("' . $date . '", "%Y-%m")';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (!empty($result[0])) {
                return $result[0];               
            } else {
                return array('personal_account_id' => $this->_personal_account, 'meters_id' => $meter_id, 'date' => $date, 'value' => 0);
            }            
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return array('personal_account_id' => $this->_personal_account, 'meters_id' => $meter_id, 'date' => $date, 'value' => 0);
        }
    }

    


    public function __destruct() {
        parent::__destruct();

        unset($this->_personal_account);
    }

}

?>
