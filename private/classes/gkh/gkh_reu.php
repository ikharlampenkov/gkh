<?php

/*
  CREATE TABLE IF NOT EXISTS `reu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_info_admin` text,
  PRIMARY KEY (`id`),
  KEY `fk_reu_user` (`user_id`),
  KEY `fk_reu_city1` (`city_id`)
  ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

 */

class gkh_reu extends gkh {

    private $_user;

    public function __construct() {
        parent::__construct();
    }

    public function getAllReu() {
        try {
            $sql = 'SELECT reu.id, reu.title as title, email, city_id, city.title as city_title, is_moderated 
                    FROM reu, city 
                    WHERE reu.city_id=city.id 
                    ORDER BY is_moderated';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getReu($id) {
        try {
            $sql = 'SELECT * FROM reu WHERE id=' . (int) $id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {

                $this->_user = new share_user();
                $result[0]['user'] = $this->_user->getUser($result[0]['user_id']);

                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addReu($data) {
        try {
            $data = $this->_db->prepareArray($data);
            $data['role'] = share_user::UT_REU;

            $this->_user = new share_user();
            $this->_user->addUser($data);

            $temp_user = $this->_user->getUser($data['login']);

            $sql = 'INSERT INTO reu(user_id, city_id, title, email, contact_info_admin) 
                             VALUES(' . $temp_user['id'] . ', ' . $data['city_id'] . ', "' . $data['title'] . '", "' . $data['email'] . '", "' . $data['contact_info_admin'] . '")';
            $this->_db->query($sql);

            unset($temp_user);
            unset($this->_user);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateReu($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            $this->_user = new share_user();
            $this->_user->editUser($data['user_id'], $data);
            
            if (isset($data['is_moderated'])) {
                $data['is_moderated'] = 1;
            } else {
                $data['is_moderated'] = 0;
            }

            $sql = 'UPDATE reu 
                    SET city_id=' . $data['city_id'] . ', title="' . $data['title'] . '", email="' . $data['email'] . '", 
                        contact_info_admin="' . $data['contact_info_admin'] . '", is_moderated=' . $data['is_moderated'] . ' 
                    WHERE id=' . (int) $id;
            $this->_db->query($sql);
            unset($this->_user);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function registNewReu($data) {
        try {
            $data = $this->_db->prepareArray($data);

            $data['role'] = share_user::UT_REU;
            $data['login'] = 'user_reu_' . $data['city_id'] . '_' . date('d-m-Y-H-i-s');
            $data['password'] = '000000';

            $this->_user = new share_user();
            $this->_user->addUser($data);

            $temp_user = $this->_user->getUser($data['login']);

            $sql = 'INSERT INTO reu(user_id, city_id, title, contact_info_admin, what_interested, is_moderated) 
                             VALUES(' . $temp_user['id'] . ', ' . $data['city_id'] . ', "' . $data['title'] . '", "' . $data['contact_info_admin'] . '", "' . $data['what_interested'] . '", 0)';
            $this->_db->query($sql);

            unset($temp_user);
            unset($this->_user);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteReu($id) {
        try {
            $temp_reu = $this->getReu($id);
            $this->_user = new share_user();
            $this->_user->deleteUser($temp_reu['id_user']);

            $sql = 'DELETE FROM reu WHERE id=' . (int) $id;
            $this->_db->query($sql);

            unset($temp_reu);
            unset($this->_user);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function setSupportEmail($id, $email) {
        try {
            $data = $this->_db->prepareString($email);
            $this->_db->query('UPDATE reu SET email="' . $email . '" WHERE id=' . (int) $id);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function recoverPassword($data) {
        try {
            $data = $this->_db->prepareArray($data);
            $this->_user = new share_user();
            $temp_user = $this->_user->getUser($data['login']);

            if ($temp_user !== false) {

                $title = iconv('UTF-8', 'WINDOWS-1251//IGNORE', 'ЖКХИНФОРМ.РФ Восстановление пароля');
                $text ='Здравствуйте, уважаемые коллеги !
                        Ваш логин: ' . $data['login'] . ' . 
                        Ваш пароль: ' . $temp_user['password'];
                $text = iconv('UTF-8', 'KOI8-R//IGNORE', $text);
                
                mail($data['email'], $title, $text, 'From: ');
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public static function getReuId() {
        $db = simo_db::getInstance();
        $sql = 'SELECT id FROM reu WHERE user_id=' . simo_session::getVar('id', 'user');
        $result = $db->query($sql);
        if (isset($result[0][0])) {
            return $result[0][0];
        } else
            return false;
    }

    public function __destruct() {
        parent::__destruct();
    }

}

?>
