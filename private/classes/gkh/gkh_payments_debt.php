<?php

/*
  CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`payments_debt` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `payment` DECIMAL(8,2) NULL ,
  `debt` DECIMAL(8,2) NULL ,
  `personal_account_id` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_payments_debt_personal_account1` (`personal_account_id` ASC) ,
  CONSTRAINT `fk_payments_debt_personal_account1`
  FOREIGN KEY (`personal_account_id` )
  REFERENCES `dnevnik_gkh_site_db`.`personal_account` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
  ENGINE = InnoDB
 */

/**
 * Description of gkh_payments_debt
 *
 * @author Moris
 */
class gkh_payments_debt extends gkh {

    protected $_personal_account;

    public function __construct($personal_account) {
        parent::__construct();

        $this->_personal_account = $personal_account;
    }

    public function getBalance() {
        try {
            $sql = 'SELECT * 
                    FROM payments_debt 
                    WHERE personal_account_id=' . $this->_personal_account . ' 
                    ORDER BY date';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                $balance = array();
                $i = 0;
                foreach ($result as $res) {
                    if ($i == 0) {
                        $balance[$i]['id'] = $res['id'];
                        $balance[$i]['date'] = $res['date'];
                        $balance[$i]['total_beginning_month'] = 0;
                        $balance[$i]['debt'] = $res['debt'];
                        $balance[$i]['payment'] = $res['payment'];
                        $balance[$i]['total_end_month'] = $res['debt'] - $res['payment'];
                    } else {
                        $balance[$i]['id'] = $res['id'];
                        $balance[$i]['date'] = $res['date'];
                        $balance[$i]['total_beginning_month'] = $balance[$i-1]['total_end_month'];
                        $balance[$i]['debt'] = $res['debt'];
                        $balance[$i]['payment'] = $res['payment'];
                        $balance[$i]['total_end_month'] = $balance[$i]['total_beginning_month'] + $res['debt'] - $res['payment'];
                    }
                    $i++;
                }
                return $balance;
            } else {
                return false;
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            return false;
        }
    }

    public function __destruct() {
        parent::__destruct();
    }

}

?>
