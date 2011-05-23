<?php /* Smarty version Smarty-3.0.7, created on 2011-05-23 20:43:50
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:114754dda649660ab03-18620626%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '06f23a46aed9fc3af496589adff00c09fe8f7897' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/index.tpl',
      1 => 1306158220,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '114754dda649660ab03-18620626',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_date_format')) include 'H:\www\gkh\private\classes\smarty\plugins\modifier.date_format.php';
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8"></meta>
        <meta name="DESCRIPTION" content="<?php echo $_smarty_tpl->getVariable('description')->value;?>
"></meta>
        <meta name="keywords" content="<?php echo $_smarty_tpl->getVariable('keywords')->value;?>
"></meta>
        <meta name="author-corporate" content=""></meta>
        <meta name="publisher-email" content=""></meta>
        <script type="text/javascript" language="javascript" src="/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="/js/main.js" ></script>

        <style >
            input {
    width: 99%;
}

            textarea {
    width: 99%;
}
        </style>

        <title><?php echo $_smarty_tpl->getVariable('title')->value;?>
</title>

    </head>
    <body>
<?php $_template = new Smarty_Internal_Template("error_msg.tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php unset($_template);?>

        <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1">
            <tr>
                <td valign="top" height="150">

                    <table width="100%" height="150" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>Сайт управляющей компании</td>
                            <td width="300">

                                <div style="text-align:center; vertical-align:middle;">
                                    <div style="border:1px solid black; width:250px; height:120px; padding:10px; text-align:left;">
<?php if (isset($_smarty_tpl->getVariable('login_fail',null,true,false)->value)){?><div style="color:red; font-weight:bold; font-size:12px;">Вы ввели неправильный логин и пароль!</div><?php }?>
                                        <form method="post" style="margin:0px; padding:0px;">
                                            <div><span style="width:70px">Логин: </span><input name="login" type="text" style="width:150px;"></div>
                                            <div><span style="width:70px">Пароль: </span><input name="psw" type="password" style="width:150px;"></div>
                                            <div><input type="submit" value="Войти" style="width:70px;"></div>
                                        </form>
                                    </div>
                                </div>

                            </td>
                        </tr>
                    </table>


                </td>
            </tr>
            <tr>
                <td>        
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr valign="top">
                            <td>
                            <?php if (isset($_smarty_tpl->getVariable('page',null,true,false)->value)&&!empty($_smarty_tpl->getVariable('page',null,true,false)->value)){?>
                                <?php $_template = new Smarty_Internal_Template(($_smarty_tpl->getVariable('page')->value).".tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php unset($_template);?>  
                            <?php }else{ ?>
                                Главная страница<br /><br/><br /><br/>
                                
                                <a href="?page=content_page&title=eltechrab">Электротехнические работы</a><br /><br/>
                                <a href="?page=content_page&title=santechrab">Сантехнические работы</a><br /><br/>
                                <a href="?page=house">Дома</a><br /><br/>
                                <a href="?page=document">Документы</a><br /><br />
                            <?php }?>
                            </td>
                            <td width="250">
                                <h3>Новости</h3>

                                <?php  $_smarty_tpl->tpl_vars['news'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('news_list')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['news']->key => $_smarty_tpl->tpl_vars['news']->value){
?>
                                <div><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['news']->value['date'],"%d.%m.%Y");?>
&nbsp;<?php echo $_smarty_tpl->tpl_vars['news']->value['title'];?>
</div>
                                <div><?php echo $_smarty_tpl->tpl_vars['news']->value['short_text'];?>
</div>
                                <?php if ($_smarty_tpl->tpl_vars['news']->value['full_text']){?><a href="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
?page=news&action=view_news&id=<?php echo $_smarty_tpl->tpl_vars['news']->value['id'];?>
&category=<?php echo $_smarty_tpl->tpl_vars['news']->value['news_category_id'];?>
">подробнее...</a><br/><?php }?>
                                <br/>
                                <?php }} ?>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="40">&nbsp;</td>
            </tr>
        </table>



    </body>
</html>