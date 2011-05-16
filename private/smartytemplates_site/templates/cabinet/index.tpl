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
                <td>Сайт управляющей компании
                    <br /><br /><b>Личный кабинет</b>
                </td>
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

                    <a href="?page=receipt">Электронная квитанция</a><br /><br />
                    <a href="?page=balance">Баланс платежей</a><br /><br />
                    <a href="?page=meters">Показания счетчиков</a><br /><br />
                    <a href="?page=support&category=request_master">Заявка на вызов мастера</a><br /><br />
                    <a href="?page=support&category=question">Задать вопрос</a><br /><br />
                    <a href="?page=appointment">Записаться на прием</a><br /><br />
                    <a href="?page=payment">Оплата услуг</a><br /><br />

                </td>
                <td>

                    {if isset($page)}
                        {if $page=="receipt"}
                            {include file="cabinet/receipt.tpl"}
                        {/if}
                        {if $page=="balance"}
                            {include file="cabinet/balance.tpl"}
                        {/if}
                        {if $page=="meters"}
                            {include file="cabinet/meters.tpl"}
                        {/if}
                        {if $page=="support"}
                            {include file="cabinet/support.tpl"}
                        {/if}
                        {if $page=="appointment"}
                            {include file="cabinet/appointment.tpl"}
                        {/if}
                        {if $page=="payment"}
                            {include file="cabinet/payment.tpl"}
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