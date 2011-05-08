<?php

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

if ($page == 'content_page') {

    $o_content_page = new gkh_content_page();

    if ($action == 'add') {
        if (isset($_POST['data'])) {
            $o_content_page->addContentPage($_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('conpage', '');
        $o_smarty->assign('txt', 'Добавить контентную страницу');
    } elseif ($action == 'edit' && isset($_GET['id'])) {

        if (isset($_POST['data'])) {
            $o_content_page->updateContentPage($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('txt', 'Редактировать контентную страницу');
        $o_smarty->assign('conpage', $o_content_page->getContentPage($_GET['id']));
    } elseif ($action == 'del') {
        $o_content_page->deleteContentPage($_GET['id']);
        simo_functions::chLocation('?page=' . $page);
    } else {
        $o_smarty->assign('conpage_list', $o_content_page->getAllContentPage());
    }
}

if ($page == 'city') {

    $o_city = new gkh_city();

    if ($action == 'add') {
        if (isset($_POST['data'])) {
            $o_city->addCity($_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('conpage', '');
        $o_smarty->assign('txt', 'Добавить город');
    } elseif ($action == 'edit' && isset($_GET['id'])) {

        if (isset($_POST['data'])) {
            $o_city->updateCity($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('txt', 'Редактировать город');
        $o_smarty->assign('city', $o_city->getCity($_GET['id']));
    } elseif ($action == 'del') {
        $o_city->deleteCity($_GET['id']);
        simo_functions::chLocation('?page=' . $page);
    } else {
        $o_smarty->assign('city_list', $o_city->getAllCity());
    }
}

if ($page == 'reu') {

    $o_reu = new gkh_reu();
    $o_city = new gkh_city();

    if ($action == 'add') {
        if (isset($_POST['data'])) {
            $o_reu->addReu($_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('conpage', '');
        $o_smarty->assign('txt', 'Добавить РЭУ');
        $o_smarty->assign('city_list', $o_city->getAllCity());
    } elseif ($action == 'edit' && isset($_GET['id'])) {

        if (isset($_POST['data'])) {
            $o_reu->updateReu($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('txt', 'Редактировать РЭУ');
        $o_smarty->assign('reu', $o_reu->getReu($_GET['id']));
        $o_smarty->assign('city_list', $o_city->getAllCity());
    } elseif ($action == 'del') {
        $o_reu->deleteReu($_GET['id']);
        simo_functions::chLocation('?page=' . $page);
    } else {
        $o_smarty->assign('reu_list', $o_reu->getAllReu());
    }
}

if ($page == 'support') {

    $o_tech_support_post = new gkh_tech_support_post();
    $o_reu = new gkh_reu();

    if ($action == 'answer') {
        if (isset($_POST['data'])) {
            $o_tech_support_post->answerQuestion($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('tech_support_post', $o_tech_support_post->getSupportPost($_GET['id']));
        $o_smarty->assign('txt', 'Ответить на вопрос');
    } elseif ($action == 'question') {
        if (isset($_POST['data'])) {
            $o_tech_support_post->askQuestion($_POST['data']['reu_id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }
        $o_smarty->assign('reu_list', $o_reu->getAllReu());
        $o_smarty->assign('txt', 'Задать вопрос');
    } elseif ($action == 'view_ticket') {
        if (isset($_POST['data'])) {
            $o_tech_support_post->answerQuestion($_GET['id'], $_POST['data']['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }
        $o_smarty->assign('reu_info', $o_reu->getReu($_GET['reu_id']));
        $o_smarty->assign('ticket', $o_tech_support_post->getTicket($_GET['id'], $_GET['reu_id']));
    } else {
        $o_smarty->assign('ticket_list', $o_tech_support_post->getAllTicket());
    }
}

if ($action == 'logoin_as_reu') {
    $o_reu = new gkh_reu();
    $temp_reu = $o_reu->getReu($_GET['id']);
    
    $o_fmuser->logIn($temp_reu['user']['login'], $temp_reu['user']['password']);
    
    simo_functions::chLocation('');
    exit; 
}

$o_smarty->display('admin/index.tpl');
?>
