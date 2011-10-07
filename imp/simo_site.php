<?php

if( !isset($_SESSION)) {
  session_start() ;
}

/**
 * Подключаем общий файл конфигурации
 *
 */
 $config_path = '/home/dnevnik/private/config/';
 
 if ($_SERVER['SERVER_NAME'] == 'xn--21-kmcm3c.xn--p1ai') {
    include_once $config_path . 'simo_site_reu21_conf.php';
} elseif ($_SERVER['SERVER_NAME'] == 'xn--j1aakaas.xn--p1ai') {
    include_once $config_path . 'simo_site_ooockk_conf.php';
} elseif ($_SERVER['SERVER_NAME'] == 'xn--9-4tbj3b.xn--p1ai') {
    include_once $config_path . 'simo_site_reu9_conf.php';
} elseif ($_SERVER['SERVER_NAME'] == 'xn--19-kmcm3c.xn--p1ai') {
    include_once $config_path . 'simo_site_reu19_conf.php';
} else {
    include_once $config_path . 'simo_site_conf.php';
}

/**
 * Подключаем Smarty
 *
 */
include_once '/home/dnevnik/private/classes/smarty/Smarty.class.php';

/**
 * Функция автоматически загружающая файлы с классами по необходимости
 *
 * @param string $className
 */
function autoload($className) {
  global $__cfg;
  
  if(file_exists($fn = $__cfg['site.main.dir'] . 'private/classes/stdclass/' . $className . '.php')) {
    include_once($fn);
  }

  if (file_exists($fn = $__cfg['site.main.dir'] . 'private/classes/stdclass/db_driver/' . $className . '.php')) {
  	include_once($fn);
  }

  if(file_exists($fn = $__cfg['site.main.dir'] . 'private/classes/share/' . $className . '.php')) {
    include_once($fn);
  }

  if(file_exists($fn = $__cfg['site.main.dir'] . 'private/classes/gkh/' . $className . '.php')) {
    include_once($fn);
  }
  
  if(file_exists($fn = $__cfg['site.main.dir'] . 'private/classes/gkh_site/' . $className . '.php')) {
    include_once($fn);
  }
  
  if(file_exists($fn = $__cfg['site.main.dir'] . 'private/classes/FileManager/' . $className . '.php')) {
    include_once($fn);
  }
}

spl_autoload_register('autoload', false);

$o_log = new simo_log();
$o_log->setLogLevel($__cfg['log.level']);

?>