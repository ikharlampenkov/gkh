<?php /* Smarty version Smarty-3.0.7, created on 2011-05-23 22:07:52
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/admin/personal_account.tpl" */ ?>
<?php /*%%SmartyHeaderCode:197184dda78481705f6-50297686%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3fbd8de81806c83bcb9390beda4bb194e8399c0c' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/admin/personal_account.tpl',
      1 => 1306163269,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '197184dda78481705f6-50297686',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<h1>Лицевые счета</h1>

<?php if ($_smarty_tpl->getVariable('action')->value=="add"||$_smarty_tpl->getVariable('action')->value=="edit"){?>

<h2><?php echo $_smarty_tpl->getVariable('txt')->value;?>
</h2>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php echo $_smarty_tpl->getVariable('action')->value;?>
<?php if ('edit'){?>&id=<?php echo $_smarty_tpl->getVariable('pa')->value['id'];?>
<?php }?>" method="post">
    <table>
        <tr>
            <td width="200">ФИО</td>
            <td><input name="data[fio]" value="<?php echo $_smarty_tpl->getVariable('pa')->value['fio'];?>
" /></td>
        </tr>
        <tr>
            <td>Дом</td>
            <td><select name="data[house_id]">
                <?php  $_smarty_tpl->tpl_vars['house'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('house_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['house']->key => $_smarty_tpl->tpl_vars['house']->value){
?>
                    <option value="<?php echo $_smarty_tpl->tpl_vars['house']->value['id'];?>
" <?php if (isset($_smarty_tpl->getVariable('pa',null,true,false)->value['house_id'])&&$_smarty_tpl->getVariable('pa')->value['house_id']==$_smarty_tpl->tpl_vars['house']->value['id']){?>selected="selected"<?php }?>><?php echo $_smarty_tpl->tpl_vars['house']->value['street'];?>
, <?php echo $_smarty_tpl->tpl_vars['house']->value['number'];?>
<?php echo $_smarty_tpl->tpl_vars['house']->value['subnumber'];?>
</option>
                <?php }} ?>
                </select>
            </td>
        </tr>
        <tr>
            <td>Квартира</td>
            <td><input name="data[apartment]" value="<?php echo $_smarty_tpl->getVariable('pa')->value['apartment'];?>
" /></td>
        </tr>
        <tr>
            <td>Пароль</td>
            <td><input name="data[password]" value="<?php echo $_smarty_tpl->getVariable('pa')->value['password'];?>
" /></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<?php }elseif($_smarty_tpl->getVariable('action')->value=="meters"){?>

<h2>Счетчики для л/с <?php echo $_smarty_tpl->getVariable('pa')->value['id'];?>
</h2>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php echo $_smarty_tpl->getVariable('action')->value;?>
&id=<?php echo $_smarty_tpl->getVariable('pa')->value['id'];?>
" method="post">
    <table>    
<?php  $_smarty_tpl->tpl_vars['meter'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('meters_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['meter']->key => $_smarty_tpl->tpl_vars['meter']->value){
?>
        <tr>
            <td><?php echo $_smarty_tpl->tpl_vars['meter']->value['title'];?>
</td>
            <td><input type="checkbox" name=data[meters][<?php echo $_smarty_tpl->tpl_vars['meter']->value['id'];?>
] <?php if (in_array($_smarty_tpl->tpl_vars['meter']->value['id'],$_smarty_tpl->getVariable('pa_meters')->value)){?>checked="checked"<?php }?> /></td>
        </tr>
<?php }} ?>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>
<?php }else{ ?>

<?php if ($_smarty_tpl->getVariable('pa_list')->value!==false){?>
<table>
    <tr>
        <td>Счет</td>
        <td>ФИО</td>
        <td>Адрес</td>
        <td>&nbsp;</td>
    </tr>
<?php  $_smarty_tpl->tpl_vars['pa'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('pa_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['pa']->key => $_smarty_tpl->tpl_vars['pa']->value){
?>
    <tr>
        <td><?php echo $_smarty_tpl->tpl_vars['pa']->value['id'];?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['pa']->value['fio'];?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['pa']->value['fio'];?>
</td>
        <td><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=meters&id=<?php echo $_smarty_tpl->tpl_vars['pa']->value['id'];?>
">счетчики</a><br />
            <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=edit&id=<?php echo $_smarty_tpl->tpl_vars['pa']->value['id'];?>
">редактировать</a><br />
            <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=del&id=<?php echo $_smarty_tpl->tpl_vars['pa']->value['id'];?>
">удалить</a></td>
    </tr>
<?php }} ?>
</table>
<?php }?>

<br />
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add">Добавить лицевой счет</a>

<?php }?>