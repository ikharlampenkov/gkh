<h1>Техническая поддержка</h1>


{if $action=="answer"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}&id={$tech_support_post.id}" method="post">
    <table>
        <tr>
            <td width="200">Дата вороса</td>
            <td>{$tech_support_post.date_question|date_format:"%d.%m.%Y %H:%M"}</td>
        </tr>
        <tr>
            <td width="200">Вопрос</td>
            <td>{$tech_support_post.question}</td>
        </tr>
        <tr>
            <td width="200">Ответ</td>
            <td><textarea name="data[answer]">{$tech_support_post.answer}</textarea></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{elseif $action=="question"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>РЭУ</td>
            <td><select name="data[reu_id]">
                {foreach from=$reu_list item=reu}
                    <option value="{$reu.id}">{$reu.title}</option>
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

<h2>Вопрос № {$ticket.id} от {$reu_info.title}</h2>
<div>{$ticket.title}</div>
<br />

<div><b>Контакты:</b> {$reu_info.contact_info_admin} </div><br />

{if $ticket.post_list}
<table>
{foreach from=$ticket.post_list item=post name=_post}
    <tr>
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
    <tr>
        <td>
            <form action="?page={$page}&action={$action}&id={$ticket.id}&reu_id={$ticket.reu_id}" method="post">
		Ответ<br />
                <textarea name="data[answer]">{$post.answer}</textarea>

                Прикрепит файл<br />
                <div id="file_list">
                    <input type="file" name="qfile1" />
                </div>
                <input type="hidden" id="file_count" value="2" />
                <a href="#" onclick="addFile('file_list', 'file_count')">Прикрепить еще один файл</a><br /><br />

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

<form action="?page={$page}&action={$action}{if edit}&id={$ticket_status.id}{/if}" method="post">
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

<h4>Статусы заявок</h4>

{if $ticket_status_list!==false}
<table>
{foreach from=$ticket_status_list item=ticket_status}
    <tr>
        <td>{$ticket_status.title}</td>
        <td>{$ticket_status.rating}</td>
        <td><a href="?page={$page}&action=edit_status&id={$ticket_status.id}">редактировать</a><br />
            <a href="?page={$page}&action=del_status&id={$ticket_status.id}">удалить</a> </td>
    </tr>
{/foreach}
</table>
{/if}

<a href="?page={$page}&action=add_status">добавить статус заявки</a>

<hr width="100%" size="1" />

<h4>Заявки</h4>

{if $ticket_list!==false}
<table>
{foreach from=$ticket_list item=ticket}
    <tr style="background-color: {if $ticket.is_complete}#ccffcc{else}#ffd2ba{/if}">
        <td>{$ticket.date|date_format:"%d.%m.%Y %H:%M"}</td>
		<td>{$ticket.reu_title}</td>
        <td>{$ticket.title|strip_tags:false|truncate:30:""}</td>
        <td><a href="?page={$page}&action=view_ticket&id={$ticket.id}&reu_id={$ticket.reu_id}">ответить</a><br /> </td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=question">Задать вопрос</a>

{/if}