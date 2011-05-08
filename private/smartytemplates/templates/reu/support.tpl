<h1>Техническая поддержка</h1>


{if $action=="question"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}" method="post" enctype="multipart/form-data">
    <table>
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

<h2>Вопрос № {$ticket.id}</h2>
<div>{$ticket.title}</div>
<br />

{if $ticket.post_list}
<table>
{foreach from=$ticket.post_list item=post}
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
{/foreach}
</table>
{/if}

<h4>Задать вопрос</h4>

<form action="?page={$page}&action={$action}&id={$ticket.id}" method="post" enctype="multipart/form-data">
    <table>
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

{else}

<form action="?page={$page}" method="post" >
    <table>
        <tr>
            <td width="185">E-mail для тех. поддержки</td>
            <td><input name="data[email]" value="{$reu_info.email}" /> </td>
        </tr> 
    </table>
    <input name="save" type="submit" value="Изменить e-mail" style="width: 150px;" />
</form> 
<br />

{if $ticket_list!==false}
<table>
{foreach from=$ticket_list item=ticket}
    <tr style="background-color: {if $ticket.is_complete}#ccffcc{else}#ffd2ba{/if}" >
        <td>{$ticket.date|date_format:"%d.%m.%Y %H:%M"}</td>
        <td>{$ticket.title|strip_tags:false|truncate:30:""}</td>
        <td><a href="?page={$page}&action=view_ticket&id={$ticket.id}">просмотреть</a><br /> </td>
    </tr>
{/foreach}
</table>
{/if}

<a href="?page={$page}&action=question">Задать вопрос</a>

{/if}