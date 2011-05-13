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
        $o_smarty->assign('ticket_status_list', $o_tech_support_post->getAllTicketStatus());
        $o_smarty->assign('ticket', $o_tech_support_post->getTicket($_GET['id'], $_GET['reu_id']));
    } elseif ($action == 'add_status') {
        if (isset($_POST['data'])) {
            $o_tech_support_post->addTicketStatus($_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('txt', 'Добавить cтатус заявки');
    } elseif ($action == 'edit_status' && isset($_GET['id'])) {

        if (isset($_POST['data'])) {
            $o_tech_support_post->updateTicketStatus($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('txt', 'Редактировать cтатус заявки');
        $o_smarty->assign('ticket_status', $o_tech_support_post->getTicketStatus($_GET['id']));
    } elseif ($action == 'del_status') {
        $o_tech_support_post->deleteTicketStatus($_GET['id']);
        simo_functions::chLocation('?page=' . $page);    
    } else {
        $o_smarty->assign('ticket_status_list', $o_tech_support_post->getAllTicketStatus());
        $o_smarty->assign('ticket_list', $o_tech_support_post->getAllTicket());
    }
}

if ($page == 'news') {

    $o_news = new gkh_news();

    if ($action == 'add_category') {
        if (isset($_POST['data'])) {
            $o_news->addNewsCategory($_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('txt', 'Добавить категорию новостей');
    } elseif ($action == 'edit_category' && isset($_GET['id'])) {

        if (isset($_POST['data'])) {
            $o_news->updateNewsCategory($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('txt', 'Редактировать категорию новостей');
        $o_smarty->assign('news_category', $o_news->getNewsCategory($_GET['id']));
    } elseif ($action == 'del_category') {
        $o_news->deleteNewsCategory($_GET['id']);
        simo_functions::chLocation('?page=' . $page);
    } elseif ($action == 'add_news') {
        if (isset($_POST['data'])) {
            $o_news->addNews($_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('news_category_list', $o_news->getAllNewsCategory());
        $o_smarty->assign('txt', 'Добавить новость');
    } elseif ($action == 'edit_news' && isset($_GET['id'])) {

        if (isset($_POST['data'])) {
            $o_news->updateNews($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('txt', 'Редактировать новость');
        $o_smarty->assign('news', $o_news->getNews($_GET['id']));
        $o_smarty->assign('news_category_list', $o_news->getAllNewsCategory());
    } elseif ($action == 'del_news') {
        $o_news->deleteNews($_GET['id']);
        simo_functions::chLocation('?page=' . $page);
    } elseif ($action == 'edit_news_comment' && isset($_GET['id'])) {

        if (isset($_POST['data'])) {
            $o_news->updateComment($_GET['news_id'], $_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page . '&action=show_comment&id=' . $_GET['news_id']);
            exit;
        }

        $o_smarty->assign('txt', 'Редактировать комментарий для новости: ');
        $o_smarty->assign('news', $o_news->getNews($_GET['news_id']));
        $o_smarty->assign('news_comment', $o_news->getComment($_GET['news_id'], $_GET['id']));
    } elseif ($action == 'del_news_comment') {
        $o_news->deleteComment($_GET['news_id'], $_GET['id']);
        simo_functions::chLocation('?page=' . $page . '&action=show_comment&id=' . $_GET['news_id']);
    } elseif ($action == 'show_comment') {
        $o_smarty->assign('news', $o_news->getNews($_GET['id']));  
        $o_smarty->assign('news_comment_list', $o_news->getAllCommentByNews($_GET['id'], gkh_news::ANY_COMMENT));
    } else {

        if (isset($_GET['pager'])) {
            $cur_page = $_GET['pager'];
        } else {
            $cur_page = 0;
        }
        $o_smarty->assign('cur_page', $cur_page);
        

        $o_smarty->assign('news_category_list', $o_news->getAllNewsCategory());
        $o_smarty->assign('news_list', $o_news->getAllNews(gkh_news::ANY_CATEGORY, $cur_page));
        $o_smarty->assign('page_info', $o_news->getPageInfo(gkh_news::ANY_CATEGORY, $cur_page));
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
