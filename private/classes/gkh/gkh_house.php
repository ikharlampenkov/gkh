<?php

/*
 CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`house` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `street` VARCHAR(50) NOT NULL ,
  `number` INT UNSIGNED NOT NULL ,
  `subnumber` VARCHAR(3) NULL ,
  `area` DECIMAL(9,2) UNSIGNED NULL ,
  `file_repair_plan` VARCHAR(255) NULL ,
  `file_costs_income` VARCHAR(255) NULL ,
  `file_performed_repair` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
 */

/**
 * Description of gkh_house
 *
 * @author Administrator
 */
class gkh_house extends gkh {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function getAllHouse() {
        try {
            $sql = 'SELECT * FROM house';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getHouse($id) {
        try {
            $sql = 'SELECT * FROM house WHERE id=' . (int) $id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addHouse($data) {
        try {
            $data = $this->_db->prepareArray($data);

            $sql = 'INSERT INTO house(street, number, subnumber, area) 
                    VALUES("' . $data['street'] . '", ' . $data['number'] . ', "' . $data['subnumber'] . '", ' . $data['area'] . ')';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateHouse($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            $sql = 'UPDATE house 
                    SET street="' . $data['street'] . '", number=' . $data['number'] . ', 
                        subnumber="' . $data['subnumber'] . '", area="' . $data['area'] . '" 
                    WHERE id=' . (int) $id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteHouse($id) {
        try {
            $sql = 'DELETE FROM house WHERE id=' . (int) $id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    public function __destruct() {
        parent::__destruct();
    }    
}

?>
