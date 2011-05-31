<h1>Электронная квитанция</h1>



{*<div><span>Плательщик:</span>&nbsp;<span>{$account_info.fio}</span></div>*}
<div><span>Лицевой счет №:</span>&nbsp;<span>{$account_info.id}</span></div>
<div><span>Адрес:</span>&nbsp;<span>{$house.street} д.{$house.number}{$house.subnumber} кв.{$account_info.apartment}</span></div>

<table>
    <tr>
        <td>Наименование операции</td>
        <td>Дата</td>
        <td>Оплата</td>
    </tr>

    {foreach from=$meters item=meter}
    <tr>
        <td>{$meter.title}</td>
        <td>{$date|date_format:"%m/%Y"}</td>
        <td>{$meter.diff}{$meter.unit}={$meter.sum}</td>
    </tr>
    {/foreach}
    
    <tr>
        <td>{$gku.title}</td>
        <td>{$date|date_format:"%m/%Y"}</td>
        <td>{$gku.sum}</td>
    </tr>
    
    <tr>
        <td>Итого</td>
        <td>&nbsp;</td>
        <td>{$itogo}</td>
    </tr>
    
</table>

{if $action!='print'}
<br/><br/>
<a href="?page={$page}&action=print" target="_blank">Распечатать</a>
{/if}