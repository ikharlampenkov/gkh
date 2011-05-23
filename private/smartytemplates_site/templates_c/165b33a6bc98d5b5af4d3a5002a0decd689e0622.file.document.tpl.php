<?php /* Smarty version Smarty-3.0.7, created on 2011-05-23 20:35:42
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/admin/document.tpl" */ ?>
<?php /*%%SmartyHeaderCode:249524dda62aeedbe42-59315566%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '165b33a6bc98d5b5af4d3a5002a0decd689e0622' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/admin/document.tpl',
      1 => 1306157739,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '249524dda62aeedbe42-59315566',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_truncate')) include 'H:\www\gkh\private\classes\smarty\plugins\modifier.truncate.php';
?><h1>Документы</h1>

<?php if ($_smarty_tpl->getVariable('action')->value=="add"||$_smarty_tpl->getVariable('action')->value=="edit"){?>

<h2><?php echo $_smarty_tpl->getVariable('txt')->value;?>
</h2>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php echo $_smarty_tpl->getVariable('action')->value;?>
&id=<?php if ($_smarty_tpl->getVariable('action')->value=="edit"){?><?php echo $_smarty_tpl->getVariable('document')->value['id'];?>
<?php }?>" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="200">Название</td>
            <td><input name="data[title]" value="<?php echo $_smarty_tpl->getVariable('document')->value['title'];?>
" /></td>
        </tr>
        <tr>
            <td >Краткое описание</td>
            <td><textarea name="data[short_text]"><?php echo $_smarty_tpl->getVariable('document')->value['short_text'];?>
</textarea></td>
        </tr>
        <tr>
            <td>Родительский элемент</td>
            <td><select name="data[parrent_id]">
                    <option value="0" <?php if (isset($_smarty_tpl->getVariable('document',null,true,false)->value['parent_id'])&&$_smarty_tpl->getVariable('document')->value['parent_id']==0){?>selected="selected"<?php }?>>корень</option>
                    <?php  $_smarty_tpl->tpl_vars['folder'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('folder_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['folder']->key => $_smarty_tpl->tpl_vars['folder']->value){
?>
                    <option value="<?php echo $_smarty_tpl->tpl_vars['folder']->value['id'];?>
" <?php if (isset($_smarty_tpl->getVariable('document',null,true,false)->value['parent_id'])&&$_smarty_tpl->getVariable('document')->value['parent_id']==$_smarty_tpl->tpl_vars['folder']->value['id']){?>selected="selected"<?php }?>><?php echo $_smarty_tpl->tpl_vars['folder']->value['title'];?>
</option>
                    <?php }} ?>
                </select></td>
        </tr>
        <tr>
            <td>Файл</td>
            <td><?php if (!empty($_smarty_tpl->getVariable('document',null,true,false)->value['file'])){?><a href=<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->getVariable('document')->value['file'];?>
>Файл</a><br /><?php }?>
                <input type="file"  name="data[file]" /></td>
        </tr>
    </table>
    <input type="hidden" name="data[is_folder]" value="0" />
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<?php }elseif($_smarty_tpl->getVariable('action')->value=="add_folder"||$_smarty_tpl->getVariable('action')->value=="edit_folder"){?>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php echo $_smarty_tpl->getVariable('action')->value;?>
&id=<?php if ($_smarty_tpl->getVariable('action')->value=="edit"){?><?php echo $_smarty_tpl->getVariable('document')->value['id'];?>
<?php }?>" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="200">Название</td>
            <td><input name="data[title]" value="<?php echo $_smarty_tpl->getVariable('document')->value['title'];?>
" /></td>
        </tr>
        <tr>
            <td>Родительский элемент</td>
            <td><select name="data[parrent_id]">
                    <option value="0" <?php if (isset($_smarty_tpl->getVariable('document',null,true,false)->value['parent_id'])&&$_smarty_tpl->getVariable('document')->value['parent_id']==0){?>selected="selected"<?php }?>>корень</option>
                    <?php  $_smarty_tpl->tpl_vars['folder'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('folder_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['folder']->key => $_smarty_tpl->tpl_vars['folder']->value){
?>
                    <option value="<?php echo $_smarty_tpl->tpl_vars['folder']->value['id'];?>
" <?php if (isset($_smarty_tpl->getVariable('document',null,true,false)->value['parent_id'])&&$_smarty_tpl->getVariable('document')->value['parent_id']==$_smarty_tpl->tpl_vars['folder']->value['id']){?>selected="selected"<?php }?>><?php echo $_smarty_tpl->tpl_vars['folder']->value['title'];?>
</option>
                    <?php }} ?>
                </select></td>
        </tr>
    </table>
    <input type="hidden" name="data[short_text]" value="" />
    <input type="hidden" name="data[is_folder]" value="1" />
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<?php }else{ ?>

<?php if ($_smarty_tpl->getVariable('document_list')->value!==false){?>
<table>
    <tr>
       <td>Название</td>
       <td>Краткое описание</td>
       <td>Тип</td>
       <td>&nbsp;</td>
    </tr>
<?php  $_smarty_tpl->tpl_vars['document'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('document_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['document']->key => $_smarty_tpl->tpl_vars['document']->value){
?>
    <tr>
        <td><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['document']->value['title'],100);?>
</td>
	<td><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['document']->value['short_text'],200);?>
</td>
        <td><?php if ($_smarty_tpl->tpl_vars['document']->value['is_folder']==1){?>папка<?php }else{ ?>документ<?php }?></td>    
        <td><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php if ($_smarty_tpl->tpl_vars['document']->value['is_folder']==1){?>edit_folder<?php }else{ ?>edit<?php }?>&id=<?php echo $_smarty_tpl->tpl_vars['document']->value['id'];?>
">редактировать</a><br />
            <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php if ($_smarty_tpl->tpl_vars['document']->value['is_folder']==1){?>del_folder<?php }else{ ?>del<?php }?>&id=<?php echo $_smarty_tpl->tpl_vars['document']->value['id'];?>
">удалить</a></td>
    </tr>
<?php }} ?>
</table>
<?php }?>

<br />
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add_folder">Добавить папку</a><br />
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add">Добавить документ</a>

<?php }?>