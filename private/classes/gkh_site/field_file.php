<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of field_file
 *
 * @author Moris
 */
class field_file {
    
    public function __construct($name, $value) {
        parent::__construct($name, 'text', $value);
    }
        
    public function getValue();
    public function setValue($value);
    
    protected function _checkValue($value);
    
    protected function _uploadFile();

    public function __destruct() {
        parent::__destruct();
    }
}

?>
