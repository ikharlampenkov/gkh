-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 19 2011 г., 22:56
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
-- Структура таблицы `acl`
--

DROP TABLE IF EXISTS `acl`;
CREATE TABLE IF NOT EXISTS `acl` (
  `menu_id` int(10) unsigned NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`menu_id`,`role`),
  KEY `fk_acl_user_role1` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `acl`
--

INSERT INTO `acl` (`menu_id`, `role`) VALUES
(1, 'admin'),
(1, 'simple_user');

-- --------------------------------------------------------

--
-- Структура таблицы `content_page`
--

DROP TABLE IF EXISTS `content_page`;
CREATE TABLE IF NOT EXISTS `content_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(40) NOT NULL COMMENT 'английское название для системы',
  `title` varchar(255) NOT NULL,
  `content` text,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_title_UNIQUE` (`page_title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `content_page`
--

INSERT INTO `content_page` (`id`, `page_title`, `title`, `content`, `file`) VALUES
(1, 'eltechrab', 'Электротехнические работы', 'Список Электротехнических работ\r\n1. \r\n2. \r\n3. \r\n', '1_17-05-2011-22-45-47_0.odt'),
(2, 'santechrab', 'Сантехнические работы', 'Список сантехнических работ', '2_18-05-2011-17-56-09_0.csv;2_18-05-2011-17-56-42_0.mwb;2_18-05-2011-17-56-42_1.txt');

-- --------------------------------------------------------

--
-- Структура таблицы `house`
--

DROP TABLE IF EXISTS `house`;
CREATE TABLE IF NOT EXISTS `house` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `street` varchar(50) NOT NULL,
  `number` int(10) unsigned NOT NULL,
  `subnumber` varchar(3) DEFAULT NULL,
  `area` decimal(9,2) unsigned DEFAULT NULL,
  `file_repair_plan` varchar(255) DEFAULT NULL,
  `file_costs_income` varchar(255) DEFAULT NULL,
  `file_performed_repair` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `house`
--

INSERT INTO `house` (`id`, `street`, `number`, `subnumber`, `area`, `file_repair_plan`, `file_costs_income`, `file_performed_repair`) VALUES
(1, 'ул. Сибиряков-Гвардейцев', 16, '', '0.00', NULL, NULL, NULL),
(2, 'ул. Сибиряков-Гвардейцев', 11, '', '0.00', NULL, NULL, NULL),
(3, 'ул. Пролетарская', 17, 'а', '0.00', '3_19-05-2011-22-42-25_.pdf', '3_19-05-2011-22-50-31_.csv', NULL),
(4, 'ул. Пролетарская', 17, 'б', '0.00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `license`
--

DROP TABLE IF EXISTS `license`;
CREATE TABLE IF NOT EXISTS `license` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `license`
--


-- --------------------------------------------------------

--
-- Структура таблицы `management_company`
--

DROP TABLE IF EXISTS `management_company`;
CREATE TABLE IF NOT EXISTS `management_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domen` varchar(45) NOT NULL,
  `title` varchar(255) NOT NULL,
  `version` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='управляющая компания' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `management_company`
--

INSERT INTO `management_company` (`id`, `domen`, `title`, `version`, `password`) VALUES
(1, 'site', 'Тестовая управляющая компания', '1', '123789');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `eng_title` varchar(45) NOT NULL,
  `param_name` varchar(45) DEFAULT NULL,
  `param_value` varchar(45) DEFAULT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_module` (`module_id`),
  KEY `fk_menu_menu1` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `module_id`, `title`, `eng_title`, `param_name`, `param_value`, `parent_id`) VALUES
(1, 2, 'Лицензии', 'license', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `meters`
--

DROP TABLE IF EXISTS `meters`;
CREATE TABLE IF NOT EXISTS `meters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `rate` decimal(12,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `meters`
--

INSERT INTO `meters` (`id`, `title`, `rate`) VALUES
(1, 'Электроэнергия', '70.00'),
(2, 'Горячая вода', '15.00'),
(3, 'Холодная вода', '10.00');

-- --------------------------------------------------------

--
-- Структура таблицы `meters_to_account`
--

DROP TABLE IF EXISTS `meters_to_account`;
CREATE TABLE IF NOT EXISTS `meters_to_account` (
  `personal_account_id` int(10) unsigned NOT NULL,
  `meters_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`personal_account_id`,`meters_id`),
  KEY `fk_meters_to_account_meters1` (`meters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `meters_to_account`
--

INSERT INTO `meters_to_account` (`personal_account_id`, `meters_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `meters_value`
--

DROP TABLE IF EXISTS `meters_value`;
CREATE TABLE IF NOT EXISTS `meters_value` (
  `personal_account_id` int(10) unsigned NOT NULL,
  `meters_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `value` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`personal_account_id`,`meters_id`,`date`),
  KEY `fk_meters_value_meters1` (`meters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `meters_value`
--

INSERT INTO `meters_value` (`personal_account_id`, `meters_id`, `date`, `value`) VALUES
(1, 1, '2011-05-16', '100.000'),
(1, 2, '2011-05-16', '5.000'),
(1, 3, '2011-05-16', '6.500');

-- --------------------------------------------------------

--
-- Структура таблицы `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `eng_title` varchar(255) NOT NULL,
  `files` text,
  `db_tables` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `module`
--

INSERT INTO `module` (`id`, `title`, `eng_title`, `files`, `db_tables`) VALUES
(1, 'Техническая поддержка', 'tech_support', NULL, NULL),
(2, 'Лицензии', 'license', NULL, NULL),
(3, 'Показания счетчиков', 'meters', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `news`
--


-- --------------------------------------------------------

--
-- Структура таблицы `news_category`
--

DROP TABLE IF EXISTS `news_category`;
CREATE TABLE IF NOT EXISTS `news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `news_category`
--

INSERT INTO `news_category` (`id`, `title`) VALUES
(1, 'Объявления'),
(2, 'Отключения'),
(3, 'Подключения'),
(4, 'Согласования'),
(5, 'Законодательства');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `news_comment`
--


-- --------------------------------------------------------

--
-- Структура таблицы `personal_account`
--

DROP TABLE IF EXISTS `personal_account`;
CREATE TABLE IF NOT EXISTS `personal_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `house_id` int(10) unsigned NOT NULL,
  `apartment` int(10) unsigned DEFAULT NULL,
  `fio` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personal_account_user1` (`user_id`),
  KEY `fk_personal_account_house1` (`house_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `personal_account`
--

INSERT INTO `personal_account` (`id`, `user_id`, `house_id`, `apartment`, `fio`, `password`) VALUES
(1, 2, 0, NULL, 'Тестовый жилец', '123');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `tech_support_post`
--

INSERT INTO `tech_support_post` (`id`, `ticket_id`, `question`, `date_question`, `answer`, `date_answer`, `file`, `answer_file`) VALUES
(1, 1, 'Бежит батарея', '2011-05-16 23:58:03', 'Разберемся', '2011-05-17 23:34:19', '', ''),
(2, 2, 'Почему редко вывозят мусор с территории?', '2011-05-16 23:58:36', NULL, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `tech_support_ticket`
--

DROP TABLE IF EXISTS `tech_support_ticket`;
CREATE TABLE IF NOT EXISTS `tech_support_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personal_account_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `ticket_status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tech_support_ticket_personal_account1` (`personal_account_id`),
  KEY `fk_tech_support_ticket_ticket_state1` (`ticket_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `tech_support_ticket`
--

INSERT INTO `tech_support_ticket` (`id`, `personal_account_id`, `title`, `date`, `category`, `ticket_status_id`) VALUES
(1, 1, 'Бежит батарея', '2011-05-16 23:58:03', 'request_master', 2),
(2, 1, 'Почему редко вывозят мусор с территории?', '2011-05-16 23:58:36', 'question', 1);

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

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `role` (`role`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `role`) VALUES
(1, 'admin', '123', 'admin'),
(2, 'ten', '321', 'tenant');

-- --------------------------------------------------------

--
-- Структура таблицы `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `title` varchar(20) NOT NULL,
  `ru_title` varchar(40) NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_role`
--

INSERT INTO `user_role` (`title`, `ru_title`) VALUES
('admin', 'Администратор'),
('simple_user', 'Посетитель сайта'),
('tenant', 'Жилец дома');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `acl`
--
ALTER TABLE `acl`
  ADD CONSTRAINT `fk_acl_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acl_user_role1` FOREIGN KEY (`role`) REFERENCES `user_role` (`title`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_menu1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_module` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `meters_to_account`
--
ALTER TABLE `meters_to_account`
  ADD CONSTRAINT `fk_meters_to_account_meters1` FOREIGN KEY (`meters_id`) REFERENCES `meters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_meters_to_account_personal_account1` FOREIGN KEY (`personal_account_id`) REFERENCES `personal_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `meters_value`
--
ALTER TABLE `meters_value`
  ADD CONSTRAINT `fk_meters_value_meters1` FOREIGN KEY (`meters_id`) REFERENCES `meters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_meters_value_personal_account1` FOREIGN KEY (`personal_account_id`) REFERENCES `personal_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Ограничения внешнего ключа таблицы `personal_account`
--
ALTER TABLE `personal_account`
  ADD CONSTRAINT `fk_personal_account_house1` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personal_account_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `tech_support_post`
--
ALTER TABLE `tech_support_post`
  ADD CONSTRAINT `fk_tech_support_post_tech_support_ticket1` FOREIGN KEY (`ticket_id`) REFERENCES `tech_support_ticket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `tech_support_ticket`
--
ALTER TABLE `tech_support_ticket`
  ADD CONSTRAINT `fk_tech_support_ticket_personal_account1` FOREIGN KEY (`personal_account_id`) REFERENCES `personal_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tech_support_ticket_ticket_state1` FOREIGN KEY (`ticket_status_id`) REFERENCES `tech_support_ticket_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `user_role` (`title`);
SET FOREIGN_KEY_CHECKS=1;
