<?php /* Smarty version Smarty-3.0.7, created on 2011-05-31 22:17:48
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/cabinet/balance.tpl" */ ?>
<?php /*%%SmartyHeaderCode:264444de5069c5a1f10-94532609%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4276d81f75dd5a545d7e1264057870cfec179921' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/cabinet/balance.tpl',
      1 => 1306855065,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '264444de5069c5a1f10-94532609',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_date_format')) include 'H:\www\gkh\private\classes\smarty\plugins\modifier.date_format.php';
?><h1>Баланс платежей</h1>

<?php if ($_smarty_tpl->getVariable('balance')->value!==false){?>

<table>
    <tr>
        <td>Месяц</td>
        <td>Баланс на начало месяца</td>
        <td>Начислено</td>
        <td>Оплачено</td>
        <td>Баланс на конец месяца</td>
    </tr>
    <?php  $_smarty_tpl->tpl_vars['month'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('balance')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['month']->key => $_smarty_tpl->tpl_vars['month']->value){
?>
    <tr>
        <td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['month']->value['date'],"%m.%Y");?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['month']->value['total_beginning_month'];?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['month']->value['debt'];?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['month']->value['payment'];?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['month']->value['total_end_month'];?>
</td>
    </tr>
    <?php }} ?>
    <tr>
        <td colspan="4">Итого <?php if ($_smarty_tpl->getVariable('month')->value['total_end_month']>0){?>(долг)<?php }else{ ?>(переплата)<?php }?>:</td>
        <td><?php echo $_smarty_tpl->getVariable('month')->value['total_end_month'];?>
</td>
    </tr>
</table>

<?php }?>