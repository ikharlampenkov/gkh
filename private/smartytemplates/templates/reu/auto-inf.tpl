<h1>Управление авто-информатором</h1>

<h4>Обновить БД</h4>

<form action="?page={$page}&action=update_db" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td width="150">Выберите файл</td>
            <td><input type="file" name="data[file]" /></td>
        </tr>
        <tr>
            <td colspan="2"><input id="save" name="save" type="submit" value="Обновить БД" /></td>
        </tr>
    </table>
</form>

<hr width="100%" size="1" />

<h4>История обновлений</h4>

{if $history_list != false}
<table border="1">
    <tr>
        <td>Дата</td>
        <td></td>
    </tr>
{foreach from=$history_list item=history}
    <tr>
        <td>{$history.date|date_format:"%d.%m.%Y %H:%M"}</td>
        <td><a href="">загрузить</a></td>
    </tr>
{/foreach}
</table>

{/if}

<hr width="100%" size="1" />