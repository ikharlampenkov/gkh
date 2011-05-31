<h1>Вакансии</h1>

{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if $action=="edit"}&id={$vacancy.id}{/if}" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="200">Должность</td>
            <td><input name="data[position]" value="{$vacancy.position}" /></td>
        </tr>
        <tr>
            <td>Требования</td>
            <td><textarea name="data[requirements]" />{$vacancy.requirements}</textarea></td>
        </tr> 
        <tr>
            <td>Заработная плата</td>
            <td><input name="data[salary]" value="{$vacancy.salary}" /></td>
        </tr>
        <tr>
            <td>Текст</td>
            <td><textarea name="data[some_text]" />{$vacancy.some_text}</textarea></td>
        </tr>
        <tr>
            <td>Куда присылать резюме</td>
            <td><input name="data[contact]" value="{$vacancy.contact}" /></td>
        </tr>
        <tr>
            <td>К кому обращаться</td>
            <td><input name="data[who]" value="{$vacancy.who}" /></td>
        </tr>
        <tr>
            <td>Активная</td>
            <td><input name="data[is_active]" type="checkbox" {if isset($vacancy.is_active) && $vacancy.is_active}checked="checked"{/if} style="font-size: 14px; width: 25px;" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}

{if $vacancy_list!==false}
<table>
    <tr>
       <td>Должность</td>
       <td>Требования</td>
       <td>Заработная плата</td>
       <td>Активность</td>
       <td>&nbsp;</td>
    </tr>
{foreach from=$vacancy_list item=vacancy}
    <tr>
	<td>{$vacancy.position}</td>
        <td>{$vacancy.requirements}</td>
        <td>{$vacancy.salary}</td>
        <td>{$vacancy.is_active}</td>
        <td><a href="?page={$page}&action=edit&id={$vacancy.id}">редактировать</a><br />
            <a href="?page={$page}&action=del&id={$vacancy.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=add">Добавить вакансию</a>

{/if}