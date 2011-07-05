<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Новости</div>
                                            <div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>


{if $action=="add_category" || $action=="edit_category"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if edit}&id={$news_category.id}{/if}" method="post">
    <table>
        <tr>
            <td width="200">Название</td>
            <td><input name="data[title]" value="{$news_category.title}" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{elseif $action=="add_news" || $action=="edit_news"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if edit}&id={$news.id}{/if}" method="post">
    <table cellpadding="5"  border="0">
        <tr>
            <td width="200">Название</td>
            <td><input name="data[title]" value="{$news.title}" /></td>
        </tr>
        <tr>
            <td width="200">Категория</td>
            <td><select name="data[news_category_id]">
                {foreach from=$news_category_list item=news_category}
                    <option value="{$news_category.id}" {if isset($news) && $news.news_category_id==$news_category.id}selected="selected"{/if}>{$news_category.title}</option>
                {/foreach}    
                </select>
            </td>
        </tr>
        <tr>
            <td width="200">Дата</td>
            <td><input name="data[date]" value="{if isset($news.date)}{$news.date|date_format:"%d.%m.%Y"}{else}{$smarty.now|date_format:"%d.%m.%Y"}{/if}" /></td>
        </tr>
        <tr>
            <td width="200">Анонс</td>
            <td><textarea name="data[short_text]">{$news.short_text}</textarea></td>
        </tr>
        <tr>
            <td width="200">Текст новости</td>
            <td><textarea name="data[full_text]">{$news.full_text}</textarea></td>
        </tr>
        <tr>
            <td>Важная информация</td>
            <td><input type="checkbox" name="data[is_impotant]" {if isset($news.is_impotant) && $news.is_impotant}checked="checked"{/if} style="width: 14px;" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{elseif $action=="show_comment"}

<div>{$news.date|date_format:"%d.%m.%Y"}&nbsp;{$news.title}</div><br />

{if $news_comment_list!==false}
    
    <h4>Комментарии</h4>
    
<table>
{foreach from=$news_comment_list item=news_comment}
    <tr>
        <td>{$news_comment.date|date_format:"%d.%m.%Y"}</td>
        <td>{$news_comment.nickname}</td>
        <td>{$news_comment.text|truncate:100}</td>
        <td><a href="?page={$page}&action=edit_news_comment&id={$news_comment.id}&news_id={$news.id}">редактировать</a><br />
            <a href="?page={$page}&action=del_news_comment&id={$news_comment.id}&news_id={$news.id}">удалить</a> </td>
    </tr>
{/foreach}
</table>
{else}
    <div>Для данной новости нет комментариев</div>
{/if}

{elseif $action=="edit_news_comment"}

<h2>{$txt}{$news.title}</h2>

<form action="?page={$page}&action=edit_news_comment&id={$news_comment.id}&news_id={$news.id}" method="post">
    <table>
        <tr>
            <td width="200">Дата</td>
            <td><input name="data[date]" value="{$news_comment.date|date_format:"%d.%m.%Y"}" /></td>
        </tr>
        <tr>
            <td width="200">Имя</td>
            <td><input name="data[nickname]" value="{$news_comment.nickname}" /></td>
        </tr>
        <tr>
            <td width="200">Комментарий</td>
            <td><textarea name="data[text]">{$news_comment.text}</textarea></td>
        </tr>
        <tr>
            <td>Модерировать</td>
            <td><input type="checkbox" name="data[is_moderated]" {if $news_comment.is_moderated}checked="checked"{/if} style="width: 14px;" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}

{if $news_list!==false}
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add_news">ДОБАВИТЬ НОВОСТЬ</a>
</td>
</table>

{if $page_info.page_count>1}
<table>
    <tr>
        <td id="pager">Страница: 
        {section name=pager loop={$page_info.page_count} start=0}
        {if $smarty.section.pager.index==$cur_page}<b>{$smarty.section.pager.index+1}</b>{else}<a href={$siteurl}?page={$page}&action={$action}&pager={$smarty.section.pager.index} >{$smarty.section.pager.index+1}</a> {/if}
        {/section}   
        </td>
    </tr>
</table>
{/if}

<table cellpadding="5" border="0" style="font-size:14px;">
    <tr>
        <td class="pum">Дата</td>
        <td class="pum">Заголовок</td>
        <td class="pum">Категория</td>
        <td class="pum">Анонс</td>
        <td class="pum">Важная информация</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
{foreach from=$news_list item=news}
    <tr>
        <td class="pom">{$news.date|date_format:"%d.%m.%Y"}</td>
        <td class="pem">{$news.title}</td>
        <td class="pem">{$news.category_title}</td>
        <td class="pem">{$news.short_text|strip_tags:false|truncate:50}</td>
        <td class="pem">{if $news.is_impotant==1}Да{else}Нет{/if}</td>
        <td class="pom"><a href="?page={$page}&action=show_comment&id={$news.id}">просмотреть комментарии</a></td>
        <td class="pom"><a href="?page={$page}&action=edit_news&id={$news.id}">редактировать</a></td>
        <td class="pom"><a href="?page={$page}&action=del_news&id={$news.id}">удалить</a> </td>
    </tr>
{/foreach}
</table>

{if $page_info.page_count>1}
<table>
    <tr>
        <td id="pager">Страница: 
        {section name=pager loop={$page_info.page_count} start=0}
        {if $smarty.section.pager.index==$cur_page}<b>{$smarty.section.pager.index+1}</b>{else}<a href={$siteurl}?page={$page}&action={$action}&pager={$smarty.section.pager.index} >{$smarty.section.pager.index+1}</a> {/if}
        {/section}   
        </td>
    </tr>
</table>
<br/>
{/if}

{/if}
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add_news">ДОБАВИТЬ НОВОСТЬ</a>
</td>
</table>

<hr width="100%" size="1" />

<h2>Категории новостей</h2>
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add_category">ДОБАВИТЬ КАТЕГОРИЮ</a>
</td>
</table>

{if $news_category_list!==false}
<table cellpadding="5" style="font-size:14px;">
{foreach from=$news_category_list item=news_category}
    <tr>
        <td class="pem">{$news_category.title}</td>
        <td class="pom"><a href="?page={$page}&action=edit_category&id={$news_category.id}">редактировать</a></td>
        <td class="pom">    <a href="?page={$page}&action=del_category&id={$news_category.id}">удалить</a> </td>
    </tr>
{/foreach}
</table>
{/if}
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page={$page}&action=add_category">ДОБАВИТЬ КАТЕГОРИЮ</a>
</td>
</table>

<br>
{/if}