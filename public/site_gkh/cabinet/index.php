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

if ($page == 'content_page' && isset($_GET['title'])) {

    $o_content_page = new gkh_content_page_site();
    $o_smarty->assign('conpage', $o_content_page->getContentPage($_GET['title']));
    $o_smarty->assign('conpage_title', $_GET['title']);
}

if ($page == 'house') {

    if (isset($_GET['category'])) {
        $o_smarty->assign('category', $_GET['category']);
    } else {
        $o_smarty->assign('category', 'all');
    }

    $o_house = new gkh_house();

    if ($action == 'view') {
        $o_smarty->assign('house', $o_house->getHouse($_GET['id']));
    } else {
        $o_smarty->assign('house_list', $o_house->getHouseCatalog());
    }
}

if ($page == 'document') {

    if (isset($_GET['root'])) {
        $root = $_GET['root'];
    } else {
        $root = 0;
    }

    $o_document = new gkh_document();

    if ($root != 0) {
        $o_smarty->assign('document', $o_document->getDocument($root));
        $o_smarty->assign('path_to_document', $o_document->getFullPathToFolder($root));
    } else {
        $o_smarty->assign('document', false);
    }

    $o_smarty->assign('document_list', $o_document->getDocumentCatalog($root));
}

if ($page == 'faq') {

    if (isset($_GET['root'])) {
        $root = $_GET['root'];
    } else {
        $root = 0;
    }

    $o_faq = new gkh_faq();

    if (isset($_GET['is_situation'])) {
        $o_smarty->assign('faq_list', $o_faq->getSituationFaq());
        $o_smarty->assign('is_situation', 1);
    } else {

        if ($root != 0) {
            $o_smarty->assign('faq', $o_faq->getFaq($root));
            $o_smarty->assign('path_to_faq', $o_faq->getFullPathToFolder($root));
        } else {
            $o_smarty->assign('faq', false);
        }

        $o_smarty->assign('faq_list', $o_faq->getFaqCatalog($root));
        $o_smarty->assign('is_situation', 0);
    }
}

if ($page == 'personal' && isset($_GET['is_leaders'])) {
    $is_leaders = $_GET['is_leaders'];

    if ($is_leaders == gkh_personal::NOT_LEADER_PERSONAL) {
        $o_smarty->assign('personal_title', 'Персонал');
    } elseif ($is_leaders == gkh_personal::LEADER_PERSONAL) {
        $o_smarty->assign('personal_title', 'Руководство');
    }
    $o_smarty->assign('is_leaders', $is_leaders);

    $o_personal = new gkh_personal();

    $o_smarty->assign('personal_list', $o_personal->getAllPersonal($is_leaders));
}

if ($page == 'license') {

    $o_license = new gkh_license();
    $o_smarty->assign('license_list', $o_license->getAllLicense());
}

if ($page == 'vacancy') {

    $o_vacancy = new gkh_vacancy();

    $o_smarty->assign('vacancy_list', $o_vacancy->getPublicVacancy());
}

if ($page == 'news') {

        $o_news = new gkh_news();

        if (isset($_GET['category'])) {
            $category = $_GET['category'];
            $o_smarty->assign('news_category', $o_news->getNewsCategory($category));
        } else {
            $category = gkh_news::ANY_CATEGORY;
        }
        $o_smarty->assign('category', $category);

        if ($action == 'view_news' && isset($_GET['id'])) {

            if (isset($_POST['data'])) {
                $o_news->addComment($_GET['id'], $_POST['data']);
                simo_functions::chLocation('?page=news&action=view_news&id=' . $_GET['id'] . '&category=' . $category);
                exit;
            }

            $o_smarty->assign('news', $o_news->getNews($_GET['id']));
            $o_smarty->assign('news_comment_list', $o_news->getAllCommentByNews($_GET['id'], gkh_news::IS_MODERATED));
        } else {

            if (isset($_GET['pager'])) {
                $cur_page = $_GET['pager'];
            } else {
                $cur_page = 0;
            }
            $o_smarty->assign('cur_page', $cur_page);

            if (isset($_GET['is_important'])) {
                $o_smarty->assign('news_list_full', $o_news->getImportantNews($cur_page));
                $o_smarty->assign('page_info', $o_news->getPageInfo($category, $cur_page, 1));
                $o_smarty->assign('is_important', 1);
            } else {

                $o_smarty->assign('news_list_full', $o_news->getAllNews($category, $cur_page));
                $o_smarty->assign('page_info', $o_news->getPageInfo($category, $cur_page, -1));
                $o_smarty->assign('is_important', 0);
            }
        }
    }


$o_news = new gkh_news();
$o_smarty->assign('news_list', $o_news->getTopNews(gkh_news::ANY_CATEGORY));

$o_faq = new gkh_faq();
$o_smarty->assign('faq_title_list', $o_faq->getSituationFaq());

$o_smarty->display('cabinet/index.tpl');
?>
