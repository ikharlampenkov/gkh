<h1>Рассылка универсальных сообщений</h1>

<form action="?page={$page}" method="post">

    <div>Сообщение</div>
    <textarea name="data[message]"></textarea>
    <br /><br />

    <table border="1">
        <tr>
            <td width="25" align="center">&nbsp;</td>
            <td>лицевой счет</td>
            <td>улица</td>
            <td>дом</td>
            <td>квартира</td>     
            <td>телефон</td>           
        </tr>
{foreach from=$pa_list item=pa}
        <tr>
            <td><input id="check" type="checkbox" name="data[debts][{$pa.id}]" /></td>
            <td>{$pa.id}</td>
            <td>{$pa.house.street}</td>
            <td>{$pa.house.number}{$pa.house.subnumber}</td>
            <td>{$pa.apartment}</td>
            <td>{$pa.phone}</td>
        </tr>
{/foreach}
    </table>

    <input id="save" name="save" type="submit" value="Разослать" />
</form>