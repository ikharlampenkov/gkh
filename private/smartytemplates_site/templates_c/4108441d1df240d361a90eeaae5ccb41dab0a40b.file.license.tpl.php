<?php /* Smarty version Smarty-3.0.7, created on 2011-05-30 00:35:42
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/license.tpl" */ ?>
<?php /*%%SmartyHeaderCode:295334de283ee314c02-46844844%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4108441d1df240d361a90eeaae5ccb41dab0a40b' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/license.tpl',
      1 => 1306690538,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '295334de283ee314c02-46844844',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_truncate')) include 'H:\www\gkh\private\classes\smarty\plugins\modifier.truncate.php';
?><h1>Лицензии</h1>

<?php if ($_smarty_tpl->getVariable('license_list')->value!==false){?>
<table>
<?php  $_smarty_tpl->tpl_vars['license'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('license_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['license']->key => $_smarty_tpl->tpl_vars['license']->value){
?>
    <tr>
        <td>
        <?php if ($_smarty_tpl->tpl_vars['license']->value['img_prew']){?><img src="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->tpl_vars['license']->value['img_prew'];?>
" alt="<?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['license']->value['description'],50);?>
" /><?php }else{ ?>&nbsp;<?php }?><br />
        <div><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['license']->value['description'],50);?>
</div>
        </td>
    </tr>
<?php }} ?>
</table>
<?php }?>