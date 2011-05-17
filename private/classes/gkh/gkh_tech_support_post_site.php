<?php

/*
 CREATE TABLE IF NOT EXISTS `tech_support_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personal_account_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `category` int(11) DEFAULT NULL,
  `ticket_state_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tech_support_ticket_personal_account1` (`personal_account_id`),
  KEY `fk_tech_support_ticket_ticket_state1` (`ticket_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 */

/**
 * Description of gkh_tech_support_post_site
 *
 * @author Moris
 */
class gkh_tech_support_post_site extends gkh_tech_support_post {
    
    const CATEGORY_REQUEST_MASTER = 'request_master';
    const CATEGORY_QUESTION = 'question';
    
    protected $_personal_account;
    
    public function __construct($personal_account) {
        parent::__construct();

        $this->_personal_account = $personal_account;
    }
    
    public function getAllTicket($category) {
        try {
            $sql = '';
            if ($this->_personal_account != 0) {
                $sql .= 'SELECT tech_support_ticket.id, personal_account_id, tech_support_ticket.title, date, category, tech_support_ticket_status.title as status  
                         FROM tech_support_ticket, tech_support_ticket_status 
                         WHERE tech_support_ticket.ticket_status_id=tech_support_ticket_status.id 
                           AND personal_account_id=' . $this->_personal_account .' 
                           AND category="' . $category . '"';
            } else {
                $sql .= 'SELECT tech_support_ticket.id, personal_account_id, tech_support_ticket.title, date, category, tech_support_ticket_status.title as status 
                         FROM tech_support_ticket, tech_support_ticket_status
                         WHERE tech_support_ticket.ticket_status_id=tech_support_ticket_status.id 
                           AND category="' . $category . '"';
            }
            $sql .= ' ORDER BY rating DESC, date DESC';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getTicket($id, $category) {
        try {
            $sql = 'SELECT tech_support_ticket.id, personal_account_id, tech_support_ticket.title, date, category, tech_support_ticket_status.title as status 
                    FROM tech_support_ticket, tech_support_ticket_status  
                    WHERE tech_support_ticket.ticket_status_id=tech_support_ticket_status.id 
                      AND tech_support_ticket.id=' . (int)$id . ' AND category="' . $category . '" ';
            if ($this->_personal_account != 0) $sql.= ' AND personal_account_id=' . $this->_personal_account;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                $result[0]['post_list'] = $this->getAllSupportPost($result[0]['id']);
                return $result[0];
            } else return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function askQuestion($data, $category) {
        try {
            $data = $this->_db->prepareArray($data);
            if (!empty($data['question'])) {

                $date = date('Y-m-d H:i:s');
                $title = substr($data['question'], 0, 255);			

                $sql = 'INSERT INTO tech_support_ticket(personal_account_id, title, date, category, ticket_status_id) 
                        VALUES(' . $this->_personal_account . ', "' . $title . '", "' . $date . '", "' . $category  . '", ' . gkh_tech_support_post::NEW_TICKET_STATUS . ')';
                $this->_db->query($sql);

                $sql = 'SELECT LAST_INSERT_ID()';
                $tempTicket = $this->_db->query($sql);

                $file = $this->_uploadFile($tempTicket[0][0]);

                $sql = 'INSERT INTO tech_support_post(ticket_id, question, date_question, file) 
                        VALUES(' . $tempTicket[0][0] . ', "' . $data['question'] . '", "' . $date . '", "' . $file . '")';
                $this->_db->query($sql);
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }   
    
}

?>
