
<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">{$module_title}</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>

{if $action=="answer"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}&id={$tech_support_post.id}&category={$category}" method="post">
    <table>
        <tr class="pem">
            <td width="200">Дата вороса</td>
            <td>{$tech_support_post.date_question|date_format:"%d.%m.%Y %H:%M"}</td>
        </tr>
        <tr class="pem">
            <td width="200">Вопрос</td>
            <td>{$tech_support_post.question}</td>
        </tr>
        <tr class="pem">
            <td width="200">Ответ</td>
            <td><textarea name="data[answer]">{$tech_support_post.answer}</textarea></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{elseif $action=="question"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}&category={$category}" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>От кого</td>
            <td><select name="data[personal_account_id]">
                {foreach from=$pa_list item=pa}
                    <option value="{$pa.id}">{$pa.fio}</option>
                {/foreach}
                </select></td>
        </tr>
        <tr>
            <td width="200">Вопрос</td>
            <td><textarea name="data[question]"></textarea></td>
        </tr>
		<tr>
            <td width="200">Прикрепит файл</td>
            <td>
			<div id="file_list">
			<input type="file" name="qfile1" />
			</div>
			<input type="hidden" id="file_count" value="2" />
			<a href="#" onclick="addFile('file_list', 'file_count')">Прикрепить еще один файл</a>
			</td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{elseif $action==view_ticket}

<h2>{$ticket_title} № {$ticket.id} от {$pa_info.fio}</h2>
<div>{$ticket.title}</div>
<br />

{if $ticket.post_list}
<table>
{foreach from=$ticket.post_list item=post name=_post}
    <tr class="pem">
        <td style="background-color: #e0e0e0;">{$post.date_question|date_format:"%d.%m.%Y %H:%M"}<br />
                {$post.question}
                {if $post.file_list != false}
            <div>
                    {foreach from=$post.file_list item=file name=_file}
                <a href="{$siteurl}temp_support/{$file}" target="_blank">Файл {$smarty.foreach._file.iteration}</a><br />
                    {/foreach}
            </div>
                {/if}
        </td>
    </tr>
		{if $smarty.foreach._post.last}
    <tr class="pem">
        <td>
            <form action="?page={$page}&action={$action}&id={$ticket.id}&pa_id={$ticket.personal_account_id}&category={$category}" method="post">
		Ответ<br />
                <textarea name="data[answer]">{$post.answer}</textarea><br />

                Прикрепит файл<br />
                <div id="file_list">
                    <input type="file" name="qfile1" />
                </div>
                <input type="hidden" id="file_count" value="2" />
                <a href="#" onclick="addFile('file_list', 'file_count')">Прикрепить еще один файл</a><br /><br />
                
                Статус<br />
                <select name="data[tech_support_ticket_status_id]">
                    {foreach from=$ticket_status_list item=ticket_status}
                    <option value="{$ticket_status.id}" {if $ticket.ticket_status_id== $ticket_status.id}selected="selected"{/if}>{$ticket_status.title}</option>
                    {/foreach}
                </select><br /><br />

                <input name="data[id]" type="hidden" value="{$post.id}" />
                <input id="save" name="save" type="submit" value="Сохранить" />
            </form>
        </td>
    </tr>
		{else}
    <tr>
        <td>{$post.date_answer|date_format:"%d.%m.%Y %H:%M"}<br />
                {$post.answer}
            {if $post.answer_file_list != false}
            <div>
                    {foreach from=$post.answer_file_list item=file name=_file}
                <a href="{$siteurl}temp_support/{$file}" target="_blank">Файл {$smarty.foreach._file.iteration}</a><br />
                    {/foreach}
            </div>
                {/if}
        </td>
    </tr>
		{/if}
{/foreach}
</table>
{/if}

{elseif $action=="add_status" || $action=="edit_status"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if edit}&id={$ticket_status.id}{/if}&category={$category}" method="post">
    <table>
        <tr>
            <td width="200">Название</td>
            <td><input name="data[title]" value="{$ticket_status.title}" /></td>
        </tr>
        <tr>
            <td width="200">Рейтинг</td>
            <td><input name="data[rating]" value="{$ticket_status.rating}" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}



<h4>{$module_title}</h4>

{if $ticket_list!==false}
<table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
    <tr>
       <td class="pum">Номер</td>
       <td class="pum">Дата</td>
       <td class="pum">От кого</td>
       <td class="pum">Заголовок</td>
       <td class="pum">Состояние</td>
       <td class="pum">&nbsp;</td>
    </tr>
{foreach from=$ticket_list item=ticket}
    <tr>
        <td class="pem">{$ticket.id}</td>
        <td class="pem">{$ticket.date|date_format:"%d.%m.%Y %H:%M"}</td>
	<td class="pem">{$ticket.fio}</td>
        <td class="pem">{$ticket.title|strip_tags:false|truncate:30:""}</td>
        <td class="pem">{$ticket.status}</td>
        <td class="pom"><a href="?page={$page}&action=view_ticket&id={$ticket.id}&pa_id={$ticket.personal_account_id}&category={$category}">открыть</a><br /> </td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=question&category={$category}">{$action_title}</a>
<hr width="100%" size="1" />

<h4>Статусы заявок</h4>

{if $ticket_status_list!==false}
<table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
{foreach from=$ticket_status_list item=ticket_status}
    <tr class="pem">
        <td>{$ticket_status.title}</td>
        <td>{$ticket_status.rating}</td>
        <td class="pom"><a href="?page={$page}&action=edit_status&id={$ticket_status.id}&category={$category}">редактировать</a><br />
            <a href="?page={$page}&action=del_status&id={$ticket_status.id}&category={$category}">удалить</a> </td>
    </tr>
{/foreach}
</table>
{/if}

<a href="?page={$page}&action=add_status&category={$category}">добавить статус заявки</a>

{/if}