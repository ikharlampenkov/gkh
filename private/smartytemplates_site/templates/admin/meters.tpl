<h1>Счетчики</h1>

{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if edit}&id={$meter.id}{/if}" method="post">
    <table>
        <tr>
            <td width="200">Название</td>
            <td><input name="data[title]" value="{$meter.title}" /></td>
        </tr>
        <tr>
            <td width="200">Тариф</td>
            <td><input name="data[rate]" value="{$meter.rate}" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}

{if $meters_list!==false}
<table>
    <tr>
       <td>Название</td>
       <td>Тариф</td>
       <td>&nbsp;</td>
    </tr>
{foreach from=$meters_list item=meter}
    <tr>
        <td>{$meter.title}</td>
	<td>{$meter.rate}</td>
        <td><a href="?page={$page}&action=edit&id={$meter.id}">редактировать</a><br />
            <a href="?page={$page}&action=del&id={$meter.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=add">Добавить счетчик</a>

{/if}