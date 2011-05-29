<h1>Лицензии</h1>

{if $license_list!==false}
<table>
{foreach from=$license_list item=license}
    <tr>
        <td>
        {if $license.img_prew}<img src="{$siteurl}temp_files/{$license.img_prew}" alt="{$license.description|truncate:50}" />{else}&nbsp;{/if}<br />
        <div>{$license.description|truncate:50}</div>
        </td>
    </tr>
{/foreach}
</table>
{/if}