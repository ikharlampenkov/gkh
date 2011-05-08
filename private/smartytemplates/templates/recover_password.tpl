<h1>Восстановление пароля</h1>

<form action="?page={$page}" method="post">
    <table width="100%">
        <tr>
            <td width="200">Логин</td>
            <td><input name="data[login]" /></td>
        </tr>
        <tr>
            <td>E-mail</td>
            <td><input name="data[email]" /> </td>
        </tr>
        <tr>
            <td><input type="submit" name="action" value="Восстановить" /> </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</form>