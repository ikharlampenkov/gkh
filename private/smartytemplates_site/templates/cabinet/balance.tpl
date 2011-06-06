
<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Баланс платежей</div>
                                            <div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
{if $balance !== false}

<table cellpadding="10">
    <tr>
        <td class="pom" align="center"><b>Месяц</td>
        <td class="pom" align="center"><b>Баланс на начало месяца</td>
        <td class="pom" align="center"><b>Начислено</td>
        <td class="pom" align="center"><b>Оплачено</td>
        <td class="pom" align="center"><b>Баланс на конец месяца</td>
    </tr>
    {foreach from=$balance item=month}
    <tr>
        <td class="pem" align="center">{$month.date|date_format:"%m.%Y"}</td>
        <td class="pem" align="center">{$month.total_beginning_month}</td>
        <td class="pem" align="center">{$month.debt}</td>
        <td class="pem" align="center">{$month.payment}</td>
        <td class="pem" align="center">{$month.total_end_month}</td>
    </tr>
    {/foreach}
</table>
<br>
<div align="center" style="font-weight:bold; font-size: 16px">Итого {if $month.total_end_month>0}(долг){else}(переплата){/if}: {$month.total_end_month}</div>

{/if}