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

$reu_id = gkh_reu::getReuId();

if ($page == 'contact') {

    $o_contact = new gkh_contact($reu_id);

    if (isset($_POST['data'])) {
        $o_contact->setContact($_POST['data']);
        simo_functions::chLocation('?page=' . $page);
        exit;
    }

    $o_smarty->assign('contact', $o_contact->getContact());
}

if ($page == 'personal-account') {
    $o_dept_info = new gkh_personal_account($reu_id);

    if ($action == 'edit' && isset($_GET['id'])) {

        if (isset($_POST['data'])) {
            $o_dept_info->updatePersonalAccount($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('paccount', $o_dept_info->getPersonalAccount($_GET['id']));
    } else {

        $o_smarty->assign('personal_account_list', $o_dept_info->getAllPersonalAccount());
    }
}

if ($page == 'auto-inf') {

    $o_dept_info = new gkh_personal_account($reu_id);

    if ($action == 'update_db' && isset($_POST['save'])) {
        $o_dept_info->processingUploadFile();
        simo_functions::chLocation('?page=' . $page);
        exit;
    }

    $o_smarty->assign('history_list', $o_dept_info->getAllHistory(5));
}

if ($page == 'messaging') {
    $o_dept_info = new gkh_personal_account($reu_id);
    $o_smarty->assign('street_list', $o_dept_info->getFilterList('street'));
    $o_smarty->assign('house_list', $o_dept_info->getFilterList('house'));
    $o_smarty->assign('apartment_list', $o_dept_info->getFilterList('apartment'));

    $cur_street = '';
    $cur_house = '';
    $cur_apartment = '';
    $cur_rec_on_page = gkh_personal_account::RECORD_ON_PAGE;
    $cur_start_from = 0;

    if (isset($_GET['pager'])) {
        $cur_page = $_GET['pager'];
    } else {
        $cur_page = 0;
    }

    if (isset($_POST['filter'])) {
        $cur_street = @$_POST['filter']['street'];
        $cur_house = $_POST['filter']['house'];
        $cur_apartment = $_POST['filter']['apartment'];
        $cur_rec_on_page = $_POST['filter']['rec_on_page'];
        $cur_start_from = $_POST['filter']['start_from'];

        simo_session::setVar('cur_street', $cur_street, 'filter');
        simo_session::setVar('cur_house', $cur_house, 'filter');
        simo_session::setVar('cur_apartment', $cur_apartment, 'filter');
        simo_session::setVar('cur_rec_on_page', $cur_rec_on_page, 'filter');
        simo_session::setVar('cur_start_from', $cur_start_from, 'filter');

        $cur_page = 0;
    } elseif (isset($_SESSION['filter'])) {
        $cur_street = simo_session::getVar('cur_street', 'filter');
        $cur_house = simo_session::getVar('cur_house', 'filter');
        $cur_apartment = simo_session::getVar('cur_apartment', 'filter');
        $cur_rec_on_page = simo_session::getVar('cur_rec_on_page', 'filter');
        $cur_start_from = simo_session::getVar('cur_start_from', 'filter');
    }

    if ($cur_start_from != 0) {
        $cur_page = ceil($cur_start_from / $cur_rec_on_page) - 1;
    }

    $o_smarty->assign('cur_street', $cur_street);
    $o_smarty->assign('cur_house', $cur_house);
    $o_smarty->assign('cur_apartment', $cur_apartment);
    $o_smarty->assign('cur_page', $cur_page);
    $o_smarty->assign('cur_rec_on_page', $cur_rec_on_page);
    $o_smarty->assign('cur_start_from', $cur_start_from);

    if ($action == 'send_dept_message') {

        if (isset($_POST['data'])) {
            $o_dept_info->sendDebtMessage($_POST['data']);
            simo_session::clearVars('filter');
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('rec_on_page', $o_dept_info->rec_on_page);
        $o_smarty->assign('page_info', $o_dept_info->getPageInfo($cur_page, $cur_rec_on_page, $cur_street, $cur_house, $cur_apartment));
        $o_smarty->assign('dept_list', $o_dept_info->getAllPersonalAccount($cur_street, $cur_house, $cur_apartment, $cur_page, $cur_rec_on_page, $cur_start_from));
        $o_smarty->assign('txt', 'Разослать информацию о задолженности');
    } elseif ($action == 'send_message') {
        if (isset($_POST['data'])) {
            $o_dept_info->sendMessage($_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            simo_session::clearVars('filter');
            exit;
        }

        $o_smarty->assign('rec_on_page', $o_dept_info->rec_on_page);
        $o_smarty->assign('page_info', $o_dept_info->getPageInfo($cur_page, $cur_rec_on_page, $cur_street, $cur_house, $cur_apartment));
        $o_smarty->assign('dept_list', $o_dept_info->getAllPersonalAccount($cur_street, $cur_house, $cur_apartment, $cur_page, $cur_rec_on_page, $cur_start_from));
        $o_smarty->assign('txt', 'Разослать сообщение');
    }
}

if ($page == 'support') {

    $o_tech_support_post = new gkh_tech_support_post();

    if ($action == 'question') {
        if (isset($_POST['data'])) {
            $o_tech_support_post->askQuestion($reu_id, $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('txt', 'Задать вопрос');
    } elseif ($action == 'view_ticket') {
        if (isset($_POST['data'])) {
            $o_tech_support_post->askDopQuestion($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('ticket', $o_tech_support_post->getTicket($_GET['id'], $reu_id));
    } else {
        $o_reu = new gkh_reu();

        if (isset($_POST['data']['email']) && !empty($_POST['data']['email'])) {
            $o_reu->setSupportEmail($reu_id, $_POST['data']['email']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }


        $o_smarty->assign('reu_info', $o_reu->getReu($reu_id));
        $o_smarty->assign('ticket_list', $o_tech_support_post->getAllTicket($reu_id));
    }
}

$o_smarty->display('reu/index.tpl');
?>
