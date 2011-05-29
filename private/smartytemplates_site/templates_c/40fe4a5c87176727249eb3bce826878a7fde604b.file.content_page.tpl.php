<?php /* Smarty version Smarty-3.0.7, created on 2011-05-29 20:28:14
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/content_page.tpl" */ ?>
<?php /*%%SmartyHeaderCode:67024de249ee94d533-69480054%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '40fe4a5c87176727249eb3bce826878a7fde604b' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/content_page.tpl',
      1 => 1305907054,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '67024de249ee94d533-69480054',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<h1><?php echo $_smarty_tpl->getVariable('conpage')->value['title'];?>
</h1>

<div><?php echo nl2br($_smarty_tpl->getVariable('conpage')->value['content']);?>
</div>

<?php if (isset($_smarty_tpl->getVariable('conpage',null,true,false)->value['file_list'])&&$_smarty_tpl->getVariable('conpage')->value['file_list']!==false){?>
<?php  $_smarty_tpl->tpl_vars['file'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('conpage')->value['file_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['_file']['iteration']=0;
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['file']->key => $_smarty_tpl->tpl_vars['file']->value){
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['_file']['iteration']++;
?>
<a href="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->tpl_vars['file']->value;?>
" target="_blank">Файл <?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['_file']['iteration'];?>
</a><br /><br /> 
<?php }} ?>
<?php }?>