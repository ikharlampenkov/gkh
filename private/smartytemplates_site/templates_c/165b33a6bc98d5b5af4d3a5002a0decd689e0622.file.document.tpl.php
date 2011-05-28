<?php /* Smarty version Smarty-3.0.7, created on 2011-05-28 14:10:33
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/admin/document.tpl" */ ?>
<?php /*%%SmartyHeaderCode:319344de09fe9568ba6-57904921%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '165b33a6bc98d5b5af4d3a5002a0decd689e0622' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/admin/document.tpl',
      1 => 1306566627,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '319344de09fe9568ba6-57904921',
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

<?php if (isset($_smarty_tpl->getVariable('path_to_document',null,true,false)->value)){?>
<div>
    <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
">..</a> / 
<?php unset($_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['name'] = 'path_doc';
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['loop'] = is_array($_loop=count($_smarty_tpl->getVariable('path_to_document')->value)) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['step'] = ((int)-1) == 0 ? 1 : (int)-1;
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['show'] = true;
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['max'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['loop'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['start'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['step'] > 0 ? 0 : $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['loop']-1;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['show']) {
    $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['total'] = min(ceil(($_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['step'] > 0 ? $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['loop'] - $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['start'] : $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['start']+1)/abs($_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['step'])), $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['max']);
    if ($_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['total'] == 0)
        $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['show'] = false;
} else
    $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['total'] = 0;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['show']):

            for ($_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['index'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['start'], $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['iteration'] = 1;
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['iteration'] <= $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['total'];
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['index'] += $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['step'], $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['iteration']++):
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['rownum'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['iteration'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['index_prev'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['index'] - $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['index_next'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['index'] + $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['first']      = ($_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['iteration'] == 1);
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['last']       = ($_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['iteration'] == $_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['total']);
?>
    <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&root=<?php echo $_smarty_tpl->getVariable('path_to_document')->value[$_smarty_tpl->getVariable('smarty')->value['section']['path_doc']['index']]['id'];?>
"><?php echo $_smarty_tpl->getVariable('path_to_document')->value[$_smarty_tpl->getVariable('smarty')->value['section']['path_doc']['index']]['title'];?>
</a><?php if (!$_smarty_tpl->getVariable('smarty')->value['section']['path_doc']['last']){?> / <?php }?>
<?php endfor; endif; ?>    
</div><br />
<?php }?>

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
        <td><?php if ($_smarty_tpl->tpl_vars['document']->value['is_folder']==1){?><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&root=<?php echo $_smarty_tpl->tpl_vars['document']->value['id'];?>
"><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['document']->value['title'],100);?>
</a><?php }else{ ?><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['document']->value['title'],100);?>
<?php }?></td>
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