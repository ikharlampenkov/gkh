<?php /* Smarty version Smarty-3.0.7, created on 2011-06-26 23:55:32
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/admin/license.tpl" */ ?>
<?php /*%%SmartyHeaderCode:74094e076484c7dec1-40881882%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '088ed38f855d2c0ab576be6d0da629e61df4e770' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/admin/license.tpl',
      1 => 1309107286,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '74094e076484c7dec1-40881882',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_truncate')) include 'H:\www\gkh\private\classes\smarty\plugins\modifier.truncate.php';
?><h1>Достижения</h1>

<?php if ($_smarty_tpl->getVariable('action')->value=="add"||$_smarty_tpl->getVariable('action')->value=="edit"){?>

<h2><?php echo $_smarty_tpl->getVariable('txt')->value;?>
</h2>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php echo $_smarty_tpl->getVariable('action')->value;?>
<?php if ($_smarty_tpl->getVariable('action')->value=="edit"){?>&id=<?php echo $_smarty_tpl->getVariable('license')->value['id'];?>
<?php }?>" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>Достижение</td>
            <td><?php if (!empty($_smarty_tpl->getVariable('license',null,true,false)->value['img'])){?><img src="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->getVariable('license')->value['img'];?>
" /><br />
                &nbsp;<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=del_file&id=<?php echo $_smarty_tpl->getVariable('license')->value['id'];?>
&field=img">удалить</a><br /><?php }?>
                <input type="file"  name="data[img]" /></td>
        </tr>
        <tr>
            <td width="200">Описание</td>
            <td><textarea name="data[description]"><?php echo $_smarty_tpl->getVariable('license')->value['description'];?>
</textarea></td>
        </tr> 
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<?php }else{ ?>

<?php if ($_smarty_tpl->getVariable('license_list')->value!==false){?>
<table>
    <tr>
       <td>Достижение</td>
       <td>Описание</td>
       <td>&nbsp;</td>
    </tr>
<?php  $_smarty_tpl->tpl_vars['license'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('license_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['license']->key => $_smarty_tpl->tpl_vars['license']->value){
?>
    <tr>
        <td><?php if ($_smarty_tpl->tpl_vars['license']->value['img_prew']){?><img src="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->tpl_vars['license']->value['img_prew'];?>
" /><?php }else{ ?>&nbsp;<?php }?></td>
	<td><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['license']->value['description'],50);?>
</td>
        <td><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=edit&id=<?php echo $_smarty_tpl->tpl_vars['license']->value['id'];?>
">редактировать</a><br />
            <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=del&id=<?php echo $_smarty_tpl->tpl_vars['license']->value['id'];?>
">удалить</a></td>
    </tr>
<?php }} ?>
</table>
<?php }?>

<br />
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add">Добавить достижение</a>

<?php }?>