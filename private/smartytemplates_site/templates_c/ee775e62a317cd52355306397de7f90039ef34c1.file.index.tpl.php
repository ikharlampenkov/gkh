<?php /* Smarty version Smarty-3.0.7, created on 2011-05-18 12:04:10
         compiled from "H:/www/gkh/private/smartytemplates_site/templates/cabinet/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:23264dd3534a589020-97789359%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ee775e62a317cd52355306397de7f90039ef34c1' => 
    array (
      0 => 'H:/www/gkh/private/smartytemplates_site/templates/cabinet/index.tpl',
      1 => 1305695047,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '23264dd3534a589020-97789359',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8"></meta>
<meta name="DESCRIPTION" content="<?php echo $_smarty_tpl->getVariable('description')->value;?>
"></meta>
<meta name="keywords" content="<?php echo $_smarty_tpl->getVariable('keywords')->value;?>
"></meta>
<meta name="author-corporate" content=""></meta>
<meta name="publisher-email" content=""></meta>

<style type="text/css">
table {
    width: 100%;
}

tr {
   vertical-align: top;
}

input {
    width: 100%;
}

textarea {
    width: 100%;
    height: 200px;
}

#save {
    width: 100px;
}

</style>

<script type="text/javascript" language="javascript" src="/js/main.js" ></script>

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
                <td>Сайт управляющей компании
                    <br /><br /><b>Личный кабинет</b>
                </td>
                <td width="300">

                    <div><?php echo $_smarty_tpl->getVariable('user')->value;?>
</div> <a href="<?php echo $_smarty_tpl->getVariable('siteurl')->value;?>
?logout">Выйти</a>

                </td>
            </tr>
        </table>


    </td>
  </tr>
  <tr>
    <td>

        <table border="1" width="100">
            <tr>
                <td width="230">

                    <a href="?page=receipt">Электронная квитанция</a><br /><br />
                    <a href="?page=balance">Баланс платежей</a><br /><br />
                    <a href="?page=meters">Показания счетчиков</a><br /><br />
                    <a href="?page=payment">Оплата услуг</a><br /><br />
                    <a href="?page=support&category=request_master">Заявка на вызов мастера</a><br /><br />
                    <a href="?page=support&category=question">Задать вопрос</a><br /><br />
                </td>
                <td>

                    <?php if (isset($_smarty_tpl->getVariable('page',null,true,false)->value)&&!empty($_smarty_tpl->getVariable('page',null,true,false)->value)){?>
                        <?php $_template = new Smarty_Internal_Template("cabinet/".($_smarty_tpl->getVariable('page')->value).".tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php unset($_template);?>                        
                    <?php }?>

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