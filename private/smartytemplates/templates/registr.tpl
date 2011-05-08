<h1>Регистрация нового РЭУ</h1>

<form action="?page={$page}" method="post">
    <table width="100%">
        <tr>
            <td width="200">Город</td>
            <td><select name="data[city_id]" >
                {foreach from=$city_list item=city}
                    <option value="{$city.id}">{$city.title}</option>
                {/foreach}
                </select>
            </td>
        </tr>
        <tr>
            <td>Название</td>
            <td><input name="data[title]" /> </td>
        </tr>
        <tr>
            <td>Контактная информация</td>
            <td><textarea name="data[contact_info_admin]"></textarea></td>
        </tr>
        <tr>
            <td>Что заинтересовало?</td>
            <td><textarea name="data[what_interested]"></textarea></td>
        </tr>
        <tr>
            <td><input type="submit" name="action" value="Зарегистрировать" /> </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</form>