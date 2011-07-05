
<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Персонал</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if $action=="edit"}&id={$personal.id}{/if}" method="post" enctype="multipart/form-data">
    <table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
        <tr class="pem">
            <td width="200">ФИО</td>
            <td><input name="data[fio]" value="{$personal.fio}" /></td>
        </tr> 
        <tr class="pem">
            <td>Фото</td>
            <td>{if !empty($personal.foto)}<img src="{$siteurl}temp_files/{$personal.foto}" /><br />
                &nbsp;<a href="?page={$page}&action=del_file&id={$personal.id}&field=foto">удалить</a><br />{/if}
                <input type="file"  name="data[foto]" /></td>
        </tr>
        <tr class="pem">
            <td>Руководитель</td>
            <td><input name="data[is_leaders]" type="checkbox" {if isset($personal.leaders) && $personal.leaders}checked="checked"{/if} style="font-size: 14px; width: 25px;" /></td>
        </tr>
        <tr class="pem">
            <td>Отдел</td>
            <td><input name="data[department]" value="{$personal.department}" /></td>
        </tr>
        <tr class="pem">
            <td>Должность</td>
            <td><input name="data[position]" value="{$personal.position}" /></td>
        </tr>
        <tr class="pem">
            <td>E-mail</td>
            <td><input name="data[email]" value="{$personal.email}" /></td>
        </tr>
        <tr class="pem">
            <td>Текст</td>
            <td><textarea name="data[sometext]" />{$personal.sometext}</textarea></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add">ДОБАВИТЬ РАБОТНИКА</a>
</td>
</table>
{if $personal_list!==false}
<table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
    <tr>
       <td class="pum">Фото</td>
       <td class="pum">ФИО</td>
       <td class="pum">Отдел</td>
       <td class="pum">Должность</td>
       <td>&nbsp;</td>
    </tr>
{foreach from=$personal_list item=personal}
    <tr>
        <td class="pem">{if $personal.img_prew}<img src="{$siteurl}temp_files/{$personal.img_prew}" />{else}&nbsp;{/if}</td>
	<td class="pem">{$personal.fio}</td>
        <td class="pem">{$personal.department}</td>
        <td class="pem">{$personal.position}</td>
        <td class="pom"><a href="?page={$page}&action=edit&id={$personal.id}">редактировать</a><br />
            <a href="?page={$page}&action=del&id={$personal.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add">ДОБАВИТЬ РАБОТНИКА</a>
</td>
</table>



{/if}