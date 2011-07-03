<?php

/*
 CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`license` (
  `id` INT NOT NULL ,
  `description` VARCHAR(255) NOT NULL ,
  `img` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
 */

/**
 * Description of gkh_licencse
 *
 * @author Administrator
 */
class gkh_license extends gkh {
    
    private $_img;
    
    public function __construct() {
        parent::__construct();
        
        global $__cfg;
        $this->_img = new Image($__cfg['temp.public.dir']);
        
        
    }

    public function getAllLicense() {
        try {
            $sql = 'SELECT * FROM license';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                foreach ($result as &$res) {
                    $this->_img->setName($res['img']);
                    $res['img_prew'] = $this->_img->getPreview();
                }
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getLicense($id) {
        try {
            $sql = 'SELECT * FROM license WHERE id=' . (int)$id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                $this->_img->setName($result[0]['img']);
                $result[0]['img_prew'] = $this->_img->getPreview();
                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addLicense($data) {
        try {
            $data = $this->_db->prepareArray($data);
            
            $sql = 'INSERT INTO license(img, description) 
                    VALUES("", "' . $data['description'] . '")';
            $this->_db->query($sql);
            
            $temp_id = $this->_db->query('SELECT LAST_INSERT_ID()');
            
            $fileName = $this->_img->download('img');
            if ($fileName !== false) {
                $this->_img->createPreview();
                $sql = 'UPDATE license 
                    SET img="' . $fileName . '" WHERE id=' . (int)$temp_id[0][0];

                $this->_db->query($sql);
            }
            
            //$file = $this->_uploadFile($temp_id[0][0], 'img');
            /*
            if ($file != 'NULL') {
                $sql = 'UPDATE license 
                    SET img="' . $file . '" WHERE id=' . (int)$temp_id[0][0];

                $this->_db->query($sql);
            } 
             * 
             */           
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateLicense($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);

            $sql = 'UPDATE license 
                    SET description="' . $data['description'] . '"  
                    WHERE id=' . (int)$id;
            $this->_db->query($sql);
            
            $fileName = $this->_img->download('img');
            if ($fileName !== false) {
                $this->_img->createPreview();
                $sql = 'UPDATE license 
                        SET img="' . $fileName . '" WHERE id=' . (int)$id;

                $this->_db->query($sql);
            }
/*
            $file = $this->_uploadFile($id, 'img');
            if ($file != 'NULL') {
                $sql = 'UPDATE license 
                        SET img="' . $file . '" WHERE id=' . (int)$id;

                $this->_db->query($sql);
            }
 * 
 */
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteLicense($id) {
        try {
            $sql = 'DELETE FROM license WHERE id=' . (int)$id;
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
            $temp = $this->getLicense($id);
            
            $this->_img->setName($temp[$field]);
            $this->_img->delete();
            
            //simo_functions::_delFile($__cfg['temp.public.dir'] . $temp[$field]);

            $sql = 'UPDATE license 
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
