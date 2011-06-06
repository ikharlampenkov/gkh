
<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Показания счетчиков</div>
                                            <div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
{if $meters !== false}

<form action="?page={$page}" method="post">
    <table cellpadding="10">
        <tr>
            <td width="200" class="pom" align="center">Счетчик</td>
            <td class="pom" align="center">Показания (предыдущее/текущее значение)</td>
        </tr>
        {foreach from=$meters item=meter}
        <tr>
            <td width="200" class="pem" align="center">{$meter.title}</td>
            <td class="pem" align="center">{$meter.prev_value.value}/&nbsp; <input type="text" name="data[{$meter.id}][value]" value="{$meter.cur_value.value}" style="width: 60px;" />
                <input type="hidden" name="data[{$meter.id}][date]" value="{$meter.cur_value.date}" /></td>
        </tr>
        {/foreach}
    </table>
    <br>
    <div align="center">
    <input id="save" name="save" type="submit" value="Сохранить" style="font-size: 14px;"/></div>
</form>

{else}
У Вас нет счетчиков
{/if}