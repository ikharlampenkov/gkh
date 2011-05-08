<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of gkh_city
 *
 * @author Moris
 */
class gkh_city extends gkh {

    public function  __construct() {
        parent::__construct();
    }

    public function getAllCity() {
        try {
            $sql = 'SELECT * FROM city';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getCity($id) {
        try {
            $sql = 'SELECT * FROM city WHERE id=' . (int)$id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addCity($data) {
        try {
            $data = $this->_db->prepareArray($data);
            
            $sql = 'INSERT INTO city(title, phone_code) VALUES("' . $data['title'] . '", "' . $data['phone_code'] . '")';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateCity($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            $sql = 'UPDATE city SET title="' . $data['title'] . '", phone_code="' . $data['phone_code'] . '" WHERE id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteCity($id) {
        try {
            $sql = 'DELETE FROM city WHERE id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function  __destruct() {
        parent::__destruct();
    }
}
?>
