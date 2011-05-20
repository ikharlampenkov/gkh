<h1>Персонал</h1>

{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if $action=="edit"}&id={$personal.id}{/if}" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="200">ФИО</td>
            <td><input name="data[fio]" value="{$personal.fio}" /></td>
        </tr> 
        <tr>
            <td>Фото</td>
            <td>{if !empty($personal.foto)}<img src="{$siteurl}temp_files/{$personal.foto}" /><br />
                &nbsp;<a href="?page={$page}&action=del_file&id={$personal.id}&field=foto">удалить</a><br />{/if}
                <input type="file"  name="data[foto]" /></td>
        </tr>
        <tr>
            <td>Руководитель</td>
            <td><input name="data[is_leaders]" type="checkbox" {if isset($personal.leaders) && $personal.leaders}checked="checked"{/if} style="font-size: 14px; width: 25px;" /></td>
        </tr>
        <tr>
            <td>Отдел</td>
            <td><input name="data[department]" value="{$personal.department}" /></td>
        </tr>
        <tr>
            <td>Должность</td>
            <td><input name="data[position]" value="{$personal.position}" /></td>
        </tr>
        <tr>
            <td>E-mail</td>
            <td><input name="data[email]" value="{$personal.email}" /></td>
        </tr>
        <tr>
            <td>Текст</td>
            <td><textarea name="data[sometext]" />{$personal.sometext}</textarea></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}

{if $personal_list!==false}
<table>
    <tr>
       <td>Фото</td>
       <td>ФИО</td>
       <td>Отдел</td>
       <td>Должность</td>
       <td>&nbsp;</td>
    </tr>
{foreach from=$personal_list item=personal}
    <tr>
        <td>{if $personal.img_prew}<img src="{$siteurl}temp_files/{$personal.img_prew}" />{else}&nbsp;{/if}</td>
	<td>{$personal.fio}</td>
        <td>{$personal.department}</td>
        <td>{$personal.position}</td>
        <td><a href="?page={$page}&action=edit&id={$personal.id}">редактировать</a><br />
            <a href="?page={$page}&action=del&id={$personal.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=add">Добавить работника</a>

{/if}