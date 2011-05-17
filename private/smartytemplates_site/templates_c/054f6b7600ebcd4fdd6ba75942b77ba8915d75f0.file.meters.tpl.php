<?php /* Smarty version Smarty-3.0.7, created on 2011-05-16 22:52:33
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/cabinet/meters.tpl" */ ?>
<?php /*%%SmartyHeaderCode:191974dd148412df173-35301561%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '054f6b7600ebcd4fdd6ba75942b77ba8915d75f0' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/cabinet/meters.tpl',
      1 => 1305561150,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '191974dd148412df173-35301561',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<h1>Показания счетчиков</h1>

<?php if ($_smarty_tpl->getVariable('meters')->value!==false){?>

<form action="?page=<?php echo $_smarty_tpl->getVariable('page')->value;?>
" method="post">
    <table>
        <tr>
            <td width="200">Счетчик</td>
            <td>Показания (предыдущее/текущее значение)</td>
        </tr>
        <?php  $_smarty_tpl->tpl_vars['meter'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('meters')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['meter']->key => $_smarty_tpl->tpl_vars['meter']->value){
?>
        <tr>
            <td width="200"><?php echo $_smarty_tpl->tpl_vars['meter']->value['title'];?>
</td>
            <td><?php echo $_smarty_tpl->tpl_vars['meter']->value['prev_value']['value'];?>
/&nbsp; <input type="text" name="data[<?php echo $_smarty_tpl->tpl_vars['meter']->value['id'];?>
][value]" value="<?php echo $_smarty_tpl->tpl_vars['meter']->value['cur_value']['value'];?>
" style="width: 60px;" />
                <input type="hidden" name="data[<?php echo $_smarty_tpl->tpl_vars['meter']->value['id'];?>
][date]" value="<?php echo $_smarty_tpl->tpl_vars['meter']->value['cur_value']['date'];?>
" /></td>
        </tr>
        <?php }} ?>
    </table>
    
    
    <input id="save" name="save" type="submit" value="Сохранить" />
</form>

<?php }else{ ?>
У Вас нет счетчиков
<?php }?>