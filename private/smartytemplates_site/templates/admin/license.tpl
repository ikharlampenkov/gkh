
<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Достижения</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if $action=="edit"}&id={$license.id}{/if}" method="post" enctype="multipart/form-data">
    <table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
        <tr>
            <td class="pem">Достижение</td>
            <td class="pem">{if !empty($license.img)}<img src="{$siteurl}temp_files/{$license.img}" /><br />
                &nbsp;<a href="?page={$page}&action=del_file&id={$license.id}&field=img">удалить</a><br />{/if}
                <input type="file"  name="img" /></td>
        </tr>
        <tr class="pem">
            <td width="200">Описание</td>
            <td><textarea name="data[description]">{$license.description}</textarea></td>
        </tr> 
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add">ДОБАВИТЬ ДОКУМЕНТ</a>
</td>
</table>
{if $license_list!==false}
<table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
    <tr>
       <td class="pom">Достижение</td>
       <td class="pom">Описание</td>
       <td class="pom">&nbsp;</td>
       <td class="pom">&nbsp;</td>
    </tr>
{foreach from=$license_list item=license}
    <tr>
        <td class="pem">{if $license.img_prew}<img src="{$siteurl}temp_files/{$license.img_prew}" />{else}&nbsp;{/if}</td>
	<td class="pem">{$license.description|truncate:50}</td>
        <td class="pom"><a href="?page={$page}&action=edit&id={$license.id}">редактировать</a></td>
         <td class="pom">   <a href="?page={$page}&action=del&id={$license.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add">ДОБАВИТЬ ДОКУМЕНТ</a>
</td>
</table>

{/if}