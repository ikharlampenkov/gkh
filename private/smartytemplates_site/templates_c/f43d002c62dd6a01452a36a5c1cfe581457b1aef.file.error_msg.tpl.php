<?php /* Smarty version Smarty-3.0.7, created on 2011-06-06 21:38:30
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/error_msg.tpl" */ ?>
<?php /*%%SmartyHeaderCode:268694de09ed93ca691-72237888%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f43d002c62dd6a01452a36a5c1cfe581457b1aef' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/error_msg.tpl',
      1 => 1304440380,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '268694de09ed93ca691-72237888',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_smarty_tpl->getVariable('exception')->value){?>
<script>
function closeErrorMsg()
{
 o_errorblock = document.getElementById("errorblock");
 o_errorblock.style.display = "none";
}
</script>
<div style="background-color:#ffffd7; border : 1px solid Black; font-size:12px; color:#000000; width:400px;" id="errorblock">
<div>Сообщение об ошибке: <?php echo $_smarty_tpl->getVariable('e_message')->value;?>
</div>
<div>Код ошибки: <?php echo $_smarty_tpl->getVariable('e_code')->value;?>
</div>
<input type="button" value="Закрыть" onclick="closeErrorMsg();">
</div>
<?php }?>