<h1>Вакансии</h1>

{if $vacancy_list!==false}

<table>
    <tr>
       <td>Должность</td>
       <td>Требования</td>
       <td>Заработная плата</td>
       <td>Текст</td>
       <td>Куда присылать резюме</td>
       <td>К кому обращаться</td>
    </tr>
{foreach from=$vacancy_list item=vacancy}
    <tr>
	<td>{$vacancy.position}</td>
        <td>{$vacancy.requirements}</td>
        <td>{$vacancy.salary}</td>
        <td>{$vacancy.some_text}</td>
        <td>{$vacancy.contact}</td>
        <td>{$vacancy.who}</td>
    </tr>
{/foreach}
</table>

{/if}