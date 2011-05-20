<?php

/*
 CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`personal` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `fio` VARCHAR(100) NOT NULL ,
  `foto` VARCHAR(255) NULL ,
  `is_leaders` TINYINT(1)  NOT NULL DEFAULT 0 ,
  `department` VARCHAR(255) NULL ,
  `position` VARCHAR(255) NULL ,
  `email` VARCHAR(60) NULL ,
  `sometext` TEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
 */


/**
 * Description of gkh_personal
 *
 * @author Administrator
 */
class gkh_personal extends gkh {
    
    const ANY_PERSONAL = -1;
    const LEADER_PERSONAL = 1;
    const NOT_LEADER_PERSONAL = 0;
    
    public function getAllPersonal($is_leaders = -1) {
        try {
            $sql = 'SELECT * FROM personal';
            if ($is_leaders != gkh_personal::ANY_PERSONAL) {
                $sql .= ' WHERE is_leaders=' . $is_leaders;
            }
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                foreach ($result as &$res) {
                    $res['img_prew'] = $res['foto'];
                }
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getPersonal($id) {
        try {
            $sql = 'SELECT * FROM personal WHERE id=' . (int)$id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                $result[0]['img_prew'] = $result[0]['foto'];
                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addPersonal($data) {
        try {
            $data = $this->_db->prepareArray($data);
            
            if (isset($data['is_leaders'])) {
                $data['is_leaders'] = 1;
            } else {
                $data['is_leaders'] = 0;
            }
            
            $sql = 'INSERT INTO personal(fio, is_leaders, department, position, email, sometext) 
                    VALUES("' . $data['fio'] . '", ' . $data['is_leaders'] . ', "' . $data['department'] . '", 
                           "' . $data['position'] . '", "' . $data['email'] . '", "' . $data['sometext'] . '")';
            $this->_db->query($sql);
            
            $temp_id = $this->_db->query('SELECT LAST_INSERT_ID()');
            
            $file = $this->_uploadFile($temp_id[0][0], 'foto');
            if ($file != 'NULL') {
                $sql = 'UPDATE personal 
                    SET foto="' . $file . '" WHERE id=' . (int)$temp_id[0][0];

                $this->_db->query($sql);
            }            
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updatePersonal($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);

            if (isset($data['is_leaders'])) {
                $data['is_leaders'] = 1;
            } else {
                $data['is_leaders'] = 0;
            }
            
            if (empty($data['area']))
                $data['area'] = 0;

            $sql = 'UPDATE personal 
                    SET fio="' . $data['fio'] . '", is_leaders=' . $data['is_leaders'] . ', 
                        department="' . $data['department'] . '", position="' . $data['position'] . '", 
                        email="' . $data['email'] . '", sometext="' . $data['sometext'] . '"  
                    WHERE id=' . (int)$id;
            $this->_db->query($sql);

            $file = $this->_uploadFile($id, 'img');
            if ($file != 'NULL') {
                $sql = 'UPDATE personal 
                        SET img="' . $file . '" WHERE id=' . (int)$id;

                $this->_db->query($sql);
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deletePersonal($id) {
        try {
            $sql = 'DELETE FROM personal WHERE id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    protected function _uploadFile($id, $field) {
        global $__cfg;
        $resstr = '';

        if (isset($_FILES['data'])) {
            print_r($_FILES);
            if (!empty($_FILES['data']['name'][$field])) {
                $tempInfo = pathinfo($_FILES['data']['name'][$field]);
                $temp_file_name = $id . '_' . date('d-m-Y-H-i-s') . '_' . $i . '.' . $tempInfo['extension'];

                $result = copy($_FILES['data']['tmp_name'][$field], $__cfg['temp.public.dir'] . $temp_file_name);
                chmod($__cfg['temp.public.dir'] . $temp_file_name, 0766);
                return $temp_file_name;
            } else return 'NULL';            
        } else {
            return 'NULL';
        }
    }

    public function deleteFile($id, $field) {
        global $__cfg;
        try {
            $temp = $this->getPersonal($id);
            simo_functions::_delFile($__cfg['temp.public.dir'] . $temp[$field]);

            $sql = 'UPDATE personal 
                        SET ' . $field . '=NULL WHERE id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function __destruct() {
        parent::__destruct();
    } 
}

?>
