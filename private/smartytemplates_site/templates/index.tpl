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
                                            <a href="?page=content_page&title=helpful_information">Полезная информация</a>&nbsp;&nbsp;&nbsp;&nbsp;
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
                                <span style="font-size: 14px">Аварийная служба</span><br/>
                                <span style="font-size: 20px; color: #51828e;">36-66-83</span><br/>
                                <span style="font-size: 12px; color: #51828e;">круглосуточно</span>
                            </td>
                            <td width="159" background="img/vhod.jpg" valign="top" style="padding-left: 15px;" align="right">
                                <br/><br/><br/>
                                {if isset($login_fail)} <div style="color:red; font-weight:bold; font-size:12px;">Вы ввели неправильный логин и пароль!</div>{/if}

                                <form method="post" style="margin:0px; padding:0px;">
                                    {*<span style="width:70px">Лицевой счет: </span>*}
                                    <input type="text" name="personal_account" value="Лицевой счет" style="font-size: 16px; width: 150px; color:#999999;" onfocus="if (this.value == this.defaultValue) this.value = '';" onmouseout="if (this.value == '') this.value = 'Лицевой счет';"  />
                                    <br/><br/>
                                    {*<span style="width:70px">Пароль: </span>*}
                                    <input type="password" name="psw" value="Пароль"  style="font-size: 16px; width: 150px; color:#999999;" onfocus="if (this.value == this.defaultValue) this.value = '';" onmouseout="if (this.value == '') this.value = 'Пароль';" />

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
                                                    <li class="{if $spage=='main'}active{else}noactive{/if}"><a id="tmM" title="Главная" href="/">Главная</a></li>
                                                    <li class="{if $spage=='about'}active{else}noactive{/if}"><a id="tmC" title="О нас" href="?page=content_page&title=about&spage=about">О нас</a></li>
                                                    <li class="{if $spage=='service'}active{else}noactive{/if}"><a id="tmS" title="Услуги" href="?page=content_page&title=service&spage=service">Услуги</a></li>
                                                    <li class="{if $spage=='rates'}active{else}noactive{/if}"><a id="tmL" title="Тарифы" href="?page=content_page&title=rates&spage=rates">Тарифы</a></li>
                                                    <li class="{if $spage=='news'}active{else}noactive{/if}"><a id="tmCON" title="Новости" href="?page=news&spage=news">Новости</a</li>
                                                    <li class="{if $spage=='house'}active{else}noactive{/if}"><a id="tma" title="Ваш дом" href="?page=house&spage=house">Ваш дом</a></li>
                                                    <li class="{if $spage=='reports'}active{else}noactive{/if}"><a id="tmO" title="Отчеты" href="?page=content_page&title=reports&spage=reports">Отчеты</a></li>
                                                </ul>
                                            </td>
                                            <td align="right"><img src="img/right.jpg" /></td>
                                        </tr>
                                    </table>
                                </div>

                                <div style="text-align:center">
                                    <ul class="sub">
                                        {if $spage=='main'}
                                        <li class="{if $conpage_title=='disclosure_of_information'}active{else}noactive{/if}"><a title="Раскрытие информации" href="?page=content_page&title=disclosure_of_information">Раскрытие информации</a></li>
                                        <li class="{if $conpage_title=='cabinet'}active{else}noactive{/if}"><a title="Личный кабинет" href="?page=content_page&title=cabinet">Личный кабинет</a></li>
                                        <li class="{if $page=='faq' && isset($is_situation) && $is_situation==1}active{else}noactive{/if}"><a title="Жизненные ситуации" href="?page=faq&is_situation=1">Жизненные ситуации</a></li>
                                        <li class="{if $page=='news' && isset($is_important) && $is_important==1}active{else}noactive{/if}"><a title="Важная информация" href="?page=news&is_important=1">Важная информация</a></li>
                                        {/if}
                                        {if $spage=='about'}
                                        <li class="{if $conpage_title=='general_information'}active{else}noactive{/if}"><a title="Общая информация" href="?page=content_page&title=general_information&spage=about">Общая информация</a></li>
                                        <li class="{if $page=='license'}active{else}noactive{/if}"><a title="Лицензии" href="?page=license&spage=about">Лицензии</a></li>
                                        {*<li class="{if $page=='personal' && $is_leaders==1}active{else}noactive{/if}"><a title="Руководство" href="?page=personal&is_leaders=1&spage=about">Руководство</a></li>*}
                                        {*<li class="{if $page=='personal' && $is_leaders==0}active{else}noactive{/if}"><a title="Персонал" href="?page=personal&is_leaders=0&spage=about">Персонал</a></li>*}
                                        <li class="{if $conpage_title=='leaders'}active{else}noactive{/if}"><a title="Руководство" href="?page=content_page&title=leaders&spage=about">Руководство</a></li>
                                        <li class="{if $conpage_title=='passport_office'}active{else}noactive{/if}"><a title="Паспортный стол" href="?page=content_page&title=passport_office&spage=about">Паспортный стол</a></li>
                                        <li class="{if $page=='vacancy'}active{else}noactive{/if}"><a title="Вакансии" href="?page=vacancy&spage=about">Вакансии</a></li>
                                        <li class="{if $conpage_title=='distributor'}active{else}noactive{/if}"><a title="Поставщики" href="?page=content_page&title=distributor&spage=about">Поставщики</a></li>
                                        <li class="{if $conpage_title=='contact'}active{else}noactive{/if}"><a title="Контакты" href="?page=content_page&title=contact&spage=about">Контакты</a></li>
                                        {/if}
                                        {if $spage=='service'}
                                        <li class="{if $conpage_title=='eltechrab'}active{else}noactive{/if}"><a title="Электротехнические работы" href="?page=content_page&title=eltechrab&spage=service">Электротехнические работы</a></li>
                                        <li class="{if $conpage_title=='santechrab'}active{else}noactive{/if}"><a title="Сантехнические работы" href="?page=content_page&title=santechrab&spage=service">Сантехнические работы</a></li>
                                        <li class="{if $conpage_title=='keep_the_house'}active{else}noactive{/if}"><a title="Содержание дома" href="?page=content_page&title=keep_the_house&spage=service">Содержание дома</a></li>
                                        {*<li class="{if $conpage_title=='home_repair'}active{else}noactive{/if}"><a title="Ремонт дома" href="?page=content_page&title=home_repair&spage=service">Ремонт дома</a></li>*}
                                        <li class="{if $conpage_title=='where_to_pay'}active{else}noactive{/if}"><a title="Где оплатить?" href="?page=content_page&title=where_to_pay&spage=service">Где оплатить?</a></li>
                                        {/if}
                                        {if $spage=='rates'}
                                        <li class="{if $conpage_title=='gkh'}active{else}noactive{/if}"><a title="Жилищно-коммунальные услуги" href="?page=content_page&title=gkh&spage=rates">Жилищно-коммунальные услуги</a></li>
                                        <li class="{if $conpage_title=='communal_resources'}active{else}noactive{/if}"><a title="Коммунальные ресурсы" href="?page=content_page&title=communal_resources&spage=rates">Коммунальные ресурсы</a></li>                                        
                                        <li class="{if $conpage_title=='where_to_pay'}active{else}noactive{/if}"><a title="Где оплатить?" href="?page=content_page&title=where_to_pay&spage=rates">Где оплатить?</a></li>
                                        {/if}
                                        {if $spage=='news'}
                                        <li class="{if $category=='1'}active{else}noactive{/if}"><a title="Объявления" href="?page=news&category=1&spage=news">Объявления</a></li>
                                        <li class="{if $category=='2'}active{else}noactive{/if}"><a title="Отключения" href="?page=news&category=2&spage=news" >Отключения</a></li>
                                        <li class="{if $category=='3'}active{else}noactive{/if}"><a title="Подключения" href="?page=news&category=3&spage=news" >Подключения</a></li>
                                        <li class="{if $category=='4'}active{else}noactive{/if}"><a title="Согласования" href="?page=news&category=4&spage=news" >Согласования</a></li>
                                        <li class="{if $category=='5'}active{else}noactive{/if}"><a title="Законодательство" href="?page=news&category=5&spage=news" >Законодательство</a></li>
                                        {/if}
                                        {if $spage=='house'}
                                        <li class="{if $category=='all'}active{else}noactive{/if}"><a title="Обслуживаемые дома" href="?page=house&category=all&spage=house">Обслуживаемые дома</a></li>
                                        <li class="{if $category=='plan'}active{else}noactive{/if}"><a title="План проводимых работ" href="?page=content_page&title=plan_prov_rabot&spage=house">План проводимых работ</a></li>
                                        {*<li class="{if $category=='reports'}active{else}noactive{/if}"><a title="Отчет по капитальном ремонту" href="?page=house&category=reports&spage=house">Отчет по капитальном ремонту</a></li>*}
                                        {/if}
                                        {if $spage=='reports'}
                                        <li class="{if $conpage_title=='financial_statements'}active{else}noactive{/if}"><a title="Бухгалтерская отчетность" href="?page=content_page&title=financial_statements&spage=reports">Бухгалтерская отчетность</a></li>
                                        <li class="{if $conpage_title=='income'}active{else}noactive{/if}"><a title="Доходы" href="?page=content_page&title=income&spage=reports">Доходы</a></li>
                                        <li class="{if $conpage_title=='costs'}active{else}noactive{/if}"><a title="Расходы" href="?page=content_page&title=costs&spage=reports">Расходы</a></li>
                                        {/if}
                                    </ul>
                                </div>

                                <script type="text/javascript">
                                var submenus = [ {  id:"tmM",subs:[  {  "t":"Раскрытие информации","u":"?page=content_page&title=disclosure_of_information" } , { "t":"Личный кабинет","u":"?page=content_page&title=cabinet" } , { "t":"Жизненные ситуации","u":"?page=faq&is_situation=1" } , { "t":"Важная информация","u":"?page=content_page&title=important_information" } ] } ,
                                                 { id:"tmC",subs:[ { "t":"Общая информация","u":"?page=content_page&title=general_information&spage=about" } , { "t":"Лицензии","u":"?page=license&spage=about" } , { "t":"Руководство","u":"?page=content_page&title=leaders&spage=about" } , { "t":"Паспортный стол","u":"?page=content_page&title=passport_office&spage=about" } , { "t":"Вакансии","u":"?page=vacancy&spage=about" } , { "t":"Поставщики","u":"?page=content_page&title=distributor&spage=about" } , { "t":"Контакты","u":"?page=content_page&title=contact&spage=about" } ] } , 
                                                 { id:"tmS",subs:[ { "t":"Электротехнические работы","u":"?page=content_page&title=eltechrab&spage=service" } , { "t":"Сантехнические работы","u":"?page=content_page&title=santechrab&spage=service" } , { "t":"Содержание дома","u":"?page=content_page&title=keep_the_house&spage=service" } , { "t":"Где оплатить?","u":"?page=content_page&title=where_to_pay&spage=service" } ] } , 
                                                 { id:"tmL",subs:[ { "t":"Жилищно-коммунальные услуги","u":"?page=content_page&title=gkh&spage=rates" } , { "t":"Коммунальные ресурсы","u":"?page=content_page&title=communal_resources&spage=rates" } , { "t":"Где оплатить?","u":"?page=content_page&title=where_to_pay&spage=rates" } ] } , 
                                                 { id:"tmCON",subs:[ { "t":"Объявления","u":"?page=news&category=1&spage=news" } , { "t":"Отключения","u":"?page=news&category=2&spage=news" } , { "t":"Подключения","u":"?page=news&category=3&spage=news" } , { "t":"Согласования","u":"?page=news&category=4&spage=news" } , { "t":"Законодательство","u":"?page=news&category=5&spage=news" } ] } , 
                                                 { id:"tma",subs:[ { "t":"Обслуживаемые дома","u":"?page=house&category=all&spage=house" } , { "t":"План проводимых работ","u":"?page=content_page&title=plan_prov_rabot&spage=house" } ] } , 
                                                 { id:"tmO",subs:[ { "t":"Бухгалтерская отчетность","u":"?page=content_page&title=financial_statements&spage=reports" } , { "t":"Доходы","u":"?page=content_page&title=income&spage=reports" } , { "t":"Расходы","u":"?page=content_page&title=costs&spage=reports" } ] } ];
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
                            <td width="885" valign="top" style="font-size:13px;">

                            {if isset($page) && !empty($page)} 
                                {include file="$page.tpl"} 
                            {else} 

                                <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>

                                        <td width="32%" valign="top">
                                            <div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Личный кабинет жильца</div>
                                            <div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
                                            <img src="kab.gif">
                                        </td>
                                        <td width="200">&nbsp;</td>

                                        <td width="32%" valign="top">
                                            <div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Раскрытие информации</div>
                                            <div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>

                                            <ul>
                                                <li><a title="Общая информация" href="?page=content_page&title=general_information&spage=about">Общая информация</a></li>

                                                <li>Финансово-хозяйственная деятельность</li>
                                                <li><a title="Бухгалтерская отчетность" href="?page=content_page&title=financial_statements&spage=reports">- бухгалтерская отчетность</a></li>
                                                <li><a title="Доходы" href="?page=content_page&title=income&spage=reports">- доходы от услуг по управлению МКД</a></li>
                                                <li><a title="Расходы" href="?page=content_page&title=costs&spage=reports">- расходы в связи с оказанием услуг по управлению МКД</a></li>

                                                <li>Информация об услугах, работах по содержанию и ремонту</li>
                                                <li><a title="По содержанию дома" href="?page=content_page&title=basic&spage=about">- базовые</a></li>
                                                <li><a title="Электротехнические" href="?page=content_page&title=platnie&spage=about">- платные</a></li>


                                                <li>Порядок и условия оказания услуг по содержание и ремонт</li>
                                                <li><a title="- Договор" href="?page=content_page&title=dogovor&spage=about">- Договор</a></li>
                                                <li><a title="- План работ по содержанию и ремонту" href="?page=content_page&title=plan_rabot&spage=about">- План работ по содержанию и ремонту</a></li>
                                                <li><a title="- Меры по снижению расходов на работу" href="?page=content_page&title=meri_rashod&spage=about">- Меры по снижению расходов на работу</a></li>
                                                <li><a title="- Нарушения" href="?page=content_page&title=narusheni&spage=about">- Нарушения</a></li>
                                                <li><a title="- Соответствие качеству" href="?page=content_page&title=kachthestvo&spage=about">- Соответствие качеству</a></li>

                                                <li>Содержание, периодичность, результат, стоимость работ по содержанию и ремонту</li>
                                                <li><a title="Тарифы на коммунальные ресурсы" href="?page=content_page&title=communal_resources&spage=rates">Тарифы на коммунальные ресурсы</a></li>                                        
                                                
                                                <li><a title="Случаи привлечения к ответственности" href="?page=content_page&title=otvetstv&spage=about">Случаи привлечения к ответственности</a></li>
                                            </ul>                                                                                  
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

                                <br/>
                                {foreach from=$faq_title_list item=faq_t}

                                <div><a href="?page=faq&is_situation=1#{$faq_t.id}" style="color: #fff; font-size: 16px;">{$faq_t.question}</a></div>
                                <br/>
                                {/foreach}

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