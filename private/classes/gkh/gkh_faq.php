<?php

/*
  CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`faq` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `parrent_id` INT UNSIGNED NOT NULL DEFAULT 0 ,
  `question` TEXT NOT NULL ,
  `answer` TEXT NULL ,
  `is_folder` TINYINT(1)  NOT NULL DEFAULT 0 ,
   is_situation
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
 */

/**
 * Description of gkh_faq
 *
 * @author Administrator
 */
class gkh_faq extends gkh {
    const IS_FOLDER = 1;
    const IS_ROOT = 0;

    public function __construct() {
        parent::__construct();
    }

    public function getAllFaq() {
        try {
            $sql = 'SELECT * FROM faq';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    public function getSituationFaq() {
        try {
            $sql = 'SELECT * FROM faq WHERE is_situation=1';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getFaq($id) {
        try {
            $sql = 'SELECT * FROM faq WHERE id=' . (int)$id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getFaqCatalog($root) {
        try {
            $sql = 'SELECT * 
                    FROM faq 
                    WHERE parrent_id=' . $root . ' 
                    ORDER BY is_folder DESC, question';
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
            $sql = 'SELECT * FROM faq WHERE is_folder=' . gkh_faq::IS_FOLDER;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
   // parrent_id, question, answer, is_folder

    public function getFullPathToFolder($folder_id, array &$path = array()) {
        try {
            $sql = 'SELECT id, parrent_id, question 
                    FROM faq 
                    WHERE is_folder=' . gkh_faq::IS_FOLDER . ' AND id=' . $folder_id . '';
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

    public function addFaq($data) {
        try {
            $data = $this->_db->prepareArray($data);
            
            if (isset($data['is_situation'])) {
                $data['is_situation'] = 1;
            } else {
                $data['is_situation'] = 0;
            }

            $sql = 'INSERT INTO faq(parrent_id, question, answer, is_folder, is_situation) 
                    VALUES(' . $data['parrent_id'] . ', "' . $data['question'] . '", 
                          "' . $data['answer'] . '", ' . $data['is_folder'] . ', ' . $data['is_situation'] . ')';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateFaq($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            
            if (isset($data['is_situation'])) {
                $data['is_situation'] = 1;
            } else {
                $data['is_situation'] = 0;
            }

            $sql = 'UPDATE faq 
                    SET parrent_id=' . $data['parrent_id'] . ', question="' . $data['question'] . '",  
                        answer="' . $data['answer'] . '", is_folder=' . $data['is_folder'] . ', 
                        is_situation=' . $data['is_situation'] . ' 
                    WHERE id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteFaq($id) {
        try {
            $sql = 'DELETE FROM faq WHERE id=' . (int)$id;
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
