<?php

include_once $_SERVER['DOCUMENT_ROOT'] . '/allinclud.php';

$o_smarty = new simo_smarty();
$o_user = new share_user_site();

if (isset($_GET['page'])) {
    $page = $_GET['page'];
} else {
    $page = '';
}

if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = '';
}

$o_smarty->assign('page', $page);
$o_smarty->assign('action', $action);


if ($o_user->isLogin()) {
    $o_smarty->assign('login', true);
    $o_smarty->assign('user', simo_session::getVar('login', 'user'));
    $o_smarty->assign('role', $o_user->getUserRole());

    if (isset($_GET['logout'])) {
        $o_user->logOut();
        header("Location: /");
    }

    if ($o_user->getUserRole() == 'admin') {
        include_once $_SERVER['DOCUMENT_ROOT'] . '/admin/index.php';
    } elseif ($o_user->getUserRole() == 'tenant') {
        include_once $_SERVER['DOCUMENT_ROOT'] . '/cabinet/index.php';
    } else {
        
    }
} else {
    $o_smarty->assign('login', false);
    
    if (isset($_POST['login']) && isset($_POST['psw'])) {
        if ($o_user->logIn($_POST['login'], $_POST['psw'])) {
            header("Location: /");
        } else {
            $o_smarty->assign('login_fail', '1');
        }
    }    
    
    $o_smarty->display('index.tpl');
}
?>
