<?php

/*
 CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`vacancy` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `position` VARCHAR(255) NOT NULL ,
  `requirements` TEXT NULL ,
  `salary` VARCHAR(100) NULL ,
  `some_text` TEXT NULL ,
  `contact` VARCHAR(255) NULL ,
  `who` VARCHAR(255) NULL ,
  `is_active` TINYINT(1)  NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`id`) )
  ENGINE = InnoDB
 */

/**
 * Description of gkh_vacancy
 *
 * @author Administrator
 */
class gkh_vacancy extends gkh {
    
    public function getAllVacancy() {
        try {
            $sql = 'SELECT * FROM vacancy';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getVacancy($id) {
        try {
            $sql = 'SELECT * FROM vacancy WHERE id=' . (int)$id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    public function getPublicVacancy() {
        try {
            $sql = 'SELECT * FROM vacancy WHERE is_active=1';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addVacancy($data) {
        try {
            $data = $this->_db->prepareArray($data);
            
            if (isset($data['is_active'])) {
                $data['is_active'] = 1;
            } else {
                $data['is_active'] = 0;
            }
            
            $sql = 'INSERT INTO vacancy(position, requirements, salary, some_text, contact, who, is_active) 
                    VALUES("' . $data['position'] . '", "' . $data['requirements'] . '", "' . $data['salary'] . '", 
                           "' . $data['some_text'] . '", "' . $data['contact'] . '", "' . $data['who'] . '", ' . $data['is_active'] . ')';
            $this->_db->query($sql);         
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    public function updateVacancy($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);

            if (isset($data['is_active'])) {
                $data['is_active'] = 1;
            } else {
                $data['is_active'] = 0;
            }
            
            $sql = 'UPDATE vacancy 
                    SET position="' . $data['position'] . '", requirements="' . $data['requirements'] . '", 
                        salary="' . $data['salary'] . '", some_text="' . $data['some_text'] . '", 
                        contact="' . $data['contact'] . '", who="' . $data['who'] . '", is_active=' . $data['is_active'] . '    
                    WHERE id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteVacancy($id) {
        try {
            $sql = 'DELETE FROM vacancy WHERE id=' . (int)$id;
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
