<h1>Контакты</h1>

<form action="?page={$page}" method="post">
    <table>
        <tr>
            <td width="200">Адрес</td>
            <td><input type="text" name="data[address]" value="{if isset($contact.address)}{$contact.address}{/if}" /></td>
        </tr>
         <tr>
            <td width="200">Телефон</td>
            <td><input type="text" name="data[phone_number]" value="{if isset($contact.phone_number)}{$contact.phone_number}{/if}" /></td>
        </tr>
    </table>
    <input type="hidden" name="data[id]" value="{if isset($contact.id)}{$contact.id}{else}0{/if}" />
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>