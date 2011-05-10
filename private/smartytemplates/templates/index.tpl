<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8"></meta>
        <meta name="DESCRIPTION" content="{$description}"></meta>
        <meta name="keywords" content="{$keywords}"></meta>
        <meta name="author-corporate" content=""></meta>
        <meta name="publisher-email" content=""></meta>

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
                            <td>ЖКХИНФОРМ.РФ</td>
                            <td width="300">

                                <div style="text-align:center; vertical-align:middle;">
                                    <div style="border:1px solid black; width:250px; height:120px; padding:10px; text-align:left;">
{if isset($login_fail)}<div style="color:red; font-weight:bold; font-size:12px;">Вы ввели неправильный логин и пароль!</div>{/if}
                                        <form method="post" style="margin:0px; padding:0px;">
                                            <div><span style="width:70px">Логин: </span><input name="login" type="text" style="width:150px;"></div>
                                            <div><span style="width:70px">Пароль: </span><input name="psw" type="password" style="width:150px;"></div>
                                            <div><input type="submit" value="Войти" style="width:70px;"> <a href="?page=recover_password">Забыли пароль?</a></div>
                                        </form>
                                        <a href="?page=registr" >Зарегистрироваться</a>
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

        {if $page=="registr"} 
           {include file="registr.tpl"}
        {elseif $page=="recover_password"}
           {include file="recover_password.tpl"}
        {elseif $page=="news"}
           {include file="news.tpl"}
        {else}
                                <h4>{$about.title}</h4>
                                <div>{$about.content}</div>

                                <h4>{$how_connect.title}</h4>
                                <div>{$how_connect.content}</div>

                                <h4>{$how_much.title}</h4>
                                <div>{$how_much.content}</div>
        {/if}
                            </td>
                            <td width="250">
                                <h3>Новости</h3>
                                
                                {foreach from=$news_list item=news}
                                <div>{$news.date|date_format:"%d.%m.%Y"}&nbsp;{$news.title}</div>
                                <div>{$news.short_text}</div>
                                {if $news.full_text}<a href="{$siteurl}?page=news&action=view_news&id={$news.id}">подробнее...</a><br/>{/if}
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