<?php

$management_company = 1;

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

$o_smarty->display('admin/index.tpl');
?>
