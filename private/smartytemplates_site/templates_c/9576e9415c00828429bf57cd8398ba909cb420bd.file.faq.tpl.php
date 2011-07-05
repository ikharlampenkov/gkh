<?php /* Smarty version Smarty-3.0.7, created on 2011-07-05 23:31:54
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/admin/faq.tpl" */ ?>
<?php /*%%SmartyHeaderCode:326354e133c7a5ea554-29806257%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9576e9415c00828429bf57cd8398ba909cb420bd' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/admin/faq.tpl',
      1 => 1309819860,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '326354e133c7a5ea554-29806257',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_truncate')) include 'H:\www\gkh\private\classes\smarty\plugins\modifier.truncate.php';
?><div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Вопросы и ответы</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>

<?php if ($_smarty_tpl->getVariable('action')->value=="add"||$_smarty_tpl->getVariable('action')->value=="edit"){?>
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
"><< Назад</a> 
<h2><?php echo $_smarty_tpl->getVariable('txt')->value;?>
</h2>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php echo $_smarty_tpl->getVariable('action')->value;?>
&id=<?php if ($_smarty_tpl->getVariable('action')->value=="edit"){?><?php echo $_smarty_tpl->getVariable('faq')->value['id'];?>
<?php }?>" method="post" enctype="multipart/form-data">
    <table>
        <tr class="pem">
            <td width="200" >Вопрос</td>
            <td><input name="data[question]" value="<?php echo $_smarty_tpl->getVariable('faq')->value['question'];?>
" /></td>
        </tr>
        <tr class="pem">
            <td>Ответ</td>
            <td><textarea name="data[answer]"><?php echo $_smarty_tpl->getVariable('faq')->value['answer'];?>
</textarea></td>
        </tr>
        <tr class="pem">
            <td>Родительский элемент</td>
            <td><select name="data[parrent_id]">
                    <option value="0" <?php if (isset($_smarty_tpl->getVariable('faq',null,true,false)->value['parent_id'])&&$_smarty_tpl->getVariable('faq')->value['parent_id']==0){?>selected="selected"<?php }?>>корень</option>
                    <?php  $_smarty_tpl->tpl_vars['folder'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('folder_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['folder']->key => $_smarty_tpl->tpl_vars['folder']->value){
?>
                    <option value="<?php echo $_smarty_tpl->tpl_vars['folder']->value['id'];?>
" <?php if (isset($_smarty_tpl->getVariable('faq',null,true,false)->value['parent_id'])&&$_smarty_tpl->getVariable('faq')->value['parent_id']==$_smarty_tpl->tpl_vars['folder']->value['id']){?>selected="selected"<?php }?>><?php echo $_smarty_tpl->tpl_vars['folder']->value['question'];?>
</option>
                    <?php }} ?>
                </select></td>
        </tr>
        <tr class="pem">
            <td>Жизненные ситуации</td>
            <td><input type="checkbox" name="data[is_situation]" <?php if (isset($_smarty_tpl->getVariable('faq',null,true,false)->value['is_situation'])&&$_smarty_tpl->getVariable('faq')->value['is_situation']){?>checked="checked"<?php }?> style="width: 14px;" /></td>
        </tr>
    </table>
    <input type="hidden" name="data[is_folder]" value="0" />
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<?php }elseif($_smarty_tpl->getVariable('action')->value=="add_folder"||$_smarty_tpl->getVariable('action')->value=="edit_folder"){?>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php echo $_smarty_tpl->getVariable('action')->value;?>
&id=<?php if ($_smarty_tpl->getVariable('action')->value=="edit_folder"){?><?php echo $_smarty_tpl->getVariable('faq')->value['id'];?>
<?php }?>" method="post" enctype="multipart/form-data">
    <table>
        <tr class="pem">
            <td width="200">Название</td>
            <td><input name="data[question]" value="<?php echo $_smarty_tpl->getVariable('faq')->value['question'];?>
" /></td>
        </tr>
        <tr class="pem">
            <td>Родительский элемент</td>
            <td><select name="data[parrent_id]">
                    <option value="0" <?php if (isset($_smarty_tpl->getVariable('faq',null,true,false)->value['parent_id'])&&$_smarty_tpl->getVariable('faq')->value['parent_id']==0){?>selected="selected"<?php }?>>корень</option>
                    <?php  $_smarty_tpl->tpl_vars['folder'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('folder_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['folder']->key => $_smarty_tpl->tpl_vars['folder']->value){
?>
                    <option value="<?php echo $_smarty_tpl->tpl_vars['folder']->value['id'];?>
" <?php if (isset($_smarty_tpl->getVariable('faq',null,true,false)->value['parent_id'])&&$_smarty_tpl->getVariable('faq')->value['parent_id']==$_smarty_tpl->tpl_vars['folder']->value['id']){?>selected="selected"<?php }?>><?php echo $_smarty_tpl->tpl_vars['folder']->value['question'];?>
</option>
                    <?php }} ?>
                </select></td>
        </tr>
    </table>
    <input type="hidden" name="data[answer]" value="" />
    <input type="hidden" name="data[is_folder]" value="1" />
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<?php }else{ ?>
<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add_folder">ДОБАВИТЬ ПАПКУ</a> / <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add">ДОБАВИТЬ ДОКУМЕНТ</a>
</td>
</table>
<?php if (isset($_smarty_tpl->getVariable('path_to_faq',null,true,false)->value)){?>
<div>
    <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
"><< Назад</a> 
<?php unset($_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['name'] = 'path_doc';
$_smarty_tpl->tpl_vars['smarty']->value['section']['path_doc']['loop'] = is_array($_loop=count($_smarty_tpl->getVariable('path_to_faq')->value)) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
&root=<?php echo $_smarty_tpl->getVariable('path_to_faq')->value[$_smarty_tpl->getVariable('smarty')->value['section']['path_doc']['index']]['id'];?>
"><?php echo $_smarty_tpl->getVariable('path_to_faq')->value[$_smarty_tpl->getVariable('smarty')->value['section']['path_doc']['index']]['question'];?>
</a><?php if (!$_smarty_tpl->getVariable('smarty')->value['section']['path_doc']['last']){?> / <?php }?>
<?php endfor; endif; ?>    
</div><br />
<?php }?>

<?php if ($_smarty_tpl->getVariable('faq_list')->value!==false){?>
<table width="100%" cellpadding="5" cellspacing="2" style="font-size: 14px">
    <tr>
       <td class="pum">Вопрос</td>
       <td class="pum">Ответ</td>
       <td class="pum">Тип</td>
       <td>&nbsp;</td>
    </tr>
<?php  $_smarty_tpl->tpl_vars['faq'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('faq_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['faq']->key => $_smarty_tpl->tpl_vars['faq']->value){
?>
    <tr>
        <td class="pem"><?php if ($_smarty_tpl->tpl_vars['faq']->value['is_folder']==1){?><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&root=<?php echo $_smarty_tpl->tpl_vars['faq']->value['id'];?>
"><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['faq']->value['question'],100);?>
</a><?php }else{ ?><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['faq']->value['question'],100);?>
<?php }?></td>
	<td class="pem"><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['faq']->value['answer'],200);?>
</td>
        <td class="pem"><?php if ($_smarty_tpl->tpl_vars['faq']->value['is_folder']==1){?>папка<?php }else{ ?>документ<?php }?></td>    
        <td class="pom"><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php if ($_smarty_tpl->tpl_vars['faq']->value['is_folder']==1){?>edit_folder<?php }else{ ?>edit<?php }?>&id=<?php echo $_smarty_tpl->tpl_vars['faq']->value['id'];?>
">редактировать</a></td>
        <td class="pom">    <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=<?php if ($_smarty_tpl->tpl_vars['faq']->value['is_folder']==1){?>del_folder<?php }else{ ?>del<?php }?>&id=<?php echo $_smarty_tpl->tpl_vars['faq']->value['id'];?>
">удалить</a></td>
    </tr>
<?php }} ?>
</table>
<?php }?>

<table cellpadding="5" border="0" style="font-size:14px;">
<td class="pom" align="center">
<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add_folder">ДОБАВИТЬ ПАПКУ</a> / <a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=add">ДОБАВИТЬ ДОКУМЕНТ</a>
</td>
</table>

<?php }?>