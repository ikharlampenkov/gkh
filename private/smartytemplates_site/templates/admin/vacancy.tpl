<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Вакансии</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if $action=="edit"}&id={$vacancy.id}{/if}" method="post" enctype="multipart/form-data">
    <table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
        <tr class="pem">
            <td width="200">Должность</td>
            <td><input name="data[position]" value="{$vacancy.position}" /></td>
        </tr>
        <tr class="pem">
            <td>Требования</td>
            <td><textarea name="data[requirements]" />{$vacancy.requirements}</textarea></td>
        </tr> 
        <tr class="pem">
            <td>Заработная плата</td>
            <td><input name="data[salary]" value="{$vacancy.salary}" /></td>
        </tr>
        <tr class="pem">
            <td>Текст</td>
            <td><textarea name="data[some_text]" />{$vacancy.some_text}</textarea></td>
        </tr>
        <tr class="pem">
            <td>Куда присылать резюме</td>
            <td><input name="data[contact]" value="{$vacancy.contact}" /></td>
        </tr>
        <tr class="pem">
            <td>К кому обращаться</td>
            <td><input name="data[who]" value="{$vacancy.who}" /></td>
        </tr>
        <tr class="pem">
            <td>Активная</td>
            <td><input name="data[is_active]" type="checkbox" {if isset($vacancy.is_active) && $vacancy.is_active}checked="checked"{/if} style="font-size: 14px; width: 25px;" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add">ДОБАВИТЬ ВАКАНСИЮ</a>
</td>
</table>
{if $vacancy_list!==false}
<table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
    <tr>
       <td class="pum">Должность</td>
       <td class="pum">Требования</td>
       <td class="pum">Заработная плата</td>
       <td class="pum">Активность</td>
       <td class="pum">&nbsp;</td>
       <td class="pum">&nbsp;</td>
    </tr>
{foreach from=$vacancy_list item=vacancy}
    <tr>
	<td class="pem">{$vacancy.position}</td>
        <td class="pem">{$vacancy.requirements}</td>
        <td class="pem">{$vacancy.salary}</td>
        <td class="pem">{$vacancy.is_active}</td>
        <td class="pom"><a href="?page={$page}&action=edit&id={$vacancy.id}">редактировать</a></td>
        <td class="pom"><a href="?page={$page}&action=del&id={$vacancy.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add">ДОБАВИТЬ ВАКАНСИЮ</a>
</td>
</table>


{/if}