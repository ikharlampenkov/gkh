<h1>Баланс платежей</h1>

{if $balance !== false}

<table>
    <tr>
        <td>Месяц</td>
        <td>Баланс на начало месяца</td>
        <td>Начислено</td>
        <td>Оплачено</td>
        <td>Баланс на конец месяца</td>
    </tr>
    {foreach from=$balance item=month}
    <tr>
        <td>{$month.date|date_format:"%m.%Y"}</td>
        <td>{$month.total_beginning_month}</td>
        <td>{$month.debt}</td>
        <td>{$month.payment}</td>
        <td>{$month.total_end_month}</td>
    </tr>
    {/foreach}
    <tr>
        <td colspan="4">Итого:</td>
        <td>{$month.total_end_month}</td>
    </tr>
</table>

{/if}