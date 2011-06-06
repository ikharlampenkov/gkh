<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">{$module_title}</div>
                                            <div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>


{if $action=="question"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}&category={$category}" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="200" class="pom" align="center">Вопрос</td>
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

<h2>{$ticket_title} № {$ticket.id}</h2>
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

<h4>{$action_title}</h4>

<form action="?page={$page}&action={$action}&id={$ticket.id}&category={$category}" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="200" class="pom" align="center">Вопрос</td>
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

{if $ticket_list!==false}
<table cellpadding="10">
   <tr>
       <td  class="pom" align="center"><b>Номер</td>
       <td class="pom" align="center"><b>Дата</td>
       <td class="pom" align="center"><b>Заголовок</td>
       <td class="pom" align="center"><b>Состояние</td>
       <td class="pom" align="center"><b>&nbsp;</td>
    </tr> 
{foreach from=$ticket_list item=ticket}
    <tr>
        <td  class="pem" align="center">{$ticket.id}</td>
        <td  class="pem" align="center">{$ticket.date|date_format:"%d.%m.%Y %H:%M"}</td>
        <td  class="pem" align="center">{$ticket.title|strip_tags:false|truncate:30:""}</td>
        <td  class="pem" align="center">{$ticket.status}</td>
        <td  class="pem" align="center"><a href="?page={$page}&action=view_ticket&id={$ticket.id}&category={$category}">просмотреть</a><br /> </td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=question&category={$category}">{$action_title}</a>

{/if}	 	 		 