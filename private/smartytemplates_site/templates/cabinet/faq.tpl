<h1>{if isset($is_situation) && $is_situation==1}Жизненные ситуации{else}Вопрос-ответ{/if}</h1>

{if isset($path_to_faq)}
<div>
    <a href="?page={$page}">..</a> / 
{section name=path_doc loop=count($path_to_faq) step=-1 max=count($path_to_faq)-1}
    <a href="?page={$page}&root={$path_to_faq[path_doc].id}">{$path_to_faq[path_doc].question}</a>{if !$smarty.section.path_doc.last} / {/if}
{/section}    
</div><br />
{/if}


{if isset($faq) && $faq != false}
<h4>{$faq.question}</h4>
{/if}


{foreach from=$faq_list item=faq}

{if $faq.is_folder}
<div><img src="/img/folder.png" /> <a href="?page={$page}&root={$faq.id}">{$faq.question}</a></div>
{else}
<div>{*<img src="/img/page_word.png" /> *}<a href="javascript:showAnswer({$faq.id});">{$faq.question}</a></div>
<div id="question_{$faq.id}" style="display:none;">{$faq.answer|nl2br}</div>
{/if}
<br/>
{/foreach}