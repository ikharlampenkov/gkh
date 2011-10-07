<?php

/*
  function _checkPin($pin) {
  $query = "SELECT * FROM `information_on_debt` WHERE `personal_account`= '$pin'";
  $result = $this->_db->query($query);
  if ($result->numRows()) {
  return true;
  } else {
  return false;
  }
  }

  function _getData($pin) {
  $query = "SELECT `amount_debt`,`amount_penalty`, `amount_debt_w_penalties`, `number_months`  FROM `information_on_debt` WHERE `personal_account` = '$pin'";
  $result = $this->_db->query($query);
  $data = array();
  if ($result->numRows()) {
  $data = $result->fetchRow(2);
  }
  $this->setVarSession(self::SVAR_DATA, $data);
  return true;
  }
 */

/**
 * Проверка существования введенного PIN-кода
 *
 * @return bool
 */
function _checkPinRemote($pin) {
    $result = file('http://xn--f1aefjego4ag.xn--p1ai/debtrq.php?action=checkPin&pin=' . $pin);

    if (!empty($result[0]) && strstr($result[0], 'Error') === false) {
        if ($result[0] == 'true') {
            return true;
        } else {
            return false;
        }
    }
}

/**
 * Получение данных о задолженности по PIN
 *
 * @param string $pin
 * @return bool
 */
function _getDataRemote($pin) {
    $data = array();

    $result = file('http://xn--f1aefjego4ag.xn--p1ai/debtrq.php?action=getData&pin=' . $pin);
    if (!empty($result[0]) && strstr($result[0], 'Error') === false) {
        $tempArray = explode(';', $result[0]);
        $data['amount_debt'] = $tempArray[0];
        $data['amount_penalty'] = $tempArray[1];
        $data['amount_debt_w_penalties'] = $tempArray[2];
        $data['number_months'] = $tempArray[3];
    }
    //$this->setVarSession(self::SVAR_DATA, $data);
    return true;
}

echo _checkPinRemote('04264308');

echo _getDataRemote('04264308');

?>
