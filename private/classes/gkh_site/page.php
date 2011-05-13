<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of page
 *
 * @author Moris
 */
abstract class page {
    
    const ACTION_INSERT = 'insert';
    const ACTION_UPDATE = 'update';
    const ACTION_DELETE = 'delete';
    const ACTION_SELECT = 'select';


    protected $_db;
    
    protected $_module;
    protected $_field_list;


    public function __construct($module, array $field_list) {
        $this->_db = simo_db::getInstance();
        
        $this->_module = $module;
        $this->_field_list = $field_list;
    }
    
    protected function createSQL($action, array $value_list) {
        
    }
    
    public function __destruct() {
        unset($this->_db);
    }
}

?>
