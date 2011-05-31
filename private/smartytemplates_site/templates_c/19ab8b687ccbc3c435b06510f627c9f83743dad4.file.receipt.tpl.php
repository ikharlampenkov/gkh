<?php /* Smarty version Smarty-3.0.7, created on 2011-05-31 23:50:15
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/cabinet/receipt.tpl" */ ?>
<?php /*%%SmartyHeaderCode:111094de51c47b7be81-00689028%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '19ab8b687ccbc3c435b06510f627c9f83743dad4' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/cabinet/receipt.tpl',
      1 => 1306860612,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '111094de51c47b7be81-00689028',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_date_format')) include 'H:\www\gkh\private\classes\smarty\plugins\modifier.date_format.php';
?><h1>Электронная квитанция</h1>
<div><span>Лицевой счет №:</span>&nbsp;<span><?php echo $_smarty_tpl->getVariable('account_info')->value['id'];?>
</span></div>
<div><span>Адрес:</span>&nbsp;<span><?php echo $_smarty_tpl->getVariable('house')->value['street'];?>
 д.<?php echo $_smarty_tpl->getVariable('house')->value['number'];?>
<?php echo $_smarty_tpl->getVariable('house')->value['subnumber'];?>
 кв.<?php echo $_smarty_tpl->getVariable('account_info')->value['apartment'];?>
</span></div>

<table>
    <tr>
        <td>Наименование операции</td>
        <td>Дата</td>
        <td>Оплата</td>
    </tr>

    <?php  $_smarty_tpl->tpl_vars['meter'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('meters')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['meter']->key => $_smarty_tpl->tpl_vars['meter']->value){
?>
    <tr>
        <td><?php echo $_smarty_tpl->tpl_vars['meter']->value['title'];?>
</td>
        <td><?php echo smarty_modifier_date_format($_smarty_tpl->getVariable('date')->value,"%m/%Y");?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['meter']->value['diff'];?>
<?php echo $_smarty_tpl->tpl_vars['meter']->value['unit'];?>
=<?php echo $_smarty_tpl->tpl_vars['meter']->value['sum'];?>
</td>
    </tr>
    <?php }} ?>
    
    <tr>
        <td><?php echo $_smarty_tpl->getVariable('gku')->value['title'];?>
</td>
        <td><?php echo smarty_modifier_date_format($_smarty_tpl->getVariable('date')->value,"%m/%Y");?>
</td>
        <td><?php echo $_smarty_tpl->getVariable('gku')->value['sum'];?>
</td>
    </tr>
    
    <tr>
        <td>Итого</td>
        <td>&nbsp;</td>
        <td><?php echo $_smarty_tpl->getVariable('itogo')->value;?>
</td>
    </tr>
    
</table>

<?php if ($_smarty_tpl->getVariable('action')->value!='print'){?>
<br/><br/>
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=print" target="_blank">Распечатать</a>
<?php }?>