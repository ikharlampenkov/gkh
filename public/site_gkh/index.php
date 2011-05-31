<?php

include_once $_SERVER['DOCUMENT_ROOT'] . '/allinclud.php';

$o_smarty = new simo_smarty();
$o_user = new share_user_site();

if (isset($_GET['page'])) {
    $page = $_GET['page'];
} else {
    $page = '';
}

if (isset($_GET['spage'])) {
    $spage = $_GET['spage'];
} else {
    $spage = 'main';
}

if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = '';
}

$o_smarty->assign('page', $page);
$o_smarty->assign('spage', $spage);
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

    if (isset($_POST['personal_account']) && isset($_POST['psw'])) {

        $login = gkh_personal_account_site::getUserByPA($_POST['personal_account']);
        if ($login === false) {
            $login = $_POST['personal_account'];
        }

        if ($o_user->logIn($login, $_POST['psw'])) {
            header("Location: /");
        } else {
            $o_smarty->assign('login_fail', '1');
        }
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


    $o_news = new gkh_news();
    $o_smarty->assign('news_list', $o_news->getTopNews(gkh_news::ANY_CATEGORY));
    
    $o_faq = new gkh_faq();
    $o_smarty->assign('faq_list', $o_faq->getSituationFaq());

    //$o_house = new gkh_house();
    //$o_smarty->assign('house_login_list', $o_house->getAllHouse());

    $o_smarty->display('index.tpl');
}
?>
