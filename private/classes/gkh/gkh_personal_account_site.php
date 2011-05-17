<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
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
    
    public function __destruct() {
        parent::__destruct();
    }
    
}

?>
