<?php /* Smarty version Smarty-3.0.7, created on 2011-06-27 00:04:51
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/cabinet/house.tpl" */ ?>
<?php /*%%SmartyHeaderCode:108714e0766b37199d8-61605321%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'db85a9669cd515d3fce7717964cad848895ae374' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/cabinet/house.tpl',
      1 => 1309107537,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '108714e0766b37199d8-61605321',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<div style="color: #838383; font-size: 21px; border-bottom: 2px solid #89b4be; padding-bottom: 10px;">Дома</div>
<div style="font-size: 5px; border-top: 1px dashed #89b4be; margin-top: 1px; ">&nbsp;</div>

<br/>
<div><b>Выберите улицу:</b></div><br/><br/>

<?php if ($_smarty_tpl->getVariable('action')->value=="view"){?>

<h4>Дом </h4>

<div>
    <?php if (!empty($_smarty_tpl->getVariable('house',null,true,false)->value['file_repair_plan'])){?>
    <a href="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
temp_files/<?php echo $_smarty_tpl->getVariable('house')->value['file_repair_plan'];?>
" target="_blank">План работ по содержанию и ремонту</a><br /><br />
    <?php }?>




</div>


<?php }else{ ?>

<table width="100%">
    <tr valign="top">
<?php  $_smarty_tpl->tpl_vars['street'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('house_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['_house_list']['iteration']=0;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['_house_list']['index']=-1;
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['street']->key => $_smarty_tpl->tpl_vars['street']->value){
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['_house_list']['iteration']++;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['_house_list']['index']++;
?>
        <td>
            <span><a href="javascript:showHouse(<?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['_house_list']['index'];?>
)"><?php echo $_smarty_tpl->tpl_vars['street']->value['street'];?>
</a></span>
            <div id="house_<?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['_house_list']['index'];?>
" style="display: none;">
                <table border="1">
                    <tr>
                        <td>Номер</td>
                        <td>Буква</td>
                        <td>Площадь</td>
                    </tr>
<?php  $_smarty_tpl->tpl_vars['house'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['street']->value['houses']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['house']->key => $_smarty_tpl->tpl_vars['house']->value){
?>
                    <tr>
                        <td><?php echo $_smarty_tpl->tpl_vars['house']->value['number'];?>
</td>
                        <td><?php echo $_smarty_tpl->tpl_vars['house']->value['subnumber'];?>
</td>
                        <td><?php echo $_smarty_tpl->tpl_vars['house']->value['area'];?>
</td>
                    </tr>
<?php }} ?>
                </table>
            </div>
        </td>
        <?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['_house_list']['iteration']%3==0){?></tr><tr valign="top"><?php }?>
<?php }} ?>
    </tr>
</table>

<?php }?>