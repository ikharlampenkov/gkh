<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Документы</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>

{if $document != false}
<a href="?page={$page}"><< Назад</a>
<h4>{$document.title}</h4>
{/if}

<table width="100%" cellpadding="5" cellspacing="2">
{foreach from=$document_list item=document}

{if $document.is_folder}
<tr><td class="pem"><div><img src="/img/folder.png" /> <a href="?page={$page}&root={$document.id}">{$document.title}</a></div>
{else}
<tr><td class="peem"><div><img src="/img/page_word.png" /> <a href="{$siteurl}temp_files/{$document.file}" title="{$document.short_text}" target="_blank">{$document.title}</a></div>
{/if}
</td></tr>
{/foreach}
</table>