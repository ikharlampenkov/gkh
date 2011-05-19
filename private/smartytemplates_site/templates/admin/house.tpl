<h1>Дома</h1>

{if $action=="add"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}" method="post">
    <table>
        <tr>
            <td width="200">Улица</td>
            <td><input name="data[street]" value="" /></td>
        </tr>
        <tr>
            <td width="200">Номер</td>
            <td><input name="data[number]" value="" style="width: 50px;" /> / <input name="data[subnumber]" value="" style="width: 25px;" /></td>
        </tr>
        <tr>
            <td width="200">Общая площадь</td>
            <td><input name="data[area]" value="" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{elseif $action=="edit"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}&id={$house.id}" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="200">Улица</td>
            <td><input name="data[street]" value="{$house.street}" /></td>
        </tr>
        <tr>
            <td >Номер</td>
            <td><input name="data[number]" value="{$house.number}" style="width: 50px;" /> / <input name="data[subnumber]" value="{$house.subnumber}" style="width: 25px;" /></td>
        </tr>
        <tr>
            <td >Общая площадь</td>
            <td><input name="data[area]" value="{$house.area}" /></td>
        </tr>
        <tr>
            <td>План работ по содержанию и ремонту</td>
            <td>{if !empty($house.file_repair_plan)}<a href={$siteurl}temp_files/{$house.file_repair_plan}>План работ по содержанию и ремонту</a>
                &nbsp;<a href="?page={$page}&action=del_file&id={$house.id}&field=file_repair_plan">удалить</a><br />{/if}
                <input type="file"  name="data[file_repair_plan]" /></td>
        </tr>
        <tr>
            <td>Доходы и расходы</td>
            <td>{if !empty($house.file_costs_income)}<a href={$siteurl}temp_files/{$house.file_costs_income}>Доходы и расходы</a>
                &nbsp;<a href="?page={$page}&action=del_file&id={$house.id}&field=file_costs_income">удалить</a><br />{/if}
                <input type="file"  name="data[file_costs_income]" /></td>
        </tr>
        <tr>
            <td>Выполненные работы</td>
            <td>{if !empty($house.file_performed_repair)}<a href={$siteurl}temp_files/{$house.file_performed_repair}>Выполненные работы</a>
                &nbsp;<a href="?page={$page}&action=del_file&id={$house.id}&field=file_performed_repair">удалить</a><br />{/if}
                <input type="file"  name="data[file_performed_repair]" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

{else}

{if $house_list!==false}
<table>
    <tr>
       <td>Улица</td>
       <td>Номер</td>
       <td>Общая площадь</td>
       <td>&nbsp;</td>
    </tr>
{foreach from=$house_list item=house}
    <tr>
        <td>{$house.street}</td>
	<td>{$house.number}{if !empty($house.subnumber)}{$house.subnumber}{/if}</td>
        <td>{$house.area}</td>    
        <td><a href="?page={$page}&action=edit&id={$house.id}">редактировать</a><br />
            <a href="?page={$page}&action=del&id={$house.id}">удалить</a></td>
    </tr>
{/foreach}
</table>
{/if}

<br />
<a href="?page={$page}&action=add">Добавить дом</a>

{/if}