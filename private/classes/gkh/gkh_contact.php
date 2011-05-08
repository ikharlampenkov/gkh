<?php
/* 
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reu_id` int(10) unsigned NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`reu_id`),
  KEY `fk_contact_reu1` (`reu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
 */

/**
 * Description of gkh_contact
 *
 * @author Moris
 */
class gkh_contact extends gkh {

    private $_reu_id;

    public function  __construct($reu_id) {
        parent::__construct();

        $this->_reu_id = $reu_id;
    }

    public function getContact() {
        try {
            $sql = 'SELECT * FROM contact WHERE reu_id=' . $this->_reu_id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }

    public function setContact($data) {
        try {
            $data = $this->_db->prepareArray($data);

            if ($data['id'] != 0) {
                $sql = 'UPDATE contact SET address="' . $data['address'] . '", phone_number="' . $data['phone_number'] . '" WHERE id=' . $data['id'] . ' AND reu_id=' . $this->_reu_id;
            } else {
                $sql = 'INSERT INTO contact(reu_id, address, phone_number) VALUES(' . $this->_reu_id . ', "' . $data['address'] . '", "' . $data['phone_number'] . '")';
            }
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
