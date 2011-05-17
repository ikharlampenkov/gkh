<?php
/* 
 CREATE TABLE IF NOT EXISTS `content_page` (
  `id` int(11) NOT NULL,
  `management_company_id` ,
  `page_title` varchar(40) NOT NULL DEFAULT 'английское название для системы',
  `title` varchar(255) NOT NULL,
  `content` text,
  `file` varchar(255), 
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_title_UNIQUE` (`page_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 */

class gkh_content_page_site extends gkh {

    protected $_management_company;

    public function  __construct($management_company) {
        parent::__construct();
        
        $this->_management_company = $management_company;
    }

    public function getAllContentPage() {
        try {
            $sql = 'SELECT * FROM content_page WHERE management_company_id=' . $this->_management_company;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
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
        try {
            $data = $this->_db->prepareArray($data);
            $sql = 'INSERT INTO content_page(management_company_id, page_title, title, content) 
                    VALUES(' . $this->_management_company . ', "' . $data['page_title'] . '", "' . $data['title'] . '", "' . $data['content'] . '")';
            $this->_db->query($sql);
            
            $sql = 'SELECT LAST_INSERT_ID()';
            $temp_id = $this->_db->query($sql);

            $file = $this->_uploadFile($temp_id[0][0]);
            
            if ($file != 'NULL') {
                $sql = 'UPDATE content_page SET file="' . $file . '" 
                        WHERE management_company_id=' . $this->_management_company . ' AND id=' . (int)$temp_id[0][0];
                $this->_db->query($sql);
            }            
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateContentPage($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            
            $file = $this->_uploadFile($id);
            
            $sql = 'UPDATE content_page 
                    SET page_title="' . $data['page_title'] . '", title="' . $data['title'] . '", content="' . $data['content'] . '" ';
            
            if ($file != 'NULL') {
                $sql .= ', file="' . $file . '" ';
            }
            
            $sql .= ' WHERE management_company_id=' . $this->_management_company . ' AND id=' . (int)$id;
            
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteContentPage($id) {
        try {
            $sql = 'DELETE FROM content_page WHERE management_company_id=' . $this->_management_company . ' AND id=' . (int)$id;
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

                    $resstr .= $temp_file_name . ';';
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
