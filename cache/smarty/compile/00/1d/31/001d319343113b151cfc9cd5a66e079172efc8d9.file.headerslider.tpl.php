<?php /* Smarty version Smarty-3.1.19, created on 2016-03-18 20:08:42
         compiled from "/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/themes/madeinazores-2016SS_v0.1/modules/headerslider/headerslider.tpl" */ ?>
<?php /*%%SmartyHeaderCode:48732011756e03cefe10008-03526482%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '001d319343113b151cfc9cd5a66e079172efc8d9' => 
    array (
      0 => '/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/themes/madeinazores-2016SS_v0.1/modules/headerslider/headerslider.tpl',
      1 => 1458331716,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '48732011756e03cefe10008-03526482',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56e03cf0038c55_17351848',
  'variables' => 
  array (
    'page_name' => 0,
    'headerslider_slides' => 0,
    'slide' => 0,
    'link' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56e03cf0038c55_17351848')) {function content_56e03cf0038c55_17351848($_smarty_tpl) {?>

<?php if ($_smarty_tpl->tpl_vars['page_name']->value=='index') {?>
<!-- Module HeaderSlider -->

<?php if (isset($_smarty_tpl->tpl_vars['headerslider_slides']->value)) {?>
		<div id="headerpage-slider">
			<?php if (isset($_smarty_tpl->tpl_vars['headerslider_slides']->value[0])&&isset($_smarty_tpl->tpl_vars['headerslider_slides']->value[0]['sizes'][1])) {?><?php $_smarty_tpl->_capture_stack[0][] = array('height', null, null); ob_start(); ?><?php echo $_smarty_tpl->tpl_vars['headerslider_slides']->value[0]['sizes'][1];?>
<?php list($_capture_buffer, $_capture_assign, $_capture_append) = array_pop($_smarty_tpl->_capture_stack[0]);
if (!empty($_capture_buffer)) {
 if (isset($_capture_assign)) $_smarty_tpl->assign($_capture_assign, ob_get_contents());
 if (isset( $_capture_append)) $_smarty_tpl->append( $_capture_append, ob_get_contents());
 Smarty::$_smarty_vars['capture'][$_capture_buffer]=ob_get_clean();
} else $_smarty_tpl->capture_error();?><?php }?>
			<ul id="headerslider">
				<?php  $_smarty_tpl->tpl_vars['slide'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['slide']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['headerslider_slides']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['slide']->key => $_smarty_tpl->tpl_vars['slide']->value) {
$_smarty_tpl->tpl_vars['slide']->_loop = true;
?>
					<?php if ($_smarty_tpl->tpl_vars['slide']->value['active']) {?>
 					<li class="headerslider-container">
 						<div class="slide-container" style="background-image: url('<?php echo $_smarty_tpl->tpl_vars['link']->value->getMediaLink(((string)@constant('_MODULE_DIR_'))."headerslider/images/".((string)mb_convert_encoding(htmlspecialchars($_smarty_tpl->tpl_vars['slide']->value['image'], ENT_QUOTES, 'UTF-8', true), "HTML-ENTITIES", 'UTF-8')));?>
');">
 							<?php if (isset($_smarty_tpl->tpl_vars['slide']->value['description'])&&trim($_smarty_tpl->tpl_vars['slide']->value['description'])!='') {?>
								
								
									<a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['slide']->value['url'], ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['slide']->value['legend'], ENT_QUOTES, 'UTF-8', true);?>
">
										
										<div class="container">
										<div class="row header-info ">
										<div class="headerslider-description"><?php echo $_smarty_tpl->tpl_vars['slide']->value['description'];?>
</div>
										<p class="img-credits"><?php echo mb_convert_encoding(htmlspecialchars($_smarty_tpl->tpl_vars['slide']->value['legend'], ENT_QUOTES, 'UTF-8', true), "HTML-ENTITIES", 'UTF-8');?>
"</p>
										</div>
										</div>
									</a>	

							<?php }?>
 						</div>
  					</li>
					<?php }?>
				<?php } ?>
			</ul>
		</div>
<?php }?>

<!-- /Module HeaderSlider -->
<?php }?>


<?php }} ?>
