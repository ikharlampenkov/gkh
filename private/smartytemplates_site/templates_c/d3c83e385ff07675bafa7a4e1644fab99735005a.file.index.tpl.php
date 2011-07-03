<?php /* Smarty version Smarty-3.0.7, created on 2011-07-03 23:25:54
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/admin/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:270534e109812efae41-42768862%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd3c83e385ff07675bafa7a4e1644fab99735005a' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/admin/index.tpl',
      1 => 1309195302,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '270534e109812efae41-42768862',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_date_format')) include 'H:\www\gkh\private\classes\smarty\plugins\modifier.date_format.php';
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8"></meta>
        <meta name="DESCRIPTION" content="<?php echo $_smarty_tpl->getVariable('description')->value;?>
"></meta>
        <meta name="keywords" content="<?php echo $_smarty_tpl->getVariable('keywords')->value;?>
"></meta>
        <meta name="author-corporate" content=""></meta>
        <meta name="publisher-email" content=""></meta>

        <link title="Screen" rel="stylesheet" type="text/css" href="/css/css.css" media="all"</link>

        <script type="text/javascript" language="javascript" src="/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="/js/main.js" ></script>
        <script type="text/javascript" language="javascript" src="/js/common.js"></script>

        <title><?php echo $_smarty_tpl->getVariable('title')->value;?>
 Административный раздел</title>

        <style type="text/css">
            table {
    width: 100%;
}

            tr {
   vertical-align: top;
}

            input {
    width: 100%;
}

            textarea {
    width: 100%;
    height: 200px;
}

            #save {
    width: 100px;
}

        </style>

    </head>
    <body>
<?php $_template = new Smarty_Internal_Template("error_msg.tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php unset($_template);?>

        <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td style="border:#999999 1px solid;" align="center"><a href="?page=messaging">Рассылка сообщений</a> / <a href="?page=content_page&action=edit&id=debt_call">Обзвон должников</a> / <a href="?page=content_page&action=edit&id=sms_message">Смс рассылка</a> / <a href="?page=content_page&action=edit&id=tele_rating">Телеголосование</a> </td>
            </tr>
            <tr>
                <td style="border:#999999 1px solid;" align="center"><a href="?page=content_page">Контентная страница</a> / <a href="?page=news">Новости</a> / <a href="?page=meters">Счетчики</a> / <a href="?page=house">Дома</a> / <a href="?page=license">Достижения</a> / <a href="?page=personal">Персонал</a> / <a href="?page=vacancy">Вакансии</a> / <a href="?page=document">Документы</a> / <a href="?page=faq">Вопросы и ответы</a> / <a href="?page=personal_account">Лицевые счета</a> / <a href="?page=support&category=request_master">Заявка на вызов мастера</a> / <a href="?page=support&category=question">Задать вопрос</a>  </td>
            </tr>
            <tr>
                <td height="200" background="/img/bgshapka.jpg">

                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>&nbsp;</td>
                            <td width="466">
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td height="30" class="topmenu">
                                            &nbsp;<img src="/img/karta.gif" align="absmiddle" /><img src="/img/mail.gif" align="absmiddle" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="?page=faq">Вопрос-ответ</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="?page=content_page&action=edit&id=helpful_information">Полезная информация</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="?page=document">Документы</a>
                                        </td>
                                    </tr>
                                    <tr><td height="170" width="466"><img src="/img/podlogo.jpg" /></td></tr>
                                </table>
                            </td>
                            <td width="195" background="/img/podlogo2.jpg" style="padding-left:60px;" valign="top">
                                <br/>
                                <span style="font-size: 14px">Справочная служба</span><br/>
                                <span style="font-size: 20px; color: #51828e;">36-54-61</span><br/><br/>
                                <span style="font-size: 14px">Аварийная служб</span><br/>
                                <span style="font-size: 20px; color: #51828e;">36-66-8</span><br/>
                                <span style="font-size: 12px; color: #51828e;">круглосуточн</span>
                            </td>
                            <td width="159" background="img/vhod.jpg" valign="top" style="padding-left: 15px;" align="right">
                                <br/><br/><br/>

                                <div><?php echo $_smarty_tpl->getVariable('user')->value;?>
</div> <a href="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
?logout">Выйти</a>                             

                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>

                </td>
            </tr>
            <tr>
                <td>

                    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="bgmenu" height="82">
                        <tr>
                            <td>&nbsp;</td>
                            <td width="885" valign="top">

                                <div class="panel">
                                    <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0"  background="/img/bgleft.jpg" >
                                        <tr>
                                            <td><img src="/img/left.jpg" /></td>
                                            <td width="750">
                                                <ul>
                                                    <li class="<?php if ($_smarty_tpl->getVariable('spage')->value=='main'){?>active<?php }else{ ?>noactive<?php }?>"><a id="tmM" title="Главная" href="/">Главная</a></li>
                                                    <li class="<?php if ($_smarty_tpl->getVariable('spage')->value=='about'){?>active<?php }else{ ?>noactive<?php }?>"><a id="tmC" title="О нас" href="?page=content_page&action=edit&id=about&spage=about">О нас</a></li>
                                                    <li class="<?php if ($_smarty_tpl->getVariable('spage')->value=='service'){?>active<?php }else{ ?>noactive<?php }?>"><a id="tmS" title="Услуги" href="?page=content_page&action=edit&id=service&spage=service">Услуги</a></li>
                                                    <li class="<?php if ($_smarty_tpl->getVariable('spage')->value=='rates'){?>active<?php }else{ ?>noactive<?php }?>"><a id="tmL" title="Тарифы" href="?page=content_page&action=edit&id=rates&spage=rates">Тарифы</a></li>
                                                    <li class="<?php if ($_smarty_tpl->getVariable('spage')->value=='news'){?>active<?php }else{ ?>noactive<?php }?>"><a id="tmCON" title="Новости" href="?page=news&spage=news">Новости</a</li>
                                                    <li class="<?php if ($_smarty_tpl->getVariable('spage')->value=='house'){?>active<?php }else{ ?>noactive<?php }?>"><a id="tma" title="Ваш дом" href="?page=house&spage=house">Ваш дом</a></li>
                                                    <li class="<?php if ($_smarty_tpl->getVariable('spage')->value=='reports'){?>active<?php }else{ ?>noactive<?php }?>"><a id="tmO" title="Отчеты" href="?page=content_page&action=edit&id=reports&spage=reports">Отчеты</a></li>
                                                </ul>
                                            </td>
                                            <td align="right"><img src="img/right.jpg" /></td>
                                        </tr>
                                    </table>
                                </div>

                                <div style="text-align:center">
                                    <ul class="sub">
                                        <?php if ($_smarty_tpl->getVariable('spage')->value=='main'){?>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='disclosure_of_information'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Раскрытие информации" href="?page=content_page&action=edit&id=disclosure_of_information">Раскрытие информации</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='cabinet'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Личный кабинет" href="?page=content_page&action=edit&id=cabinet">Личный кабинет</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('page')->value=='faq'&&isset($_smarty_tpl->getVariable('is_situation',null,true,false)->value)&&$_smarty_tpl->getVariable('is_situation')->value==1){?>active<?php }else{ ?>noactive<?php }?>"><a title="Жизненные ситуации" href="?page=faq&is_situation=1">Жизненные ситуации</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('page')->value=='news'&&isset($_smarty_tpl->getVariable('is_important',null,true,false)->value)&&$_smarty_tpl->getVariable('is_important')->value==1){?>active<?php }else{ ?>noactive<?php }?>"><a title="Важная информация" href="?page=news&is_important=1">Важная информация</a></li>
                                        <?php }?>
                                        <?php if ($_smarty_tpl->getVariable('spage')->value=='about'){?>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='general_information'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Общая информация" href="?page=content_page&action=edit&id=general_information&spage=about">Общая информация</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('page')->value=='license'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Лицензии" href="?page=license&spage=about">Достижения</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='leaders'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Руководство" href="?page=content_page&action=edit&id=leaders&spage=about">Руководство</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='passport_office'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Паспортный стол" href="?page=content_page&action=edit&id=passport_office&spage=about">Паспортный стол</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('page')->value=='vacancy'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Вакансии" href="?page=vacancy&spage=about">Вакансии</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='contact'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Контакты" href="?page=content_page&action=edit&id=contact&spage=about">Контакты</a></li>
                                        <?php }?>
                                        <?php if ($_smarty_tpl->getVariable('spage')->value=='service'){?>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='eltechrab'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Электротехнические работы" href="?page=content_page&action=edit&id=eltechrab&spage=service">Электротехнические работы</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='santechrab'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Сантехнические работы" href="?page=content_page&action=edit&id=santechrab&spage=service">Сантехнические работы</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='keep_the_house'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Содержание дома" href="?page=content_page&action=edit&id=keep_the_house&spage=service">Содержание дома</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='where_to_pay'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Где оплатить?" href="?page=content_page&action=edit&id=where_to_pay&spage=service">Где оплатить?</a></li>
                                        <?php }?>
                                        <?php if ($_smarty_tpl->getVariable('spage')->value=='rates'){?>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='gkh'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Жилищно-коммунальные услуги" href="?page=content_page&action=edit&id=gkh&spage=rates">Жилищно-коммунальные услуги</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='communal_resources'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Коммунальные ресурсы" href="?page=content_page&action=edit&id=communal_resources&spage=rates">Коммунальные ресурсы</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='distributor'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Поставщики" href="?page=content_page&title=distributor&spage=rates">Поставщики</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='where_to_pay'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Где оплатить?" href="?page=content_page&action=edit&id=where_to_pay&spage=rates">Где оплатить?</a></li>
                                        <?php }?>
                                        <?php if ($_smarty_tpl->getVariable('spage')->value=='news'){?>
                                        <li class="<?php if ($_smarty_tpl->getVariable('category')->value=='1'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Объявления" href="?page=news&category=1&spage=news">Объявления</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('category')->value=='2'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Отключения" href="?page=news&category=2&spage=news" >Отключения</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('category')->value=='3'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Подключения" href="?page=news&category=3&spage=news" >Подключения</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('category')->value=='4'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Согласования" href="?page=news&category=4&spage=news" >Согласования</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('category')->value=='5'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Законодательство" href="?page=news&category=5&spage=news" >Законодательство</a></li>
                                        <?php }?>
                                        <?php if ($_smarty_tpl->getVariable('spage')->value=='house'){?>
                                        <li class="<?php if ($_smarty_tpl->getVariable('category')->value=='all'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Обслуживаемые дома" href="?page=house&category=all&spage=house">Обслуживаемые дома</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='plan_prov_rabot'){?>active<?php }else{ ?>noactive<?php }?>"><a title="План проводимых работ" href="?page=content_page&action=edit&id=plan_prov_rabot&spage=house">План проводимых работ</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='kap_remont'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Журнал проводимых работ" href="?page=content_page&action=edit&id=kap_remont&spage=house">Журнал проводимых работ</a></li>
                                        <?php }?>
                                        <?php if ($_smarty_tpl->getVariable('spage')->value=='reports'){?>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='financial_statements'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Бухгалтерская отчетность" href="?page=content_page&action=edit&id=financial_statements&spage=reports">Бухгалтерская отчетность</a></li>
                                        <li class="<?php if ($_smarty_tpl->getVariable('conpage_title')->value=='income'){?>active<?php }else{ ?>noactive<?php }?>"><a title="Отчет о прибылях и убытка" href="?page=content_page&action=edit&id=income&spage=reports">Отчет о прибылях и убытка</a></li>
                                        <?php }?>
                                    </ul>
                                </div>

                                <script type="text/javascript">
                                var submenus = [ {  id:"tmM",subs:[  {  "t":"Раскрытие информации","u":"?page=content_page&action=edit&id=disclosure_of_information" } , { "t":"Личный кабинет","u":"?page=content_page&action=edit&id=cabinet" } , { "t":"Жизненные ситуации","u":"?page=faq&is_situation=1" } , { "t":"Важная информация","u":"?page=content_page&action=edit&id=important_information" } ] } ,
                                                 { id:"tmC",subs:[ { "t":"Общая информация","u":"?page=content_page&action=edit&id=general_information&spage=about" } , { "t":"Достижения","u":"?page=license&spage=about" } , { "t":"Руководство","u":"?page=content_page&action=edit&id=leaders&spage=about" } , { "t":"Паспортный стол","u":"?page=content_page&action=edit&id=passport_office&spage=about" } , { "t":"Вакансии","u":"?page=vacancy&spage=about" } , { "t":"Контакты","u":"?page=content_page&action=edit&id=contact&spage=about" } ] } , 
                                                 { id:"tmS",subs:[ { "t":"Электротехнические работы","u":"?page=content_page&action=edit&id=eltechrab&spage=service" } , { "t":"Сантехнические работы","u":"?page=content_page&action=edit&id=santechrab&spage=service" } , { "t":"Содержание дома","u":"?page=content_page&action=edit&id=keep_the_house&spage=service" } , { "t":"Где оплатить?","u":"?page=content_page&action=edit&id=where_to_pay&spage=service" } ] } , 
                                                 { id:"tmL",subs:[ { "t":"Жилищно-коммунальные услуги","u":"?page=content_page&action=edit&id=gkh&spage=rates" } , { "t":"Коммунальные ресурсы","u":"?page=content_page&action=edit&id=communal_resources&spage=rates" } , { "t":"Поставщики","u":"?page=content_page&action=edit&id=distributor&spage=rates" } , { "t":"Где оплатить?","u":"?page=content_page&action=edit&id=where_to_pay&spage=rates" } ] } , 
                                                 { id:"tmCON",subs:[ { "t":"Объявления","u":"?page=news&category=1&spage=news" } , { "t":"Отключения","u":"?page=news&category=2&spage=news" } , { "t":"Подключения","u":"?page=news&category=3&spage=news" } , { "t":"Согласования","u":"?page=news&category=4&spage=news" } , { "t":"Законодательство","u":"?page=news&category=5&spage=news" } ] } , 
                                                 { id:"tma",subs:[ { "t":"Обслуживаемые дома","u":"?page=house&category=all&spage=house" } , { "t":"План проводимых работ","u":"?page=content_page&action=edit&id=plan_prov_rabot&spage=house" } , { "t":"Журнал проводимых работ","u":"?page=content_page&action=edit&id=kap_remont&spage=house" } ] } , 
                                                 { id:"tmO",subs:[ { "t":"Бухгалтерская отчетность","u":"?page=content_page&action=edit&id=financial_statements&spage=reports" } , { "t":"Отчет о прибылях и убытка","u":"?page=content_page&action=edit&id=income&spage=reports" } ] } ];
                                </script>
                                
                                </div>

                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>

                </td>
            </tr>
            <tr>
                <td height="30px">&nbsp;</td>
            </tr>
            <tr>
                <td height="400px" style="border-bottom: 1px solid #d3d4ba" valign="top">

                    <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>&nbsp;</td>
                            <td width="885" valign="top">

                            <?php if (isset($_smarty_tpl->getVariable('page',null,true,false)->value)&&!empty($_smarty_tpl->getVariable('page',null,true,false)->value)){?> 
                                <?php $_template = new Smarty_Internal_Template("admin/".($_smarty_tpl->getVariable('page')->value).".tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php unset($_template);?> 
                            <?php }else{ ?> 

                                <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>

                                        <td width="32%" valign="top">
                                            <div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Личный кабинет жильца</div>
                                            <div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
                                            <img src="/kab.gif" />
                                        </td>
                                        <td width="200">&nbsp;</td>

                                        <td width="32%" valign="top">
                                            <div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Прозрачность работы</div>
                                            <div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
                                            
                                            <table cellpadding="5" border="0">
                                                <tr><td class="pom"><a title="Общая информация" href="?page=content_page&title=general_information&spage=about">Общая информация</a></td>

                                                <tr><td class="pem">Финансово-хозяйственная деятельность</td></tr>
                                                <tr><td class="pom"><a title="Бухгалтерская отчетность" href="?page=content_page&title=financial_statements&spage=reports">Бухгалтерская отчетность</a></td></tr>
                                                <tr><td class="pom"><a title="Доходы" href="?page=content_page&title=income&spage=reports">Отчет о прибылях и убытках</a></td></tr>
                                                
                                                <tr><td class="pem">Информация об услугах, работах по содержанию и ремонту</li>
                                                <tr><td class="pom"><a title="По содержанию дома" href="?page=content_page&title=basic&spage=about">Базовые услуги</a></td></tr>
                                                <tr><td class="pom"><a title="Электротехнические" href="?page=content_page&title=platnie&spage=about">Платные</a></td></tr>

                                                <tr><td class="pem">Порядок и условия оказания услуг по содержание и ремонт</li>
                                                <tr><td class="pom"><a title="Договор" href="?page=content_page&title=dogovor&spage=about">Договор управления МКД</a></td></tr>
                                                <tr><td class="pom"><a title="План работ по содержанию и ремонту" href="?page=content_page&title=plan_rabot&spage=about">План работ по содержанию и ремонту</a></td></tr>
                                                <tr><td class="pom"><a title="Меры по снижению расходов на работу" href="?page=content_page&title=meri_rashod&spage=about">Меры по снижению расходов на работу</a></td></tr>
                                                <tr><td class="pom"><a title="Нарушения" href="?page=content_page&title=narusheni&spage=about">Нарушения</td></tr>
                                                <tr><td class="pom"><a title="Соответствие качеству" href="?page=content_page&title=kachthestvo&spage=about">Соответствие качеству</td></tr>

                                                <tr><td class="pem">Содержание, периодичность, результат, стоимость работ по содержанию и ремонту</td></tr>
                                                <tr><td class="pom"><a title="Тарифы на коммунальные ресурсы" href="?page=content_page&title=communal_resources&spage=rates">Тарифы на коммунальные ресурсы</a></td></tr>                                        
                                                
                                                <tr><td class="pem"><a title="Случаи привлечения к ответственности" href="?page=content_page&title=otvetstv&spage=about">Случаи привлечения к ответственности</a></td></tr>
                                            
                                            </table>
                                            
                                        </td>
                                        <td width="200">&nbsp;</td>

                                        <td width="32%" valign="top">
                                            <div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Важная информация</div>
                                            <div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>

                                            <?php  $_smarty_tpl->tpl_vars['news'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('news_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['news']->key => $_smarty_tpl->tpl_vars['news']->value){
?> 
                                            <div><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['news']->value['date'],"%d.%m.%Y");?>
 &nbsp; <?php echo $_smarty_tpl->tpl_vars['news']->value['title'];?>
</div>
                                            <div><?php echo $_smarty_tpl->tpl_vars['news']->value['short_text'];?>
 </div>
                                            <?php if ($_smarty_tpl->tpl_vars['news']->value['full_text']){?><a href="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
?page=news&action=view_news&id=<?php echo $_smarty_tpl->tpl_vars['news']->value['id'];?>
&category=<?php echo $_smarty_tpl->tpl_vars['news']->value['news_category_id'];?>
">подробнее...</a><br/><?php }?> 
                                            <br/>
                                           <?php }} ?>

                                        </td>
                                    </tr>
                                </table>

                            <?php }?>

                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>

                </td>
            </tr>
            <tr>
                <td style="background-color: #89b4be; height: 300px; border-top: 1px solid white">

                    <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>&nbsp;</td>
                            <td width="604" valign="top">                                
                                <br/>
                                <div style="color: #fff; font-size: 21px;">Жизненные ситуации</div>

                                <br/>
                                <?php  $_smarty_tpl->tpl_vars['faq_t'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('faq_title_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['faq_t']->key => $_smarty_tpl->tpl_vars['faq_t']->value){
?>

                                <div><a href="?page=faq&is_situation=1#<?php echo $_smarty_tpl->tpl_vars['faq_t']->value['id'];?>
" style="color: #fff; font-size: 16px;"><?php echo $_smarty_tpl->tpl_vars['faq_t']->value['question'];?>
</a></div>
                                <br/>
                                <?php }} ?>
                            </td>
                            <td width="281" valign="bottom"><img src="/img/banner.gif" /></td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>

                </td>
            </tr>
            <tr>
                <td style="height: 100px">&nbsp;</td>
            </tr>
        </table>
        
    </body>
</html>