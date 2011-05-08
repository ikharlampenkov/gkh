<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8"></meta>
<meta name="DESCRIPTION" content="{$description}"></meta>
<meta name="keywords" content="{$keywords}"></meta>
<meta name="author-corporate" content=""></meta>
<meta name="publisher-email" content=""></meta>

<style type="text/css">
table {
    width: 100%;
}

tr {
   vertical-align: top;
}

input {
    width: 99%;
}

textarea {
    width: 99%;
    height: 200px;
}

#save {
    width: 100px;
}

#check {
    font-size: 14px;
}

</style>

<script type="text/javascript" language="javascript" src="/js/jquery.js" ></script>
<script type="text/javascript" language="javascript" src="/js/main.js" ></script>

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

                    <div>{$user}</div> <a href="{$siteurl}?logout">Выйти</a>

                </td>
            </tr>
        </table>


    </td>
  </tr>
{*end up*}
{*middle*}
  <tr>
    <td>

        <table border="1" width="100">
            <tr>
                <td width="230">

                    <a href="?page=contact">Контакты</a><br /><br />
                    <a href="?page=personal-account">Управление лицевыми счетами</a><br /><br />
                    <a href="?page=auto-inf">Управление авто-информатором</a><br /><br />
                    <a href="?page=messaging">Рассылка универсальных сообщений</a><br /><br />
                    <a href="?page=support">Тех. поддержка</a><br /><br />

                </td>
                <td>

                    {if isset($page)}
                        {if $page=="contact"}
                            {include file="reu/contact.tpl"}
                        {/if}
                        {if $page=="personal-account"}
                            {include file="reu/personal-account.tpl"}
                        {/if}
                        {if $page=="auto-inf"}
                            {include file="reu/auto-inf.tpl"}
                        {/if}
                        {if $page=="messaging"}
                            {include file="reu/messaging.tpl"}
                        {/if}
                        {if $page=="support"}
                            {include file="reu/support.tpl"}
                        {/if}
                    {/if}

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