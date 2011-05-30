<?php

/*
  CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_category_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_text` text,
  `full_text` text,
  `is_impotant` TINYINT(1)  NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`),
  KEY `fk_news_news_category1` (`news_category_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


  CREATE TABLE IF NOT EXISTS `news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


  CREATE TABLE IF NOT EXISTS `news_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `nickname` varchar(15) DEFAULT NULL,
  `text` text NOT NULL,
  `is_moderated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`news_id`),
  KEY `fk_news_comment_news1` (`news_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

 */

/**
 * Description of gkh_news
 *
 * @author Moris
 */
class gkh_news extends gkh {
    const ANY_CATEGORY = 0;
    const NEWS_ON_FIRST_PAGE = 5;
    const NEWS_ON_PAGE = 20;
    const ANY_COMMENT = -1;
    const IS_MODERATED = 1;
    const IS_NOT_MODERATED = 0;

    public function __construct() {
        parent::__construct();
    }

    public function getAllNewsCategory() {
        try {
            $sql = 'SELECT * FROM news_category';
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getNewsCategory($id) {
        try {
            $sql = 'SELECT * FROM news_category WHERE id=' . (int)$id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addNewsCategory($data) {
        try {
            $data = $this->_db->prepareArray($data);

            $sql = 'INSERT INTO news_category(title) VALUES("' . $data['title'] . '")';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateNewsCategory($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);
            $sql = 'UPDATE news_category SET title="' . $data['title'] . '" WHERE id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteNewsCategory($id) {
        try {
            $sql = 'DELETE FROM news_category WHERE id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getAllNews($category_id, $cur_page = -1) {
        try {
            $sql = 'SELECT news.id, news_category_id, date, news.title, short_text, full_text, is_impotant, news_category.title AS category_title
                    FROM news, news_category
                    WHERE news.news_category_id=news_category.id ';

            if ($category_id != gkh_news::ANY_CATEGORY) {
                $sql .= ' AND news_category_id=' . $category_id;
            }

            $sql .= ' ORDER BY date DESC ';

            if ($cur_page != -1) {
                $sql .= ' LIMIT ' . $cur_page * gkh_news::NEWS_ON_PAGE . ', ' . gkh_news::NEWS_ON_PAGE;
            }

            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getTopNews($category_id) {
        try {
            $sql = 'SELECT news.id, news_category_id, date, news.title, short_text, full_text, is_impotant, news_category.title AS category_title
                    FROM news, news_category
                    WHERE news.news_category_id=news_category.id ';
            if ($category_id != gkh_news::ANY_CATEGORY) {
                $sql .= ' AND news_category_id=' . $category_id;
            }

            $sql .= ' ORDER BY date DESC
                      LIMIT 5';

            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }
    
    public function getImportantNews($cur_page) {
        try {
            $sql = 'SELECT news.id, news_category_id, date, news.title, short_text, full_text, is_impotant, news_category.title AS category_title
                    FROM news, news_category
                    WHERE news.news_category_id=news_category.id AND is_impotant=1';
            $sql .= ' ORDER BY date DESC ';
            
            if ($cur_page != -1) {
                $sql .= ' LIMIT ' . $cur_page * gkh_news::NEWS_ON_PAGE . ', ' . gkh_news::NEWS_ON_PAGE;
            }

            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getNews($id) {
        try {
            $sql = 'SELECT * FROM news WHERE id=' . (int)$id;
            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addNews($data) {
        try {
            $data = $this->_db->prepareArray($data);

            $data['date'] = date('Y-m-d', strtotime($data['date']));

            if (isset($data['is_impotant'])) {
                $data['is_impotant'] = 1;
            } else {
                $data['is_impotant'] = 0;
            }

            $sql = 'INSERT INTO news(news_category_id, date, title, short_text, full_text, is_impotant)
                              VALUES(' . $data['news_category_id'] . ', "' . $data['date'] . '",
                                    "' . $data['title'] . '", "' . $data['short_text'] . '",
                                    "' . $data['full_text'] . '", ' . $data['is_impotant'] . ')';
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateNews($id, $data) {
        try {
            $data = $this->_db->prepareArray($data);

            $data['date'] = date('Y-m-d', strtotime($data['date']));
            
            if (isset($data['is_impotant'])) {
                $data['is_impotant'] = 1;
            } else {
                $data['is_impotant'] = 0;
            }

            $sql = 'UPDATE news
                    SET news_category_id=' . $data['news_category_id'] . ', date="' . $data['date'] . '",
                        title="' . $data['title'] . '", short_text="' . $data['short_text'] . '",
                        full_text="' . $data['full_text'] . '", is_impotant=' . $data['is_impotant'] . ' 
                    WHERE id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteNews($id) {
        try {
            $sql = 'DELETE FROM news WHERE id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getPageInfo($category_id, $cur_page, $is_important = -1) {
        $retArray = array();
        $retArray['cur_page'] = $cur_page;
        $retArray['rec_on_page'] = gkh_news::NEWS_ON_PAGE;

        try {
            $sql = 'SELECT COUNT(news.id) FROM news, news_category
                    WHERE news.news_category_id=news_category.id ';

            if ($category_id != gkh_news::ANY_CATEGORY) {
                $sql .= ' AND news_category_id=' . $category_id;
            }
            
            if ($is_important != -1) {
                $sql .= ' AND is_impotant=' . $is_important;
            }

            $result = $this->_db->query($sql);
            $retArray['page_count'] = ceil(($result[0][0] / $retArray['rec_on_page']));
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
            $retArray['page_count'] = 0;
        }
        return $retArray;
    }

    public function getAllCommentByNews($id, $is_moderated) {
        try {
            $sql = 'SELECT *
                    FROM news_comment
                    WHERE news_id=' . $id;

            if ($is_moderated != gkh_news::ANY_COMMENT) {
                $sql .= ' AND is_moderated=' . $is_moderated;
            }

            $sql .= ' ORDER BY is_moderated, date';

            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result;
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function getComment($news_id, $id) {
        try {
            $sql = 'SELECT *
                    FROM news_comment
                    WHERE news_id=' . (int)$news_id . ' AND id=' . (int)$id;

            $result = $this->_db->query($sql, simo_db::QUERY_MOD_ASSOC);
            if (isset($result[0])) {
                return $result[0];
            } else
                return false;
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function addComment($news_id, $data) {
        try {
            $data = $this->_db->prepareArray($data);

            if (!empty($data['text'])) {

                $data['date'] = date('Y-m-d');

                $sql = 'INSERT INTO news_comment(news_id, date, nickname, text, is_moderated)
                              VALUES(' . $news_id . ', "' . $data['date'] . '",
                                    "' . $data['nickname'] . '", "' . $data['text'] . '", 0)';
                $this->_db->query($sql);
            }
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function updateComment($news_id, $id, $data) {
        try {
            $data = $this->_db->prepareArray($data);

            if (isset($data['is_moderated'])) {
                $data['is_moderated'] = 1;
            } else {
                $data['is_moderated'] = 0;
            }

            $data['date'] = date('Y-m-d', strtotime($data['date']));

            $sql = 'UPDATE news_comment 
                    SET date="' . $data['date'] . '", nickname="' . $data['nickname'] . '", 
                        text="' . $data['text'] . '", is_moderated=' . $data['is_moderated'] . ' 
                    WHERE news_id=' . (int)$news_id . ' AND id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function deleteComment($news_id, $id) {
        try {
            $sql = 'DELETE FROM news_comment WHERE news_id=' . (int)$news_id . ' AND id=' . (int)$id;
            $this->_db->query($sql);
        } catch (Exception $e) {
            simo_exception::registrMsg($e, $this->_debug);
        }
    }

    public function __destruct() {
        parent::__destruct();
    }

}

?>
