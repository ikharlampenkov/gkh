<h1>Вопросы и ответы</h1>

{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}&id={if $action=="edit"}{$faq.id}{/if}" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="200">Вопрос</td>
            <td><input name="data[question]" value="{$faq.question}" /></td>
        </tr>
        <tr>
            <td >Ответ</td>
            <td><textarea name="data[answer]">{$faq.answer}</textarea></td>
        </tr>
        <tr>
            <td>Родительский элемент</td>
            <td><select name="data[parrent_id]">
                    <option value="0" {if isset($faq.parent_id) && $faq.parent_id==0}selected="selected"{/if}>корень</option>
                    {foreach from=$folder_list item=folder}
                    <option value="{$folder.id}" {if isset($faq.parent_id) && $faq.parent_id==$folder.id}selected="selected"{/if}>{$folder.question}</option>
                    {/foreach}
                </select></td>
        </tr>
    </table>
    <input type="hidden" name="data[is_folder]" value="0" />
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{elseif $action=="add_folder" || $action=="edit_folder"}

<form action="?page={$page}&action={$action}&id={if $action=="edit"}{$faq.id}{/if}" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="200">Название</td>
            <td><input name="data[question]" value="{$faq.question}" /></td>
        </tr>
        <tr>
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

{if isset($path_to_faq)}
<div>
    <a href="?page={$page}">..</a> / 
{section name=path_doc loop=count($path_to_faq) step=-1}
    <a href="?page={$page}&root={$path_to_faq[path_doc].id}">{$path_to_faq[path_doc].question}</a>{if !$smarty.section.path_doc.last} / {/if}
{/section}    
</div><br />
{/if}

{if $faq_list!==false}
<table>
    <tr>
       <td>Вопрос</td>
       <td>Ответ</td>
       <td>Тип</td>
       <td>&nbsp;</td>
    </tr>
{foreach from=$faq_list item=faq}
    <tr>
        <td>{if $faq.is_folder==1}<a href="?page={$page}&root={$faq.id}">{$faq.question|truncate:100}</a>{else}{$faq.question|truncate:100}{/if}</td>
	<td>{$faq.answer|truncate:200}</td>
        <td>{if $faq.is_folder==1}папка{else}документ{/if}</td>    
        <td><a href="?page={$page}&action={if $faq.is_folder==1}edit_folder{else}edit{/if}&id={$faq.id}">редактировать</a><br />
            <a href="?page={$page}&action={if $faq.is_folder==1}del_folder{else}del{/if}&id={$faq.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=add_folder">Добавить папку</a><br />
<a href="?page={$page}&action=add">Добавить документ</a>

{/if}