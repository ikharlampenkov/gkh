<h1>Документы</h1>

{if $document != false}
<h4>{$document.title}</h4>
{/if}


{foreach from=$document_list item=document}

{if $document.is_folder}
<div><a href="?page={$page}&root={$document.id}">{$document.title}</a></div>
{else}
<div><a href="{$siteurl}temp_files/{$document.file}" title="{$document.short_text}" target="_blank">{$document.title}</a></div>
{/if}
{/foreach}