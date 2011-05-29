{if $action=='view_news'}

<h1>Новости{if isset($news_category)}: {$news_category.title}{/if}</h1>

<div>{$news.date|date_format:"%d.%m.%Y"}&nbsp;{$news.title}</div><br />
<div>{$news.full_text}</div>

<br/><br/>

<div>Комментарии:</div><br />

{foreach from=$news_comment_list item="news_comment"}
<div>{$news_comment.date|date_format:"%d.%m.%Y"}&nbsp;{$news_comment.nickname}</div>
<div>{$news_comment.text}</div><br /><br />
{/foreach}

<div>Добавить комментарий:</div>
<form action="?page={$page}&action={$action}&id={$news.id}&category={$news.news_category_id}" method="post">
    <table width="100%">
        <tr>
            <td width="200">Имя</td>
            <td><input name="data[nickname]" value="" /></td>
        </tr>
        <tr>
            <td>Комментарий</td>
            <td><textarea name="data[text]"></textarea></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<br/><br/>
<a href="{$siteurl}?page=news" >Все новости</a>

{else}

<h1>Новости{if isset($news_category)}: {$news_category.title}{/if}</h1>

{if $page_info.page_count!=0}
<table>
    <tr>
        <td id="pager">Страница: 
        {section name=pager loop={$page_info.page_count} start=0}
        {if $smarty.section.pager.index==$cur_page}<b>{$smarty.section.pager.index+1}</b>{else}<a href={$siteurl}?page={$page}&action={$action}&pager={$smarty.section.pager.index}&category={$news.news_category_id} >{$smarty.section.pager.index+1}</a> {/if}
        {/section}   
        </td>
    </tr>
</table>
<br/>
{/if}

{foreach from=$news_list_full item=news}
<div>{$news.date|date_format:"%d.%m.%Y"}&nbsp;{$news.title}</div>
<div>{$news.short_text}</div>
{if $news.full_text}<a href="{$siteurl}?page=news&action=view_news&id={$news.id}&category={$news.news_category_id}">подробнее...</a><br/>{/if}
<br/>
{/foreach}

{if $page_info.page_count!=0}
<br/>
<table>
    <tr>
        <td id="pager">Страница: 
        {section name=pager loop={$page_info.page_count} start=0}
        {if $smarty.section.pager.index==$cur_page}<b>{$smarty.section.pager.index+1}</b>{else}<a href={$siteurl}?page={$page}&action={$action}&pager={$smarty.section.pager.index}&category={$news.news_category_id} >{$smarty.section.pager.index+1}</a> {/if}
        {/section}   
        </td>
    </tr>
</table>
{/if}

{/if}