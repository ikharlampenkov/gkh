<h1>Дома</h1>

{if $action == "view"}

<h4>Дом </h4>

<div>
    {if !empty($house.file_repair_plan)}
    <a href="{$siteurl}temp_files/{$house.file_repair_plan}" target="_blank">План работ по содержанию и ремонту</a><br /><br />
    {/if}
    
    {if !empty($house.file_costs_income)}
    <a href="{$siteurl}temp_files/{$house.file_costs_income}" target="_blank">Доходы и расходы</a><br /><br />
    {/if} 
    
    {if !empty($house.file_performed_repair)}
    <a href="{$siteurl}temp_files/{$house.file_performed_repair}">Выполненные работы</a><br /><br />
    {/if}
</div>

<a href="?page={$page}" >Весь список</a>

{else}

{foreach from=$house_list item=street name=_house_list}
<div>
    <span>{$street.street}</span>&nbsp;<span><a href="javascript:showHouse({$smarty.foreach._house_list.index})">дома</a></span>
</div>
<div id="house_{$smarty.foreach._house_list.index}" style="display: none;">
{foreach from=$street.houses item=house}
    <div><a href="?page={$page}&action=view&id={$house.id}">{$house.number}{$house.subnumber}</a></div>
{/foreach}
</div>
{/foreach}

{/if}