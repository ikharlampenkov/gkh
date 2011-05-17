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
    
    protected $_management_company;
    
    public function __construct($management_company) {
        parent::__construct();
        
        $this->_management_company = $management_company;
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
    
    public function __destruct() {
        parent::__destruct();
    }
    
}

?>
