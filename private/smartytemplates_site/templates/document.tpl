<h1>Документы</h1>

{if isset($path_to_document)}
<div>
    <a href="?page={$page}">..</a> / 
{section name=path_doc loop=count($path_to_document) step=-1 max=count($path_to_document)-1}
    <a href="?page={$page}&root={$path_to_document[path_doc].id}">{$path_to_document[path_doc].title}</a>{if !$smarty.section.path_doc.last} / {/if}
{/section}    
</div><br />
{/if}


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