<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of page_content
 *
 * @author Moris
 */
class page_content extends page {
    
    public function __construct($module, array $field_list) {
        parent::__construct($module, $field_list);
    }
    
    public function setContent($value) {
        $sql = $this->createSQL(page_content::ACTION_UPDATE, $value);
        $this->_db->query($sql);        
    }
    
    public function getContent() {
        $sql = $this->createSQL(page_content::ACTION_SELECT, $value);
        $this->_db->query($sql);
    }


    public function __destruct() {
        parent::__destruct();
    }
    
}

?>
