<?php

/*
  CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`document` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `parrent_id` INT UNSIGNED NOT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `short_text` TEXT NULL ,
  `file` VARCHAR(255) NULL ,
  `is_folder` TINYINT(1)  NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_document_document1` (`parrent_id` ASC) ,
  CONSTRAINT `fk_document_document1`
  FOREIGN KEY (`parrent_id` )
  REFERENCES `dnevnik_gkh_site_db`.`document` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
  ENGINE = InnoDB
 */

/**
 * Description of gkh_document
 *
 * @author Administrator
 */
class gkh_document extends gkh {
    const IS_FOLDER = 1;
    const IS_ROOT = 0;

    public function __construct() {
        parent::__construct();
    }

    public function getAllDocument() {
        try {
            $sql = 'SELECT * FROM document';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getDocument($id) {
        try {
            $sql = 'SELECT * FROM document WHERE id=' . (int)$id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getDocumentCatalog($root) {
        try {
            $sql = 'SELECT * 
                    FROM document 
                    WHERE parrent_id=' . $root . ' 
                    ORDER BY is_folder DESC, title';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getFolderList() {
        try {
            $sql = 'SELECT * FROM document WHERE is_folder=' . gkh_document::IS_FOLDER;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getFullPathToFolder($folder_id, array &$path = array()) {
        try {
            $sql = 'SELECT id, parrent_id, title 
                    FROM document 
                    WHERE is_folder=' . gkh_document::IS_FOLDER . ' AND id=' . $folder_id . '';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                //if ($result[0]['id'] != $folder_id) {
                $path[] = $result[0];
                //}   
                if ($result[0]['parrent_id'] != self::IS_ROOT) {
                    $this->getFullPathToFolder($result[0]['parrent_id'], $path);
                }
                return $path;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addDocument($data) {
        try {
            $data = $this->_db->prepareArray($data);

            $sql = 'INSERT INTO document(parrent_id, title, short_text, is_folder) 
                    VALUES(' . $data['parrent_id'] . ', "' . $data['title'] . '", "' . $data['short_text'] . '", ' . $data['is_folder'] . ')';
            $this->_db->query($sql);

            $sql = 'SELECT LAST_INSERT_ID()';
            $temp_id = $this->_db->query($sql);

            $file = $this->_uploadFile($temp_id[0][0], 'file');

            if ($file != 'NULL') {
                $sql = 'UPDATE document SET file="' . $file . '" 
                        WHERE id=' . (int)$temp_id[0][0];
                $this->_db->query($sql);
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateDocument($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);

            $sql = 'UPDATE document 
                    SET parrent_id=' . $data['parrent_id'] . ', title="' . $data['title'] . '",  
                        short_text="' . $data['short_text'] . '", is_folder=' . $data['is_folder'] . ' 
                    WHERE id=' . (int)$id;
            $this->_db->query($sql);

            $file = $this->_uploadFile($id, 'file');
            if ($file != 'NULL') {
                $sql = 'UPDATE document 
                    SET file="' . $file . '" WHERE id=' . (int)$id;

                $this->_db->query($sql);
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteDocument($id) {
        try {
            $sql = 'DELETE FROM document WHERE id=' . (int)$id;
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
            } else
                return 'NULL';
        } else {
            return 'NULL';
        }
    }

    public function deleteFile($id, $field) {
        global $__cfg;
        try {
            $temp = $this->getDocument($id);
            simo_functions::_delFile($__cfg['temp.public.dir'] . $temp[$field]);

            $sql = 'UPDATE document 
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
