<?php

/**
 * Настройки системы
 *
 * @author Moris
 * @package simo
 */

$__cfg['db.dsn'] = 'mysqli://gkx_user:123456@localhost/dnevnik_gkh_site_db';
$__cfg['site.main.dir'] = 'H:/www/gkh/';
$__cfg['db.driver.path'] = $__cfg['site.main.dir'] . 'private/classes/stdclass/db_driver/';
$__cfg['db.driver.debug'] = true;

$__cfg['log.path'] = $__cfg['site.main.dir'] . 'private/logs/';
$__cfg['log.level'] = 2;

$__cfg['system.debug'] = true;

$__cfg['smarty.templates'] = $__cfg['site.main.dir'] . 'private/smartytemplates_site/templates/';
$__cfg['smarty.compile']   = $__cfg['site.main.dir'] . 'private/smartytemplates_site/templates_c/';
$__cfg['smarty.cache']     = $__cfg['site.main.dir'] . 'private/smartytemplates_site/cache/';
$__cfg['smarty.compile_check'] = true;
$__cfg['smarty.debug'] = false;

$__cfg['smarty.default.title'] = 'Сайт управляющей компании. ЖКХИНФОРМ.РФ';
$__cfg['smarty.default.desc'] = '';
$__cfg['smarty.default.keyword'] = '';

//$__cfg['smarty.encoding'] = 'windows-1251';
$__cfg['smarty.encoding'] = 'utf-8';

$__cfg['site.dir'] = $__cfg['site.main.dir'] . 'public/site_gkh';
$__cfg['site.url'] = 'http://www.site.gkh/';

$__cfg['temp.dir'] = $__cfg['site.main.dir'] . 'private/temp/';
$__cfg['temp.support.dir'] = $__cfg['site.main.dir'] . 'public/temp_support/';

$__cfg['sms.login'] = 'sibdnevnik';
$__cfg['sms.password'] = 'kirill604';

?>