<?php /* Smarty version Smarty-3.0.7, created on 2011-05-30 00:30:33
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/personal.tpl" */ ?>
<?php /*%%SmartyHeaderCode:93674de282b95052a1-43501895%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5e8bf5ff116d035245edd614d1706076d668f57d' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/personal.tpl',
      1 => 1306690229,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '93674de282b95052a1-43501895',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<h1><?php echo $_smarty_tpl->getVariable('personal_title')->value;?>
</h1>

<?php if ($_smarty_tpl->getVariable('personal_list')->value!==false){?>
<table>
    <tr>
       <td>Фото</td>
       <td>ФИО</td>
       <td>Отдел</td>
       <td>Должность</td>
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
    </tr>
<?php }} ?>
</table>
<?php }?>