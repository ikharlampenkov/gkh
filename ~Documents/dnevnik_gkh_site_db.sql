-- phpMyAdmin SQL Dump
-- version 3.3.10.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 06 2011 г., 21:37
-- Версия сервера: 5.0.92
-- Версия PHP: 5.2.6

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT=0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `dnevnik_gkh_site_db`
--

--
-- Дамп данных таблицы `acl`
--

REPLACE INTO `acl` (`menu_id`, `role`) VALUES
(1, 'admin'),
(1, 'simple_user');

--
-- Дамп данных таблицы `content_page`
--

REPLACE INTO `content_page` (`id`, `page_title`, `title`, `description`, `content`, `file`) VALUES
(1, 'eltechrab', 'Электротехнические работы', NULL, 'Список Электротехнических работ\r\n1. \r\n2. \r\n3. \r\n', NULL),
(2, 'santechrab', 'Сантехнические работы', NULL, 'Список сантехнических работ', '2_18-05-2011-17-56-09_0.csv;2_18-05-2011-17-56-42_0.mwb;2_18-05-2011-17-56-42_1.txt'),
(3, 'contact', 'Контакты', '', '<p>\r\n	<strong>ООО &laquo;РЭУ-7&raquo; Инн 4205206313 КПП 420501001</strong></p>\r\n<p>\r\n	<strong>р/с 40702810056000000936</strong></p>\r\n<p>\r\n	<strong>к/с 30101810800000000782</strong></p>\r\n<p>\r\n	<strong>БИК 043207782</strong></p>\r\n<p>\r\n	<strong>ОКПО 67692645 ОГРН 1104205014726</strong></p>\r\n<p>\r\n	<strong>Кемеровский РФ ОАО &laquo;Россельхозбанк&raquo; г.Кемерово</strong></p>\r\n<p>\r\n	<strong>Reu007@mail.ru</strong></p>\r\n<p>\r\n	&nbsp;</p>\r\n', ''),
(4, 'disclosure_of_information', 'Раскрытие информации', NULL, '', ''),
(5, 'cabinet', 'Личный кабинет', NULL, '', ''),
(6, 'important_information', 'Важная информация', NULL, '', ''),
(7, 'about', 'О нас', '', '', ''),
(8, 'general_information', 'Общая информация', '', '<table border=\\"0\\" cellpadding=\\"10\\" width=\\"100%\\">\r\n	<tbody>\r\n		<tr>\r\n			<td class=\\"pom\\">\r\n				Фирменное наименование юридического лица:</td>\r\n			<td class=\\"pom\\">\r\n				ООО &quot;РЭУ-7&quot;;</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\\"pem\\">\r\n				Фамилия, имя и отчество руководителя:</td>\r\n			<td class=\\"pem\\">\r\n				Гнатюк Елена Григорьевна</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\\"pom\\">\r\n				Реквизиты свидетельства о государственной регистрации:</td>\r\n			<td class=\\"pom\\">\r\n				Серия 42, №003231220, Поставлено на учет в соответствии с положением Налогового кодекса Российской федерации 7 сентября 2010 г.</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\\"pem\\">\r\n				Почтовый адрес:</td>\r\n			<td class=\\"pem\\">\r\n				Россия, 650023, г. Кемерово, Весенняя 18</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\\"pom\\">\r\n				Адрес фактического местонахождения:</td>\r\n			<td class=\\"pom\\">\r\n				Россия, г. Кемерово, Весенняя 18</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\\"pem\\">\r\n				Контактные телефоны:</td>\r\n			<td class=\\"pem\\">\r\n				8 (3842) 36-54-61, факс</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\\"pom\\">\r\n				Официальный сайт в сети Интернет:</td>\r\n			<td class=\\"pom\\">\r\n				<a href=\\"http://рэу7.рф\\">рэу7.рф</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\\"pem\\">\r\n				Адрес электронной почты:</td>\r\n			<td class=\\"pem\\">\r\n				<a href=\\"mailto:reu007@mail.ru\\">reu007@mail.ru</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\\"pom\\">\r\n				Режим работы организации:</td>\r\n			<td class=\\"pom\\">\r\n				Понедельник с 8-00 до 17-00<br />\r\n				Вторник с 8-00 до 17-00<br />\r\n				Среда с 8-00 до 17-00<br />\r\n				Четверг с 8-00 до 17-00<br />\r\n				Пятница с 8-00 до 17-00</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\\"pom\\">\r\n				Часы приема:</td>\r\n			<td class=\\"pom\\">\r\n				<p>\r\n					Директор: Гнатюк Елена Григорьевна<br />\r\n					Понедельник с 16-00 до 18-00<br />\r\n					Четверг с 16-00 до 18-00</p>\r\n				<p>\r\n					Зам.директора: Ивлев Олег Валериевич<br />\r\n					Понедельник с 16-00 до 18-00<br />\r\n					Четверг с 16-00 до 18-00</p>\r\n				<p>\r\n					Экономист: Новикова Екатерина Владимировна<br />\r\n					Понедельник с 16-00 до 18-00<br />\r\n					Четверг с 16-00 до 18-00</p>\r\n				<p>\r\n					Инженера<br />\r\n					Вторник с 8-00 до 12-00<br />\r\n					Четверг с 16-00 до 18-00</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\\"pem\\">\r\n				Работа диспетчерских служб:</td>\r\n			<td class=\\"pem\\">\r\n				36-66-83 (круглосуточно)</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\\"pom\\">\r\n				Перечень многоквартирных домов:</td>\r\n			<td class=\\"pom\\">\r\n				<a href=\\"http://рэу7.рф/?page=house&amp;category=all&amp;spage=house\\">Перечень домов</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n', ''),
(9, 'service', 'Услуги', NULL, '', ''),
(10, 'keep_the_house', 'Содержание дома', NULL, '', ''),
(11, 'home_repair', 'Ремонт дома', NULL, '', ''),
(12, 'rates', 'Тарифы', NULL, '', ''),
(13, 'gkh', 'Жилищно-коммунальные услуги', '', '<h2>\r\n	Тарифы на услуги ЖКХ на 2011 год</h2>\r\n<p>\r\n	<a name=\\"gil\\"></a>Плата за жилое помещение</p>\r\n<table border=\\"1\\" cellpadding=\\"5px\\" cellspacing=\\"0\\" width=\\"100%\\">\r\n	<tbody>\r\n		<tr align=\\"center\\" bgcolor=\\"#97d5ea\\" valign=\\"center\\">\r\n			<td width=\\"5%\\">\r\n				№</td>\r\n			<td width=\\"30%\\">\r\n				Услуга</td>\r\n			<td width=\\"15%\\">\r\n				Единицы измерения</td>\r\n			<td width=\\"10%\\">\r\n				Размер платы с учетом НДС, руб.</td>\r\n			<td width=\\"20%\\">\r\n				Размер платы для граждан с учетом НДС, руб.</td>\r\n			<td width=\\"30%\\">\r\n				Основание</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" rowspan=\\"10\\" valign=\\"top\\">\r\n				1.1</td>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>Размер платы за содержание и текущий ремонт жилого помещения для нанимателей жилых помещений по договорам социального найма и договорам найма жилых помещений государственного или муниципального жилищного фонда, договорам найма специализированных жилых помещений муниципального жилищного фонда, а также для собственников помещений в многоквартирном доме, которые на их общем собрании не приняли решение об установлении размера платы за содержание и ремонт жилого помещения:</strong></td>\r\n			<td rowspan=\\"24\\">\r\n				<a href=\\"http://www.gkh-kemerovo.ru/?page=14#l34\\">Решение Кемеровского городского Совета народных депутатов №&nbsp;408 от 26.11.2010</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>Многоквартирные капитальные жилые дома:</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				оборудованные лифтом и мусоропроводом (12 этажей и выше)</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				16,47</td>\r\n			<td>\r\n				16,47</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				оборудованные лифтом и мусоропроводом (ниже 12 этажей)</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				15,36</td>\r\n			<td>\r\n				15,36</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				оборудованные мусоропроводом без лифта</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				11,78</td>\r\n			<td>\r\n				11,78</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				оборудованные лифтом без мусоропровода</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				14,98</td>\r\n			<td>\r\n				14,98</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				без лифта и мусоропровода</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				11,68</td>\r\n			<td>\r\n				11,68</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>Муниципальные общежития:</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				оборудованные лифтом и мусоропроводом</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				24,56</td>\r\n			<td>\r\n				24,56</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				без лифта и мусоропровода</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				20,45</td>\r\n			<td>\r\n				20,45</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" rowspan=\\"2\\" valign=\\"top\\">\r\n				1.2</td>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>дополнительно:</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				для многоквартирных домов, имеющих вахтеров размер платы увеличивается на</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				3,73</td>\r\n			<td>\r\n				3,73</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<br />\r\n	&nbsp;</p>\r\n<h1>\r\n	Плата за жилое помещение (для ветхого и неблагоустроенного жилищного фонда)</h1>\r\n<table border=\\"1\\" cellpadding=\\"5px\\" cellspacing=\\"0\\" width=\\"100%\\">\r\n	<tbody>\r\n		<tr align=\\"center\\" bgcolor=\\"#97d5ea\\" valign=\\"center\\">\r\n			<td width=\\"5%\\">\r\n				№</td>\r\n			<td width=\\"30%\\">\r\n				Услуга</td>\r\n			<td width=\\"15%\\">\r\n				Единицы измерения</td>\r\n			<td width=\\"10%\\">\r\n				Размер платы с учетом НДС, руб.</td>\r\n			<td width=\\"20%\\">\r\n				Размер платы для граждан с учетом НДС, руб.</td>\r\n			<td width=\\"30%\\">\r\n				Основание</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" rowspan=\\"13\\" valign=\\"top\\">\r\n				1</td>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>Размер платы за содержание и текущий ремонт жилого помещения для нанимателей жилых помещений по договорам социального найма и договорам найма жилых помещений государственного или муниципального жилищного фонда, договорам найма специализированных жилых помещений муниципального жилищного фонда, а также для собственников помещений в многоквартирном доме, которые на их общем собрании не приняли решение об установлении размера платы за содержание и ремонт жилого помещения:</strong></td>\r\n			<td rowspan=\\"13\\">\r\n				<a href=\\"http://www.gkh-kemerovo.ru/?page=14#l34\\">Решение Кемеровского городского Совета народных депутатов №&nbsp;408 от 26.11.2010</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				Многоквартирные капитальные жилые дома, не присоединенные к системе коммунальной канализации</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				60,80</td>\r\n			<td>\r\n				11,68</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>Капитальные жилые дома:</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				с центральным отоплением (2, 3-этажные), введенные в эксплуатацию до 01.01.1990</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				12,88</td>\r\n			<td>\r\n				11,68</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				с печным отоплением</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				12,36</td>\r\n			<td>\r\n				11,39</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>Некапитальные жилые дома (каркасно-засыпные):</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				с центральным отоплением</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				11,69</td>\r\n			<td>\r\n				9,58</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				с печным отоплением</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				12,33</td>\r\n			<td>\r\n				9,27</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				Жилые дома, не имеющие благоустройства</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				12,32</td>\r\n			<td>\r\n				8,22</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>Ветхие жилые дома с износом свыше 65%:</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				с центральным отоплением</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				11,63</td>\r\n			<td>\r\n				4,34</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				не имеющие канализации</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				12,36</td>\r\n			<td>\r\n				5,17</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				с печным отоплением</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				12,29</td>\r\n			<td>\r\n				5,08</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<br />\r\n	&nbsp;</p>\r\n<h1>\r\n	Плата за капитальный ремонт, наем, доп. услуги</h1>\r\n<table border=\\"1\\" cellpadding=\\"5px\\" cellspacing=\\"0\\" width=\\"100%\\">\r\n	<tbody>\r\n		<tr align=\\"center\\" bgcolor=\\"#97d5ea\\" valign=\\"center\\">\r\n			<td width=\\"5%\\">\r\n				№</td>\r\n			<td width=\\"30%\\">\r\n				Услуга</td>\r\n			<td width=\\"15%\\">\r\n				Единицы измерения</td>\r\n			<td width=\\"10%\\">\r\n				Размер платы, руб.</td>\r\n			<td width=\\"30%\\">\r\n				Основание</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" valign=\\"top\\">\r\n				1</td>\r\n			<td>\r\n				Плата за капитальный ремонт общего имущества</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				2,86</td>\r\n			<td rowspan=\\"3\\">\r\n				<a href=\\"http://www.gkh-kemerovo.ru/?page=14#l34\\">Решение Кемеровского городского Совета народных депутатов №&nbsp;408 от 26.11.2010</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" valign=\\"top\\">\r\n				2</td>\r\n			<td>\r\n				Плата за жилое помещение (плата за наем для нанимателей жилых помещений по договорам социального найма государственного или муниципального жилищного фонда, договорам найма специализированных жилых помещений муниципального жилищного фонда для многоквартирных жилых домов, оборудованных лифтом и/или мусоропроводом)</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				0,90</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" valign=\\"top\\">\r\n				3</td>\r\n			<td>\r\n				Плата за жилое помещение (плата за наем для нанимателей жилых помещений по договорам социального найма государственного или муниципального жилищного фонда, договорам найма специализированных жилых помещений муниципального жилищного фонда для домов не указанных в предыдущем пункте)</td>\r\n			<td>\r\n				1м&sup2;</td>\r\n			<td>\r\n				0,58</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" valign=\\"top\\">\r\n				4</td>\r\n			<td>\r\n				Плата за техническое обслуживание систем коллективного приема телевидения (коллективная антенна)</td>\r\n			<td>\r\n				1 кабельный ввод</td>\r\n			<td>\r\n				13,50</td>\r\n			<td>\r\n				Решение ООО &laquo;Энергия-плюс&raquo;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n', ''),
(14, 'communal_resources', 'Коммунальные ресурсы', '', '<table border=\\"1\\" cellpadding=\\"5px\\" cellspacing=\\"0\\" width=\\"100%\\">\r\n	<tbody>\r\n		<tr align=\\"center\\" bgcolor=\\"#97d5ea\\" valign=\\"center\\">\r\n			<td rowspan=\\"2\\" width=\\"5%\\">\r\n				№</td>\r\n			<td rowspan=\\"2\\" width=\\"30%\\">\r\n				Услуга</td>\r\n			<td rowspan=\\"2\\" width=\\"20%\\">\r\n				Единицы измерения</td>\r\n			<td colspan=\\"2\\" width=\\"20%\\">\r\n				Плата за коммунальные услуги, руб. с учетом НДС</td>\r\n			<td rowspan=\\"2\\" width=\\"25%\\">\r\n				Основание</td>\r\n		</tr>\r\n		<tr align=\\"center\\" bgcolor=\\"#97d5ea\\" valign=\\"center\\">\r\n			<td>\r\n				свыше регионального стандарта нормативной площади жилого помещения</td>\r\n			<td>\r\n				в пределах регионального стандарта нормативной площади жилого помещения</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" rowspan=\\"4\\" valign=\\"top\\">\r\n				1</td>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>Холодное водоснабжение</strong></td>\r\n			<td rowspan=\\"13\\">\r\n				<a href=\\"http://www.gkh-kemerovo.ru/?page=14#l35\\">Решение Кемеровского городского Совета народных депутатов №&nbsp;409 от 26.11.2010</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				для жителей, проживающих в жилищном фонде с центральным отоплением и горячим водоснабжением, получающих услугу от ОАО &laquo;СКЭК&raquo;</td>\r\n			<td>\r\n				1 м&sup3; потребленной воды</td>\r\n			<td>\r\n				16,87</td>\r\n			<td>\r\n				16,87</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				для жителей, проживающих в жилищном фонде с центральным отоплением и горячим водоснабжением, получающих услугу от ОАО &laquo;Азот&raquo;</td>\r\n			<td>\r\n				1 м&sup3; потребленной воды</td>\r\n			<td>\r\n				18,37</td>\r\n			<td>\r\n				18,37</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				для жителей, проживающих в жилищном фонде, не имеющем центрального отопления и горячего водоснабжения</td>\r\n			<td>\r\n				1 м&sup3; потребленной воды</td>\r\n			<td>\r\n				9,11</td>\r\n			<td>\r\n				9,11</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" rowspan=\\"3\\" valign=\\"top\\">\r\n				2</td>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>Водоотведение и очистка сточных вод</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				для потребителей, получающих услугу от ОАО &laquo;СКЭК&raquo;</td>\r\n			<td>\r\n				1 м&sup3; стоков</td>\r\n			<td>\r\n				10,14</td>\r\n			<td>\r\n				10,14</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				для потребителей, получающих услугу от ОАО &laquo;Азот&raquo;</td>\r\n			<td>\r\n				1 м&sup3; стоков</td>\r\n			<td>\r\n				8,08</td>\r\n			<td>\r\n				8,08</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" rowspan=\\"3\\" valign=\\"top\\">\r\n				3</td>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>Горячее водоснабжение</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				вне жилых районов Кедровка, Промышленновский</td>\r\n			<td>\r\n				1 м&sup3; потребленной воды</td>\r\n			<td>\r\n				35,68</td>\r\n			<td>\r\n				21,26</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				в жилых районах Кедровка, Промышленновский</td>\r\n			<td>\r\n				1 м&sup3; потребленной воды</td>\r\n			<td>\r\n				59,53</td>\r\n			<td>\r\n				35,18</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" rowspan=\\"3\\" valign=\\"top\\">\r\n				4</td>\r\n			<td align=\\"center\\" colspan=\\"4\\" valign=\\"center\\">\r\n				<strong>Центральное отопление</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				вне жилых районов Кедровка, Промышленновский</td>\r\n			<td>\r\n				1 Гкал отпущенной тепловой энергии</td>\r\n			<td>\r\n				566,37</td>\r\n			<td>\r\n				482,52</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				в жилых районах Кедровка, Промышленновский</td>\r\n			<td>\r\n				1 Гкал отпущенной тепловой энергии</td>\r\n			<td>\r\n				930,36</td>\r\n			<td>\r\n				614,30</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" valign=\\"top\\">\r\n				5</td>\r\n			<td>\r\n				Плата за услугу электроснабжения в домах, оборудованных стационарными плитами</td>\r\n			<td>\r\n				1 кВт.ч</td>\r\n			<td>\r\n				1,53</td>\r\n			<td>\r\n				1,53</td>\r\n			<td rowspan=\\"2\\">\r\n				<a href=\\"http://www.gkh-kemerovo.ru/?page=14#l36\\">Постановление РЭК Кемеровской области №&nbsp;220 от&nbsp;23.11.2010</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" valign=\\"top\\">\r\n				6</td>\r\n			<td>\r\n				Плата за услугу электроснабжения в домах, оборудованных стационарными газовыми плитами</td>\r\n			<td>\r\n				1 кВт.ч</td>\r\n			<td>\r\n				2,18</td>\r\n			<td>\r\n				2,18</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" valign=\\"top\\">\r\n				7</td>\r\n			<td>\r\n				Плата за техническое обслуживание внутридомового газового оборудования</td>\r\n			<td>\r\n				м&sup3;</td>\r\n			<td>\r\n				1,38</td>\r\n			<td>\r\n				1,38</td>\r\n			<td>\r\n				Соглосование РЭК Кемеровской области с 01.03.2010</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" valign=\\"top\\">\r\n				8</td>\r\n			<td>\r\n				Плата за услугу газоснабжения</td>\r\n			<td>\r\n				м&sup3;</td>\r\n			<td>\r\n				3,16</td>\r\n			<td>\r\n				3,16</td>\r\n			<td>\r\n				<a href=\\"http://www.gkh-kemerovo.ru/?page=14#l37\\">Постановление РЭК Кемеровской области №&nbsp;292 от&nbsp;21.12.2010</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\\"left\\" valign=\\"top\\">\r\n				9</td>\r\n			<td>\r\n				Плата для нанимателей и собственников, проживающих в индивидуальных жилых домах г. Кемерово за услугу полив огородов.</td>\r\n			<td>\r\n				м&sup3;</td>\r\n			<td>\r\n				31,57</td>\r\n			<td>\r\n				31,57</td>\r\n			<td>\r\n				Постановление Главы города №&nbsp;21 от 05.12.1998<br />\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n', ''),
(15, 'reports', 'Отчеты', NULL, '', ''),
(16, 'financial_statements', 'Бухгалтерская отчетность', '', '<p>\r\n	<img src=\\"/ckfinder/userfiles/files/1.jpg\\" /></p>\r\n<p>\r\n	<img alt=\\"\\" src=\\"/ckfinder/userfiles/images/2.jpg\\" /></p>\r\n', ''),
(17, 'income', 'Отчет о прибылях и убытках', '', '', ''),
(18, 'costs', 'Расходы', NULL, '', ''),
(19, 'helpful_information', 'Полезная информация', '', '<p>\r\n	Раздел находится в разработке.</p>\r\n', NULL),
(20, 'passport_office', 'Паспортный стол', '', '', NULL),
(21, 'where_to_pay', 'Где оплатить?', '', '<h2>\r\n	Пункты приема платежей ЖКУ в кассах жилищно-эксплуатирующих организаций города Кемерово</h2>\r\n<table align=\\"center\\" border=\\"1\\" cellpadding=\\"3\\" cellspacing=\\"0\\">\r\n	<tbody>\r\n		<tr align=\\"center\\" bgcolor=\\"#97d5ea\\" valign=\\"MIDDLE\\">\r\n			<td rowspan=\\"2\\" width=\\"93\\">\r\n				<p>\r\n					<strong>Район</strong></p>\r\n			</td>\r\n			<td rowspan=\\"2\\" width=\\"170\\">\r\n				<p>\r\n					<strong>Адрес</strong></p>\r\n			</td>\r\n			<td rowspan=\\"2\\" width=\\"190\\">\r\n				<p>\r\n					<strong>Контактный телефон</strong></p>\r\n			</td>\r\n			<td colspan=\\"7\\">\r\n				<p>\r\n					<strong>Часы работы</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr align=\\"center\\" bgcolor=\\"#97d5ea\\">\r\n			<td style=\\"text-align: center;\\" width=\\"36\\">\r\n				Пн.</td>\r\n			<td style=\\"text-align: center;\\" width=\\"23\\">\r\n				Вт.</td>\r\n			<td style=\\"text-align: center;\\" width=\\"28\\">\r\n				Ср.</td>\r\n			<td style=\\"text-align: center;\\" width=\\"29\\">\r\n				Чт.</td>\r\n			<td style=\\"text-align: center;\\" width=\\"43\\">\r\n				Пт.</td>\r\n			<td width=\\"69\\">\r\n				Сб.</td>\r\n			<td width=\\"79\\">\r\n				Вс.</td>\r\n		</tr>\r\n		<tr>\r\n			<td rowspan=\\"6\\">\r\n				Ленинский</td>\r\n			<td>\r\n				ул. Ворошилова, 1</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842514722\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;51-47-22</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				08 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				б-р. Строителей, 11</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842536911\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;53-69-11</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				08 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				б-р. Строителей, 12</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842519201\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;51-92-01</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				08 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				б-р. Строителей, 46/1</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\">+<span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842733752\\"><span class=\\"skype_pnh_left_span\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842733752\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">7&nbsp;(3842)&nbsp;73-37-52</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></span></span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				08 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				пр. Октябрьский, 78б</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842532554\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;53-25-54</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 20</td>\r\n			<td align=\\"center\\">\r\n				09 - 17</td>\r\n			<td align=\\"center\\">\r\n				-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				пр. Ленинградский, 38</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842732600\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;73-26-00</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				08 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td rowspan=\\"7\\">\r\n				Центральный</td>\r\n			<td>\r\n				ул. Весенняя, 18</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842367966\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;36-79-66</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				ул. 9 января, 6</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842359873\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;35-98-73</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				ул. Орджоникидзе, 4</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842584048\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;58-40-48</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				пр. Ленина, 58</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842523278\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;52-32-78</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				ул. Гагарина, 139</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842547571\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;54-75-71</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				ул. Дзержинского, 18</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842757242\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;75-72-42</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				ул. Тухачевского, 2</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842352759\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;35-27-59</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 18</td>\r\n			<td align=\\"center\\">\r\n				09 - 16</td>\r\n			<td align=\\"center\\">\r\n				-</td>\r\n		</tr>\r\n		<tr>\r\n			<td rowspan=\\"4\\">\r\n				Заводский</td>\r\n			<td>\r\n				ул. В. Волошиной, 13</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842305479\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;30-54-79</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				пр. Молодежный, 4а</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842312039\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;31-20-39</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 20</td>\r\n			<td align=\\"center\\">\r\n				10 - 19</td>\r\n			<td align=\\"center\\">\r\n				10 - 17</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				пр. Ленина, 55б</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842213630\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;21-36-30</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n			<td align=\\"center\\">\r\n				10 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				пр. Кузнецкий, 122</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842213783\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;21-37-83</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n			<td align=\\"center\\">\r\n				10 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td rowspan=\\"3\\">\r\n				Рудничный</td>\r\n			<td>\r\n				пр. Шахтеров, 75</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842641502\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;64-15-02</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				ул. Нахимова, 34а</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842641652\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;64-16-52</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				пр. Шахтеров, 51</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842342063\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;34-20-63</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 19</td>\r\n			<td align=\\"center\\">\r\n				09 - 17</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n		</tr>\r\n		<tr>\r\n			<td rowspan=\\"6\\">\r\n				Кировский</td>\r\n			<td>\r\n				пер. Рекордный, 3</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842616064\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;61-60-64</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 18</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n			<td align=\\"center\\">\r\n				-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				ул. Каркасная,10а</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842614314\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;61-43-14</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 18</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n			<td align=\\"center\\">\r\n				-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				ул. Матросова,5а</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842623472\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;62-34-72</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 18</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n			<td align=\\"center\\">\r\n				-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				ул. Инициативная,48а</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842616464\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;61-64-64</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 18</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n			<td align=\\"center\\">\r\n				-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				ул. Халтурина,23</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842610616\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;61-06-16</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 18</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n			<td align=\\"center\\">\r\n				-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				ул. 40 лет Октября, 13</td>\r\n			<td align=\\"center\\" style=\\"text-align: center;\\">\r\n				<span class=\\"skype_pnh_container\\" dir=\\"ltr\\"><span class=\\"skype_pnh_highlighting_inactive_common\\" dir=\\"ltr\\" title=\\"Позвонить через Skype на следующий номер (Россия): +73842618841\\"><span class=\\"skype_pnh_textarea_span\\"><span class=\\"skype_pnh_text_span\\">+7&nbsp;(3842)&nbsp;61-88-41</span></span><span class=\\"skype_pnh_right_span\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;</span></td>\r\n			<td align=\\"center\\" colspan=\\"5\\">\r\n				08 - 18</td>\r\n			<td align=\\"center\\">\r\n				09 - 15</td>\r\n			<td align=\\"center\\">\r\n				-</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', NULL),
(22, 'leaders', 'Руководство', '', '', NULL),
(23, 'distributor', 'Поставщики', '', '<table border=\\"1\\" cellpadding=\\"0\\" cellspacing=\\"0\\" style=\\"width:100%\\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\\"center\\">\r\n				№ п/п</td>\r\n			<td align=\\"center\\">\r\n				Наименование услуги</td>\r\n			<td align=\\"center\\">\r\n				Жилой фонд</td>\r\n			<td align=\\"center\\">\r\n				Наименование поставщика</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				1.</td>\r\n			<td>\r\n				Отпуск и прием сточных вод</td>\r\n			<td>\r\n				жилой фонд (89 домов)</td>\r\n			<td>\r\n				ОАО &ldquo;СКЭК&rdquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				2.</td>\r\n			<td>\r\n				Отпуск и пользование электроэнергией</td>\r\n			<td>\r\n				жилой фонд (89 домов)</td>\r\n			<td>\r\n				ООО &ldquo;ЭСО&raquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				3.</td>\r\n			<td>\r\n				Проведение дезинфекционных работ</td>\r\n			<td>\r\n				жилой фонд (89домов)</td>\r\n			<td>\r\n				ФГУЗ &rdquo;Дезинфекционная станция&rdquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				4</td>\r\n			<td>\r\n				Планово-регулярное удаление ТБО</td>\r\n			<td>\r\n				Жилой фонд (89 домов)</td>\r\n			<td>\r\n				МП &ldquo;САХ&rdquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				5.</td>\r\n			<td>\r\n				Техническое обслуживание лифтов</td>\r\n			<td>\r\n				Жилой фонд (2 дома)</td>\r\n			<td>\r\n				ЗАО&raquo;Кемероволифтсервис&raquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				6.</td>\r\n			<td>\r\n				Отпуск тепловой энергии в горячей воде</td>\r\n			<td>\r\n				Жилой фонд (89 домов)</td>\r\n			<td>\r\n				ОАО&raquo;Кузбассэнерго&raquo;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				6.</td>\r\n			<td>\r\n				Передача тепловой энергии в горячей воде</td>\r\n			<td>\r\n				жилой фонд (89 домов)</td>\r\n			<td>\r\n				МП &ldquo;Тепловые сети&rdquo;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n', NULL),
(24, 'Базовые', 'basic', '', '', NULL),
(25, 'platnie', 'Платные', '', '', NULL),
(26, 'order_service', 'Порядок и условия оказания услуг по содержание и ремонт', '', '', NULL),
(27, 'dogovor', 'Договор', '', '', NULL),
(28, 'plan_rabot', 'План работ по содержанию и ремонту', '', '', NULL);
REPLACE INTO `content_page` (`id`, `page_title`, `title`, `description`, `content`, `file`) VALUES
(29, 'meri_rashod', 'Меры по снижению расходов на работу', '', '', NULL),
(30, 'narusheni', 'Нарушения', '', '', NULL),
(31, 'kachthestvo', 'Соответствие качеству', '', '', NULL),
(32, 'soderg', 'Содержание, периодичность, результат, стоимость работ по содержанию и ремонту', '', '', NULL),
(33, 'otvetstv', 'Случаи привлечения к ответственности', '', '', NULL),
(34, 'plan_prov_rabot', 'План проводимых работ', '', '', NULL),
(35, 'kap_remont', 'Журнал проводимых работ', '', '', NULL);

--
-- Дамп данных таблицы `document`
--

REPLACE INTO `document` (`id`, `parrent_id`, `title`, `short_text`, `file`, `is_folder`) VALUES
(3, 0, 'Региональное законодательство', '', NULL, 1),
(4, 3, 'Закон о ЖКХ', 'Основной закон\r\n', '4_23-05-2011-20-36-23_.pdf', 0),
(5, 0, 'Федеральное законодательство', '', NULL, 1),
(6, 5, 'Уровень 2', '', NULL, 1),
(7, 6, 'Уровень 3', '', NULL, 1),
(8, 0, 'Договор управления МКД', '', '8_31-05-2011-19-21-25_.doc', 0);

--
-- Дамп данных таблицы `faq`
--

REPLACE INTO `faq` (`id`, `parrent_id`, `question`, `answer`, `is_folder`, `is_situation`) VALUES
(1, 0, 'Общие вопросы', '', 1, 0),
(2, 6, 'Приватизация', '', 0, 1),
(3, 0, 'Счетчики', '', 1, 0),
(4, 6, 'Потерял паспорт', '', 0, 1),
(5, 6, 'Потоп', '', 0, 1),
(6, 0, 'Жизненные ситуации', '', 1, 0),
(7, 6, 'Пожар', '', 0, 1),
(8, 6, 'Перепланировка', '', 0, 1);

--
-- Дамп данных таблицы `house`
--

REPLACE INTO `house` (`id`, `street`, `number`, `subnumber`, `area`, `file_repair_plan`, `file_costs_income`, `file_performed_repair`) VALUES
(8, '50 лет октября', 7, '', '1416.60', NULL, NULL, NULL),
(9, '50 лет октября', 9, '', '1480.20', NULL, NULL, NULL),
(10, '50 лет октября', 12, '', '1377.90', NULL, NULL, NULL),
(11, '50 лет октября', 13, '', '2856.10', NULL, NULL, NULL),
(12, '50 лет октября', 14, '', '2596.40', NULL, NULL, NULL),
(13, '50 лет октября', 15, '', '7515.30', NULL, NULL, NULL),
(14, '50 лет октября', 16, '', '1515.60', NULL, NULL, NULL),
(15, '50 лет октября', 18, '', '1925.30', NULL, NULL, NULL),
(16, '50 лет октября', 22, '', '2505.10', NULL, NULL, NULL),
(17, '50 лет октября', 24, 'а', '1535.50', NULL, NULL, NULL),
(18, '50 лет октября', 24, '', '2361.30', NULL, NULL, NULL),
(19, '50 лет октября', 26, '', '3245.30', NULL, NULL, NULL),
(20, '50 лет октября', 26, 'а', '3541.10', NULL, NULL, NULL),
(21, '50 лет октября', 30, '', '3507.60', NULL, NULL, NULL),
(22, '50 лет октября', 30, 'а', '3683.00', NULL, NULL, NULL),
(23, '50 лет октября', 32, 'а', '1366.40', NULL, NULL, NULL),
(24, '50 лет октября', 32, '', '3576.70', NULL, NULL, NULL),
(25, 'Весенняя', 13, '', '5298.80', NULL, NULL, NULL),
(26, 'Весенняя', 15, '', '7773.80', NULL, NULL, NULL),
(27, 'Весенняя', 16, '', '7266.20', NULL, NULL, NULL),
(28, 'Дзержинского', 2, 'а', '1580.50', NULL, NULL, NULL),
(29, 'Кирова', 26, '', '2323.90', NULL, NULL, NULL),
(30, 'Красная', 13, '', '2487.20', NULL, NULL, NULL),
(31, 'Красноармейская', 101, '', '1590.90', NULL, NULL, NULL),
(32, 'Ленина', 34, '', '1702.70', NULL, NULL, NULL),
(33, 'Мичурина', 29, '', '3567.80', NULL, NULL, NULL),
(34, 'Ноградская', 7, 'а', '3276.30', NULL, NULL, NULL),
(35, 'Советский', 45, '', '2946.50', NULL, NULL, NULL),
(36, 'Томская', 5, 'а', '8265.90', NULL, NULL, NULL);

--
-- Дамп данных таблицы `license`
--

REPLACE INTO `license` (`id`, `description`, `img`) VALUES
(2, '', '2_01-06-2011-11-44-49_.jpg');

--
-- Дамп данных таблицы `management_company`
--

REPLACE INTO `management_company` (`id`, `domen`, `title`, `version`, `password`) VALUES
(1, 'site', 'Тестовая управляющая компания', '1', '123789');

--
-- Дамп данных таблицы `menu`
--

REPLACE INTO `menu` (`id`, `module_id`, `title`, `eng_title`, `param_name`, `param_value`, `parent_id`) VALUES
(1, 2, 'Лицензии', 'license', NULL, NULL, 0);

--
-- Дамп данных таблицы `meters`
--

REPLACE INTO `meters` (`id`, `title`, `rate`, `unit`) VALUES
(1, 'Электроэнергия', '1.53', 'кВт'),
(2, 'Горячая вода', '31.40', 'куб'),
(3, 'Холодная вода', '27.00', 'куб');

--
-- Дамп данных таблицы `meters_to_account`
--

REPLACE INTO `meters_to_account` (`personal_account_id`, `meters_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(1, 3),
(2, 3);

--
-- Дамп данных таблицы `meters_value`
--

REPLACE INTO `meters_value` (`personal_account_id`, `meters_id`, `date`, `value`) VALUES
(1, 1, '2011-05-16', '100.000'),
(1, 2, '2011-05-16', '5.000'),
(1, 3, '2011-05-16', '6.500'),
(2, 2, '2011-05-23', '25.000'),
(2, 3, '2011-05-23', '0.000');

--
-- Дамп данных таблицы `module`
--

REPLACE INTO `module` (`id`, `title`, `eng_title`, `files`, `db_tables`) VALUES
(1, 'Техническая поддержка', 'tech_support', NULL, NULL),
(2, 'Лицензии', 'license', NULL, NULL),
(3, 'Показания счетчиков', 'meters', NULL, NULL);

--
-- Дамп данных таблицы `news`
--

REPLACE INTO `news` (`id`, `news_category_id`, `date`, `title`, `short_text`, `full_text`, `is_impotant`) VALUES
(1, 1, '2011-05-30 00:00:00', 'Сайт проходит режим тестирования', 'Тестирование', 'Тестирование', 1),
(2, 2, '2011-06-01 00:00:00', 'С 01.06 по 01.09 отключение горячей воды', '', '', 0);

--
-- Дамп данных таблицы `news_category`
--

REPLACE INTO `news_category` (`id`, `title`) VALUES
(1, 'Объявления'),
(2, 'Отключения'),
(3, 'Подключения'),
(4, 'Согласования'),
(5, 'Законодательство');

--
-- Дамп данных таблицы `news_comment`
--


--
-- Дамп данных таблицы `payments_debt`
--

REPLACE INTO `payments_debt` (`id`, `date`, `payment`, `debt`, `personal_account_id`) VALUES
(1, '2011-01-25', '2000.00', '1700.00', 1),
(2, '2011-02-25', '1900.00', '1800.00', 1),
(3, '2011-03-25', '1600.00', '1850.00', 1),
(4, '2011-04-25', '1750.00', '1850.00', 1),
(5, '2011-05-25', '0.00', '1800.00', 1);

--
-- Дамп данных таблицы `personal`
--

REPLACE INTO `personal` (`id`, `fio`, `foto`, `is_leaders`, `department`, `position`, `email`, `sometext`) VALUES
(1, 'Петров Петр Сергеевич', '1_20-05-2011-22-19-54_.jpg', 0, 'АУП', 'Директор', '', 'Кое-что обо мне');

--
-- Дамп данных таблицы `personal_account`
--

REPLACE INTO `personal_account` (`id`, `user_id`, `house_id`, `apartment`, `fio`, `password`, `phone`) VALUES
(1, 2, 8, 10, 'Макимов Петр Аркадьевич', '123', '9095139264'),
(2, 3, 8, 14, 'Петров Геннадий Александрович', '0851', NULL);

--
-- Дамп данных таблицы `tech_support_post`
--

REPLACE INTO `tech_support_post` (`id`, `ticket_id`, `question`, `date_question`, `answer`, `date_answer`, `file`, `answer_file`) VALUES
(1, 1, 'Бежит батарея', '2011-05-16 23:58:03', 'Разберемся', '2011-05-17 23:34:19', '', ''),
(2, 2, 'Почему редко вывозят мусор с территории?', '2011-05-16 23:58:36', 'Просто так', '2011-05-26 23:23:51', '', '');

--
-- Дамп данных таблицы `tech_support_ticket`
--

REPLACE INTO `tech_support_ticket` (`id`, `personal_account_id`, `title`, `date`, `category`, `ticket_status_id`) VALUES
(1, 1, 'Бежит батарея', '2011-05-16 23:58:03', 'request_master', 2),
(2, 1, 'Почему редко вывозят мусор с территории?', '2011-05-16 23:58:36', 'question', 2);

--
-- Дамп данных таблицы `tech_support_ticket_status`
--

REPLACE INTO `tech_support_ticket_status` (`id`, `title`, `rating`) VALUES
(1, 'Новая заявка', 10000),
(2, 'Завершено', 0);

--
-- Дамп данных таблицы `user`
--

REPLACE INTO `user` (`id`, `login`, `password`, `role`) VALUES
(1, 'admin', '123', 'admin'),
(2, 'ten', '321', 'tenant'),
(3, 'user_tenant_3', '0851', 'tenant');

--
-- Дамп данных таблицы `user_role`
--

REPLACE INTO `user_role` (`title`, `ru_title`) VALUES
('admin', 'Администратор'),
('simple_user', 'Посетитель сайта'),
('tenant', 'Жилец дома');

--
-- Дамп данных таблицы `vacancy`
--

REPLACE INTO `vacancy` (`id`, `position`, `requirements`, `salary`, `some_text`, `contact`, `who`, `is_active`) VALUES
(1, 'Разнорабочий', 'С собой иметь:\r\nПаспорт\r\nВоенный билет\r\nТрудовую книжку\r\nСНИПС\r\nИНН', '7000', '', 'Кемерово, ул. Весенняя, 18', 'Приемная. Специалист по кадрам.', 1);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
