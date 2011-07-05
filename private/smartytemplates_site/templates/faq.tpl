
<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">{if isset($is_situation) && $is_situation==1}Жизненные ситуации{else}Вопрос-ответ{/if}</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>


<table width="100%" cellpadding="5" cellspacing="2">
{if isset($path_to_faq)}
<tr><td class="pim"><a href="?page={$page}"><< Назад</a> 
{section name=path_doc loop=count($path_to_faq) step=-1 max=count($path_to_faq)-1}
    <a href="?page={$page}&root={$path_to_faq[path_doc].id}">{$path_to_faq[path_doc].question}</a>{if !$smarty.section.path_doc.last} / {/if}
{/section}    
</td></tr>
{/if}


{if isset($faq) && $faq != false}
<tr><td class="pem"><b>{$faq.question}</b></td></tr>
{/if}

{foreach from=$faq_list item=faq}
{if $faq.is_folder}
<tr><td class="pem"><img src="/img/folder.png" /> <a href="?page={$page}&root={$faq.id}">{$faq.question}</a>
{else}
<tr><td class="pem">{*<img src="/img/page_word.png" /> *}<a href="javascript:showAnswer({$faq.id});">{$faq.question}</a></div>
<div id="question_{$faq.id}" style="display:none;background-color: #ffffff;padding:10px;">{$faq.answer|nl2br}</div>
{/if}
{/foreach}
</table>