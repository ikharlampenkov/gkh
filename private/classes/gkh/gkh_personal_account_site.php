<?php

/*
 CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`personal_account` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `user_id` INT UNSIGNED NOT NULL ,
  `house_id` INT UNSIGNED NOT NULL ,
  `apartment` INT UNSIGNED NULL ,
  `fio` VARCHAR(45) NULL DEFAULT NULL ,
  `password` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_personal_account_user1` (`user_id` ASC) ,
  INDEX `fk_personal_account_house1` (`house_id` ASC) ,
  CONSTRAINT `fk_personal_account_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `dnevnik_gkh_site_db`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personal_account_house1`
    FOREIGN KEY (`house_id` )
    REFERENCES `dnevnik_gkh_site_db`.`house` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
 */

/**
 * Description of gkh_personal_account_site
 *
 * @author Moris
 */
class gkh_personal_account_site extends gkh {
        
    public function __construct() {
        parent::__construct();
       
    }
    
    public function getPAByUser($user_id) {
        try {
            $sql = 'SELECT * FROM personal_account WHERE user_id=' . (int)$user_id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (!empty($result[0])) {
                return $result[0];               
            } else {
                return false;    
            }            
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }
        
    public function getAllPA() {
        try {
            $sql = 'SELECT * FROM personal_account';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (!empty($result[0])) {
                return $result;               
            } else {
                return false;    
            }            
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }
    
    public function getAllPAForMessage() {
        try {
            $sql = 'SELECT * FROM personal_account';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (!empty($result[0])) {
                
                $o_house = new gkh_house();
                
                foreach ($result as &$pa) {
                    $pa['house'] = $o_house->getHouse($pa['house_id']);
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
    
    public function getPA($id) {
        try {
            $sql = 'SELECT * FROM personal_account WHERE id=' . (int)$id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (!empty($result[0])) {
                return $result[0];               
            } else {
                return false;    
            }            
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }
    
    public function addPA($data) {
        try {
            $data = $this->_db->prepareArray($data);
            $o_temp_user = new share_user_site();

            $user_data = array('login' => 'user_tenant_' . $o_temp_user->getNextId(), 'password' => $data['password'], 'role' => 'tenant');
            $o_temp_user->addUser($user_data);
            
            $temp_id = $this->_db->query('SELECT LAST_INSERT_ID()');
            
            $sql = 'INSERT INTO personal_account(user_id, house_id, apartment, fio, password) 
                    VALUES(' . $temp_id[0][0] . ', ' . $data['house_id'] . ', 
                           ' . $data['apartment'] . ', "' . $data['fio'] . '", "' . $data['password'] . '")';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updatePA($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            $sql = 'UPDATE personal_account SET house_id=' . $data['house_id'] . ', fio="' . $data['fio'] . '", apartment=' . $data['apartment'] . ' WHERE id=' . (int) $id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deletePA($id) {
        try {
            $sql = 'DELETE FROM personal_account WHERE id=' . (int) $id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    public function sendMessage($data) {
        $message = $data['message'];
        foreach ($data['debts'] as $key => $value) {
            try {
                $result = $this->getPA($key);

                $test = $this->_send_sms($result['phone'], mb_convert_encoding($message, 'Windows-1251', 'UTF-8'), $__cfg['sms.login'], $__cfg['sms.password']); //рассылка сообщения
                simo_log::logMsg($test);
            } catch (Exception $e) {
                simo_exception::registrMsg($e, $this->_debug);
            }
        }
    }
    
    static function getUserByAddress($house_id, $apartment) {
        try {
            $db = simo_db::getInstance();
            $apartment = $db->prepareString($apartment);
            
            $sql = 'SELECT user_id FROM personal_account WHERE house_id=' . $house_id . ' AND apartment=' . $apartment;
            $result = $db->query($sql);
            
            if (isset($result[0][0])) {
                $temp_user = new share_user_site();
                $user = $temp_user->getUser($result[0][0]);
                return $user['login'];
            } else {
                return false;
            }
            
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    static function getUserByPA($personal_account) {
        try {
            $db = simo_db::getInstance();
            $apartment = $db->prepareString($personal_account);
            
            $sql = 'SELECT user_id FROM personal_account WHERE id="' . $personal_account . '"';
            $result = $db->query($sql);
            
            if (isset($result[0][0])) {
                $temp_user = new share_user_site();
                $user = $temp_user->getUser($result[0][0]);
                return $user['login'];
            } else {
                return false;
            }
            
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }
    
    private function _send_sms($to, $msg, $login, $password) {
        $u = 'http://www.websms.ru/http_in4.asp';
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, 'Http_username=' . urlencode($login) . '&Http_password=' . urlencode($password) . '&Phone_list=' . $to . '&Message=' . urlencode($msg));
        curl_setopt($ch, CURLOPT_URL, $u);
        $u = trim(curl_exec($ch));
        curl_close($ch);
        return (preg_match('#Http_id\s*=\s*0#i', $u));
    }


    public function __destruct() {
        parent::__destruct();
    }
    
}

?>
