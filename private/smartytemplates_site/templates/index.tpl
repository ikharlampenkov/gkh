<!DOCTYPE html PUBliC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8"></meta>
        <meta name="DEscriptION" content="{$description}"></meta>
        <meta name="keywords" content="{$keywords}"></meta>
        <meta name="author-corporate" content=""></meta>
        <meta name="publisher-email" content=""></meta>

        <link title="Screen" rel="stylesheet" type="text/css" href="/css/css.css" media="all"</link>

        <script type="text/javascript" language="javascript" src="/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="/js/main.js" ></script>
        <script type="text/javascript" language="javascript" src="/js/common.js"></script>

        <title>{$title}</title>

    </head>
    <body>
 {include file="error_msg.tpl"} 

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
                                {if isset($login_fail)} <div style="color:red; font-weight:bold; font-size:12px;">Вы ввели неправильный логин и пароль!</div>{/if}

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
                                                    <li class="{if $page==''}active{else}noactive{/if}"><a id="tmM" title="Главная" href="/">Главная</a></li>
                                                    <li class="{if $spage=='about'}active{else}noactive{/if}"><a id="tmC" title="О нас" href="/">О нас</a></li>
                                                    <li class="{if $spage=='service'}active{else}noactive{/if}"><a id="tmS" title="Услуги" href="/">Услуги</a></li>
                                                    <li class="{if $page=='rate'}active{else}noactive{/if}"><a id="tmL" title="Тарифы" href="/">Тарифы</a></li>
                                                    <li class="{if $page=='news'}active{else}noactive{/if}"><a id="tmCON" title="Новости" href="?page=news">Новости</a</li>
                                                    <li class="{if $page=='house'}active{else}noactive{/if}"><a id="tma" title="Ваш дом" href="?page=house">Ваш дом</a></li>
                                                    <li class="{if $page=='report'}active{else}noactive{/if}"><a id="tmO" title="Отчеты" href="/">Отчеты</a></li>
                                                </ul>
                                            </td>
                                            <td align="right"><img src="img/right.jpg" /></td>
                                        </tr>
                                    </table>
                                </div>

                                <div style="text-align:center">
                                    <ul class="sub">
                                        {if $page==''}
                                        <li><a title="Раскрытие информации" href="/">Раскрытие информации</a></li>
                                        <li><a title="Личный кабинет" href="/">Личный кабинет</a></li>
                                        <li><a title="Жизненные ситуации" href="/" target="_blank">Жизненные ситуации</a></li>
                                        <li><a title="Важная информация" href="/">Важная информация</a></li>
                                        {/if}
                                        {if $spage=='about'}
                                        <li class="{if $page=='eltechrab'}active{else}noactive{/if}"><a title="Общая информация" href="/">Общая информация</a></li>
                                        <li class="{if $page=='license'}active{else}noactive{/if}"><a title="Лицензии" href="?page=license&spage=about">Лицензии</a></li>
                                        <li class="{if $is_leaders=='1'}active{else}noactive{/if}"><a title="Руководство" href="?page=personal&is_leaders=1&spage=about">Руководство</a></li>
                                        <li class="{if $is_leaders=='0'}active{else}noactive{/if}"><a title="Персонал" href="?page=personal&is_leaders=0&spage=about">Персонал</a></li>
                                        <li class="{if $page=='eltechrab'}active{else}noactive{/if}"><a title="Вакансии" href="/">Вакансии</a></li>
                                        <li class="{if $page=='eltechrab'}active{else}noactive{/if}"><a title="Контакты" href="/">Контакты</a></li>
                                        {/if}
                                        {if $spage=='service'}
                                        <li class="{if $conpage_title=='eltechrab'}active{else}noactive{/if}"><a title="Электротехнические работы" href="?page=content_page&title=eltechrab&spage=service">Электротехнические работы</a></li>
                                        <li class="{if $conpage_title=='santechrab'}active{else}noactive{/if}"><a title="Сантехнические работы" href="?page=content_page&title=santechrab&spage=service">Сантехнические работы</a></li>
                                        <li class="{if $conpage_title==''}active{else}noactive{/if}"><a title="Содержание дома" href="?page=content_page&title=">Содержание дома</a></li>
                                        <li class="{if $conpage_title==''}active{else}noactive{/if}"><a title="Ремонт дома" href="?page=content_page&title=">Ремонт дома</a></li>
                                        {/if}
                                        {if $page=='rate'}
                                        {/if}
                                        {if $page=='news'}
                                        <li class="{if $category=='1'}active{else}noactive{/if}"><a title="Объявления" href="?page=news&category=1">Объявления</a></li>
                                        <li class="{if $category=='2'}active{else}noactive{/if}"><a title="Отключения" href="?page=news&category=2" >Отключения</a></li>
                                        <li class="{if $category=='3'}active{else}noactive{/if}"><a title="Подключения" href="?page=news&category=3" >Подключения</a></li>
                                        <li class="{if $category=='4'}active{else}noactive{/if}"><a title="Согласования" href="?page=news&category=4" >Согласования</a></li>
                                        <li class="{if $category=='5'}active{else}noactive{/if}"><a title="Законодательство" href="?page=news&category=5" >Законодательство</a></li>
                                        {/if}
                                        {if $page=='report'}
                                        {/if}
                                    </ul>
                                </div>

                                <script type="text/javascript">
                                var submenus = [ {  id:"tmM",subs:[  {  "t":"Раскрытие информации","u":"/" } , { "t":"Личный кабинет","u":"http://messenger.dnevnik.ru/" } , { "t":"Жизненные ситуации","u":"/" } , { "t":"Важная информация","u":"/" } ] } ,
                                                 { id:"tmC",subs:[ { "t":"Общая информация","u":"/" } , { "t":"Лицензии","u":"?page=license&spage=about" } , { "t":"Руководство","u":"?page=personal&is_leaders=1&spage=about" } , { "t":"Персонал","u":"?page=personal&is_leaders=0&spage=about" } , { "t":"Вакансии","u":"/" } , { "t":"Контакты","u":"/" } ] } , 
                                                 { id:"tmS",subs:[ { "t":"Электротехнические работы","u":"?page=content_page&title=eltechrab&spage=service" } , { "t":"Сантехнические работы","u":"?page=content_page&title=santechrab&spage=service" } , { "t":"Содержание дома","u":"/" } , { "t":"Ремонт дома","u":"/" } ] } , 
                                                 { id:"tmL",subs:[ { "t":"Жилищно-коммунальные услуги","u":"/" } , { "t":"Коммунальные ресурсы","u":"/" } ] } , 
                                                 { id:"tmCON",subs:[ { "t":"Объявления","u":"?page=news&category=1" } , { "t":"Отключения","u":"?page=news&category=2" } , { "t":"Подключения","u":"?page=news&category=3" } , { "t":"Согласования","u":"?page=news&category=4" } , { "t":"Законодательство","u":"?page=news&category=5" } ] } , 
                                                 { id:"tma",subs:[ { "t":"Обслуживаемые дома","u":"/" } , { "t":"План проводимых работ","u":"/" } , { "t":"Отчет по капитальном ремонту ","u":"/" } ] } , 
                                                 { id:"tmO",subs:[ { "t":"Бухгалтерская отчетность","u":"/" } , { "t":"Доходы","u":"/" } , { "t":"Расходы","u":"/" } ] } ];
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

                            {if isset($page) && !empty($page)} 
                                {include file="$page.tpl"} 
                            {else} 

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

                                            {foreach from=$news_list item=news} 
                                            <div>{$news.date|date_format:"%d.%m.%Y"} &nbsp; {$news.title}</div>
                                            <div>{$news.short_text} </div>
                                            {if $news.full_text}<a href="{$siteurl}?page=news&action=view_news&id={$news.id}&category={$news.news_category_id}">подробнее...</a><br/>{/if} 
                                            <br/>
                                           {/foreach}

                                        </td>
                                    </tr>
                                </table>

                            {/if}

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