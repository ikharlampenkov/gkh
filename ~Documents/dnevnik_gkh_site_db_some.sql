-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 30 2011 г., 22:19
-- Версия сервера: 5.1.50
-- Версия PHP: 5.3.5

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `dnevnik_gkh_site_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `content_page`
--

DROP TABLE IF EXISTS `content_page`;
CREATE TABLE IF NOT EXISTS `content_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(40) NOT NULL COMMENT 'английское название для системы',
  `title` varchar(255) NOT NULL,
  `description` text,
  `content` text,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_title_UNIQUE` (`page_title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `content_page`
--

INSERT INTO `content_page` (`id`, `page_title`, `title`, `description`, `content`, `file`) VALUES
(1, 'eltechrab', 'Электротехнические работы', NULL, 'Список Электротехнических работ\r\n1. \r\n2. \r\n3. \r\n', '1_17-05-2011-22-45-47_0.odt'),
(2, 'santechrab', 'Сантехнические работы', NULL, 'Список сантехнических работ', '2_18-05-2011-17-56-09_0.csv;2_18-05-2011-17-56-42_0.mwb;2_18-05-2011-17-56-42_1.txt'),
(3, 'contact', 'Контакты', NULL, '', ''),
(4, 'disclosure_of_information', 'Раскрытие информации', NULL, '', ''),
(5, 'cabinet', 'Личный кабинет', NULL, '', ''),
(6, 'important_information', 'Важная информация', NULL, '', ''),
(7, 'about', 'О нас', NULL, '', ''),
(8, 'general_information', 'Общая информация', NULL, '', ''),
(9, 'service', 'Услуги', NULL, '', ''),
(10, 'keep_the_house', 'Содержание дома', NULL, '', ''),
(11, 'home_repair', 'Ремонт дома', NULL, '', ''),
(12, 'rates', 'Тарифы', NULL, '', ''),
(13, 'gkh', 'Жилищно-коммунальные услуги', NULL, '', ''),
(14, 'communal_resources', 'Коммунальные ресурсы', NULL, '', ''),
(15, 'reports', 'Отчеты', NULL, '', ''),
(16, 'financial_statements', 'Бухгалтерская отчетность', NULL, '', ''),
(17, 'income', 'Доходы', NULL, '', ''),
(18, 'costs', 'Расходы', NULL, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `faq`
--

DROP TABLE IF EXISTS `faq`;
CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parrent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `question` text NOT NULL,
  `answer` text,
  `is_folder` tinyint(1) NOT NULL DEFAULT '0',
  `is_situation` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `faq`
--

INSERT INTO `faq` (`id`, `parrent_id`, `question`, `answer`, `is_folder`, `is_situation`) VALUES
(1, 0, 'Общие вопросы', '', 1, 0),
(2, 1, 'Что мне делать', 'Прыгать\r\n', 0, 0),
(3, 0, 'Счетчики', '', 1, 0);

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
  `is_impotant` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_news_news_category1` (`news_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `news_category_id`, `date`, `title`, `short_text`, `full_text`, `is_impotant`) VALUES
(1, 1, '2011-05-30 00:00:00', 'Самая первая новость', 'впотвт', 'првварварваравраврва', 1);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_news_category1` FOREIGN KEY (`news_category_id`) REFERENCES `news_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
