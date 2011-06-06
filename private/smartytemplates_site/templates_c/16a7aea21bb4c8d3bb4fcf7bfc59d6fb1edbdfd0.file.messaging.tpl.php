<?php /* Smarty version Smarty-3.0.7, created on 2011-06-06 21:42:01
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/admin/messaging.tpl" */ ?>
<?php /*%%SmartyHeaderCode:48004dece7391f43f9-50433249%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '16a7aea21bb4c8d3bb4fcf7bfc59d6fb1edbdfd0' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/admin/messaging.tpl',
      1 => 1306899840,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '48004dece7391f43f9-50433249',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<h1>Рассылка универсальных сообщений</h1>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
" method="post">

    <div>Сообщение</div>
    <textarea name="data[message]"></textarea>
    <br /><br />

    <table border="1">
        <tr>
            <td width="25" align="center">&nbsp;</td>
            <td>лицевой счет</td>
            <td>улица</td>
            <td>дом</td>
            <td>квартира</td>     
            <td>телефон</td>           
        </tr>
<?php  $_smarty_tpl->tpl_vars['pa'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('pa_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['pa']->key => $_smarty_tpl->tpl_vars['pa']->value){
?>
        <tr>
            <td><input id="check" type="checkbox" name="data[debts][<?php echo $_smarty_tpl->tpl_vars['pa']->value['id'];?>
]" /></td>
            <td><?php echo $_smarty_tpl->tpl_vars['pa']->value['id'];?>
</td>
            <td><?php echo $_smarty_tpl->tpl_vars['pa']->value['house']['street'];?>
</td>
            <td><?php echo $_smarty_tpl->tpl_vars['pa']->value['house']['number'];?>
<?php echo $_smarty_tpl->tpl_vars['pa']->value['house']['subnumber'];?>
</td>
            <td><?php echo $_smarty_tpl->tpl_vars['pa']->value['apartment'];?>
</td>
            <td><?php echo $_smarty_tpl->tpl_vars['pa']->value['phone'];?>
</td>
        </tr>
<?php }} ?>
    </table>

    <input id="save" name="save" type="submit" value="Разослать" />
</form>