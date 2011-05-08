<h1>Рассылка универсальных сообщений</h1>

{if $action=="send_dept_message"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}" method="post">

    <table border="0">
        <tr>
            <td colspan="6"><b>Фильтр</b></td>
        </tr>
        <tr>
            <td>По улице: </td>
            <td>
                <select name="filter[street][]" multiple="multiple">
                    <option value="">Все</option>
                {foreach from=$street_list item=street}
                    <option value="{$street.street}" {if !empty($cur_street) && in_array($street.street, $cur_street)}selected="selected"{/if}>{$street.street}</option>
                {/foreach}
                </select></td>
            <td>По дому: </td>
            <td><input name="filter[house]" value="{$cur_house}" /></td>
            <td>По квартире:</td>
            <td><input name="filter[apartment]" value="{$cur_apartment}"/></td>
        </tr>
        <tr>
            <td>Выводить по: </td>
            <td>
                <select name="filter[rec_on_page]" id="rec_on_page"  {*onchange="correctPager()"*}>
                      {foreach from=$rec_on_page item=rop key=key}
                    <option value="{$key}" {if $cur_rec_on_page==$key}selected="selected"{/if}>{$rop}</option>
                      {/foreach}
                </select>
            </td>
            <td>Выводить с: </td>
            <td colspan="3"><input name="filter[start_from]" {if $cur_start_from!=0}value="{$cur_start_from}"{/if} /></td>
        </tr>
        <tr>
            <td colspan="6"><input id="save" name="save" type="submit" value="Выбрать" /></td>
        </tr>
    </table>
</form>

<form action="?page={$page}&action={$action}" method="post">

    <table>
        <tr>
            <td id="pager">Страница: 
        {section name=pager loop={$page_info.page_count} start=0}
        {if $smarty.section.pager.index==$cur_page}<b>{$smarty.section.pager.index+1}</b>{else}<a href={$siteurl}?page={$page}&action={$action}&pager={$smarty.section.pager.index} >{$smarty.section.pager.index+1}</a> {/if}
        {/section}   
            </td>
        </tr>
    </table>    

    <table border="1">
        <tr>
            <td width="25" align="center">&nbsp;</td>
            <td>лицевой счет</td>
            <td>сектор</td>
            <td>улица</td>
            <td>дом</td>
            <td>квартира</td>
            <td>фио</td>
            <td>телефон</td>
            <td>моб. телефон</td>
            <td>сумма долга</td>
            <td>сумма пени</td>
            <td>сумма долга c пеней</td>
            <td>кол-во мес</td>
        </tr>
{foreach from=$dept_list item=debt}
        <tr>
            <td><input id="check" type="checkbox" name="data[debts][{$debt.id}]" /></td>
            <td>{$debt.personal_account}</td>
            <td>{$debt.sector}</td>
            <td>{$debt.street}</td>
            <td>{$debt.house}</td>
            <td>{$debt.apartment}</td>
            <td>{$debt.fio}</td>
            <td>{$debt.phone_number}</td>
            <td>{$debt.mobile_phone_number}</td>
            <td>{$debt.amount_debt}</td>
            <td>{$debt.amount_penalty}</td>
            <td>{$debt.amount_debt_w_penalties}</td>
            <td>{$debt.number_months}</td>
        </tr>
{/foreach}
    </table>

    <br />
    <input id="save" name="save" type="submit" value="Разослать" />
</form>

{elseif $action=="send_message"}

<h2>{$txt}</h2>

<form action="?page={$page}&action={$action}" method="post">

    <table>
        <tr>
            <td colspan="6"><b>Фильтр</b></td>
        </tr>
        <tr>
            <td>По улице: </td>
            <td><select name="filter[street][]" multiple="multiple">
                    <option value="">Все</option>
                {foreach from=$street_list item=street}
                    <option value="{$street.street}" {if !empty($cur_street) && in_array($street.street, $cur_street)}selected="selected"{/if}>{$street.street}</option>
                {/foreach}
                </select></td>
            <td>По дому: </td>
            <td><input name="filter[house]" value="{$cur_house}" /></td>
            <td>По квартире:</td>
            <td><input name="filter[apartment]" value="{$cur_apartment}"/></td>
        </tr>
        <tr>
            <td>Выводить по: </td>
            <td>
                <select name="filter[rec_on_page]" id="rec_on_page"  {*onchange="correctPager()"*}>
                      {foreach from=$rec_on_page item=rop key=key}
                    <option value="{$key}" {if $cur_rec_on_page==$key}selected="selected"{/if}>{$rop}</option>
                      {/foreach}
                </select>
            </td>
            <td>Выводить с: </td>
            <td colspan="3"><input name="filter[start_from]" {if $cur_start_from!=0}value="{$cur_start_from}"{/if} /></td>
        </tr>
        <tr>
            <td colspan="6"><input id="save" name="save" type="submit" value="Выбрать" /></td>
        </tr>
    </table>
</form>

<form action="?page={$page}&action={$action}" method="post">

    <div>Сообщение</div>
    <textarea name="data[message]"></textarea>
    <br /><br />

    <table>
        <tr>
            <td id="pager">Страница: 
        {section name=pager loop={$page_info.page_count} start=0}
        {if $smarty.section.pager.index==$cur_page}<b>{$smarty.section.pager.index+1}</b>{else}<a href={$siteurl}?page={$page}&action={$action}&pager={$smarty.section.pager.index} >{$smarty.section.pager.index+1}</a> {/if}
        {/section}   
            </td>
        </tr>
    </table>

    <table border="1">
        <tr>
            <td width="25" align="center">&nbsp;</td>
            <td>лицевой счет</td>
            <td>сектор</td>
            <td>улица</td>
            <td>дом</td>
            <td>квартира</td>
            <td>фио</td>
            <td>телефон</td>
            <td>моб. телефон</td>
            <td>сумма долга</td>
            <td>сумма пени</td>
            <td>сумма долга c пеней</td>
            <td>кол-во мес</td>
        </tr>
{foreach from=$dept_list item=debt}
        <tr>
            <td><input id="check" type="checkbox" name="data[debts][{$debt.id}]" /></td>
            <td>{$debt.personal_account}</td>
            <td>{$debt.sector}</td>
            <td>{$debt.street}</td>
            <td>{$debt.house}</td>
            <td>{$debt.apartment}</td>
            <td>{$debt.fio}</td>
            <td>{$debt.phone_number}</td>
            <td>{$debt.mobile_phone_number}</td>
            <td>{$debt.amount_debt}</td>
            <td>{$debt.amount_penalty}</td>
            <td>{$debt.amount_debt_w_penalties}</td>
            <td>{$debt.number_months}</td>
            <td>{$debt.status_housing}</td>
        </tr>
{/foreach}
    </table>

    <input id="save" name="save" type="submit" value="Разослать" />
</form>

{else}
<a href="?page={$page}&action=send_dept_message" >Разослать информацию о задолженности</a><br />

<a href="?page={$page}&action=send_message" >Разослать сообщение</a><br />
{/if}