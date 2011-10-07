<?php

/*
  CREATE  TABLE IF NOT EXISTS `dnevnik_gkh_site_db`.`house` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `street` VARCHAR(50) NOT NULL ,
  `number` INT UNSIGNED NOT NULL ,
  `subnumber` VARCHAR(3) NULL ,
  `area` DECIMAL(9,2) UNSIGNED NULL ,
  `file_repair_plan` VARCHAR(255) NULL ,
  `file_costs_income` VARCHAR(255) NULL ,
  `file_performed_repair` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
  ENGINE = InnoDB
 */

/**
 * Description of gkh_house
 *
 * @author Administrator
 */
class gkh_house extends gkh {

    public function __construct() {
        parent::__construct();
    }

    public function getAllHouse() {
        try {
            $sql = 'SELECT * FROM house ORDER BY street, number, subnumber';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getHouse($id) {
        try {
            $sql = 'SELECT * FROM house WHERE id=' . (int) $id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getHouseCatalog() {
        try {
            $sql = 'SELECT * FROM house ORDER BY street, number, subnumber';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                $retArray = array();
                $i = 0;
                $j = 0;
                $idstreet = $result[0]['street'];

                foreach ($result as $res) {
                    if ($res['street'] != $idstreet) {
                        $idstreet = $res['street'];
                        $i++;
                        $j = 0;
                    }

                    $retArray[$i]['street'] = $res['street'];
                    $retArray[$i]['houses'][$j]['id'] = $res['id'];
                    $retArray[$i]['houses'][$j]['number'] = $res['number'];
                    $retArray[$i]['houses'][$j]['subnumber'] = $res['subnumber'];
                    $retArray[$i]['houses'][$j]['area'] = $res['area'];

                    $retArray[$i]['houses'][$j]['file_repair_plan'] = $res['file_repair_plan'];
                    $retArray[$i]['houses'][$j]['file_costs_income'] = $res['file_costs_income'];
                    $retArray[$i]['houses'][$j]['file_performed_repair'] = $res['file_performed_repair'];

                    $j++;
                }

                return $retArray;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addHouse($data) {
        try {
            $data = $this->_db->prepareArray($data);

            if (empty($data['area']))
                $data['area'] = 0;



            if (strpos($data['number'], ',') !== false) {
                $house_array = explode(',', $data['number']);
                foreach ($house_array as $house) {
                    $sql = 'INSERT INTO house(street, number, subnumber, area)
                    VALUES("' . $data['street'] . '", ' . $house . ', "' . $data['subnumber'] . '", ' . str_replace(',', '.', $data['area']) . ')';
                    $this->_db->query($sql);
                }
            } else {
                $sql = 'INSERT INTO house(street, number, subnumber, area)
                    VALUES("' . $data['street'] . '", ' . $data['number'] . ', "' . $data['subnumber'] . '", ' . str_replace(',', '.', $data['area']) . ')';
                $this->_db->query($sql);
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateHouse($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);

            if (empty($data['area']))
                $data['area'] = 0;

            $sql = 'UPDATE house
                    SET street="' . $data['street'] . '", number=' . $data['number'] . ',
                        subnumber="' . $data['subnumber'] . '", area=' . str_replace(',', '.', $data['area']) . '
                    WHERE id=' . (int) $id;
            $this->_db->query($sql);

            $file = $this->_uploadFile($id, 'file_repair_plan');
            if ($file != 'NULL') {
                $sql = 'UPDATE house
                    SET file_repair_plan="' . $file . '" WHERE id=' . (int) $id;

                $this->_db->query($sql);
            }

            $file = $this->_uploadFile($id, 'file_costs_income');
            if ($file != 'NULL') {
                $sql = 'UPDATE house
                    SET file_costs_income="' . $file . '" WHERE id=' . (int) $id;

                $this->_db->query($sql);
            }

            $file = $this->_uploadFile($id, 'file_performed_repair');
            if ($file != 'NULL') {
                $sql = 'UPDATE house
                    SET file_performed_repair="' . $file . '" WHERE id=' . (int) $id;

                $this->_db->query($sql);
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteHouse($id) {
        try {
            $sql = 'DELETE FROM house WHERE id=' . (int) $id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    protected function _uploadFile($id, $field) {
        global $__cfg;
        $resstr = '';

        if (isset($_FILES['data'])) {
            //print_r($_FILES);
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
            $temp = $this->getHouse($id);
            simo_functions::_delFile($__cfg['temp.public.dir'] . $temp[$field]);

            $sql = 'UPDATE house
                        SET ' . $field . '=NULL WHERE id=' . (int) $id;
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
