<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Счетчики</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>

{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if edit}&id={$meter.id}{/if}" method="post">
    <table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
        <tr class="pom">
            <td width="200">Название</td>
            <td><input name="data[title]" value="{$meter.title}" /></td>
        </tr>
        <tr class="pom">
            <td width="200">Тариф</td>
            <td><input name="data[rate]" value="{$meter.rate}" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}

{if $meters_list!==false}
<table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
    <tr class="pum">
       <td>Название</td>
       <td>Тариф</td>
       <td>&nbsp;</td><td>&nbsp;</td>
    </tr>
{foreach from=$meters_list item=meter}
    <tr>
        <td class="pem">{$meter.title}</td>
	<td class="pem">{$meter.rate}</td>
        <td class="pom"><a href="?page={$page}&action=edit&id={$meter.id}">редактировать</a></td>
        <td class="pom">    <a href="?page={$page}&action=del&id={$meter.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=add">Добавить счетчик</a>

{/if}