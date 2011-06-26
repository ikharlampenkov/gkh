<?php /* Smarty version Smarty-3.0.7, created on 2011-06-26 22:16:09
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/admin/meters.tpl" */ ?>
<?php /*%%SmartyHeaderCode:129634de3d0ab8215d8-71396529%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'cb1ccd9f907353756d8d83f8bb871a53f1aa2dc1' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/admin/meters.tpl',
      1 => 1305821280,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '129634de3d0ab8215d8-71396529',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<h1>Счетчики</h1>

<?php if ($_smarty_tpl->getVariable('action')->value=="add"||$_smarty_tpl->getVariable('action')->value=="edit"){?>

<h2><?php echo $_smarty_tpl->getVariable('txt')->value;?>
</h2>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php echo $_smarty_tpl->getVariable('action')->value;?>
<?php if ('edit'){?>&id=<?php echo $_smarty_tpl->getVariable('meter')->value['id'];?>
<?php }?>" method="post">
    <table>
        <tr>
            <td width="200">Название</td>
            <td><input name="data[title]" value="<?php echo $_smarty_tpl->getVariable('meter')->value['title'];?>
" /></td>
        </tr>
        <tr>
            <td width="200">Тариф</td>
            <td><input name="data[rate]" value="<?php echo $_smarty_tpl->getVariable('meter')->value['rate'];?>
" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<?php }else{ ?>

<?php if ($_smarty_tpl->getVariable('meters_list')->value!==false){?>
<table>
    <tr>
       <td>Название</td>
       <td>Тариф</td>
       <td>&nbsp;</td>
    </tr>
<?php  $_smarty_tpl->tpl_vars['meter'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('meters_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['meter']->key => $_smarty_tpl->tpl_vars['meter']->value){
?>
    <tr>
        <td><?php echo $_smarty_tpl->tpl_vars['meter']->value['title'];?>
</td>
	<td><?php echo $_smarty_tpl->tpl_vars['meter']->value['rate'];?>
</td>
        <td><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=edit&id=<?php echo $_smarty_tpl->tpl_vars['meter']->value['id'];?>
">редактировать</a><br />
            <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=del&id=<?php echo $_smarty_tpl->tpl_vars['meter']->value['id'];?>
">удалить</a></td>
    </tr>
<?php }} ?>
</table>
<?php }?>

<br />
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add">Добавить счетчик</a>

<?php }?>