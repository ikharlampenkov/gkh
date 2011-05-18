<?php

$management_company = 1;

if ($page == 'content_page') {

    $o_content_page = new gkh_content_page_site();

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
    } elseif ($action == 'del_pic') {
        $o_content_page->deleteFile($_GET['id'], $_GET['fname']);
        simo_functions::chLocation('?page=' . $page . '&action=edit&id=' . $_GET['id']);        
    } else {
        $o_smarty->assign('conpage_list', $o_content_page->getAllContentPage());
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

if ($page == 'meters') {

    $o_meters = new gkh_meters(0);

    if ($action == 'add') {
        if (isset($_POST['data'])) {
            $o_meters->addMeters($_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('txt', 'Добавить счетчик');
    } elseif ($action == 'edit' && isset($_GET['id'])) {

        if (isset($_POST['data'])) {
            $o_meters->updateMeters($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('txt', 'Редактировать счетчик');
        $o_smarty->assign('meter', $o_meters->getMeters($_GET['id']));
    } elseif ($action == 'del') {
        $o_meters->deleteMeters($_GET['id']);
        simo_functions::chLocation('?page=' . $page);
    } else {
        $o_smarty->assign('meters_list', $o_meters->getAllMeters());
    }
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

    $o_tech_support_post = new gkh_tech_support_post_site(0);
    $o_pa = new gkh_personal_account_site();

    
    if ($action == 'answer') {
        if (isset($_POST['data'])) {
            $o_tech_support_post->answerQuestion($_GET['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }

        $o_smarty->assign('tech_support_post', $o_tech_support_post->getSupportPost($_GET['id']));
    } elseif ($action == 'question') {
        if (isset($_POST['data'])) {
            $o_tech_support_post->askQuestion($_POST['data']['personal_account_id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }
        $o_smarty->assign('pa_list', $o_pa->getAllPA());
    } elseif ($action == 'view_ticket') {
        if (isset($_POST['data'])) {
            $o_tech_support_post->answerQuestion($_GET['id'], $_POST['data']['id'], $_POST['data']);
            simo_functions::chLocation('?page=' . $page);
            exit;
        }
        $o_smarty->assign('pa_info', $o_pa->getPA($_GET['pa_id']));
        $o_smarty->assign('ticket_status_list', $o_tech_support_post->getAllTicketStatus());
        $o_smarty->assign('ticket', $o_tech_support_post->getTicket($_GET['id'], $category));
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
        $o_smarty->assign('ticket_list', $o_tech_support_post->getAllTicket($category));
    }
}

$o_smarty->display('admin/index.tpl');
?>
