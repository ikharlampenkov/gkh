<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Достижения</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>

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