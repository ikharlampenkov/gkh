-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 03 2011 г., 23:28
-- Версия сервера: 5.1.50
-- Версия PHP: 5.3.5

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
-- Структура таблицы `license`
--

CREATE TABLE IF NOT EXISTS `license` (
  `id` int(11) NOT NULL,
  `management_company_id` int(10) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_license_management_company1` (`management_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `license`
--


-- --------------------------------------------------------

--
-- Структура таблицы `management_company`
--

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

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `management_company_id` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `eng_title` varchar(45) NOT NULL,
  `param_name` varchar(45) DEFAULT NULL,
  `param_value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_module` (`module_id`),
  KEY `fk_menu_management_company1` (`management_company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `module_id`, `management_company_id`, `title`, `eng_title`, `param_name`, `param_value`) VALUES
(1, 2, 1, 'Лицензии', 'license', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `meters`
--

CREATE TABLE IF NOT EXISTS `meters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `meters`
--

INSERT INTO `meters` (`id`, `title`) VALUES
(1, 'Электроэнергия'),
(2, 'Горячая вода'),
(3, 'Холодная вода');

-- --------------------------------------------------------

--
-- Структура таблицы `meters_to_account`
--

CREATE TABLE IF NOT EXISTS `meters_to_account` (
  `personal_account_id` int(10) unsigned NOT NULL,
  `meters_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`personal_account_id`,`meters_id`),
  KEY `fk_meters_to_account_meters1` (`meters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `meters_to_account`
--


-- --------------------------------------------------------

--
-- Структура таблицы `meters_value`
--

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


-- --------------------------------------------------------

--
-- Структура таблицы `module`
--

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
-- Структура таблицы `personal_account`
--

CREATE TABLE IF NOT EXISTS `personal_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `management_company_id` int(10) unsigned NOT NULL,
  `fio` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personal_account_management_company1` (`management_company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `personal_account`
--

INSERT INTO `personal_account` (`id`, `management_company_id`, `fio`, `password`) VALUES
(1, 1, 'Тестовый жилец', '123');

-- --------------------------------------------------------

--
-- Структура таблицы `tech_support_post`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `tech_support_post`
--


-- --------------------------------------------------------

--
-- Структура таблицы `tech_support_ticket`
--

CREATE TABLE IF NOT EXISTS `tech_support_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `management_company_id` int(10) unsigned NOT NULL,
  `personal_account_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `category` int(11) DEFAULT NULL,
  `ticket_state_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tech_support_ticket_management_company1` (`management_company_id`),
  KEY `fk_tech_support_ticket_personal_account1` (`personal_account_id`),
  KEY `fk_tech_support_ticket_ticket_state1` (`ticket_state_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `tech_support_ticket`
--


-- --------------------------------------------------------

--
-- Структура таблицы `ticket_state`
--

CREATE TABLE IF NOT EXISTS `ticket_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `ticket_state`
--

INSERT INTO `ticket_state` (`id`, `title`, `rating`) VALUES
(1, 'Новая заявка', 1000),
(2, 'Принята на исполнение', 500),
(3, 'Выполнена', 200),
(4, 'Завершена', 0);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `license`
--
ALTER TABLE `license`
  ADD CONSTRAINT `fk_license_management_company1` FOREIGN KEY (`management_company_id`) REFERENCES `management_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_module` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_management_company1` FOREIGN KEY (`management_company_id`) REFERENCES `management_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `meters_to_account`
--
ALTER TABLE `meters_to_account`
  ADD CONSTRAINT `fk_meters_to_account_personal_account1` FOREIGN KEY (`personal_account_id`) REFERENCES `personal_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_meters_to_account_meters1` FOREIGN KEY (`meters_id`) REFERENCES `meters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `meters_value`
--
ALTER TABLE `meters_value`
  ADD CONSTRAINT `fk_meters_value_personal_account1` FOREIGN KEY (`personal_account_id`) REFERENCES `personal_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_meters_value_meters1` FOREIGN KEY (`meters_id`) REFERENCES `meters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `personal_account`
--
ALTER TABLE `personal_account`
  ADD CONSTRAINT `fk_personal_account_management_company1` FOREIGN KEY (`management_company_id`) REFERENCES `management_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `tech_support_post`
--
ALTER TABLE `tech_support_post`
  ADD CONSTRAINT `fk_tech_support_post_tech_support_ticket1` FOREIGN KEY (`ticket_id`) REFERENCES `tech_support_ticket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `tech_support_ticket`
--
ALTER TABLE `tech_support_ticket`
  ADD CONSTRAINT `fk_tech_support_ticket_ticket_state1` FOREIGN KEY (`ticket_state_id`) REFERENCES `ticket_state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tech_support_ticket_management_company1` FOREIGN KEY (`management_company_id`) REFERENCES `management_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tech_support_ticket_personal_account1` FOREIGN KEY (`personal_account_id`) REFERENCES `personal_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
