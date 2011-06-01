<?php

$management_company = 1;

$o_pa = new gkh_personal_account_site($management_company);
$account_info = $o_pa->getPAByUser(share_user_site::getUserId());

if ($page == 'content_page' && isset($_GET['title'])) {

    $o_content_page = new gkh_content_page_site();
    $o_smarty->assign('conpage', $o_content_page->getContentPage($_GET['title']));
    $o_smarty->assign('conpage_title', $_GET['title']);
}

if ($page == 'receipt') {
    //print_r($account_info);

    $date = date('Y-m-d');
    $date = '2011-05-30';
    $o_smarty->assign('date', $date);
    $o_smarty->assign('account_info', $account_info);

    $o_house = new gkh_house();
    $o_smarty->assign('house', $o_house->getHouse($account_info['house_id']));

    $o_meters = new gkh_meters($account_info['id']);
    $meters_value = $o_meters->getMetersByUserForReceipt($date);
    $o_smarty->assign('meters', $meters_value);

    $gku = array('title' => 'Плата за ЖКУ', 'sum' => 1300);
    $o_smarty->assign('gku', $gku);

    $itogo = 0;

    foreach ($meters_value as $meter) {
        $itogo += $meter['sum'];
    }

    $itogo += $gku['sum'];

    $o_smarty->assign('itogo', $itogo);

    if ($action == 'print') {
        $o_smarty->display('cabinet/print.tpl');
        exit;
    }
}

if ($page == 'meters') {

    $date = date('Y-m-d');
    $o_meters = new gkh_meters($account_info['id']);

    if (isset($_POST['data'])) {
        $o_meters->setMetersValue($_POST['data']);
        simo_functions::chLocation('?page=' . $page);
        exit;
    }

    $o_smarty->assign('meters', $o_meters->getMetersByUser($date));
}

if ($page == 'balance') {
    $o_payments_debt = new gkh_payments_debt($account_info['id']);
    $o_smarty->assign('balance', $o_payments_debt->getBalance());
}

if ($page == 'support') {

    if (isset($_GET['category'])) {
        $category = $_GET['category'];
    } else {
        $category = gkh_tech_support_post_site::CATEGORY_REQUEST_MASTER;
    }

    if ($category == gkh_tech_support_post_site::CATEGORY_REQUEST_MASTER) {
        $o_smarty->assign('module_title', 'Заявки на вызов мастера');
        $o_smarty->assign('action_title', 'Подать заявку');
        $o_smarty->assign('ticket_title', 'Заявка');
        $o_smarty->assign('txt', 'Подать заявку');
    } else {
        $o_smarty->assign('module_title', 'Вопросы');
        $o_smarty->assign('action_title', 'Задать вопрос');
        $o_smarty->assign('ticket_title', 'Вопрос');
        $o_smarty->assign('txt', 'Задать вопрос');
    }

    $o_smarty->assign('category', $category);

    $o_tech_support_post = new gkh_tech_support_post_site($account_info['id']);

    if ($action == 'question') {
        if (isset($_POST['data'])) {
            $o_tech_support_post->askQuestion($_POST['data'], $category);
            simo_functions::chLocation('?page=' . $page . '&category=' . $category);
            exit;
        }
    } elseif ($action == 'view_ticket') {
        if (isset($_POST['data'])) {
            $o_tech_support_post->askDopQuestion($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page . '&category=' . $category);
            exit;
        }

        $o_smarty->assign('ticket', $o_tech_support_post->getTicket($_GET['id'], $category));
    } else {
        $o_smarty->assign('ticket_list', $o_tech_support_post->getAllTicket($category));
    }
}

$o_smarty->display('cabinet/index.tpl');
?>
