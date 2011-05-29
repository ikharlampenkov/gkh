<?php /* Smarty version Smarty-3.0.7, created on 2011-05-29 23:11:50
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:242434de2704691a602-12444702%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '06f23a46aed9fc3af496589adff00c09fe8f7897' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/index.tpl',
      1 => 1306685507,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '242434de2704691a602-12444702',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_date_format')) include 'H:\www\gkh\private\classes\smarty\plugins\modifier.date_format.php';
?><!DOCTYPE html PUBliC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8"></meta>
        <meta name="DEscriptION" content="<?php echo $_smarty_tpl->getVariable('description')->value;?>
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
</title>

    </head>
    <body>
 <?php $_template = new Smarty_Internal_Template("error_msg.tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php unset($_template);?> 

        <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
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
                                            <a href="">Полезная информация</a>&nbsp;&nbsp;&nbsp;&nbsp;
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
                                <?php if (isset($_smarty_tpl->getVariable('login_fail',null,true,false)->value)){?> <div style="color:red; font-weight:bold; font-size:12px;">Вы ввели неправильный логин и пароль!</div><?php }?>

                                <form method="post" style="margin:0px; padding:0px;">
                                    <span style="width:70px">Лицевой счет: </span>
                                    <input type="text" name="personal_account" style="font-size: 16px; width: 150px;" />
                                    <br/><br/>
                                    <span style="width:70px">Пароль: </span>
                                    <input type="password" name="psw"  style="font-size: 16px; width: 150px;" />

                                    <div><input type="submit" value="Войти" style="width:70px;"></div>
                                </form>                             

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
                                                    <li class="active"><a id="tmM" title="Главная" href="/">Главная</a></li>
                                                    <li class="noactive"><a id="tmC" title="О нас" href="http://contact.dnevnik.ru/">О нас</a></li>
                                                    <li class="noactive"><a id="tmS" title="Услуги" href="http://schools.dnevnik.ru/school.aspx">Услуги</a></li>
                                                    <li class="noactive"><a id="tmL" title="Тарифы" href="http://lib.dnevnik.ru/">Тарифы</a></li>
                                                    <li class="noactive"><a id="tmCON" title="Новости" href="?page=news">Новости</a</li>
                                                    <li class="noactive"><a id="tma" title="Ваш дом" href="?page=house">Ваш дом</a></li>
                                                    <li class="noactive"><a id="tmO" title="Отчеты" href="http://ggg.dnevnik.ru/">Отчеты</a></li>
                                                </ul>
                                            </td>
                                            <td align="right"><img src="img/right.jpg" /></td>
                                        </tr>
                                    </table>
                                </div>

                                <div style="text-align:center">
                                    <ul class="sub">
                                        <li><a title="Раскрытие информации" href="http://dnevnik.ru/user.aspx?user=361977">Раскрытие информации</a</li>
                                        <li><a title="Личный кабинет" href="http://messenger.dnevnik.ru/">Личный кабинет</a</li>
                                        <li><a title="Жизненные ситуации" href="http://dnevnik.ru/outlook.ashx" target="_blank">Жизненные ситуации</a</li>
                                        <li><a title="Важная информация" href="http://dnevnik.ru/news.aspx">Важная информация</a</li>
                                    </ul>
                                </div>

                                <script type="text/javascript">
                                var submenus = [ {  id:"tmM",subs:[  {  "t":"Раскрытие информации","u":"http://dnevnik.ru/user.aspx?user=361977" } , { "t":"Личный кабинет","u":"http://messenger.dnevnik.ru/" } , { "t":"Жизненные ситуации","u":"http://dnevnik.ru/outlook.ashx" } , { "t":"Важная информация","u":"http://dnevnik.ru/outlook.ashx" } ] } ,
                                                 { id:"tmC",subs:[ { "t":"Общая информация","u":"http://people.dnevnik.ru" } , { "t":"Лицензии","u":"http://groups.dnevnik.ru" } , { "t":"Руководство","u":"http://events.dnevnik.ru" } , { "t":"Персонал","u":"http://networks.dnevnik.ru" } , { "t":"Вакансии","u":"http://networks.dnevnik.ru" } , { "t":"Контакты","u":"http://networks.dnevnik.ru" } ] } , 
                                                 { id:"tmS",subs:[ { "t":"Электротехнические работы","u":"?page=content_page&title=eltechrab" } , { "t":"Сантехнические работы","u":"?page=content_page&title=santechrab" } , { "t":"Содержание дома","u":"http://schools.dnevnik.ru/schedules" } , { "t":"Ремонт дома","u":"http://schools.dnevnik.ru/journals/" } ] } , 
                                                 { id:"tmL",subs:[ { "t":"Жилищно-коммунальные услуги","u":"http://lib.dnevnik.ru/literature/" } , { "t":"Коммунальные ресурсы","u":"http://lib.dnevnik.ru/media/" } ] } , 
                                                 { id:"tmCON",subs:[ { "t":"Объявления","u":"?page=news&category=1" } , { "t":"Отключения","u":"?page=news&category=2" } , { "t":"Подключения","u":"?page=news&category=3" } , { "t":"Согласования","u":"?page=news&category=4" } , { "t":"Законодательство","u":"?page=news&category=5" } ] } , 
                                                 { id:"tma",subs:[ { "t":"Обслуживаемые дома","u":"http://dnevnik.ru/contests" } , { "t":"План проводимых работ","u":"http://dnevnik.ru/contests" } , { "t":"Отчет по капитальном ремонту ","u":"http://dnevnik.ru/contests" } ] } , 
                                                 { id:"tmO",subs:[ { "t":"Бухгалтерская отчетность","u":"http://dnevnik.ru/contests" } , { "t":"Доходы","u":"http://dnevnik.ru/contests" } , { "t":"Расходы","u":"http://dnevnik.ru/contests" } ] } ];
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
                                <?php $_template = new Smarty_Internal_Template(($_smarty_tpl->getVariable('page')->value).".tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php unset($_template);?> 
                            <?php }else{ ?> 

                                <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>

                                        <td width="32%" valign="top">
                                            <div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Личный кабинет жильца</div>
                                            <div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
                                        </td>
                                        <td width="200">&nbsp;</td>

                                        <td width="32%" valign="top">
                                            <div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Прозрачность работы</div>
                                            <div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
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