<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Field
 *
 * @author Moris
 */
abstract class field {
    
    protected $_name;
    protected $_type;
    protected $_value;
    
    
    public function __construct($name, $type, $value) {
        $this->_name = $name;
        $this->_type = $type;
        $this->_value = $value;
    }
    
    public function getName() {
        return $this->_name;
    }
    
    public function getType() {
        return $this->_type;
    }
    
    abstract public function getValue();
    abstract public function setValue($value);
    
    abstract protected function _checkValue($value);

    public function __destruct() {
        unset($this->_name);
        unset($this->_type);
        unset($this->_value);
    }
    
}

?>
