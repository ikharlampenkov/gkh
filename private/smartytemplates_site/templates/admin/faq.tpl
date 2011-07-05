<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Вопросы и ответы</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>

{if $action=="add" || $action=="edit"}
<a href="?page={$page}"><< Назад</a> 
<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}&id={if $action=="edit"}{$faq.id}{/if}" method="post" enctype="multipart/form-data">
    <table>
        <tr class="pem">
            <td width="200" >Вопрос</td>
            <td><input name="data[question]" value="{$faq.question}" /></td>
        </tr>
        <tr class="pem">
            <td>Ответ</td>
            <td><textarea name="data[answer]">{$faq.answer}</textarea></td>
        </tr>
        <tr class="pem">
            <td>Родительский элемент</td>
            <td><select name="data[parrent_id]">
                    <option value="0" {if isset($faq.parent_id) && $faq.parent_id==0}selected="selected"{/if}>корень</option>
                    {foreach from=$folder_list item=folder}
                    <option value="{$folder.id}" {if isset($faq.parent_id) && $faq.parent_id==$folder.id}selected="selected"{/if}>{$folder.question}</option>
                    {/foreach}
                </select></td>
        </tr>
        <tr class="pem">
            <td>Жизненные ситуации</td>
            <td><input type="checkbox" name="data[is_situation]" {if isset($faq.is_situation) && $faq.is_situation}checked="checked"{/if} style="width: 14px;" /></td>
        </tr>
    </table>
    <input type="hidden" name="data[is_folder]" value="0" />
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{elseif $action=="add_folder" || $action=="edit_folder"}

<form action="?page={$page}&action={$action}&id={if $action=="edit_folder"}{$faq.id}{/if}" method="post" enctype="multipart/form-data">
    <table>
        <tr class="pem">
            <td width="200">Название</td>
            <td><input name="data[question]" value="{$faq.question}" /></td>
        </tr>
        <tr class="pem">
            <td>Родительский элемент</td>
            <td><select name="data[parrent_id]">
                    <option value="0" {if isset($faq.parent_id) && $faq.parent_id==0}selected="selected"{/if}>корень</option>
                    {foreach from=$folder_list item=folder}
                    <option value="{$folder.id}" {if isset($faq.parent_id) && $faq.parent_id==$folder.id}selected="selected"{/if}>{$folder.question}</option>
                    {/foreach}
                </select></td>
        </tr>
    </table>
    <input type="hidden" name="data[answer]" value="" />
    <input type="hidden" name="data[is_folder]" value="1" />
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add_folder">ДОБАВИТЬ ПАПКУ</a> / <a href="?page={$page}&action=add">ДОБАВИТЬ ДОКУМЕНТ</a>
</td>
</table>
{if isset($path_to_faq)}
<div>
    <a href="?page={$page}"><< Назад</a> 
{section name=path_doc loop=count($path_to_faq) step=-1}
    <a href="?page={$page}&root={$path_to_faq[path_doc].id}">{$path_to_faq[path_doc].question}</a>{if !$smarty.section.path_doc.last} / {/if}
{/section}    
</div><br />
{/if}

{if $faq_list!==false}
<table width="100%" cellpadding="5" cellspacing="2" style="font-size: 14px">
    <tr>
       <td class="pum">Вопрос</td>
       <td class="pum">Ответ</td>
       <td class="pum">Тип</td>
       <td>&nbsp;</td>
    </tr>
{foreach from=$faq_list item=faq}
    <tr>
        <td class="pem">{if $faq.is_folder==1}<a href="?page={$page}&root={$faq.id}">{$faq.question|truncate:100}</a>{else}{$faq.question|truncate:100}{/if}</td>
	<td class="pem">{$faq.answer|truncate:200}</td>
        <td class="pem">{if $faq.is_folder==1}папка{else}документ{/if}</td>    
        <td class="pom"><a href="?page={$page}&action={if $faq.is_folder==1}edit_folder{else}edit{/if}&id={$faq.id}">редактировать</a></td>
        <td class="pom">    <a href="?page={$page}&action={if $faq.is_folder==1}del_folder{else}del{/if}&id={$faq.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add_folder">ДОБАВИТЬ ПАПКУ</a> / <a href="?page={$page}&action=add">ДОБАВИТЬ ДОКУМЕНТ</a>
</td>
</table>

{/if}