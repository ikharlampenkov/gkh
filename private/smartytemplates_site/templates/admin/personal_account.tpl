<h1>Лицевые счета</h1>

{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if edit}&id={$pa.id}{/if}" method="post">
    <table>
        <tr>
            <td width="200">ФИО</td>
            <td><input name="data[fio]" value="{$pa.fio}" /></td>
        </tr>
        <tr>
            <td>Дом</td>
            <td><select name="data[house_id]">
                {foreach from=$house_list item=house}
                    <option value="{$house.id}" {if isset($pa.house_id) && $pa.house_id==$house.id}selected="selected"{/if}>{$house.street}, {$house.number}{$house.subnumber}</option>
                {/foreach}
                </select>
            </td>
        </tr>
        <tr>
            <td>Квартира</td>
            <td><input name="data[apartment]" value="{$pa.apartment}" /></td>
        </tr>
        <tr>
            <td>Пароль</td>
            <td><input name="data[password]" value="{$pa.password}" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{elseif $action=="meters"}

<h2>Счетчики для л/с {$pa.id}</h2>

<form action="?page={$page}&action={$action}&id={$pa.id}" method="post">
    <table>    
{foreach from=$meters_list item=meter}
        <tr>
            <td>{$meter.title}</td>
            <td><input type="checkbox" name=data[meters][{$meter.id}] {if in_array($meter.id, $pa_meters)}checked="checked"{/if} /></td>
        </tr>
{/foreach}
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>
{else}

{if $pa_list!==false}
<table>
    <tr>
        <td>Счет</td>
        <td>ФИО</td>
        <td>Адрес</td>
        <td>&nbsp;</td>
    </tr>
{foreach from=$pa_list item=pa}
    <tr>
        <td>{$pa.id}</td>
        <td>{$pa.fio}</td>
        <td>{$pa.fio}</td>
        <td><a href="?page={$page}&action=meters&id={$pa.id}">счетчики</a><br />
            <a href="?page={$page}&action=edit&id={$pa.id}">редактировать</a><br />
            <a href="?page={$page}&action=del&id={$pa.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=add">Добавить лицевой счет</a>

{/if}