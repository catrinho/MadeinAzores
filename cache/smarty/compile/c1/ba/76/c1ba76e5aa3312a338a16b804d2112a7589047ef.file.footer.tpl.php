<?php /* Smarty version Smarty-3.1.19, created on 2016-03-26 17:12:01
         compiled from "/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/themes/madeinazores-2016SS_v0.1/footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:203261556456f6c2e1ebcab7-70731600%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c1ba76e5aa3312a338a16b804d2112a7589047ef' => 
    array (
      0 => '/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/themes/madeinazores-2016SS_v0.1/footer.tpl',
      1 => 1457527859,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '203261556456f6c2e1ebcab7-70731600',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'content_only' => 0,
    'HOOK_FOOTER' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56f6c2e1f243d4_96028100',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f6c2e1f243d4_96028100')) {function content_56f6c2e1f243d4_96028100($_smarty_tpl) {?>
<?php if (!isset($_smarty_tpl->tpl_vars['content_only']->value)||!$_smarty_tpl->tpl_vars['content_only']->value) {?>
						<?php if (isset($_smarty_tpl->tpl_vars['HOOK_FOOTER']->value)) {?>
							<!-- Footer -->
							<div class="footer-container">
								<footer id="footer"  class="container">
									<div class="row"><?php echo $_smarty_tpl->tpl_vars['HOOK_FOOTER']->value;?>
</div>
									<div class="row">
										<?php echo $_smarty_tpl->getSubTemplate (((string)$_smarty_tpl->tpl_vars['tpl_dir']->value)."./footer-logos.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

									</div>
								</footer>
								
							</div><!-- #footer -->
						<?php }?>



					</div><!-- #center_column -->
					</div><!-- .row -->
				</div><!-- #columns -->
			</div><!-- .columns-container -->
		</div><!-- #page -->
<?php }?>
<?php echo $_smarty_tpl->getSubTemplate (((string)$_smarty_tpl->tpl_vars['tpl_dir']->value)."./global.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

	</body>
</html><?php }} ?>
