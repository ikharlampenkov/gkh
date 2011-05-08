<h1>РЭУ</h1>


{if $action=="add" || $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}{if edit}&id={$reu.id}{/if}" method="post">
    <table>
        <tr>
            <td width="200">Город</td>
            <td><select name="data[city_id]" >
                {foreach from=$city_list item=city}
                    <option value="{$city.id}" {if isset($reu) && $reu.city_id==$city.id}selected="selected"{/if}>{$city.title}</option>
                {/foreach}
                </select></td>
        </tr>
        <tr>
            <td width="200">Название</td>
            <td><input name="data[title]" value='{$reu.title}' /></td>
        </tr>
        <tr>
            <td>E-mail</td>
            <td><input name="data[email]" value="{$reu.email}" /></td>
        </tr>
        <tr>
            <td>Логин</td>
            <td><input name="data[login]" value="{$reu.user.login}" /></td>
        </tr>
        <tr>
            <td>Пароль</td>
            <td><input name="data[password]" value="{$reu.user.password}" /></td>
        </tr>
        <tr>
            <td>Контактные данные</td>
            <td><textarea name="data[contact_info_admin]">{$reu.contact_info_admin}</textarea></td>
        </tr>
        <tr>
            <td>Модерировать</td>
            <td><input type="checkbox" name="data[is_moderated]" value="{$reu.is_moderated}" {if $reu.is_moderated}checked="checked"{/if} style="width: 14px;" /></td>
        </tr>
    </table>
    <input name="data[user_id]" type="hidden" value="{if isset($reu.user_id)}{$reu.user_id}{else}0{/if}" />
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}

{if $reu_list!==false}
<table>
{foreach from=$reu_list item=reu}
    <tr style="background-color: {if $reu.is_moderated}#ccffcc{else}#ffd2ba{/if}">
        <td>{$reu.city_title}</td>
        <td>{$reu.title}</td>
        <td><a href="?action=logoin_as_reu&id={$reu.id}">Войти как РЭУ</a> </td>
        <td><a href="?page={$page}&action=edit&id={$reu.id}">редактировать</a><br /><a href="?page={$page}&action=del&id={$reu.id}">удалить</a> </td>
    </tr>
{/foreach}
</table>
{/if}

<a href="?page={$page}&action=add">добавить</a>

{/if}