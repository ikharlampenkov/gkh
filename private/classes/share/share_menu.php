<?php

/*
 CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`module` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NOT NULL ,
  `eng_title` VARCHAR(255) NOT NULL ,
  `files` TEXT NULL DEFAULT NULL ,
  `db_tables` TEXT NULL DEFAULT NULL ,
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
  `param_name` VARCHAR(45) NULL DEFAULT NULL ,
  `param_value` VARCHAR(45) NULL DEFAULT NULL ,
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
 */

/**
 * Description of share_menu
 *
 * @author Administrator
 */
class share_menu extends share {
    
    protected $_management_company;


    public function __construct($management_company) {
        parent::__construct();
        
        $this->_management_company = $management_company;
    }
    
    public function getAllMenu() {
        try {
            $sql = 'SELECT * FROM menu WHERE management_company_id=' . $this->_management_company;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getMenu($id) {
        try {
            $sql = 'SELECT * FROM menu 
                    WHERE management_company_id=' . $this->_management_company . ' AND id=' . (int)$id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    public function getMenuByRole($role) {
        try {
            $sql = 'SELECT * 
                    FROM menu, acl 
                    WHERE menu.id=acl.menu_id AND management_company_id=' . $this->_management_company . ' AND acl.role="' . $role . '"';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addMenu($data) {
        try {
            $data = $this->_db->prepareArray($data);
            
            $sql = 'INSERT INTO menu(module_id, management_company_id, title, eng_title, param_name, param_value) 
                    VALUES(' . $data['module_id'] . ', ' . $this->_management_company . ', 
                          "' . $data['title'] . '", "' . $data['eng_title'] . '", 
                          "' . $data['param_name'] . '", "' . $data['param_value'] . '")';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    public function updateMenu($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            $sql = 'UPDATE menu 
                    SET module_id, title="' . $data['title'] . '", eng_title="' . $data['eng_title'] . '", 
                        param_name="' . $data['param_name'] . '", param_value="' . $data['param_value'] . '" 
                    WHERE management_company_id=' . $this->_management_company . ' AND id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteMenu($id) {
        try {
            $sql = 'DELETE FROM menu WHERE management_company_id=' . $this->_management_company . ' AND id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    public function getAllModule() {
        try {
            $sql = 'SELECT * FROM module';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    public function __destruct() {
        parent::__destruct();
    }
}

?>
