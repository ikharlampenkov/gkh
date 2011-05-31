-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Время создания: Июн 01 2011 г., 01:20
-- Версия сервера: 5.0.92
-- Версия PHP: 5.2.6

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
  `id` int(10) unsigned NOT NULL auto_increment,
  `page_title` varchar(40) NOT NULL COMMENT 'английское название для системы',
  `title` varchar(255) NOT NULL,
  `description` text,
  `content` text,
  `file` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_title_UNIQUE` (`page_title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

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
(7, 'about', 'О нас', '', '<p>\r\n	<u>Проверка</u></p>\r\n', ''),
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
(18, 'costs', 'Расходы', NULL, '', ''),
(19, 'helpful_information', 'Полезная информация', NULL, NULL, NULL),
(20, 'passport_office', 'Паспортный стол', '', '', NULL),
(21, 'where_to_pay', 'Где оплатить?', '', '', NULL),
(22, 'leaders', 'Руководство', '', '', NULL),
(23, 'distributor', 'Поставщики', '', '<table border=\\"1\\" cellpadding=\\"0\\" cellspacing=\\"0\\" style=\\"width:100%\\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\\"center\\">\r\n				№ п/п</td>\r\n			<td align=\\"center\\">\r\n				Наименование услуги</td>\r\n			<td align=\\"center\\">\r\n				Жилой фонд</td>\r\n			<td align=\\"center\\">\r\n				Наименование поставщика</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				1.</td>\r\n			<td>\r\n				Отпуск и прием сточных вод</td>\r\n			<td>\r\n				жилой фонд (89 домов)</td>\r\n			<td>\r\n				ОАО &ldquo;СКЭК&rdquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				2.</td>\r\n			<td>\r\n				Отпуск и пользование электроэнергией</td>\r\n			<td>\r\n				жилой фонд (89 домов)</td>\r\n			<td>\r\n				ООО &ldquo;ЭСО&raquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				3.</td>\r\n			<td>\r\n				Проведение дезинфекционных работ</td>\r\n			<td>\r\n				жилой фонд (89домов)</td>\r\n			<td>\r\n				ФГУЗ &rdquo;Дезинфекционная станция&rdquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				4</td>\r\n			<td>\r\n				Планово-регулярное удаление ТБО</td>\r\n			<td>\r\n				Жилой фонд (89 домов)</td>\r\n			<td>\r\n				МП &ldquo;САХ&rdquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				5.</td>\r\n			<td>\r\n				Техническое обслуживание лифтов</td>\r\n			<td>\r\n				Жилой фонд (2 дома)</td>\r\n			<td>\r\n				ЗАО&raquo;Кемероволифтсервис&raquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				6.</td>\r\n			<td>\r\n				Отпуск тепловой энергии в горячей воде</td>\r\n			<td>\r\n				Жилой фонд (89 домов)</td>\r\n			<td>\r\n				ОАО&raquo;Кузбассэнерго&raquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				6.</td>\r\n			<td>\r\n				Передача тепловой энергии в горячей воде</td>\r\n			<td>\r\n				жилой фонд (89 домов)</td>\r\n			<td>\r\n				МП &ldquo;Тепловые сети&rdquo;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n', NULL),
(24, 'Базовые', 'basic', '', '', NULL),
(25, 'platnie', 'Платные', '', '', NULL),
(26, 'order_service', 'Порядок и условия оказания услуг по содержание и ремонт', '', '', NULL),
(27, 'dogovor', 'Договор', '', '', NULL),
(28, 'plan_rabot', 'План работ по содержанию и ремонту', '', '', NULL),
(29, 'meri_rashod', 'Меры по снижению расходов на работу', '', '', NULL),
(30, 'narusheni', 'Нарушения', '', '', NULL),
(31, 'kachthestvo', 'Соответствие качеству', '', '', NULL),
(32, 'soderg', 'Содержание, периодичность, результат, стоимость работ по содержанию и ремонту', '', '', NULL),
(33, 'otvetstv', 'Случаи привлечения к ответственности', '', '', NULL);
