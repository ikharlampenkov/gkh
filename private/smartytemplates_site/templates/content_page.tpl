
<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">{$conpage.title}</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>


{if !empty($conpage.description)}
<div>{$conpage.description}</div><br/><br/>
{/if}

<div>{$conpage.content}</div>

{if isset($conpage.file_list) && $conpage.file_list !== false}
{foreach from=$conpage.file_list item=file name=_file}
<a href="{$siteurl}temp_files/{$file}" target="_blank">Файл {$smarty.foreach._file.iteration}</a><br /><br /> 
{/foreach}
{/if}