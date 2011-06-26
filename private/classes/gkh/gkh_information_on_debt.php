<?php

/*
 CREATE TABLE IF NOT EXISTS `personal_account` (
  `id` int(10) unsigned NOT NULL,
  `reu_id` int(10) unsigned NOT NULL,
  `phone_number` varchar(255) default NULL,
  `mobile_phone_number` varchar(255) default NULL,
  `ai_phone_number` varchar(255) default NULL,
  `ai_mobile_phone_number` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_personal_account_reu1` (`reu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */

/*
  CREATE TABLE IF NOT EXISTS `information_on_debt` (
  `personal_account` int(10) unsigned NOT NULL COMMENT 'лицевой_счет',
  `reu_id` int(10) unsigned NOT NULL,
  `sector` int(10) unsigned NOT NULL COMMENT 'сектор',
  `street` varchar(100) NOT NULL COMMENT 'улица',
  `house` varchar(10) NOT NULL COMMENT 'дом',
  `apartment` int(10) unsigned NOT NULL COMMENT 'квартира',
  `fio` varchar(255) default NULL COMMENT 'фио',
  `amount_debt` decimal(12,2) default NULL COMMENT 'сумма_долга',
  `amount_penalty` decimal(12,2) default NULL COMMENT 'сумма_пени',
  `amount_debt_w_penalties` decimal(12,2) default NULL COMMENT 'сумма_долга_c_пеней',
  `number_months` int(11) default NULL COMMENT 'кол_во_мес',
  `status_housing` varchar(255) default NULL COMMENT 'статус_жилья',
  `total_area` decimal(12,2) unsigned default NULL COMMENT 'общая_площадь',
  `number_persons` int(10) unsigned default NULL COMMENT 'кол_во_прожив',
  `number_personal_accounts` int(10) unsigned default NULL COMMENT 'кол_л_сч',
  `reu` varchar(10) default NULL COMMENT 'рэу',
  `allowance` varchar(255) default NULL COMMENT 'льгота',
  PRIMARY KEY  (`personal_account`),
  KEY `fk_information on debt_reu1` (`reu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 */

/**
 * Description of gkh_information_on_debt
 *
 * @author Moris
 */
class gkh_information_on_debt extends gkh {

    private $_reu_id;
    private $_upload_file_name;
    private $_field_delim = ';';
    public $column_order = array('sector' => 0, 'street' => 1, 'house' => 2, 'apartment' => 3, 'fio' => 4, 'phone_number' => 6, 'personal_account' => 7,
        'amount_debt' => 8, 'amount_penalty' => 9, 'amount_debt_w_penalties' => 10, 'number_months' => 11, 'status_housing' => 12,
        'total_area' => 13, 'number_persons' => 14, 'number_personal_accounts' => 15, 'reu' => 17, 'allowance' => 18);

    public function __construct($reu_id) {
        parent::__construct();

        $this->_reu_id = $reu_id;
    }

    public function getAllDebtInfo($street = '', $house = '', $apartment = '') {
        try {
            $sql = 'SELECT * FROM information_on_debt WHERE reu_id=' . $this->_reu_id;

            if ($street != '')
                $sql .= ' AND street="' . $street . '" ';
            if ($house != '')
                $sql .= ' AND house=' . $house . ' ';
            if ($apartment != '')
                $sql .= ' AND apartment="' . $apartment . '" ';

            $sql .= ' ORDER BY amount_debt_w_penalties DESC';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }

    public function getFilterList($field) {
        try {
            $sql = 'SELECT DISTINCT ' . $field . ' as ' . $field . ' FROM information_on_debt WHERE reu_id=' . $this->_reu_id . ' ORDER BY ' . $field;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }

    public function sendDebtMessage($data) {
        global $__cfg;
        foreach ($data as $key => $value) {
            $temp_key = preg_split('/_/', $key);
            try {
                $sql = 'SELECT phone_number, fio, amount_debt, amount_penalty, amount_debt_w_penalties FROM information_on_debt
                        WHERE reu_id=' . $this->_reu_id . ' AND sector=' . $temp_key[1] . ' AND street="' . $temp_key[2] . '" AND house="' . $temp_key[3] . '" AND apartment=' . $temp_key[4];
                $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);

                $message = $result['fio'] . ' задолженность: ' . $result['amount_debt'] . ' пеня: ' . $result['amount_penalty'] . ' зодолженность с пеней: ' . $result['amount_debt_w_penalties'];
                $this->_send_sms($result['phone_number'], mb_convert_encoding($message, 'Windows-1251', 'UTF-8'), $__cfg['sms.login'], $__cfg['sms.password']); //рассылка сообщения
            } catch (Exception $e) {
                simo_exception::registrMsg($e, $this->_debug);
            }
        }
    }

    public function sendMessage($data) {
        $message = $data['message'];
        foreach ($data['debts'] as $key => $value) {
            $temp_key = preg_split('/_/', $key);
            try {
                $sql = 'SELECT phone_number, fio, amount_debt, amount_penalty, amount_debt_w_penalties FROM information_on_debt
                        WHERE reu_id=' . $this->_reu_id . ' AND sector=' . $temp_key[1] . ' AND street="' . $temp_key[2] . '" AND house="' . $temp_key[3] . '" AND apartment=' . $temp_key[4];
                $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);

                $this->_send_sms($result['phone_number'], mb_convert_encoding($message, 'Windows-1251', 'UTF-8'), $__cfg['sms.login'], $__cfg['sms.password']); //рассылка сообщения
            } catch (Exception $e) {
                simo_exception::registrMsg($e, $this->_debug);
            }
        }
    }

    public function processingUploadFile() {
        global $__cfg;
        $this->_uploadFile();

        $first = true;

        if ($this->_upload_file_name !== '') {
            $file = fopen($__cfg['temp.dir'] . $this->_upload_file_name, 'r');
            
            $this->_db->query('DELETE FROM information_on_debt WHERE reu_id=' . $this->_reu_id);

            while (($line = fgets($file)) !== false) {
                $temp_array = preg_split('/' . $this->_field_delim . '/', $line);
                if ($first) {
                    $first = false;
                } else {

                    if ($temp_array[$this->column_order['street']] != 'Итого по уч' && $temp_array[$this->column_order['house']] != 999999 && $temp_array[$this->column_order['street']] != 'Итого') {
                        //echo $temp_array[$this->column_order['street']];
                        // echo $temp_array[$this->column_order['house']];
                        //print_r($temp_array);

                        try {
                            $temp_array = $this->_db->prepareArray($temp_array);
                            $temp_array[$this->column_order['amount_debt']] = str_replace(',', '.', $temp_array[$this->column_order['amount_debt']]);
                            $temp_array[$this->column_order['amount_penalty']] = str_replace(',', '.', $temp_array[$this->column_order['amount_penalty']]);
                            $temp_array[$this->column_order['amount_debt_w_penalties']] = str_replace(',', '.', $temp_array[$this->column_order['amount_debt_w_penalties']]);
                            $temp_array[$this->column_order['total_area']] = str_replace(',', '.', $temp_array[$this->column_order['total_area']]);

                            $this->_addPersonalAccount($temp_array);
                            
                            $sql = 'INSERT INTO information_on_debt(personal_account, reu_id, sector, street, house, apartment, fio, amount_debt, amount_penalty, amount_debt_w_penalties,
                                                                number_months, status_housing, total_area, number_persons, number_personal_accounts, reu, allowance)
                                                         VALUES(' . $temp_array[$this->column_order['personal_account']] . ', ' . $this->_reu_id . ', ' . $temp_array[$this->column_order['sector']] . ', "' . $temp_array[$this->column_order['street']] . '",
                                                                "' . $temp_array[$this->column_order['house']] . '", ' . $temp_array[$this->column_order['apartment']] . ',
                                                                "' . $temp_array[$this->column_order['fio']] . '", "' . $temp_array[$this->column_order['amount_debt']] . '", "' . $temp_array[$this->column_order['amount_penalty']] . '", "' . $temp_array[$this->column_order['amount_debt_w_penalties']] . '",
                                                                ' . $temp_array[$this->column_order['number_months']] . ', "' . $temp_array[$this->column_order['status_housing']] . '", "' . $temp_array[$this->column_order['total_area']] . '",
                                                                "' . $temp_array[$this->column_order['number_persons']] . '", "' . $temp_array[$this->column_order['number_personal_accounts']] . '",
                                                                "' . $temp_array[$this->column_order['reu']] . '", "' . $temp_array[$this->column_order['allowance']] . '")';
                            $this->_db->query($sql);
                        } catch (Exception $e) {
                            simo_exception::registrMsg($e, $this->_debug);
                        }
                    }
                }
            }
            fclose($file);
            unlink($__cfg['temp.dir'] . $this->_upload_file_name);
        }
    }
    
    private function _uploadFile() {
        global $__cfg;
        if (isset($_FILES['data'])) {
            $temp_file_name = $this->_reu_id . '_' . date('d-m-Y-H-i-s') . '.csv';
            $result = copy($_FILES['data']['tmp_name']['file'], $__cfg['temp.dir'] . $temp_file_name);
            chmod($__cfg['temp.dir'] . $temp_file_name, 0766);
            if ($result) {
                $this->_upload_file_name = $temp_file_name;
                $this->_addHistoryRecord();
            }
        }
    }
    
    private function _addPersonalAccount($data) {
        $sql = 'SELECT COUNT(id) FROM personal_account WHERE reu_id=' . $this->_reu_id . ' AND id=' . $data[$this->column_order['personal_account']];
        $result = $this->_db->query($sql);
        
        if (isset($result[0][0]) && $result[0][0] == 0) {
            $sql = 'INSERT INTO personal_account(id, reu_id, phone_number, ai_phone_number) 
                    VALUES(' . $data[$this->column_order['personal_account']] . ', ' . $this->_reu_id . ', 
                           "' . $data[$this->column_order['phone_number']] . '", "' . $data[$this->column_order['phone_number']] . '")';
            $this->_db->query($sql);
        }
    }
    
    private function _addHistoryRecord() {
        global $__cfg;
        try {
            $file = fopen($__cfg['temp.dir'] . $this->_upload_file_name, 'r');
            $conent = fread($file, filesize($__cfg['temp.dir'] . $this->_upload_file_name));
            fclose($file);

            $conent = mb_convert_encoding($conent, 'UTF-8', 'Windows-1251');

            $file = fopen($__cfg['temp.dir'] . $this->_upload_file_name, 'w+');
            fwrite($file, $conent);
            fclose($file);

            $sql = 'INSERT INTO update_history(reu_id, date, content) VALUES(' . $this->_reu_id . ', NOW(), "' . $this->_db->prepareString($conent) . '")';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getAllHistory($limit = 0) {
        try {
            $sql = 'SELECT * FROM update_history WHERE reu_id=' . $this->_reu_id . ' ORDER BY date DESC';
            if ($limit != 0) {
                $sql .= ' LIMIT ' . $limit;
            }

            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    private function _send_sms($to, $msg, $login, $password) {
        $u = 'http://www.websms.ru/http_in4.asp';
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, 'Http_username=' . urlencode($login) . '&Http_password=' . urlencode($password) . '&Phone_list=' . $to . '&Message=' . urlencode($msg));
        curl_setopt($ch, CURLOPT_URL, $u);
        $u = trim(curl_exec($ch));
        curl_close($ch);
        return (preg_match('#Http_id\s*=\s*0#i', $u));
    }

    public function __destruct() {
        parent::__destruct();
    }

}

?>