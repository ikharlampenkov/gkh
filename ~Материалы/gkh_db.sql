-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 14 2011 г., 00:04
-- Версия сервера: 5.1.50
-- Версия PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `gkh_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_category_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_text` text,
  `full_text` text,
  PRIMARY KEY (`id`),
  KEY `fk_news_news_category1` (`news_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `news_category_id`, `date`, `title`, `short_text`, `full_text`) VALUES
(1, 1, '2011-05-09 00:00:00', 'Новый дизайн', 'Скоро будет обновлен дизайн сайта ЖКХИНФОРМ.РФ', ''),
(2, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(3, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(4, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(5, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(6, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(7, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(8, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(9, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(10, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(11, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(12, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(13, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(14, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(15, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(16, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(17, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(18, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(19, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(20, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(21, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(22, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(23, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(24, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(25, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n'),
(26, 1, '2011-05-09 00:00:00', 'Первая новость', 'Самая первая новость', '<br />\r\n<b>Notice</b>:  Undefined variable: news in <b>H:\\www\\gkh\\private\\classes\\smarty\\sysplugins\\smarty_internal_data.php</b> on line <b>291</b><br />\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `news_category`
--

DROP TABLE IF EXISTS `news_category`;
CREATE TABLE IF NOT EXISTS `news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `news_category`
--

INSERT INTO `news_category` (`id`, `title`) VALUES
(1, 'Все новости');

-- --------------------------------------------------------

--
-- Структура таблицы `news_comment`
--

DROP TABLE IF EXISTS `news_comment`;
CREATE TABLE IF NOT EXISTS `news_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `nickname` varchar(15) DEFAULT NULL,
  `text` text NOT NULL,
  `is_moderated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`news_id`),
  KEY `fk_news_comment_news1` (`news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `news_comment`
--

INSERT INTO `news_comment` (`id`, `news_id`, `date`, `nickname`, `text`, `is_moderated`) VALUES
(1, 2, '2011-05-12 00:00:00', 'Борис', 'В новости содержится ошибка', 1),
(2, 2, '2011-05-11 00:00:00', 'Иван', 'Еще одна ошибка', 1),
(3, 2, '1970-01-01 00:00:00', 'Иван', 'Вот теперь правильно', 0),
(4, 2, '2011-05-12 00:00:00', 'Иван', 'Теперь точно правильно', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tech_support_post`
--

DROP TABLE IF EXISTS `tech_support_post`;
CREATE TABLE IF NOT EXISTS `tech_support_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `question` text NOT NULL,
  `date_question` datetime NOT NULL,
  `answer` text,
  `date_answer` datetime DEFAULT NULL,
  `file` text,
  `answer_file` text,
  PRIMARY KEY (`id`),
  KEY `fk_tech_support_post_tech_support_ticket1` (`ticket_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `tech_support_post`
--

INSERT INTO `tech_support_post` (`id`, `ticket_id`, `question`, `date_question`, `answer`, `date_answer`, `file`, `answer_file`) VALUES
(1, 1, 'Первый вопрос', '2011-05-13 22:33:34', 'Первый ответ', '2011-05-13 22:45:55', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `tech_support_ticket`
--

DROP TABLE IF EXISTS `tech_support_ticket`;
CREATE TABLE IF NOT EXISTS `tech_support_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reu_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `is_complete` tinyint(1) NOT NULL,
  `tech_support_ticket_status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tech_support_ticket_reu1` (`reu_id`),
  KEY `fk_tech_support_ticket_tech_support_ticket_state1` (`tech_support_ticket_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `tech_support_ticket`
--

INSERT INTO `tech_support_ticket` (`id`, `reu_id`, `title`, `date`, `is_complete`, `tech_support_ticket_status_id`) VALUES
(1, 1, 'Первый вопрос', '2011-05-13 22:33:34', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `tech_support_ticket_status`
--

DROP TABLE IF EXISTS `tech_support_ticket_status`;
CREATE TABLE IF NOT EXISTS `tech_support_ticket_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `tech_support_ticket_status`
--

INSERT INTO `tech_support_ticket_status` (`id`, `title`, `rating`) VALUES
(1, 'Новая заявка', 10000),
(2, 'Завершено', 0);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_news_category1` FOREIGN KEY (`news_category_id`) REFERENCES `news_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `news_comment`
--
ALTER TABLE `news_comment`
  ADD CONSTRAINT `fk_news_comment_news1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `tech_support_post`
--
ALTER TABLE `tech_support_post`
  ADD CONSTRAINT `fk_tech_support_post_tech_support_ticket1` FOREIGN KEY (`ticket_id`) REFERENCES `tech_support_ticket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `tech_support_ticket`
--
ALTER TABLE `tech_support_ticket`
  ADD CONSTRAINT `fk_tech_support_ticket_reu1` FOREIGN KEY (`reu_id`) REFERENCES `reu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tech_support_ticket_tech_support_ticket_state1` FOREIGN KEY (`tech_support_ticket_status_id`) REFERENCES `tech_support_ticket_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
