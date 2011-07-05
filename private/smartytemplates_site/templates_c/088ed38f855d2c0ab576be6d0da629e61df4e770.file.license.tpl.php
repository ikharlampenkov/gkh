<?php /* Smarty version Smarty-3.0.7, created on 2011-07-05 23:12:28
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/admin/license.tpl" */ ?>
<?php /*%%SmartyHeaderCode:39954e1337ecdf1886-54772515%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '088ed38f855d2c0ab576be6d0da629e61df4e770' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/admin/license.tpl',
      1 => 1309821900,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '39954e1337ecdf1886-54772515',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_truncate')) include 'H:\www\gkh\private\classes\smarty\plugins\modifier.truncate.php';
?>
<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Достижения</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>
<?php if ($_smarty_tpl->getVariable('action')->value=="add"||$_smarty_tpl->getVariable('action')->value=="edit"){?>

<h2><?php echo $_smarty_tpl->getVariable('txt')->value;?>
</h2>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php echo $_smarty_tpl->getVariable('action')->value;?>
<?php if ($_smarty_tpl->getVariable('action')->value=="edit"){?>&id=<?php echo $_smarty_tpl->getVariable('license')->value['id'];?>
<?php }?>" method="post" enctype="multipart/form-data">
    <table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
        <tr>
            <td class="pem">Достижение</td>
            <td class="pem"><?php if (!empty($_smarty_tpl->getVariable('license',null,true,false)->value['img'])){?><img src="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->getVariable('license')->value['img'];?>
" /><br />
                &nbsp;<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=del_file&id=<?php echo $_smarty_tpl->getVariable('license')->value['id'];?>
&field=img">удалить</a><br /><?php }?>
                <input type="file"  name="img" /></td>
        </tr>
        <tr class="pem">
            <td width="200">Описание</td>
            <td><textarea name="data[description]"><?php echo $_smarty_tpl->getVariable('license')->value['description'];?>
</textarea></td>
        </tr> 
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<?php }else{ ?>
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add">ДОБАВИТЬ ДОКУМЕНТ</a>
</td>
</table>
<?php if ($_smarty_tpl->getVariable('license_list')->value!==false){?>
<table width="100%" cellpadding="5" cellspacing="2" style="font-size:14px">
    <tr>
       <td class="pom">Достижение</td>
       <td class="pom">Описание</td>
       <td class="pom">&nbsp;</td>
       <td class="pom">&nbsp;</td>
    </tr>
<?php  $_smarty_tpl->tpl_vars['license'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('license_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['license']->key => $_smarty_tpl->tpl_vars['license']->value){
?>
    <tr>
        <td class="pem"><?php if ($_smarty_tpl->tpl_vars['license']->value['img_prew']){?><img src="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->tpl_vars['license']->value['img_prew'];?>
" /><?php }else{ ?>&nbsp;<?php }?></td>
	<td class="pem"><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['license']->value['description'],50);?>
</td>
        <td class="pom"><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=edit&id=<?php echo $_smarty_tpl->tpl_vars['license']->value['id'];?>
">редактировать</a></td>
         <td class="pom">   <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=del&id=<?php echo $_smarty_tpl->tpl_vars['license']->value['id'];?>
">удалить</a></td>
    </tr>
<?php }} ?>
</table>
<?php }?>

<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add">ДОБАВИТЬ ДОКУМЕНТ</a>
</td>
</table>

<?php }?>