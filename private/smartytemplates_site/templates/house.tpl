<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Ваш дом</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>

<br/>
<div>Выберите улицу:</div><br/><br/>

{if $action == "view"}

<h4>Дом </h4>


    {if !empty($house.file_repair_plan)}
    <a href="{$siteurl}temp_files/{$house.file_repair_plan}" target="_blank">План работ по содержанию и ремонту</a><br /><br />
    {/if}



{else}

<table width="100%" cellpadding="5" cellspacing="2">
    <tr valign="top">
{foreach from=$house_list item=street name=_house_list}
        <td class="pem" style="font-size:14px" width="33%">
            <span><a href="javascript:showHouse({$smarty.foreach._house_list.index})">{$street.street}</a></span>
            <div id="house_{$smarty.foreach._house_list.index}" style="display: none;">
                <table border="0" width="100%" cellspacing="2">
                    <tr>
                        <td class="pim" align="center" style="color:#aaaaaa">Дом</td>
                        <td class="pim" align="center" style="color:#aaaaaa">Площадь</td>

            {if $category=='all' || $category=='plan'}
            <td class="pim" align="center" style="color:#aaaaaa">План работ по содержанию и ремонту</td>
            {/if}
            {if $category=='all'}
            <td class="pim" align="center" style="color:#aaaaaa">Доходы и расходы</td>
            {/if}
            {if $category=='all' || $category!='plan'}
            <td class="pim" align="center" style="color:#aaaaaa">Выполненные работы</td>
            {/if}

                    </tr>
{foreach from=$street.houses item=house}
                    <tr>
                        <td class="pim" align="center">{$house.number}{$house.subnumber}</td>
                        <td class="pim" align="center">{$house.area}</td>


            {if $category=='all' || $category=='plan'}
            <td class="pim" align="center">
            {if !empty($house.file_repair_plan)}
            <a href="{$siteurl}temp_files/{$house.file_repair_plan}" target="_blank">Скачать</a>
            {/if}
            </td>
            {/if}

            {if $category=='all'}
            <td class="pim" align="center">
            {if !empty($house.file_costs_income)}
            <a href="{$siteurl}temp_files/{$house.file_costs_income}" target="_blank">Скачать</a>
            {/if}
            </td>
            {/if}

            {if $category=='all' || $category!='plan'}
            <td class="pim" align="center">
            {if !empty($house.file_performed_repair)}
            <a href="{$siteurl}temp_files/{$house.file_performed_repair}">Скачать</a>
            {/if}
            </td>
            {/if}

                    </tr>
{/foreach}
                </table>
            </div>
        </td>
        {if $smarty.foreach._house_list.iteration%3==0}</tr><tr valign="top">{/if}
{/foreach}
    </tr>
</table>

{/if}