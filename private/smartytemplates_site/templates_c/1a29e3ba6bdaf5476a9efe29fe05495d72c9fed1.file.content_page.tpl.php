<?php /* Smarty version Smarty-3.0.7, created on 2011-05-17 22:34:10
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/admin/content_page.tpl" */ ?>
<?php /*%%SmartyHeaderCode:62864dd29572703602-63407882%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1a29e3ba6bdaf5476a9efe29fe05495d72c9fed1' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/admin/content_page.tpl',
      1 => 1305646399,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '62864dd29572703602-63407882',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<h1>Контентные страницы</h1>


<?php if ($_smarty_tpl->getVariable('action')->value=="add"||$_smarty_tpl->getVariable('action')->value=="edit"){?>

<h2><?php echo $_smarty_tpl->getVariable('txt')->value;?>
</h2>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php echo $_smarty_tpl->getVariable('action')->value;?>
<?php if ('edit'){?>&id=<?php echo $_smarty_tpl->getVariable('conpage')->value['id'];?>
<?php }?>" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="200">Название страницы (англ)</td>
            <td><input name="data[page_title]" value="<?php echo $_smarty_tpl->getVariable('conpage')->value['page_title'];?>
" /></td>
        </tr>
        <tr>
            <td>Название страницы</td>
            <td><input name="data[title]" value="<?php echo $_smarty_tpl->getVariable('conpage')->value['title'];?>
" /></td>
        </tr>
        <tr>
            <td>Текст</td>
            <td><textarea name="data[content]"><?php echo $_smarty_tpl->getVariable('conpage')->value['content'];?>
</textarea></td>
        </tr>
        <tr>
            <td>Прикрепить файл</td>
            <td>
                <?php if ($_smarty_tpl->getVariable('conpage')->value['file']){?><a href="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->getVariable('conpage')->value['file'];?>
" target="_blank">Файл</a>&nbsp;<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=del_pic&id=<?php echo $_smarty_tpl->getVariable('conpage')->value['id'];?>
">удалить</a> <?php }?>
                <input type="file" name="file" />
            </td>
        
        </tr>
    </table>
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<?php }else{ ?>

<?php if ($_smarty_tpl->getVariable('conpage_list')->value!==false){?>
<table>
<?php  $_smarty_tpl->tpl_vars['conpage'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('conpage_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['conpage']->key => $_smarty_tpl->tpl_vars['conpage']->value){
?>
    <tr>
        <td><?php echo $_smarty_tpl->tpl_vars['conpage']->value['page_title'];?>
</td>
        <td><?php echo $_smarty_tpl->tpl_vars['conpage']->value['title'];?>
</td>
        <td><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=edit&id=<?php echo $_smarty_tpl->tpl_vars['conpage']->value['id'];?>
">редактировать</a><br /><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=del&id=<?php echo $_smarty_tpl->tpl_vars['conpage']->value['id'];?>
">удалить</a> </td>
    </tr>
<?php }} ?>
</table>
<?php }?>

<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add">добавить</a>

<?php }?>