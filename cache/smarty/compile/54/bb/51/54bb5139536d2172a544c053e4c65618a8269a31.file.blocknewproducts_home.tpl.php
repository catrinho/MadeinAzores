<?php /* Smarty version Smarty-3.1.19, created on 2016-03-09 15:10:38
         compiled from "/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/modules/blocknewproducts/views/templates/hook/blocknewproducts_home.tpl" */ ?>
<?php /*%%SmartyHeaderCode:31798456e03cee9cf8a5-46871328%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '54bb5139536d2172a544c053e4c65618a8269a31' => 
    array (
      0 => '/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/modules/blocknewproducts/views/templates/hook/blocknewproducts_home.tpl',
      1 => 1448561400,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '31798456e03cee9cf8a5-46871328',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'new_products' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56e03ceea29387_40684351',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56e03ceea29387_40684351')) {function content_56e03ceea29387_40684351($_smarty_tpl) {?>
<?php if (isset($_smarty_tpl->tpl_vars['new_products']->value)&&$_smarty_tpl->tpl_vars['new_products']->value) {?>
	<?php echo $_smarty_tpl->getSubTemplate (((string)$_smarty_tpl->tpl_vars['tpl_dir']->value)."./product-list.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('products'=>$_smarty_tpl->tpl_vars['new_products']->value,'class'=>'blocknewproducts tab-pane','id'=>'blocknewproducts'), 0);?>

<?php } else { ?>
<ul id="blocknewproducts" class="blocknewproducts tab-pane">
	<li class="alert alert-info"><?php echo smartyTranslate(array('s'=>'No new products at this time.','mod'=>'blocknewproducts'),$_smarty_tpl);?>
</li>
</ul>
<?php }?>
<?php }} ?>
