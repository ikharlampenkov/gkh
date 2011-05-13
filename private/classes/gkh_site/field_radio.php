<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of field_radio
 *
 * @author Moris
 */
class field_radio extends field {
    
    public function __construct($name, $value) {
        parent::__construct($name, 'radio', $value);
    }
        
    public function getValue();
    public function setValue($value);
    
    protected function _checkValue($value);

    public function __destruct() {
        parent::__destruct();
    }
    
}

?>
