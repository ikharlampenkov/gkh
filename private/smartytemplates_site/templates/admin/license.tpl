<h1>Достижения</h1>

{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if $action=="edit"}&id={$license.id}{/if}" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>Достижение</td>
            <td>{if !empty($license.img)}<img src="{$siteurl}temp_files/{$license.img}" /><br />
                &nbsp;<a href="?page={$page}&action=del_file&id={$license.id}&field=img">удалить</a><br />{/if}
                <input type="file"  name="data[img]" /></td>
        </tr>
        <tr>
            <td width="200">Описание</td>
            <td><textarea name="data[description]">{$license.description}</textarea></td>
        </tr> 
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}

{if $license_list!==false}
<table>
    <tr>
       <td>Достижение</td>
       <td>Описание</td>
       <td>&nbsp;</td>
    </tr>
{foreach from=$license_list item=license}
    <tr>
        <td>{if $license.img_prew}<img src="{$siteurl}temp_files/{$license.img_prew}" />{else}&nbsp;{/if}</td>
	<td>{$license.description|truncate:50}</td>
        <td><a href="?page={$page}&action=edit&id={$license.id}">редактировать</a><br />
            <a href="?page={$page}&action=del&id={$license.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=add">Добавить достижение</a>

{/if}