<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Лицевые счета</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if edit}&id={$pa.id}{/if}" method="post">
    <table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
        <tr class="pem">
            <td width="200">ФИО</td>
            <td><input name="data[fio]" value="{$pa.fio}" /></td>
        </tr>
        <tr class="pem">
            <td>Дом</td>
            <td><select name="data[house_id]">
                {foreach from=$house_list item=house}
                    <option value="{$house.id}" {if isset($pa.house_id) && $pa.house_id==$house.id}selected="selected"{/if}>{$house.street}, {$house.number}{$house.subnumber}</option>
                {/foreach}
                </select>
            </td>
        </tr>
        <tr class="pem">
            <td>Квартира</td>
            <td><input name="data[apartment]" value="{$pa.apartment}" /></td>
        </tr>
        <tr class="pem">
            <td>Пароль</td>
            <td><input name="data[password]" value="{$pa.password}" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{elseif $action=="meters"}

<h2>Счетчики для л/с {$pa.id}</h2>

<form action="?page={$page}&action={$action}&id={$pa.id}" method="post">
    <table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">   
{foreach from=$meters_list item=meter}
        <tr class="pem">
            <td>{$meter.title}</td>
            <td><input type="checkbox" name=data[meters][{$meter.id}] {if in_array($meter.id, $pa_meters)}checked="checked"{/if} /></td>
        </tr>
{/foreach}
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>
{else}

{if $pa_list!==false}
<table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
    <tr>
        <td class="pum">Счет</td>
        <td class="pum">ФИО</td>
        <td class="pum">Адрес</td>
        <td class="pum">&nbsp;</td>
    </tr>
{foreach from=$pa_list item=pa}
    <tr>
        <td class="pem">{$pa.id}</td>
        <td class="pem">{$pa.fio}</td>
        <td class="pem">{$pa.fio}</td>
        <td class="pom"><a href="?page={$page}&action=meters&id={$pa.id}">счетчики</a><br />
            <a href="?page={$page}&action=edit&id={$pa.id}">редактировать</a><br />
            <a href="?page={$page}&action=del&id={$pa.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=add">Добавить лицевой счет</a>

{/if}