<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Документы</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>

{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>
<a href="?page={$page}"><< Назад</a> 
<form action="?page={$page}&action={$action}&id={if $action=="edit"}{$document.id}{/if}" method="post" enctype="multipart/form-data">
    <table cellpadding="5" border="0" style="font-size:14px;">
        <tr class="pem">
            <td width="200">Название</td>
            <td><input name="data[title]" value="{$document.title}" /></td>
        </tr>
        <tr class="pem">
            <td >Краткое описание</td>
            <td><textarea name="data[short_text]">{$document.short_text}</textarea></td>
        </tr class="pem">
        <tr class="pem">
            <td>Родительский элемент</td>
            <td><select name="data[parrent_id]">
                    <option value="0" {if isset($document.parent_id) && $document.parent_id==0}selected="selected"{/if}>корень</option>
                    {foreach from=$folder_list item=folder}
                    <option value="{$folder.id}" {if isset($document.parent_id) && $document.parent_id==$folder.id}selected="selected"{/if}>{$folder.title}</option>
                    {/foreach}
                </select></td>
        </tr>
        <tr class="pem">
            <td>Файл</td>
            <td>{if !empty($document.file)}<a href={$siteurl}temp_files/{$document.file}>Файл</a><br />{/if}
                <input type="file"  name="data[file]" /></td>
        </tr>
    </table>
    <input type="hidden" name="data[is_folder]" value="0" />
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{elseif $action=="add_folder" || $action=="edit_folder"}
<a href="?page={$page}"><< Назад</a> 
<form action="?page={$page}&action={$action}&id={if $action=="edit_folder"}{$document.id}{/if}" method="post" enctype="multipart/form-data">
    <table cellpadding="5" border="0" style="font-size:14px;">
        <tr class="pem">
            <td width="200">Название</td>
            <td><input name="data[title]" value="{$document.title}" /></td>
        </tr>
        <tr class="pem">
            <td>Родительский элемент</td>
            <td><select name="data[parrent_id]">
                    <option value="0" {if isset($document.parent_id) && $document.parent_id==0}selected="selected"{/if}>корень</option>
                    {foreach from=$folder_list item=folder}
                    <option value="{$folder.id}" {if isset($document.parent_id) && $document.parent_id==$folder.id}selected="selected"{/if}>{$folder.title}</option>
                    {/foreach}
                </select></td>
        </tr>
    </table>
    <input type="hidden" name="data[short_text]" value="" />
    <input type="hidden" name="data[is_folder]" value="1" />
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}

<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add_folder">ДОБАВИТЬ ПАПКУ</a> / <a href="?page={$page}&action=add">ДОБАВИТЬ ДОКУМЕНТ</a>
</td>
</table>

{if isset($path_to_document)}
<div>
    <a href="?page={$page}"><< Назад</a> 
{section name=path_doc loop=count($path_to_document) step=-1}
    <a href="?page={$page}&root={$path_to_document[path_doc].id}">{$path_to_document[path_doc].title}</a>{if !$smarty.section.path_doc.last} / {/if}
{/section}    
</div><br />
{/if}



{if $document_list!==false}
<table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
    <tr>
       <td class="pum">Название</td>
       <td class="pum">Краткое описание</td>
       <td class="pum">Тип</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
    </tr>
{foreach from=$document_list item=document}
    <tr>
        <td class="pem">{if $document.is_folder==1}<a href="?page={$page}&root={$document.id}">{$document.title|truncate:100}</a>{else}{$document.title|truncate:100}{/if}</td>
	<td class="pem">{$document.short_text|truncate:200}</td>
        <td class="pem">{if $document.is_folder==1}папка{else}документ{/if}</td>    
        <td class="pom"><a href="?page={$page}&action={if $document.is_folder==1}edit_folder{else}edit{/if}&id={$document.id}">редактировать</a></td>
          <td class="pom">  <a href="?page={$page}&action={if $document.is_folder==1}del_folder{else}del{/if}&id={$document.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add_folder">ДОБАВИТЬ ПАПКУ</a> / <a href="?page={$page}&action=add">ДОБАВИТЬ ДОКУМЕНТ</a>
</td>
</table>

<br />


{/if}