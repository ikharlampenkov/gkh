<h1>{$personal_title}</h1>

{if $personal_list!==false}
<table>
    <tr>
       <td>Фото</td>
       <td>ФИО</td>
       <td>Отдел</td>
       <td>Должность</td>
    </tr>
{foreach from=$personal_list item=personal}
    <tr>
        <td>{if $personal.img_prew}<img src="{$siteurl}temp_files/{$personal.img_prew}" />{else}&nbsp;{/if}</td>
	<td>{$personal.fio}</td>
        <td>{$personal.department}</td>
        <td>{$personal.position}</td>
    </tr>
{/foreach}
</table>
{/if}