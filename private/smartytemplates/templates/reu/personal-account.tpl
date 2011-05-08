<h1>Управление лицевыми счетами</h1>

{if $action=="edit"}

<h2>Редактировать лицевой счет </h2>

<form action="?page={$page}&action={$action}&id={$paccount.id}" method="post">
    <table>
        <tr>
            <td width="200">Лицевой счет</td>
            <td>{$paccount.id}</td>
        </tr>
        <tr>
            <td>ФИО</td>
            <td>{$paccount.fio}</td>
        </tr>
        <tr>
            <td>Адрес</td>
            <td>{$paccount.street}, {$paccount.house}-{$paccount.apartment}</td>
        </tr>
        <tr>
            <td>Телефон</td>
            <td><textarea name="data[phone_number]">{$paccount.phone_number}</textarea></td>
        </tr>
        <tr>
            <td>Телефон (автоинформатор)</td>
            <td><textarea name="data[ai_phone_number]">{$paccount.ai_phone_number}</textarea></td>
        </tr>
        <tr>
            <td>Мобильный телефон</td>
            <td><textarea name="data[mobile_phone_number]">{$paccount.mobile_phone_number}</textarea></td>
        </tr>
        <tr>
            <td>Мобильный телефон (автоинформатор)</td>
            <td><textarea name="data[ai_mobile_phone_number]">{$paccount.ai_mobile_phone_number}</textarea></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}

<table border="1">
    <tr>
        <td>лицевой счет</td>
        <td>сектор</td>
        <td>улица</td>
        <td>дом</td>
        <td>квартира</td>
        <td>фио</td>
        <td>телефон</td>
        <td></td>
    </tr>
{foreach from=$personal_account_list item=paccount}
    <tr>
        <td>{$paccount.personal_account}</td>
        <td>{$paccount.sector}</td>
        <td>{$paccount.street}</td>
        <td>{$paccount.house}</td>
        <td>{$paccount.apartment}</td>
        <td>{$paccount.fio}</td>
        <td>{$paccount.phone_number}</td>
        <td><a href="?page={$page}&action=edit&id={$paccount.id}">редактировать</a></td>

    </tr>
{/foreach}
</table>
{/if}