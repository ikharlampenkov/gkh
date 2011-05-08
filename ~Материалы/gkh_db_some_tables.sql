-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 03 2011 г., 22:03
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
-- Структура таблицы `personal_account`
--

CREATE TABLE IF NOT EXISTS `personal_account` (
  `id` int(10) unsigned NOT NULL,
  `reu_id` int(10) unsigned NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `mobile_phone_number` varchar(255) DEFAULT NULL,
  `ai_phone_number` varchar(255) DEFAULT NULL,
  `ai_mobile_phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personal_account_reu1` (`reu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Структура таблицы `tech_support_ticket`
--

CREATE TABLE IF NOT EXISTS `tech_support_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reu_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `is_complete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tech_support_ticket_reu1` (`reu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `personal_account`
--
ALTER TABLE `personal_account`
  ADD CONSTRAINT `fk_personal_account_reu1` FOREIGN KEY (`reu_id`) REFERENCES `reu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `tech_support_post`
--
ALTER TABLE `tech_support_post`
  ADD CONSTRAINT `fk_tech_support_post_tech_support_ticket1` FOREIGN KEY (`ticket_id`) REFERENCES `tech_support_ticket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `tech_support_ticket`
--
ALTER TABLE `tech_support_ticket`
  ADD CONSTRAINT `fk_tech_support_ticket_reu1` FOREIGN KEY (`reu_id`) REFERENCES `reu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
