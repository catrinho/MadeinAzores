<?php /* Smarty version Smarty-3.1.19, created on 2016-03-09 15:10:40
         compiled from "/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/themes/madeinazores-2016SS_v0.1/modules/blockuserinfo/nav.tpl" */ ?>
<?php /*%%SmartyHeaderCode:16057762556e03cf04f4163-41276084%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6d7b0f8f79db918c161140aa61c4f3127d636d26' => 
    array (
      0 => '/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/themes/madeinazores-2016SS_v0.1/modules/blockuserinfo/nav.tpl',
      1 => 1457284745,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16057762556e03cf04f4163-41276084',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'is_logged' => 0,
    'link' => 0,
    'cookie' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56e03cf05be106_55217534',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56e03cf05be106_55217534')) {function content_56e03cf05be106_55217534($_smarty_tpl) {?><!-- Block user information module NAV  -->

<div class="header_user_info">
	<?php if ($_smarty_tpl->tpl_vars['is_logged']->value) {?>
		
		<a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink('my-account',true), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'View my customer account','mod'=>'blockuserinfo'),$_smarty_tpl);?>
" class="account" rel="nofollow"><span><?php echo $_smarty_tpl->tpl_vars['cookie']->value->customer_firstname;?>
 <?php echo $_smarty_tpl->tpl_vars['cookie']->value->customer_lastname;?>
</span></a>
	
	<?php } else { ?>
		<a class="login" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink('my-account',true), ENT_QUOTES, 'UTF-8', true);?>
" rel="nofollow" title="<?php echo smartyTranslate(array('s'=>'Log in to your customer account','mod'=>'blockuserinfo'),$_smarty_tpl);?>
">
			<?php echo smartyTranslate(array('s'=>'Sign in','mod'=>'blockuserinfo'),$_smarty_tpl);?>

		</a>
	<?php }?>
</div>
<!-- /Block usmodule NAV -->
<?php }} ?>
