-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Апр 13 2011 г., 00:31
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
-- Структура таблицы `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE IF NOT EXISTS `announcement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reu_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`,`reu_id`),
  KEY `fk_announcement_reu1` (`reu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `announcement`
--


-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `phone_code` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `title`, `phone_code`) VALUES
(1, 'Кемерово', '3842'),
(2, 'Новокузнецк', '3843');

-- --------------------------------------------------------

--
-- Структура таблицы `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reu_id` int(10) unsigned NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`reu_id`),
  KEY `fk_contact_reu1` (`reu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `contact`
--

INSERT INTO `contact` (`id`, `reu_id`, `address`, `phone_number`) VALUES
(1, 1, 'Весенняя, 18', '(3842) 36-54-61 (приемная), 36-54-47, 36-79-66');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_title_UNIQUE` (`page_title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `content_page`
--

INSERT INTO `content_page` (`id`, `page_title`, `title`, `content`) VALUES
(1, 'about', 'Что такое ЖКХинформ.РФ?', 'Информация о Что такое ЖКХинформ.РФ'),
(2, 'how_connect', 'Как подключиться? Сроки.', 'Информация о Как подключиться? Сроки.'),
(3, 'how_much', 'Сколько это стоит?', 'Информация о Сколько это стоит?\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `information_on_debt`
--

DROP TABLE IF EXISTS `information_on_debt`;
CREATE TABLE IF NOT EXISTS `information_on_debt` (
  `reu_id` int(10) unsigned NOT NULL,
  `sector` int(10) unsigned NOT NULL COMMENT 'сектор',
  `street` varchar(100) NOT NULL COMMENT 'улица',
  `house` varchar(10) NOT NULL COMMENT 'дом',
  `apartment` int(10) unsigned NOT NULL COMMENT 'квартира',
  `fio` varchar(255) DEFAULT NULL COMMENT 'фио',
  `phone_number` varchar(10) DEFAULT NULL COMMENT 'телефон',
  `personal_account` varchar(20) DEFAULT NULL COMMENT 'лицевой_счет',
  `amount_debt` decimal(12,2) DEFAULT NULL COMMENT 'сумма_долга',
  `amount_penalty` decimal(12,2) DEFAULT NULL COMMENT 'сумма_пени',
  `amount_debt_w_penalties` decimal(12,2) DEFAULT NULL COMMENT 'сумма_долга_c_пеней',
  `number_months` int(11) DEFAULT NULL COMMENT 'кол_во_мес',
  `status_housing` varchar(255) DEFAULT NULL COMMENT 'статус_жилья',
  `total_area` decimal(12,2) unsigned DEFAULT NULL COMMENT 'общая_площадь',
  `number_persons` int(10) unsigned DEFAULT NULL COMMENT 'кол_во_прожив',
  `number_personal_accounts` int(10) unsigned DEFAULT NULL COMMENT 'кол_л_сч',
  `reu` varchar(10) DEFAULT NULL COMMENT 'рэу',
  `allowance` varchar(255) DEFAULT NULL COMMENT 'льгота',
  PRIMARY KEY (`reu_id`,`sector`,`street`,`house`,`apartment`),
  KEY `fk_information on debt_reu1` (`reu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `information_on_debt`
--

INSERT INTO `information_on_debt` (`reu_id`, `sector`, `street`, `house`, `apartment`, `fio`, `phone_number`, `personal_account`, `amount_debt`, `amount_penalty`, `amount_debt_w_penalties`, `number_months`, `status_housing`, `total_area`, `number_persons`, `number_personal_accounts`, `reu`, `allowance`) VALUES
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 1, 'Торопова Марина Николаевн', '253012', '37020601', '3270.36', '19.96', '3290.32', 4, 'Собственная', '29.90', 0, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 3, 'Вакульчик Вадим Иванович', '585353', '37020603', '3853.73', '11.89', '3865.62', 3, 'Собственная', '44.50', 0, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 4, 'Вакульчик Вадим Иванович', '585353', '37020604', '3862.76', '12.48', '3875.24', 3, 'Собственная', '42.80', 0, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 5, 'Мальков Александр Яковлев', '582618', '37020605', '10603.25', '165.21', '10768.46', 6, 'Собственная', '29.90', 1, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 6, 'Подкорытова Фаина Ивановн', '0', '37020606', '1193.46', '0.04', '1193.50', 2, 'Собственная', '41.40', 1, 0, 'C5', 'Ветераны труда'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 7, 'Пузанова Екатерина Лаврен', '580823', '37020607', '1300.95', '0.06', '1301.01', 2, 'Собственная', '44.50', 2, 0, 'C5', 'Вдовы участников войны'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 9, 'Никитина Лариса Ивановна', '0', '37020609', '1224.19', '0.01', '1224.20', 2, 'Приватизирован.', '29.90', 1, 0, 'C5', 'Ветераны труда'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 10, 'Никитина Мария Терентьевн', '0', '37020610', '1681.37', '0.03', '1681.40', 2, 'Приватизирован.', '41.20', 1, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 12, 'Корнева Галина Николаевна', '0', '37020612', '1699.86', '0.00', '1699.86', 2, 'Собственная', '42.80', 1, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 15, 'Лапико Елизавета Афанасье', '582026', '37020615', '1401.24', '0.17', '1401.41', 2, 'Собственная', '44.20', 1, 0, 'C5', 'Ветераны труда'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 16, 'Кондрикова Клавдия Кирилл', '0', '37020616', '1114.19', '0.02', '1114.21', 2, 'Муниципальная', '42.60', 1, 0, 'C5', 'Семьи погибших ветеранов'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 18, 'Яковлев Анатолий Иванович', '0', '37020618', '1198.01', '0.07', '1198.08', 2, 'Собственная', '41.10', 2, 0, 'C5', 'Ветераны труда'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 19, 'Летунова Вера Спиридоновн', '0', '37020619', '1347.03', '0.12', '1347.15', 2, 'Собственная', '44.20', 1, 0, 'C5', 'Ветераны труда'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 20, 'Пастухов Вениамин Петрови', '582759', '37020620', '1234.06', '0.04', '1234.10', 2, 'Собственная', '42.60', 1, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 24, 'Артюхович Мария Денисовна', '0', '37020624', '1777.02', '0.06', '1777.08', 2, 'Собственная', '30.40', 2, 0, 'C5', 'Ветераны труда'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 26, 'Суэтина Ольга Витальевна', '581387', '37020626', '1777.67', '0.12', '1777.79', 2, 'Собственная', '44.10', 1, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 27, 'Тихомирова Татьяна Алекса', '585114', '37020627', '1358.26', '0.20', '1358.46', 2, 'Собственная', '41.50', 3, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 28, 'Дюдяева Любовь Николаевна', '0', '37020628', '6621.63', '90.31', '6711.94', 6, 'Собственная', '30.20', 0, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 30, 'Трухина Галина Ермолаевна', '0', '37020630', '1680.02', '0.03', '1680.05', 2, 'Собственная', '43.80', 1, 0, 'C5', 'Ветераны труда'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 31, 'Никитина Любовь Васильевн', '0', '37020631', '2456.26', '1.40', '2457.66', 2, 'Собственная', '41.40', 1, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 32, 'Маслова Галина Александро', '582772', '37020632', '868.04', '0.03', '868.07', 2, 'Собственная', '30.30', 1, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 34, 'Кузяева Масура Миняевна', '580682', '37020634', '3408.34', '2.00', '3410.34', 2, 'Муниципальная', '43.70', 1, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 35, 'Богданова Ирина Владимиро', '583557', '37020635', '1285.24', '0.14', '1285.38', 2, 'Собственная', '41.60', 1, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 37, 'Московская Антонина Михай', '581202', '37020637', '1250.10', '0.05', '1250.15', 2, 'Собственная', '42.80', 3, 0, 'C5', 'Инвалиды(Собст. жилье)'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 38, 'Боецков Валерий Геннадьев', '0', '37020638', '1326.41', '0.10', '1326.51', 2, 'Собственная', '43.70', 4, 0, 'C5', 'Рабочие-служащие'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 39, 'Маркова Юлия Михайловна', '0', '37020639', '1658.54', '0.08', '1658.62', 2, 'Собственная', '41.60', 1, 0, 'C5', 'Ветераны труда'),
(1, 3, '50 ЛЕТ ОКТЯБРЯ', '7', 40, 'Кулабухова Галина Иннокен', '0', '37020640', '945.56', '0.02', '945.58', 2, 'Собственная', '33.00', 1, 0, 'C5', 'Рабочие-служащие');

-- --------------------------------------------------------

--
-- Структура таблицы `reu`
--

DROP TABLE IF EXISTS `reu`;
CREATE TABLE IF NOT EXISTS `reu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_info_admin` text,
  PRIMARY KEY (`id`),
  KEY `fk_reu_user` (`user_id`),
  KEY `fk_reu_city1` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `reu`
--

INSERT INTO `reu` (`id`, `city_id`, `user_id`, `title`, `email`, `contact_info_admin`) VALUES
(1, 1, 2, 'ООО "РЭУ-7"', '', NULL),
(2, 1, 3, 'Тестовое РЭУ', 'Тестовое РЭУ', 'vnvcncnvcncаьраоа парапрпа\r\nапр ароапроа\r\n аапоап\r\nап оапоа');

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
  PRIMARY KEY (`id`),
  KEY `fk_tech_support_post_tech_support_ticket1` (`ticket_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `tech_support_post`
--

INSERT INTO `tech_support_post` (`id`, `ticket_id`, `question`, `date_question`, `answer`, `date_answer`, `file`) VALUES
(1, 1, 'Мой первый вопрос?', '2011-04-12 23:54:53', NULL, NULL, NULL),
(2, 2, 'Мой Второй вопрос? Уже сложнее...', '2011-04-13 00:02:14', NULL, NULL, NULL),
(3, 2, 'Мое Первое дополнение ко второму вопросу', '2011-04-13 00:30:17', NULL, NULL, NULL);

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
  PRIMARY KEY (`id`),
  KEY `fk_tech_support_ticket_reu1` (`reu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `tech_support_ticket`
--

INSERT INTO `tech_support_ticket` (`id`, `reu_id`, `title`, `date`, `is_complete`) VALUES
(1, 1, 'Мой первый вопрос?', '2011-04-12 23:54:53', 0),
(2, 1, 'Мой Второй вопрос? Уже сложнее...', '2011-04-13 00:02:14', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `update_history`
--

DROP TABLE IF EXISTS `update_history`;
CREATE TABLE IF NOT EXISTS `update_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reu_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `content` text,
  PRIMARY KEY (`id`,`reu_id`),
  KEY `fk_update_history_reu1` (`reu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `update_history`
--

INSERT INTO `update_history` (`id`, `reu_id`, `date`, `content`) VALUES
(1, 1, '2011-03-28 12:28:27', 'участок;улица;дом;квартира;фио;месяц;телефон;лицевой_счет;сумма_долга;сумма_пени;сумма_долга_c_пеней;кол_во_мес;статус_жилья;общая_площадь;кол_во_прожив;кол_л_сч;трест;рэу;льгота\r\n3; Итого по уч;999999;;;;0;;61397,55;304,64;61702,19;6;;1069,7;33;27;"ООО ""РЭУ-7""";C5;\r\n3;50 ЛЕТ ОКТЯБРЯ;7;1;Торопова Марина Николаевн;;253012;37020601;3270,36;19,96;3290,32;4;Собственная;29,9;0;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;3;Вакульчик Вадим Иванович;;585353;37020603;3853,73;11,89;3865,62;3;Собственная;44,5;0;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;4;Вакульчик Вадим Иванович;;585353;37020604;3862,76;12,48;3875,24;3;Собственная;42,8;0;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;5;Мальков Александр Яковлев;;582618;37020605;10603,25;165,21;10768,46;6;Собственная;29,9;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;6;Подкорытова Фаина Ивановн;;0;37020606;1193,46;0,04;1193,5;2;Собственная;41,4;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;7;Пузанова Екатерина Лаврен;;580823;37020607;1300,95;0,06;1301,01;2;Собственная;44,5;2;0;"ООО ""РЭУ-7""";C5;Вдовы участников войны\r\n3;50 ЛЕТ ОКТЯБРЯ;7;9;Никитина Лариса Ивановна;;0;37020609;1224,19;0,01;1224,2;2;Приватизирован.;29,9;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;10;Никитина Мария Терентьевн;;0;37020610;1681,37;0,03;1681,4;2;Приватизирован.;41,2;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;12;Корнева Галина Николаевна;;0;37020612;1699,86;0;1699,86;2;Собственная;42,8;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;15;Лапико Елизавета Афанасье;;582026;37020615;1401,24;0,17;1401,41;2;Собственная;44,2;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;16;Кондрикова Клавдия Кирилл;;0;37020616;1114,19;0,02;1114,21;2;Муниципальная;42,6;1;0;"ООО ""РЭУ-7""";C5;Семьи погибших ветеранов\r\n3;50 ЛЕТ ОКТЯБРЯ;7;18;Яковлев Анатолий Иванович;;0;37020618;1198,01;0,07;1198,08;2;Собственная;41,1;2;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;19;Летунова Вера Спиридоновн;;0;37020619;1347,03;0,12;1347,15;2;Собственная;44,2;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;20;Пастухов Вениамин Петрови;;582759;37020620;1234,06;0,04;1234,1;2;Собственная;42,6;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;24;Артюхович Мария Денисовна;;0;37020624;1777,02;0,06;1777,08;2;Собственная;30,4;2;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;26;Суэтина Ольга Витальевна;;581387;37020626;1777,67;0,12;1777,79;2;Собственная;44,1;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;27;Тихомирова Татьяна Алекса;;585114;37020627;1358,26;0,2;1358,46;2;Собственная;41,5;3;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;28;Дюдяева Любовь Николаевна;;0;37020628;6621,63;90,31;6711,94;6;Собственная;30,2;0;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;30;Трухина Галина Ермолаевна;;0;37020630;1680,02;0,03;1680,05;2;Собственная;43,8;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;31;Никитина Любовь Васильевн;;0;37020631;2456,26;1,4;2457,66;2;Собственная;41,4;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;32;Маслова Галина Александро;;582772;37020632;868,04;0,03;868,07;2;Собственная;30,3;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;34;Кузяева Масура Миняевна;;580682;37020634;3408,34;2;3410,34;2;Муниципальная;43,7;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;35;Богданова Ирина Владимиро;;583557;37020635;1285,24;0,14;1285,38;2;Собственная;41,6;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;37;Московская Антонина Михай;;581202;37020637;1250,1;0,05;1250,15;2;Собственная;42,8;3;0;"ООО ""РЭУ-7""";C5;Инвалиды(Собст. жилье)\r\n3;50 ЛЕТ ОКТЯБРЯ;7;38;Боецков Валерий Геннадьев;;0;37020638;1326,41;0,1;1326,51;2;Собственная;43,7;4;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;39;Маркова Юлия Михайловна;;0;37020639;1658,54;0,08;1658,62;2;Собственная;41,6;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;40;Кулабухова Галина Иннокен;;0;37020640;945,56;0,02;945,58;2;Собственная;33;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n0;Итого;;;;;0;;61397,55;304,64;61702,19;66;;0;0;0;;;\r\n'),
(2, 1, '2011-03-28 13:56:49', 'участок;улица;дом;квартира;фио;месяц;телефон;лицевой_счет;сумма_долга;сумма_пени;сумма_долга_c_пеней;кол_во_мес;статус_жилья;общая_площадь;кол_во_прожив;кол_л_сч;трест;рэу;льгота\r\n3; Итого по уч;999999;;;;0;;61397,55;304,64;61702,19;6;;1069,7;33;27;"ООО ""РЭУ-7""";C5;\r\n3;50 ЛЕТ ОКТЯБРЯ;7;1;Торопова Марина Николаевн;;253012;37020601;3270,36;19,96;3290,32;4;Собственная;29,9;0;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;3;Вакульчик Вадим Иванович;;585353;37020603;3853,73;11,89;3865,62;3;Собственная;44,5;0;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;4;Вакульчик Вадим Иванович;;585353;37020604;3862,76;12,48;3875,24;3;Собственная;42,8;0;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;5;Мальков Александр Яковлев;;582618;37020605;10603,25;165,21;10768,46;6;Собственная;29,9;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;6;Подкорытова Фаина Ивановн;;0;37020606;1193,46;0,04;1193,5;2;Собственная;41,4;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;7;Пузанова Екатерина Лаврен;;580823;37020607;1300,95;0,06;1301,01;2;Собственная;44,5;2;0;"ООО ""РЭУ-7""";C5;Вдовы участников войны\r\n3;50 ЛЕТ ОКТЯБРЯ;7;9;Никитина Лариса Ивановна;;0;37020609;1224,19;0,01;1224,2;2;Приватизирован.;29,9;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;10;Никитина Мария Терентьевн;;0;37020610;1681,37;0,03;1681,4;2;Приватизирован.;41,2;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;12;Корнева Галина Николаевна;;0;37020612;1699,86;0;1699,86;2;Собственная;42,8;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;15;Лапико Елизавета Афанасье;;582026;37020615;1401,24;0,17;1401,41;2;Собственная;44,2;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;16;Кондрикова Клавдия Кирилл;;0;37020616;1114,19;0,02;1114,21;2;Муниципальная;42,6;1;0;"ООО ""РЭУ-7""";C5;Семьи погибших ветеранов\r\n3;50 ЛЕТ ОКТЯБРЯ;7;18;Яковлев Анатолий Иванович;;0;37020618;1198,01;0,07;1198,08;2;Собственная;41,1;2;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;19;Летунова Вера Спиридоновн;;0;37020619;1347,03;0,12;1347,15;2;Собственная;44,2;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;20;Пастухов Вениамин Петрови;;582759;37020620;1234,06;0,04;1234,1;2;Собственная;42,6;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;24;Артюхович Мария Денисовна;;0;37020624;1777,02;0,06;1777,08;2;Собственная;30,4;2;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;26;Суэтина Ольга Витальевна;;581387;37020626;1777,67;0,12;1777,79;2;Собственная;44,1;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;27;Тихомирова Татьяна Алекса;;585114;37020627;1358,26;0,2;1358,46;2;Собственная;41,5;3;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;28;Дюдяева Любовь Николаевна;;0;37020628;6621,63;90,31;6711,94;6;Собственная;30,2;0;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;30;Трухина Галина Ермолаевна;;0;37020630;1680,02;0,03;1680,05;2;Собственная;43,8;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;31;Никитина Любовь Васильевн;;0;37020631;2456,26;1,4;2457,66;2;Собственная;41,4;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;32;Маслова Галина Александро;;582772;37020632;868,04;0,03;868,07;2;Собственная;30,3;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;34;Кузяева Масура Миняевна;;580682;37020634;3408,34;2;3410,34;2;Муниципальная;43,7;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;35;Богданова Ирина Владимиро;;583557;37020635;1285,24;0,14;1285,38;2;Собственная;41,6;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;37;Московская Антонина Михай;;581202;37020637;1250,1;0,05;1250,15;2;Собственная;42,8;3;0;"ООО ""РЭУ-7""";C5;Инвалиды(Собст. жилье)\r\n3;50 ЛЕТ ОКТЯБРЯ;7;38;Боецков Валерий Геннадьев;;0;37020638;1326,41;0,1;1326,51;2;Собственная;43,7;4;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n3;50 ЛЕТ ОКТЯБРЯ;7;39;Маркова Юлия Михайловна;;0;37020639;1658,54;0,08;1658,62;2;Собственная;41,6;1;0;"ООО ""РЭУ-7""";C5;Ветераны труда\r\n3;50 ЛЕТ ОКТЯБРЯ;7;40;Кулабухова Галина Иннокен;;0;37020640;945,56;0,02;945,58;2;Собственная;33;1;0;"ООО ""РЭУ-7""";C5;Рабочие-служащие\r\n0;Итого;;;;;0;;61397,55;304,64;61702,19;66;;0;0;0;;;\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `role`) VALUES
(1, 'admin', '123456', 'admin'),
(2, 'user_reu_7', '654321', 'reu_admin'),
(3, 'test_reu', '123123', 'reu_admin');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `fk_announcement_reu1` FOREIGN KEY (`reu_id`) REFERENCES `reu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `fk_contact_reu1` FOREIGN KEY (`reu_id`) REFERENCES `reu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `information_on_debt`
--
ALTER TABLE `information_on_debt`
  ADD CONSTRAINT `fk_information on debt_reu1` FOREIGN KEY (`reu_id`) REFERENCES `reu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `reu`
--
ALTER TABLE `reu`
  ADD CONSTRAINT `fk_reu_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reu_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

--
-- Ограничения внешнего ключа таблицы `update_history`
--
ALTER TABLE `update_history`
  ADD CONSTRAINT `fk_update_history_reu1` FOREIGN KEY (`reu_id`) REFERENCES `reu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
