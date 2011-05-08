<?php

include_once $_SERVER['DOCUMENT_ROOT'] . '/allinclud.php';

$page = '';


$o_smarty = new simo_smarty();

$o_smarty->assign('page', $page);

$o_smarty->display('index.tpl');

?>
