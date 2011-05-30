<?php /* Smarty version Smarty-3.0.7, created on 2011-05-31 00:14:52
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/admin/personal.tpl" */ ?>
<?php /*%%SmartyHeaderCode:4374de3d08cb84e70-69685931%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '531e4ceec562a4283872e3c4e3dcb55c27755355' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/admin/personal.tpl',
      1 => 1305904917,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '4374de3d08cb84e70-69685931',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<h1>Персонал</h1>

<?php if ($_smarty_tpl->getVariable('action')->value=="add"||$_smarty_tpl->getVariable('action')->value=="edit"){?>

<h2><?php echo $_smarty_tpl->getVariable('txt')->value;?>
</h2>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php echo $_smarty_tpl->getVariable('action')->value;?>
<?php if ($_smarty_tpl->getVariable('action')->value=="edit"){?>&id=<?php echo $_smarty_tpl->getVariable('personal')->value['id'];?>
<?php }?>" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="200">ФИО</td>
            <td><input name="data[fio]" value="<?php echo $_smarty_tpl->getVariable('personal')->value['fio'];?>
" /></td>
        </tr> 
        <tr>
            <td>Фото</td>
            <td><?php if (!empty($_smarty_tpl->getVariable('personal',null,true,false)->value['foto'])){?><img src="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->getVariable('personal')->value['foto'];?>
" /><br />
                &nbsp;<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=del_file&id=<?php echo $_smarty_tpl->getVariable('personal')->value['id'];?>
&field=foto">удалить</a><br /><?php }?>
                <input type="file"  name="data[foto]" /></td>
        </tr>
        <tr>
            <td>Руководитель</td>
            <td><input name="data[is_leaders]" type="checkbox" <?php if (isset($_smarty_tpl->getVariable('personal',null,true,false)->value['leaders'])&&$_smarty_tpl->getVariable('personal')->value['leaders']){?>checked="checked"<?php }?> style="font-size: 14px; width: 25px;" /></td>
        </tr>
        <tr>
            <td>Отдел</td>
            <td><input name="data[department]" value="<?php echo $_smarty_tpl->getVariable('personal')->value['department'];?>
" /></td>
        </tr>
        <tr>
            <td>Должность</td>
            <td><input name="data[position]" value="<?php echo $_smarty_tpl->getVariable('personal')->value['position'];?>
" /></td>
        </tr>
        <tr>
            <td>E-mail</td>
            <td><input name="data[email]" value="<?php echo $_smarty_tpl->getVariable('personal')->value['email'];?>
" /></td>
        </tr>
        <tr>
            <td>Текст</td>
            <td><textarea name="data[sometext]" /><?php echo $_smarty_tpl->getVariable('personal')->value['sometext'];?>
</textarea></td>
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<?php }else{ ?>

<?php if ($_smarty_tpl->getVariable('personal_list')->value!==false){?>
<table>
    <tr>
       <td>Фото</td>
       <td>ФИО</td>
       <td>Отдел</td>
       <td>Должность</td>
       <td>&nbsp;</td>
    </tr>
<?php  $_smarty_tpl->tpl_vars['personal'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('personal_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['personal']->key => $_smarty_tpl->tpl_vars['personal']->value){
?>
    <tr>
        <td><?php if ($_smarty_tpl->tpl_vars['personal']->value['img_prew']){?><img src="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->tpl_vars['personal']->value['img_prew'];?>
" /><?php }else{ ?>&nbsp;<?php }?></td>
	<td><?php echo $_smarty_tpl->tpl_vars['personal']->value['fio'];?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['personal']->value['department'];?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['personal']->value['position'];?>
</td>
        <td><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=edit&id=<?php echo $_smarty_tpl->tpl_vars['personal']->value['id'];?>
">редактировать</a><br />
            <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=del&id=<?php echo $_smarty_tpl->tpl_vars['personal']->value['id'];?>
">удалить</a></td>
    </tr>
<?php }} ?>
</table>
<?php }?>

<br />
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add">Добавить работника</a>

<?php }?>