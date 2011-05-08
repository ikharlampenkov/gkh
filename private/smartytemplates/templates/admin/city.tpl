<h1>Города</h1>


{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if edit}&id={$city.id}{/if}" method="post">
    <table>
        <tr>
            <td width="200">Название</td>
            <td><input name="data[title]" value="{$city.title}" /></td>
        </tr>
        <tr>
            <td>Телефонный код города</td>
            <td><input name="data[phone_code]" value="{$city.phone_code}" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}

{if $city_list!==false}
<table>
{foreach from=$city_list item=city}
    <tr>
        <td>{$city.title}</td>
        <td>{$city.phone_code}</td>
        <td><a href="?page={$page}&action=edit&id={$city.id}">редактировать</a><br /><a href="?page={$page}&action=del&id={$city.id}">удалить</a> </td>
    </tr>
{/foreach}
</table>
{/if}

<a href="?page={$page}&action=add">добавить</a>

{/if}