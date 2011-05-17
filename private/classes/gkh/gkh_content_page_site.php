<?php
/* 
 CREATE TABLE IF NOT EXISTS `content_page` (
  `id` int(11) NOT NULL,
  `page_title` varchar(40) NOT NULL DEFAULT 'английское название для системы',
  `title` varchar(255) NOT NULL,
  `content` text,
  `file` varchar(255), 
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_title_UNIQUE` (`page_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 */

class gkh_content_page_site extends gkh_content_page {

    public function  __construct() {
        parent::__construct();
    }

    public function getContentPage($id) {
        try {
            $sql = 'SELECT * FROM content_page WHERE id=' . (int)$id . ' OR page_title="' . $id . '"';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addContentPage($data) {
        parent::addContentPage($data);
        try {
                        
            $sql = 'SELECT LAST_INSERT_ID()';
            $temp_id = $this->_db->query($sql);

            $file = $this->_uploadFile($temp_id[0][0]);
            
            if ($file != 'NULL') {
                $sql = 'UPDATE content_page SET file="' . $file . '" 
                        WHERE id=' . (int)$temp_id[0][0];
                $this->_db->query($sql);
            }            
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateContentPage($id, $data) {
        parent::updateContentPage($id, $data);
        try {            
            $file = $this->_uploadFile($id);
            if ($file != 'NULL') {
            $sql = 'UPDATE content_page 
                    SET file="' . $file . '" WHERE id=' . (int)$id;
            
            $this->_db->query($sql);
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    public function deleteFile($id) {
        global $__cfg;
        try {
            $temp = $this->getContentPage($id);
            simo_functions::_delFile($__cfg['temp.public.dir'] . $temp['file']);
            
            $sql = 'UPDATE content_page 
                    SET file=NULL WHERE id=' . (int)$id;
            
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    protected function _uploadFile($id) {
        global $__cfg;
        $resstr = '';

        if (isset($_FILES)) {
            $i = 0;
            foreach ($_FILES as $file) {
                if (!empty($file['name'])) {
                    $tempInfo = pathinfo($file['name']);
                    $temp_file_name = $id . '_' . date('d-m-Y-H-i-s') . '_' . $i . '.' . $tempInfo['extension'];

                    $result = copy($file['tmp_name'], $__cfg['temp.public.dir'] . $temp_file_name);
                    chmod($__cfg['temp.public.dir'] . $temp_file_name, 0766);

                    $resstr .= $temp_file_name;
                    $i++;
                }
            }
            return $resstr;
        } else {
            return 'NULL';
        }
    }
    
    public function  __destruct() {
        parent::__destruct();
    }

}

?>
