<?php
/* 
CREATE TABLE IF NOT EXISTS `tech_support_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reu_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `is_complete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tech_support_ticket_reu1` (`reu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
 *
CREATE TABLE IF NOT EXISTS `tech_support_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `question` text NOT NULL,
  `date_question` datetime NOT NULL,
  `answer` text,
  `date_answer` datetime DEFAULT NULL,
  `file` text,
  PRIMARY KEY (`id`),
  KEY `fk_tech_support_post_tech_support_ticket1` (`tech_support_ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
 */

/**
 * Description of gkh_tech_support_post
 *
 * @author Moris
 */
class gkh_tech_support_post extends gkh {

    public function  __construct() {
        parent::__construct();
    }

    public function getAllTicket($reu_id = 0) {
        try {
            $sql = '';
            if ($reu_id != 0) {
                $sql .= 'SELECT * FROM tech_support_ticket WHERE reu_id=' . (int)$reu_id;
            } else {
                $sql .= 'SELECT tech_support_ticket.id, reu_id, tech_support_ticket.title, date, is_complete, reu.title as reu_title
                         FROM tech_support_ticket, reu
                         WHERE tech_support_ticket.reu_id=reu.id';
            }
            $sql .= ' ORDER BY is_complete, date DESC';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getTicket($id, $reu_id = 0) {
        try {
            $sql = 'SELECT * FROM tech_support_ticket WHERE id=' . (int)$id;
            if ($reu_id != 0) $sql.= ' AND reu_id=' . (int)$reu_id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                $result[0]['post_list'] = $this->getAllSupportPost($result[0]['id']);
                return $result[0];
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getAllSupportPost($ticket_id) {
        try {
            $sql = 'SELECT * FROM tech_support_post WHERE ticket_id=' . (int)$ticket_id . ' ORDER BY date_question';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                foreach ($result as &$res) {
                    if (!empty($res['file'])) {
                        $res['file_list'] = preg_split('/;/', substr($res['file'], 0, strlen($res['file'])-1));
                    } else {
                        $res['file_list'] = false;
                    }

                    if (!empty($res['answer_file'])) {
                        $res['answer_file_list'] = preg_split('/;/', substr($res['answer_file'], 0, strlen($res['answer_file'])-1));
                    } else {
                        $res['answer_file_list'] = false;
                    }

                }
                return $result;
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getSupportPost($id) {
        try {
            $sql = 'SELECT * FROM tech_support_post WHERE id=' . (int)$id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function askQuestion($reu_id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            if (!empty($data['question'])) {

                $date = date('Y-m-d H:i:s');
                $title = substr($data['question'], 0, 255);			

                $sql = 'INSERT INTO tech_support_ticket(reu_id, title, date, is_complete) VALUES(' . $reu_id . ', "' . $title . '", "' . $date . '", 0)';
                $this->_db->query($sql);

                $sql = 'SELECT LAST_INSERT_ID()';
                $tempTicket = $this->_db->query($sql);

                $file = $this->_uploadFile($tempTicket[0][0]);

                $sql = 'INSERT INTO tech_support_post(ticket_id, question, date_question, file) VALUES(' . $tempTicket[0][0] . ', "' . $data['question'] . '", "' . $date . '", "' . $file . '")';
                $this->_db->query($sql);
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function askDopQuestion($ticket_id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            if (!empty($data['question'])) {
			
		$file = $this->_uploadFile($ticket_id);
                $sql = 'INSERT INTO tech_support_post(ticket_id, question, date_question, file) VALUES(' . $ticket_id . ', "' . $data['question'] . '", NOW(), "' . $file . '")';
                $this->_db->query($sql);

                $this->_changeTicketStatus($ticket_id, 0);
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

     public function answerQuestion($ticket_id, $id, $data) {
        try {
            $data = $this->_db->prepareArray($data);

            $file = $this->_uploadFile($ticked_id);

            $sql = 'UPDATE tech_support_post SET answer="' . $data['answer'] . '", date_answer=NOW()';

            if ($file != 'NULL') {
                $sql .= ', answer_file="' . $file . '"';
            }

            $sql .= ' WHERE ticket_id=' . (int)$ticket_id . ' AND id=' . (int)$id;
            $this->_db->query($sql);

            $this->_changeTicketStatus($ticket_id, 1);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    private function _changeTicketStatus($id, $status) {
        try {
            $this->_db->query('UPDATE tech_support_ticket SET is_complete=' . $status . ' WHERE id=' . (int)$id);

        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
	
    private function _uploadFile($ticked_id) {
        global $__cfg;
        $resstr = '';

        if (isset($_FILES)) {
            $i = 0;
            foreach ($_FILES as $file) {
                if (!empty($file['name'])) {
                    $tempInfo = pathinfo($file['name']);
                    $temp_file_name = $ticked_id . '_' . date('d-m-Y-H-i-s') . '_' . $i . '.' . $tempInfo['extension'];

                    $result = copy($file['tmp_name'], $__cfg['temp.support.dir'] . $temp_file_name);
                    chmod($__cfg['temp.support.dir'] . $temp_file_name, 0766);

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
