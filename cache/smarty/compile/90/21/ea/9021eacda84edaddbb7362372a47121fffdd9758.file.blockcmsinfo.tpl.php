<?php /* Smarty version Smarty-3.1.19, created on 2016-03-09 15:10:38
         compiled from "/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/modules/blockcmsinfo/blockcmsinfo.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3833893456e03cee71c9d4-95697130%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9021eacda84edaddbb7362372a47121fffdd9758' => 
    array (
      0 => '/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/modules/blockcmsinfo/blockcmsinfo.tpl',
      1 => 1448561400,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3833893456e03cee71c9d4-95697130',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'infos' => 0,
    'info' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56e03cee769966_45997997',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56e03cee769966_45997997')) {function content_56e03cee769966_45997997($_smarty_tpl) {?>
<?php if (count($_smarty_tpl->tpl_vars['infos']->value)>0) {?>
<!-- MODULE Block cmsinfo -->
<div id="cmsinfo_block">
		<?php  $_smarty_tpl->tpl_vars['info'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['info']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['infos']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['info']->key => $_smarty_tpl->tpl_vars['info']->value) {
$_smarty_tpl->tpl_vars['info']->_loop = true;
?>
			<div class="col-xs-6"><?php echo $_smarty_tpl->tpl_vars['info']->value['text'];?>
</div>
		<?php } ?>
</div>
<!-- /MODULE Block cmsinfo -->
<?php }?><?php }} ?>
