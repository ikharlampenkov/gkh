<h1>Показания счетчиков</h1>

{if $meters !== false}

<form action="?page={$page}" method="post">
    <table>
        <tr>
            <td width="200">Счетчик</td>
            <td>Показания (предыдущее/текущее значение)</td>
        </tr>
        {foreach from=$meters item=meter}
        <tr>
            <td width="200">{$meter.title}</td>
            <td>{$meter.prev_value.value}/&nbsp; <input type="text" name="data[{$meter.id}][value]" value="{$meter.cur_value.value}" style="width: 60px;" />
                <input type="hidden" name="data[{$meter.id}][date]" value="{$meter.cur_value.date}" /></td>
        </tr>
        {/foreach}
    </table>
    
    
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}
У Вас нет счетчиков
{/if}