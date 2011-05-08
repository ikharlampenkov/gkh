<?php

include_once $_SERVER['DOCUMENT_ROOT'] . '/allinclud.php';

$o_smarty = new simo_smarty();
$o_fmuser = new share_user();

if ($o_fmuser->isLogin()) {
    $o_smarty->assign('login', true);
    $o_smarty->assign('user', simo_session::getVar('login', 'user'));
    $o_smarty->assign('role', $o_fmuser->getUserRole());

    if (isset($_GET['logout'])) {
        $o_fmuser->logOut();
        header("Location: /");
    }

    if ($o_fmuser->getUserRole() == share_user::UT_ADMIN) {
        include_once $_SERVER['DOCUMENT_ROOT'] . '/admin/index.php';
    } elseif ($o_fmuser->getUserRole() == share_user::UT_REU) {
        include_once $_SERVER['DOCUMENT_ROOT'] . '/reu/index.php';
    } else {
        
    }
} else {
    $o_smarty->assign('login', false);

    if (isset($_GET['page'])) {
        $page = $_GET['page'];
    } else {
        $page = '';
    }
    
    $o_smarty->assign('page', $page);

    if (isset($_POST['login']) && isset($_POST['psw'])) {
        if ($o_fmuser->logIn($_POST['login'], $_POST['psw'])) {
            header("Location: /");
        } else {
            $o_smarty->assign('login_fail', '1');
        }
    } elseif ($page == 'registr') {
        if (isset($_POST['data'])) {
            $o_reu = new gkh_reu();
            $o_reu->registNewReu($_POST['data']);
            simo_functions::chLocation('');
            exit;
        }
        
        $o_city = new gkh_city();
        $o_smarty->assign('city_list', $o_city->getAllCity());
    } elseif ($page == 'recover_password') {
        if (isset($_POST['data'])) {
            $o_reu = new gkh_reu();
            $o_reu->recoverPassword($_POST['data']);
            simo_functions::chLocation('');
            exit;
        }        
    }

    $o_content_page = new gkh_content_page();
    $o_smarty->assign('about', $o_content_page->getContentPage('about'));
    $o_smarty->assign('how_connect', $o_content_page->getContentPage('how_connect'));
    $o_smarty->assign('how_much', $o_content_page->getContentPage('how_much'));

    $o_smarty->display('index.tpl');
}
?>