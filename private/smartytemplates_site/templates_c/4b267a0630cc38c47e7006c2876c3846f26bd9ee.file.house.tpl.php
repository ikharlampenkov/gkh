<?php /* Smarty version Smarty-3.0.7, created on 2011-05-23 18:53:52
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/house.tpl" */ ?>
<?php /*%%SmartyHeaderCode:249134dda4ad0a596d5-76475244%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4b267a0630cc38c47e7006c2876c3846f26bd9ee' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/house.tpl',
      1 => 1306151628,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '249134dda4ad0a596d5-76475244',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<h1>Дома</h1>

<?php if ($_smarty_tpl->getVariable('action')->value=="view"){?>

<h4>Дом </h4>

<div>
    <?php if (!empty($_smarty_tpl->getVariable('house',null,true,false)->value['file_repair_plan'])){?>
    <a href="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->getVariable('house')->value['file_repair_plan'];?>
" target="_blank">План работ по содержанию и ремонту</a><br /><br />
    <?php }?>
    
    <?php if (!empty($_smarty_tpl->getVariable('house',null,true,false)->value['file_costs_income'])){?>
    <a href="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->getVariable('house')->value['file_costs_income'];?>
" target="_blank">Доходы и расходы</a><br /><br />
    <?php }?> 
    
    <?php if (!empty($_smarty_tpl->getVariable('house',null,true,false)->value['file_performed_repair'])){?>
    <a href="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->getVariable('house')->value['file_performed_repair'];?>
">Выполненные работы</a><br /><br />
    <?php }?>
</div>

<a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
" >Весь список</a>

<?php }else{ ?>

<?php  $_smarty_tpl->tpl_vars['street'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('house_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['_house_list']['index']=-1;
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['street']->key => $_smarty_tpl->tpl_vars['street']->value){
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['_house_list']['index']++;
?>
<div>
    <span><?php echo $_smarty_tpl->tpl_vars['street']->value['street'];?>
</span>&nbsp;<span><a href="javascript:showHouse(<?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['_house_list']['index'];?>
)">дома</a></span>
</div>
<div id="house_<?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['_house_list']['index'];?>
" style="display: none;">
<?php  $_smarty_tpl->tpl_vars['house'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['street']->value['houses']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['house']->key => $_smarty_tpl->tpl_vars['house']->value){
?>
    <div><a href="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
&action=view&id=<?php echo $_smarty_tpl->tpl_vars['house']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['house']->value['number'];?>
<?php echo $_smarty_tpl->tpl_vars['house']->value['subnumber'];?>
</a></div>
<?php }} ?>
</div>
<?php }} ?>

<?php }?>