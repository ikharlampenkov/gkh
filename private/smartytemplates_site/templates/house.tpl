<h1>Дома</h1>

<br/>
<div><b>1 шаг</b> Выберите улицу. <b>2 шаг.</b> Скачайте нужный документ</div><br/><br/>

{if $action == "view"}

<h4>Дом </h4>

<div>
    {if !empty($house.file_repair_plan)}
    <a href="{$siteurl}temp_files/{$house.file_repair_plan}" target="_blank">План работ по содержанию и ремонту</a><br /><br />
    {/if}
    
     
    
    
</div>


{else}

{foreach from=$house_list item=street name=_house_list}
<div>
    <span><a href="javascript:showHouse({$smarty.foreach._house_list.index})">{$street.street}</a></span>
</div>
<div id="house_{$smarty.foreach._house_list.index}" style="display: none;">
    <table>
        <tr>
            <td>Номер</td>
            <td>Буква</td>
            <td>Площадь</td>
            {if $category=='all' || $category=='plan'}
            <td>План работ по содержанию и ремонту</td>
            {/if}
            {if $category=='all'}
            <td>Доходы и расходы</td>
            {/if}
            {if $category=='all' || $category!='plan'}
            <td>Выполненные работы</td>
            {/if}
        </tr>
{foreach from=$street.houses item=house}
        <tr>
            <td>{$house.number}</td>
            <td>{$house.subnumber}</td>
            <td>{$house.area}</td>
            
            {if $category=='all' || $category=='plan'}
            <td>
            {if !empty($house.file_repair_plan)}
            <a href="{$siteurl}temp_files/{$house.file_repair_plan}" target="_blank">Скачать</a>
            {/if}
            </td>
            {/if}
            
            {if $category=='all'}
            <td>
            {if !empty($house.file_costs_income)}
            <a href="{$siteurl}temp_files/{$house.file_costs_income}" target="_blank">Скачать</a>
            {/if}
            </td>
            {/if}
            
            {if $category=='all' || $category!='plan'}
            <td>
            {if !empty($house.file_performed_repair)}
            <a href="{$siteurl}temp_files/{$house.file_performed_repair}">Скачать</a>
            {/if}
            </td>
            {/if}
        </tr>
{/foreach}
    </table>
</div>
{/foreach}

{/if}