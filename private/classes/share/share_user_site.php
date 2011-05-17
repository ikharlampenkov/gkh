<?php

/*
  CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`user_role` (
  `title` VARCHAR(20) NOT NULL ,
  `ru_title` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`title`) )
  ENGINE = InnoDB;

  USE `dnevnik_gkh_site_db` ;

  -- -----------------------------------------------------
  -- Table `dnevnik_gkh_site_db`.`user`
  -- -----------------------------------------------------
  CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `role` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) )
  ENGINE = InnoDB;


  -- -----------------------------------------------------
  -- Table `dnevnik_gkh_site_db`.`acl`
  -- -----------------------------------------------------
  CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`acl` (
  `menu_id` INT UNSIGNED NOT NULL ,
  `role` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`menu_id`, `user_role_title`) ,
  INDEX `fk_acl_user_role1` (`user_role_title` ASC) ,
  CONSTRAINT `fk_acl_menu1`
  FOREIGN KEY (`menu_id` )
  REFERENCES `dnevnik_gkh_site_db`.`menu` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `fk_acl_user_role1`
  FOREIGN KEY (`user_role_title` )
  REFERENCES `dnevnik_gkh_site_db`.`user_role` (`title` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
  ENGINE = InnoDB;
 */

/**
 * Description of share_user_site
 *
 * @author Administrator
 */
class share_user_site extends share_user {

    
    
    public function __construct() {
        parent::__construct();
    }
    
    public function getAllUser() {
        try {
            $sql = 'SELECT * FROM user, user_role WHERE user.role=user_role.title';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getAllRole() {
        try {
            $sql = 'SELECT * FROM user_role';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getRole($id) {
        try {
            $sql = 'SELECT * FROM user_role WHERE title="' . $id . '"';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addRole($data) {
        try {
            $data = $this->_db->prepareArray($data);

            $sql = 'INSERT INTO user_role(title, ru_title) VALUES("' . $data['title'] . '", "' . $data['ru_title'] . '")';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateRole($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            $sql = 'UPDATE user_role SET ru_title="' . $data['ru_title'] . '" WHERE title="' . $data['title'] . '"';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteRole($id) {
        try {
            $sql = 'DELETE FROM user_role WHERE title="' . $data['title'] . '"';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getAclByRole($id) {
        try {
            $sql = 'SELECT * FROM acl WHERE role="' . $id . '"';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function setAclByRole($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            
            $result = $this->_db->query('DELETE FROM acl WHERE role="' . $id . '"');         

            foreach ($data as $menu_id => $value) {
                $sql = 'INSERT INTO acl(role, menu_id) VALUES("' . $id . '", "' . $menu_id . '")';
                $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    public function logIn($login, $psw) {
        try {
            $sql = 'SELECT id, login, password, title FROM user, user_role WHERE user.role=user_role.title AND login="' . $login . '"';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0]['login'])) {
                if ($result[0]['password'] === $psw) {
                    simo_session::setVar('login', $login, 'user');
                    simo_session::setVar('token', md5($psw), 'user');
                    simo_session::setVar('id', $result[0]['id'], 'user');
                    simo_session::setVar('role', $result[0]['title'], 'user');
                    return true;
                } 
            } return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }
    
    static public function getUserId() {
        if (simo_session::existVar('id', 'user')) {
            return simo_session::getVar('id', 'user');
        } else {
            return 0;
        }
    } 

    public function __destruct() {
        parent::__destruct();
    }

}

?>
