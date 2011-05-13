<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of field_textarea
 *
 * @author Moris
 */
class field_textarea extends field {
   
    public function __construct($name, $value) {
        parent::__construct($name, 'textarea', $value);
    }
        
    public function getValue();
    public function setValue($value);
    
    protected function _checkValue($value);

    public function __destruct() {
        parent::__destruct();
    }
    
}

?>
