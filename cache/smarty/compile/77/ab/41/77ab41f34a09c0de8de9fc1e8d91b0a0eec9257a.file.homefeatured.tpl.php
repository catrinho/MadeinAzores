<?php /* Smarty version Smarty-3.1.19, created on 2016-02-28 17:15:53
         compiled from "/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/themes/madeinazores-2016SS_v0.1/modules/homefeatured/homefeatured.tpl" */ ?>
<?php /*%%SmartyHeaderCode:68296899256d32b49cc7c41-82222213%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '77ab41f34a09c0de8de9fc1e8d91b0a0eec9257a' => 
    array (
      0 => '/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/themes/madeinazores-2016SS_v0.1/modules/homefeatured/homefeatured.tpl',
      1 => 1456673807,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '68296899256d32b49cc7c41-82222213',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'products' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56d32b49d19092_38961130',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56d32b49d19092_38961130')) {function content_56d32b49d19092_38961130($_smarty_tpl) {?>
<?php if (isset($_smarty_tpl->tpl_vars['products']->value)&&$_smarty_tpl->tpl_vars['products']->value) {?>
	<h1 class="h2"><?php echo smartyTranslate(array('s'=>'Feature Products','mod'=>'homefeatured'),$_smarty_tpl);?>
</h1>
	<?php echo $_smarty_tpl->getSubTemplate (((string)$_smarty_tpl->tpl_vars['tpl_dir']->value)."./product-list.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('class'=>'homefeatured tab-pane','id'=>'homefeatured'), 0);?>

<?php } else { ?>

<?php }?><?php }} ?>
