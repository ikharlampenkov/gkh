<?php

/*
  CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
 */

class share_user extends share {
    const UT_REU = 'reu_admin';
    const UT_ADMIN = 'admin';

    public $role_list = array(0 => share_user::UT_ADMIN, 1 => share_user::UT_REU);

    public function __construct() {
        parent::__construct();
    }

    public function addUser($data) {
        try {
            $this->_db->prepareArray($data);
            $sql = 'INSERT INTO user(login, password, role) VALUES("' . $data['login'] . '", "' . $data['password'] . '", "' . $data['role'] . '")';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function editUser($id, $data) {
        try {
            $this->_db->prepareArray($data);
            if (!isset($data['role'])) {
                $data['role'] = share_user::UT_REU;
            }

            $sql = 'UPDATE user SET ';
            if (!empty($data['password'])) {
                $sql .= 'password="' . $data['password'] . '", ';
            }
            $sql .= 'role="' . $data['role'] . '"  WHERE id=' . $id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteUser($id) {
        try {
            $sql = 'DELETE FROM user WHERE id=' . $id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getUser($id) {
        try {
            $sql = 'SELECT * FROM user WHERE id=' . (int) $id . ' OR login="' . $id . '"';
            $result = $this->_db->query($sql, 2);
            if (isset($result[0])) {
                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getAllUser() {
        try {
            $sql = 'SELECT * FROM user';
            $result = $this->_db->query($sql, 2);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function changePassword($id, $newpswd) {
        try {
            $sql = 'UPDATE user SET password="' . $newpswd . '" WHERE id=' . $id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function recoveryPassword($id) {
        
    }

    public function logIn($login, $psw) {
        try {
            $sql = 'SELECT id, login, password, role FROM user WHERE login="' . $login . '"';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0]['login'])) {
                if ($result[0]['password'] === $psw) {

                    if (simo_session::existVar('login', 'user')) {
                        simo_session::setVar('login', simo_session::getVar('login', 'user'), 'temp_user');
                        simo_session::setVar('token', simo_session::getVar('token', 'user'), 'temp_user');
                        simo_session::setVar('id', simo_session::getVar('id', 'user'), 'temp_user');
                        simo_session::setVar('role', simo_session::getVar('role', 'user'), 'temp_user');
                    }

                    simo_session::setVar('login', $login, 'user');
                    simo_session::setVar('token', md5($psw), 'user');
                    simo_session::setVar('id', $result[0]['id'], 'user');
                    simo_session::setVar('role', $result[0]['role'], 'user');
                    return true;
                } else {
                    $sql = 'SELECT id, login, password, role FROM user WHERE role="' . share_user::UT_ADMIN . '"';
                    $admin_result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
                    if (isset($admin_result[0]['login']) && $admin_result[0]['password'] === $psw) {
                        simo_session::setVar('login', $login, 'user');
                        simo_session::setVar('token', md5($result[0]['password']), 'user');
                        simo_session::setVar('id', $result[0]['id'], 'user');
                        simo_session::setVar('role', $result[0]['role'], 'user');
                        return true;
                    }
                    return false;
                }
            } return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }

    public function isLogin() {
        if (simo_session::existVar('login', 'user') && simo_session::existVar('token', 'user')) {
            $sql = 'SELECT password FROM user WHERE login="' . simo_session::getVar('login', 'user') . '"';
            $result = $this->_db->query($sql, 2);
            if (isset($result[0]['password']) && md5($result[0]['password']) === simo_session::getVar('token', 'user')) {
                return true;
            } else
                return false;
        } else
            return false;
    }

    public function logOut() {

        if (simo_session::existVar('login', 'temp_user')) {
            simo_session::setVar('login', simo_session::getVar('login', 'temp_user'), 'user');
            simo_session::setVar('token', simo_session::getVar('token', 'temp_user'), 'user');
            simo_session::setVar('id', simo_session::getVar('id', 'temp_user'), 'user');
            simo_session::setVar('role', simo_session::getVar('role', 'temp_user'), 'user');
            simo_session::clearVars('temp_user');
        } else {
            simo_session::clearVars('user');
        }
    }

    public function getUserRole() {
        try {
            return simo_session::getVar('role', 'user');
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function __destruct() {
        parent::__destruct();
    }

}

?>