<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8"></meta>
        <meta name="DESCRIPTION" content="{$description}"></meta>
        <meta name="keywords" content="{$keywords}"></meta>
        <meta name="author-corporate" content=""></meta>
        <meta name="publisher-email" content=""></meta>
        <script type="text/javascript" language="javascript" src="/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="/js/main.js" ></script>

        <style >
            input {
    width: 99%;
}

            textarea {
    width: 99%;
}
        </style>

        <title>{$title}</title>

    </head>
    <body>
{include file="error_msg.tpl"}

        <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1">
{*up*}
            <tr>
                <td valign="top" height="150">

                    <table width="100%" height="150" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>Сайт управляющей компании</td>
                            <td width="300">

                                <div style="text-align:center; vertical-align:middle;">
                                    <div style="border:1px solid black; width:250px; height:120px; padding:10px; text-align:left;">
{if isset($login_fail)}<div style="color:red; font-weight:bold; font-size:12px;">Вы ввели неправильный логин и пароль!</div>{/if}
                                        <form method="post" style="margin:0px; padding:0px;">
                                            <div><span style="width:70px">Дом: </span><select name="login" style="width:160px;">
                                                  {foreach from=$house_login_list item=house}
                                                  <option value="{$house.id}">{$house.street}, {$house.number}{$house.subnumber}</option>
                                                  {/foreach}                                    
                                                </select></div>
                                            <div><span style="width:70px">Квартира: </span><input name="apartment" type="text" style="width:150px;"></div>
                                            <div><span style="width:70px">Пароль: </span><input name="psw" type="password" style="width:150px;"></div>
                                            <div><input type="submit" value="Войти" style="width:70px;"></div>
                                        </form>
                                    </div>
                                </div>

                            </td>
                        </tr>
                    </table>


                </td>
            </tr>
{*end up*}
{*middle*}
            <tr>
                <td>        
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr valign="top">
                            <td>
                            {if isset($page) && !empty($page)}
                                {include file="$page.tpl"}  
                            {else}
                                Главная страница<br /><br/><br /><br/>

                                <a href="?page=content_page&title=eltechrab">Электротехнические работы</a><br /><br/>
                                <a href="?page=content_page&title=santechrab">Сантехнические работы</a><br /><br/>
                                <a href="?page=house">Дома</a><br /><br/>
                                <a href="?page=document">Документы</a><br /><br />
                            {/if}
                            </td>
                            <td width="250">
                                <h3>Новости</h3>

                                {foreach from=$news_list item=news}
                                <div>{$news.date|date_format:"%d.%m.%Y"}&nbsp;{$news.title}</div>
                                <div>{$news.short_text}</div>
                                {if $news.full_text}<a href="{$siteurl}?page=news&action=view_news&id={$news.id}&category={$news.news_category_id}">подробнее...</a><br/>{/if}
                                <br/>
                                {/foreach}

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
{*end middle*}
{*down*}
            <tr>
                <td height="40">&nbsp;</td>
            </tr>
{*end down*}
        </table>



    </body>
</html>