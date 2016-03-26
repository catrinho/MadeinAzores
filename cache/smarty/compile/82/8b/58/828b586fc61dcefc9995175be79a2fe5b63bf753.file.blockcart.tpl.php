<?php /* Smarty version Smarty-3.1.19, created on 2016-03-26 17:11:54
         compiled from "/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/themes/madeinazores-2016SS_v0.1/modules/blockcart/blockcart.tpl" */ ?>
<?php /*%%SmartyHeaderCode:32020548356f6c2dac2da34-44877100%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '828b586fc61dcefc9995175be79a2fe5b63bf753' => 
    array (
      0 => '/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/themes/madeinazores-2016SS_v0.1/modules/blockcart/blockcart.tpl',
      1 => 1457050560,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '32020548356f6c2dac2da34-44877100',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'cart_qties' => 0,
    'PS_CATALOG_MODE' => 0,
    'active_overlay' => 0,
    'use_taxes' => 0,
    'display_tax_label' => 0,
    'show_tax' => 0,
    'priceDisplay' => 0,
    'cart' => 0,
    'show_wrapping' => 0,
    'shipping_cost_float' => 0,
    'shipping_cost' => 0,
    'tax_cost' => 0,
    'link' => 0,
    'products' => 0,
    'product' => 0,
    'productId' => 0,
    'productAttributeId' => 0,
    'customizedDatas' => 0,
    'static_token' => 0,
    'id_customization' => 0,
    'CUSTOMIZE_TEXTFIELD' => 0,
    'customization' => 0,
    'total' => 0,
    'img_dir' => 0,
    'ajax_allowed' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56f6c2dc4a0c28_71602430',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f6c2dc4a0c28_71602430')) {function content_56f6c2dc4a0c28_71602430($_smarty_tpl) {?><?php if (!is_callable('smarty_function_counter')) include '/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/tools/smarty/plugins/function.counter.php';
if (!is_callable('smarty_modifier_replace')) include '/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/tools/smarty/plugins/modifier.replace.php';
?><!--MODULE Block cart -->

<div id="shopping_cart">
	<div id="cart-trigger">
	<a class="cd-img-replace" href="#0">Cart
		<!-- Quantidade de Produtos no Carrinho -->
		<span class="ajax_cart_quantity<?php if ($_smarty_tpl->tpl_vars['cart_qties']->value==0) {?> unvisible<?php }?>"><?php echo $_smarty_tpl->tpl_vars['cart_qties']->value;?>
</span>
		<!-- Carrinho Vazio = 0 ->empty -->
		<span class="ajax_cart_no_product<?php if ($_smarty_tpl->tpl_vars['cart_qties']->value>0) {?> unvisible<?php }?>">0</span>
	</a></div>
	</div>

<?php echo smarty_function_counter(array('name'=>'active_overlay','assign'=>'active_overlay'),$_smarty_tpl);?>

<?php if (!$_smarty_tpl->tpl_vars['PS_CATALOG_MODE']->value&&$_smarty_tpl->tpl_vars['active_overlay']->value==1) {?>

<div id="layer_cart">
	<!-- OVERLAYER CART -->
	<div class="clearfix">
		<div class="layer_cart_product col-xs-12 col-md-6">
			<span class="cross" title="<?php echo smartyTranslate(array('s'=>'Close window','mod'=>'blockcart'),$_smarty_tpl);?>
"></span>
			<span class="title">
				<i class="icon-check"></i><?php echo smartyTranslate(array('s'=>'Product successfully added to your shopping cart','mod'=>'blockcart'),$_smarty_tpl);?>

			</span>
			<div class="product-image-container layer_cart_img">
			</div>
			<div class="layer_cart_product_info">
				<span id="layer_cart_product_title" class="product-name"></span>
				<span id="layer_cart_product_attributes"></span>
				<div>
					<strong class="dark"><?php echo smartyTranslate(array('s'=>'Quantity','mod'=>'blockcart'),$_smarty_tpl);?>
</strong>
					<span id="layer_cart_product_quantity"></span>
				</div>
				<div>
					<strong class="dark"><?php echo smartyTranslate(array('s'=>'Total','mod'=>'blockcart'),$_smarty_tpl);?>
</strong>
					<span id="layer_cart_product_price"></span>
				</div>
			</div>
		</div>
		<div class="layer_cart_cart col-xs-12 col-md-6">
			<span class="title">
				<!-- Plural Case [both cases are needed because page may be updated in Javascript] -->
				<span class="ajax_cart_product_txt_s <?php if ($_smarty_tpl->tpl_vars['cart_qties']->value<2) {?> unvisible<?php }?>">
					<?php echo smartyTranslate(array('s'=>'There are [1]%d[/1] items in your cart.','mod'=>'blockcart','sprintf'=>array($_smarty_tpl->tpl_vars['cart_qties']->value),'tags'=>array('<span class="ajax_cart_quantity">')),$_smarty_tpl);?>

				</span>
				<!-- Singular Case [both cases are needed because page may be updated in Javascript] -->
				<span class="ajax_cart_product_txt <?php if ($_smarty_tpl->tpl_vars['cart_qties']->value>1) {?> unvisible<?php }?>">
					<?php echo smartyTranslate(array('s'=>'There is 1 item in your cart.','mod'=>'blockcart'),$_smarty_tpl);?>

				</span>
			</span>
			<div class="layer_cart_row">
				<strong class="dark">
					<?php echo smartyTranslate(array('s'=>'Total products','mod'=>'blockcart'),$_smarty_tpl);?>

					<?php if ($_smarty_tpl->tpl_vars['use_taxes']->value&&$_smarty_tpl->tpl_vars['display_tax_label']->value&&$_smarty_tpl->tpl_vars['show_tax']->value) {?>
						<?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?>
							<?php echo smartyTranslate(array('s'=>'(tax excl.)','mod'=>'blockcart'),$_smarty_tpl);?>

						<?php } else { ?>
							<?php echo smartyTranslate(array('s'=>'(tax incl.)','mod'=>'blockcart'),$_smarty_tpl);?>

						<?php }?>
					<?php }?>
				</strong>
				<span class="ajax_block_products_total">
					<?php if ($_smarty_tpl->tpl_vars['cart_qties']->value>0) {?>
						<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['cart']->value->getOrderTotal(false,Cart::ONLY_PRODUCTS)),$_smarty_tpl);?>

					<?php }?>
				</span>
			</div>

			<?php if ($_smarty_tpl->tpl_vars['show_wrapping']->value) {?>
				<div class="layer_cart_row">
					<strong class="dark">
						<?php echo smartyTranslate(array('s'=>'Wrapping','mod'=>'blockcart'),$_smarty_tpl);?>

						<?php if ($_smarty_tpl->tpl_vars['use_taxes']->value&&$_smarty_tpl->tpl_vars['display_tax_label']->value&&$_smarty_tpl->tpl_vars['show_tax']->value) {?>
							<?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?>
								<?php echo smartyTranslate(array('s'=>'(tax excl.)','mod'=>'blockcart'),$_smarty_tpl);?>

							<?php } else { ?>
								<?php echo smartyTranslate(array('s'=>'(tax incl.)','mod'=>'blockcart'),$_smarty_tpl);?>

							<?php }?>
						<?php }?>
					</strong>
					<span class="price cart_block_wrapping_cost">
						<?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?>
							<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['cart']->value->getOrderTotal(false,Cart::ONLY_WRAPPING)),$_smarty_tpl);?>

						<?php } else { ?>
							<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['cart']->value->getOrderTotal(true,Cart::ONLY_WRAPPING)),$_smarty_tpl);?>

						<?php }?>
					</span>
				</div>
			<?php }?>
			<div class="layer_cart_row">
				<strong class="dark<?php if ($_smarty_tpl->tpl_vars['shipping_cost_float']->value==0&&(!$_smarty_tpl->tpl_vars['cart_qties']->value||$_smarty_tpl->tpl_vars['cart']->value->isVirtualCart()||!isset($_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)||!$_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)) {?> unvisible<?php }?>">
					<?php echo smartyTranslate(array('s'=>'Total shipping','mod'=>'blockcart'),$_smarty_tpl);?>
&nbsp;<?php if ($_smarty_tpl->tpl_vars['use_taxes']->value&&$_smarty_tpl->tpl_vars['display_tax_label']->value&&$_smarty_tpl->tpl_vars['show_tax']->value) {?><?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?><?php echo smartyTranslate(array('s'=>'(tax excl.)','mod'=>'blockcart'),$_smarty_tpl);?>
<?php } else { ?><?php echo smartyTranslate(array('s'=>'(tax incl.)','mod'=>'blockcart'),$_smarty_tpl);?>
<?php }?><?php }?>
				</strong>
				<span class="ajax_cart_shipping_cost<?php if ($_smarty_tpl->tpl_vars['shipping_cost_float']->value==0&&(!$_smarty_tpl->tpl_vars['cart_qties']->value||$_smarty_tpl->tpl_vars['cart']->value->isVirtualCart()||!isset($_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)||!$_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)) {?> unvisible<?php }?>">
					<?php if ($_smarty_tpl->tpl_vars['shipping_cost_float']->value==0) {?>
						 <?php if ((!isset($_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)||!$_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)) {?><?php echo smartyTranslate(array('s'=>'To be determined','mod'=>'blockcart'),$_smarty_tpl);?>
<?php } else { ?><?php echo smartyTranslate(array('s'=>'Free shipping!','mod'=>'blockcart'),$_smarty_tpl);?>
<?php }?>
					<?php } else { ?>
						<?php echo $_smarty_tpl->tpl_vars['shipping_cost']->value;?>

					<?php }?>
				</span>
			</div>
			<?php if ($_smarty_tpl->tpl_vars['show_tax']->value&&isset($_smarty_tpl->tpl_vars['tax_cost']->value)) {?>
				<div class="layer_cart_row">
					<strong class="dark"><?php echo smartyTranslate(array('s'=>'Tax','mod'=>'blockcart'),$_smarty_tpl);?>
</strong>
					<span class="price cart_block_tax_cost ajax_cart_tax_cost"><?php echo $_smarty_tpl->tpl_vars['tax_cost']->value;?>
</span>
				</div>
			<?php }?>
			<div class="layer_cart_row">
				<strong class="dark">
					<?php echo smartyTranslate(array('s'=>'Total','mod'=>'blockcart'),$_smarty_tpl);?>

					<?php if ($_smarty_tpl->tpl_vars['use_taxes']->value&&$_smarty_tpl->tpl_vars['display_tax_label']->value&&$_smarty_tpl->tpl_vars['show_tax']->value) {?>
						<?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?>
							<?php echo smartyTranslate(array('s'=>'(tax excl.)','mod'=>'blockcart'),$_smarty_tpl);?>

						<?php } else { ?>
							<?php echo smartyTranslate(array('s'=>'(tax incl.)','mod'=>'blockcart'),$_smarty_tpl);?>

						<?php }?>
					<?php }?>
				</strong>
				<span class="ajax_block_cart_total">
					<?php if ($_smarty_tpl->tpl_vars['cart_qties']->value>0) {?>
						<?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?>
							<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['cart']->value->getOrderTotal(false)),$_smarty_tpl);?>

						<?php } else { ?>
							<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['cart']->value->getOrderTotal(true)),$_smarty_tpl);?>

						<?php }?>
					<?php }?>
				</span>
			</div>
			<div class="button-container">
				<span class="continue btn btn-default button exclusive-medium" title="<?php echo smartyTranslate(array('s'=>'Continue shopping','mod'=>'blockcart'),$_smarty_tpl);?>
">
					<span>
						<i class="icon-chevron-left left"></i><?php echo smartyTranslate(array('s'=>'Continue shopping','mod'=>'blockcart'),$_smarty_tpl);?>

					</span>
				</span>
				<a class="btn btn-default button button-medium"	href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink(((string)$_smarty_tpl->tpl_vars['order_process']->value),true), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'Proceed to checkout','mod'=>'blockcart'),$_smarty_tpl);?>
" rel="nofollow">
					<span>
						<?php echo smartyTranslate(array('s'=>'Proceed to checkout','mod'=>'blockcart'),$_smarty_tpl);?>
<i class="icon-chevron-right right"></i>
					</span>
				</a>
			</div>
		</div>
	</div>
	<div class="crossseling"></div>
	<!-- OVERLAYER CART -->
</div> 

<div id="drop-cart" class="collapsed">
<!-- DROPDOWN CART -->
	<div class="cart-header">
		<h2>Cart</h2>
		<div id="cart-close" class="icon-cross">
			<span class="cross"></span>
		</div>	
	</div>
	<div class="cart-box cart_block block exclusive">
		<div class="cart-subheader <?php if ($_smarty_tpl->tpl_vars['products']->value) {?>visible<?php } else { ?>hidden<?php }?> ">
				<span class="visible-xs"><?php echo smartyTranslate(array('s'=>'Product','mod'=>'blockcart'),$_smarty_tpl);?>
</span>
				<span class="hidden-xs"><?php echo smartyTranslate(array('s'=>'Product Description','mod'=>'blockcart'),$_smarty_tpl);?>
</span>
				<span><?php echo smartyTranslate(array('s'=>'Quantity','mod'=>'blockcart'),$_smarty_tpl);?>
</span>
				<span><?php echo smartyTranslate(array('s'=>'Price','mod'=>'blockcart'),$_smarty_tpl);?>
</span>
		</div>
		<?php if ($_smarty_tpl->tpl_vars['products']->value) {?>
			<!-- <div class="products-container"> -->
				<dl class="products">
				<?php  $_smarty_tpl->tpl_vars['product'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['product']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['products']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['product']->total= $_smarty_tpl->_count($_from);
 $_smarty_tpl->tpl_vars['product']->iteration=0;
 $_smarty_tpl->tpl_vars['product']->index=-1;
foreach ($_from as $_smarty_tpl->tpl_vars['product']->key => $_smarty_tpl->tpl_vars['product']->value) {
$_smarty_tpl->tpl_vars['product']->_loop = true;
 $_smarty_tpl->tpl_vars['product']->iteration++;
 $_smarty_tpl->tpl_vars['product']->index++;
 $_smarty_tpl->tpl_vars['product']->first = $_smarty_tpl->tpl_vars['product']->index === 0;
 $_smarty_tpl->tpl_vars['product']->last = $_smarty_tpl->tpl_vars['product']->iteration === $_smarty_tpl->tpl_vars['product']->total;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['myLoop']['first'] = $_smarty_tpl->tpl_vars['product']->first;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['myLoop']['last'] = $_smarty_tpl->tpl_vars['product']->last;
?>
					<?php $_smarty_tpl->tpl_vars['productId'] = new Smarty_variable($_smarty_tpl->tpl_vars['product']->value['id_product'], null, 0);?>
					<?php $_smarty_tpl->tpl_vars['productAttributeId'] = new Smarty_variable($_smarty_tpl->tpl_vars['product']->value['id_product_attribute'], null, 0);?>
					<dt data-id="cart_block_product_<?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product']);?>
_<?php if ($_smarty_tpl->tpl_vars['product']->value['id_product_attribute']) {?><?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product_attribute']);?>
<?php } else { ?>0<?php }?>_<?php if ($_smarty_tpl->tpl_vars['product']->value['id_address_delivery']) {?><?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_address_delivery']);?>
<?php } else { ?>0<?php }?>"

					class="<?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['myLoop']['first']) {?>first_item<?php } elseif ($_smarty_tpl->getVariable('smarty')->value['foreach']['myLoop']['last']) {?>last_item<?php } else { ?>item<?php }?>">
						
						<div class="cart-info">
							<a class="cart-images" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getProductLink($_smarty_tpl->tpl_vars['product']->value['id_product'],$_smarty_tpl->tpl_vars['product']->value['link_rewrite'],$_smarty_tpl->tpl_vars['product']->value['category']), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['link']->value->getImageLink($_smarty_tpl->tpl_vars['product']->value['link_rewrite'],$_smarty_tpl->tpl_vars['product']->value['id_image'],'cart_default');?>
" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
" /></a>
							<div class="product-name">
								<a class="cart_block_product_name" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getProductLink($_smarty_tpl->tpl_vars['product']->value,$_smarty_tpl->tpl_vars['product']->value['link_rewrite'],$_smarty_tpl->tpl_vars['product']->value['category'],null,null,$_smarty_tpl->tpl_vars['product']->value['id_shop'],$_smarty_tpl->tpl_vars['product']->value['id_product_attribute']), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value['name'], ENT_QUOTES, 'UTF-8', true);?>
"><?php echo htmlspecialchars($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['product']->value['name'],50,'...'), ENT_QUOTES, 'UTF-8', true);?>

								<?php if (isset($_smarty_tpl->tpl_vars['product']->value['attributes_small'])) {?>
									<?php echo $_smarty_tpl->tpl_vars['product']->value['attributes_small'];?>

								<?php }?>
								</a>
							</div>
							<div class="product-quantity">
								<span class="quantity-formated"><span class="quantity"><?php echo $_smarty_tpl->tpl_vars['product']->value['cart_quantity'];?>
</span>&nbsp;x&nbsp;</span>
							</div>
							<div class="product-price">
								<span class="price">
								<?php if (!isset($_smarty_tpl->tpl_vars['product']->value['is_gift'])||!$_smarty_tpl->tpl_vars['product']->value['is_gift']) {?>
									<?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==@constant('PS_TAX_EXC')) {?><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['displayWtPrice'][0][0]->displayWtPrice(array('p'=>((string)$_smarty_tpl->tpl_vars['product']->value['total'])),$_smarty_tpl);?>
<?php } else { ?><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['displayWtPrice'][0][0]->displayWtPrice(array('p'=>((string)$_smarty_tpl->tpl_vars['product']->value['total_wt'])),$_smarty_tpl);?>
<?php }?>
		                            <div class="hookDisplayProductPriceBlock-price">
		                                <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayProductPriceBlock",'product'=>$_smarty_tpl->tpl_vars['product']->value,'type'=>"price",'from'=>"blockcart"),$_smarty_tpl);?>

		                            </div>
								<?php } else { ?>
									<?php echo smartyTranslate(array('s'=>'Free!','mod'=>'blockcart'),$_smarty_tpl);?>

								<?php }?>
								</span>	
							</div>
							
							<div class="product-remove">
								<span class="remove_link">
											<?php if (!isset($_smarty_tpl->tpl_vars['customizedDatas']->value[$_smarty_tpl->tpl_vars['productId']->value][$_smarty_tpl->tpl_vars['productAttributeId']->value])&&(!isset($_smarty_tpl->tpl_vars['product']->value['is_gift'])||!$_smarty_tpl->tpl_vars['product']->value['is_gift'])) {?>
												<a class="ajax_cart_block_remove_link" data-id="cart_block_product_<?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product']);?>
_<?php if ($_smarty_tpl->tpl_vars['product']->value['id_product_attribute']) {?><?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product_attribute']);?>
<?php } else { ?>0<?php }?>_<?php if ($_smarty_tpl->tpl_vars['product']->value['id_address_delivery']) {?><?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_address_delivery']);?>
<?php } else { ?>0<?php }?>"
					
					 href="<?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product']);?>
<?php $_tmp1=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product_attribute']);?>
<?php $_tmp2=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_address_delivery']);?>
<?php $_tmp3=ob_get_clean();?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink('cart',true,null,"delete=1&id_product=".$_tmp1."&ipa=".$_tmp2."&id_address_delivery=".$_tmp3."&token=".((string)$_smarty_tpl->tpl_vars['static_token']->value)), ENT_QUOTES, 'UTF-8', true);?>
" rel="nofollow" title="<?php echo smartyTranslate(array('s'=>'remove this product from my cart','mod'=>'blockcart'),$_smarty_tpl);?>
"><span class="cross"></span></a>
											<?php }?>
										</span>
							</div>
						</div>
							
					</dt>
					<?php if (isset($_smarty_tpl->tpl_vars['product']->value['attributes_small'])) {?>
						<dd data-id="cart_block_combination_of_<?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product']);?>
<?php if ($_smarty_tpl->tpl_vars['product']->value['id_product_attribute']) {?>_<?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product_attribute']);?>
<?php }?>_<?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_address_delivery']);?>
" class="<?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['myLoop']['first']) {?>first_item<?php } elseif ($_smarty_tpl->getVariable('smarty')->value['foreach']['myLoop']['last']) {?>last_item<?php } else { ?>item<?php }?>">
					<?php }?>
					<!-- Customizable datas -->
					<?php if (isset($_smarty_tpl->tpl_vars['customizedDatas']->value[$_smarty_tpl->tpl_vars['productId']->value][$_smarty_tpl->tpl_vars['productAttributeId']->value][$_smarty_tpl->tpl_vars['product']->value['id_address_delivery']])) {?>
						<?php if (!isset($_smarty_tpl->tpl_vars['product']->value['attributes_small'])) {?>
							<dd data-id="cart_block_combination_of_<?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product']);?>
_<?php if ($_smarty_tpl->tpl_vars['product']->value['id_product_attribute']) {?><?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product_attribute']);?>
<?php } else { ?>0<?php }?>_<?php if ($_smarty_tpl->tpl_vars['product']->value['id_address_delivery']) {?><?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_address_delivery']);?>
<?php } else { ?>0<?php }?>" class="<?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['myLoop']['first']) {?>first_item<?php } elseif ($_smarty_tpl->getVariable('smarty')->value['foreach']['myLoop']['last']) {?>last_item<?php } else { ?>item<?php }?>">
						<?php }?>
						<ul class="cart_block_customizations" data-id="customization_<?php echo $_smarty_tpl->tpl_vars['productId']->value;?>
_<?php echo $_smarty_tpl->tpl_vars['productAttributeId']->value;?>
">
							<?php  $_smarty_tpl->tpl_vars['customization'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['customization']->_loop = false;
 $_smarty_tpl->tpl_vars['id_customization'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['customizedDatas']->value[$_smarty_tpl->tpl_vars['productId']->value][$_smarty_tpl->tpl_vars['productAttributeId']->value][$_smarty_tpl->tpl_vars['product']->value['id_address_delivery']]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['customization']->key => $_smarty_tpl->tpl_vars['customization']->value) {
$_smarty_tpl->tpl_vars['customization']->_loop = true;
 $_smarty_tpl->tpl_vars['id_customization']->value = $_smarty_tpl->tpl_vars['customization']->key;
?>
								<li name="customization">
									<div data-id="deleteCustomizableProduct_<?php echo intval($_smarty_tpl->tpl_vars['id_customization']->value);?>
_<?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product']);?>
_<?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product_attribute']);?>
_<?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_address_delivery']);?>
" class="deleteCustomizableProduct">
										<a class="ajax_cart_block_remove_link" href="<?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product']);?>
<?php $_tmp4=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['product']->value['id_product_attribute']);?>
<?php $_tmp5=ob_get_clean();?><?php ob_start();?><?php echo intval($_smarty_tpl->tpl_vars['id_customization']->value);?>
<?php $_tmp6=ob_get_clean();?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink('cart',true,null,"delete=1&id_product=".$_tmp4."&ipa=".$_tmp5."&id_customization=".$_tmp6."&token=".((string)$_smarty_tpl->tpl_vars['static_token']->value)), ENT_QUOTES, 'UTF-8', true);?>
" rel="nofollow">&nbsp;</a>
									</div>
									<?php if (isset($_smarty_tpl->tpl_vars['customization']->value['datas'][$_smarty_tpl->tpl_vars['CUSTOMIZE_TEXTFIELD']->value][0])) {?>
										<?php echo htmlspecialchars($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate(smarty_modifier_replace($_smarty_tpl->tpl_vars['customization']->value['datas'][$_smarty_tpl->tpl_vars['CUSTOMIZE_TEXTFIELD']->value][0]['value'],"<br />"," "),28,'...'), ENT_QUOTES, 'UTF-8', true);?>

									<?php } else { ?>
										<?php echo smartyTranslate(array('s'=>'Customization #%d:','sprintf'=>intval($_smarty_tpl->tpl_vars['id_customization']->value),'mod'=>'blockcart'),$_smarty_tpl);?>

									<?php }?>
								</li>
							<?php } ?>
						</ul>
						<?php if (!isset($_smarty_tpl->tpl_vars['product']->value['attributes_small'])) {?></dd><?php }?>
					<?php }?>
					<?php if (isset($_smarty_tpl->tpl_vars['product']->value['attributes_small'])) {?></dd><?php }?>
				<?php } ?>
				</dl>
			<!-- </div> -->
			
		<?php }?>
		<h3 class="cart_block_no_products<?php if ($_smarty_tpl->tpl_vars['products']->value) {?> unvisible<?php }?>">
			<?php echo smartyTranslate(array('s'=>'No products','mod'=>'blockcart'),$_smarty_tpl);?>

		</h3>
	</div>
	<div class="bottom">
		<div class="cart-total">
			<p class="price cart_block_total ajax_block_cart_total"><?php echo smartyTranslate(array('s'=>'Total','mod'=>'blockcart'),$_smarty_tpl);?>
: <span><?php echo $_smarty_tpl->tpl_vars['total']->value;?>
</span></p>
		</div> <!-- cd-cart-total -->
		<div class="cart-buttons">
			<a id="button_order_cart" class="checkout-btn" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink(((string)$_smarty_tpl->tpl_vars['order_process']->value),true), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'Check out','mod'=>'blockcart'),$_smarty_tpl);?>
" rel="nofollow">
				<?php echo smartyTranslate(array('s'=>'Check out','mod'=>'blockcart'),$_smarty_tpl);?>

			</a>
		</div>
	</div>
		<!-- DROPDOWN CART -->

</div> 

<div class="layer_cart_overlay"></div>
<?php }?>
<?php echo smarty_function_counter(array('name'=>'active_overlay','assign'=>'active_overlay'),$_smarty_tpl);?>

<?php if (!$_smarty_tpl->tpl_vars['PS_CATALOG_MODE']->value&&$_smarty_tpl->tpl_vars['active_overlay']->value==1) {?>
<div id="layer_cart">
	<div class="clearfix">
		<div class="layer_cart_product col-xs-12 col-md-6">
			<span class="cross" title="<?php echo smartyTranslate(array('s'=>'Close window','mod'=>'blockcart'),$_smarty_tpl);?>
"></span>
			<span class="title">
				<i class="icon-check"></i><?php echo smartyTranslate(array('s'=>'Product successfully added to your shopping cart','mod'=>'blockcart'),$_smarty_tpl);?>

			</span>
			<div class="product-image-container layer_cart_img">
			</div>
			<div class="layer_cart_product_info">
				<span id="layer_cart_product_title" class="product-name"></span>
				<span id="layer_cart_product_attributes"></span>
				<div>
					<strong class="dark"><?php echo smartyTranslate(array('s'=>'Quantity','mod'=>'blockcart'),$_smarty_tpl);?>
</strong>
					<span id="layer_cart_product_quantity"></span>
				</div>
				<div>
					<strong class="dark"><?php echo smartyTranslate(array('s'=>'Total','mod'=>'blockcart'),$_smarty_tpl);?>
</strong>
					<span id="layer_cart_product_price"></span>
				</div>
			</div>
		</div>
		<div class="layer_cart_cart col-xs-12 col-md-6">
			<span class="title">
				<!-- Plural Case [both cases are needed because page may be updated in Javascript] -->
				<span class="ajax_cart_product_txt_s <?php if ($_smarty_tpl->tpl_vars['cart_qties']->value<2) {?> unvisible<?php }?>">
					<?php echo smartyTranslate(array('s'=>'There are [1]%d[/1] items in your cart.','mod'=>'blockcart','sprintf'=>array($_smarty_tpl->tpl_vars['cart_qties']->value),'tags'=>array('<span class="ajax_cart_quantity">')),$_smarty_tpl);?>

				</span>
				<!-- Singular Case [both cases are needed because page may be updated in Javascript] -->
				<span class="ajax_cart_product_txt <?php if ($_smarty_tpl->tpl_vars['cart_qties']->value>1) {?> unvisible<?php }?>">
					<?php echo smartyTranslate(array('s'=>'There is 1 item in your cart.','mod'=>'blockcart'),$_smarty_tpl);?>

				</span>
			</span>
			<div class="layer_cart_row">
				<strong class="dark">
					<?php echo smartyTranslate(array('s'=>'Total products','mod'=>'blockcart'),$_smarty_tpl);?>

					<?php if ($_smarty_tpl->tpl_vars['use_taxes']->value&&$_smarty_tpl->tpl_vars['display_tax_label']->value&&$_smarty_tpl->tpl_vars['show_tax']->value) {?>
						<?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?>
							<?php echo smartyTranslate(array('s'=>'(tax excl.)','mod'=>'blockcart'),$_smarty_tpl);?>

						<?php } else { ?>
							<?php echo smartyTranslate(array('s'=>'(tax incl.)','mod'=>'blockcart'),$_smarty_tpl);?>

						<?php }?>
					<?php }?>
				</strong>
				<span class="ajax_block_products_total">
					<?php if ($_smarty_tpl->tpl_vars['cart_qties']->value>0) {?>
						<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['cart']->value->getOrderTotal(false,Cart::ONLY_PRODUCTS)),$_smarty_tpl);?>

					<?php }?>
				</span>
			</div>

			<?php if ($_smarty_tpl->tpl_vars['show_wrapping']->value) {?>
				<div class="layer_cart_row">
					<strong class="dark">
						<?php echo smartyTranslate(array('s'=>'Wrapping','mod'=>'blockcart'),$_smarty_tpl);?>

						<?php if ($_smarty_tpl->tpl_vars['use_taxes']->value&&$_smarty_tpl->tpl_vars['display_tax_label']->value&&$_smarty_tpl->tpl_vars['show_tax']->value) {?>
							<?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?>
								<?php echo smartyTranslate(array('s'=>'(tax excl.)','mod'=>'blockcart'),$_smarty_tpl);?>

							<?php } else { ?>
								<?php echo smartyTranslate(array('s'=>'(tax incl.)','mod'=>'blockcart'),$_smarty_tpl);?>

							<?php }?>
						<?php }?>
					</strong>
					<span class="price cart_block_wrapping_cost">
						<?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?>
							<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['cart']->value->getOrderTotal(false,Cart::ONLY_WRAPPING)),$_smarty_tpl);?>

						<?php } else { ?>
							<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['cart']->value->getOrderTotal(true,Cart::ONLY_WRAPPING)),$_smarty_tpl);?>

						<?php }?>
					</span>
				</div>
			<?php }?>
			<div class="layer_cart_row">
				<strong class="dark<?php if ($_smarty_tpl->tpl_vars['shipping_cost_float']->value==0&&(!$_smarty_tpl->tpl_vars['cart_qties']->value||$_smarty_tpl->tpl_vars['cart']->value->isVirtualCart()||!isset($_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)||!$_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)) {?> unvisible<?php }?>">
					<?php echo smartyTranslate(array('s'=>'Total shipping','mod'=>'blockcart'),$_smarty_tpl);?>
&nbsp;<?php if ($_smarty_tpl->tpl_vars['use_taxes']->value&&$_smarty_tpl->tpl_vars['display_tax_label']->value&&$_smarty_tpl->tpl_vars['show_tax']->value) {?><?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?><?php echo smartyTranslate(array('s'=>'(tax excl.)','mod'=>'blockcart'),$_smarty_tpl);?>
<?php } else { ?><?php echo smartyTranslate(array('s'=>'(tax incl.)','mod'=>'blockcart'),$_smarty_tpl);?>
<?php }?><?php }?>
				</strong>
				<span class="ajax_cart_shipping_cost<?php if ($_smarty_tpl->tpl_vars['shipping_cost_float']->value==0&&(!$_smarty_tpl->tpl_vars['cart_qties']->value||$_smarty_tpl->tpl_vars['cart']->value->isVirtualCart()||!isset($_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)||!$_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)) {?> unvisible<?php }?>">
					<?php if ($_smarty_tpl->tpl_vars['shipping_cost_float']->value==0) {?>
						 <?php if ((!isset($_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)||!$_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)) {?><?php echo smartyTranslate(array('s'=>'To be determined','mod'=>'blockcart'),$_smarty_tpl);?>
<?php } else { ?><?php echo smartyTranslate(array('s'=>'Free shipping!','mod'=>'blockcart'),$_smarty_tpl);?>
<?php }?>
					<?php } else { ?>
						<?php echo $_smarty_tpl->tpl_vars['shipping_cost']->value;?>

					<?php }?>
				</span>
			</div>
			<?php if ($_smarty_tpl->tpl_vars['show_tax']->value&&isset($_smarty_tpl->tpl_vars['tax_cost']->value)) {?>
				<div class="layer_cart_row">
					<strong class="dark"><?php echo smartyTranslate(array('s'=>'Tax','mod'=>'blockcart'),$_smarty_tpl);?>
</strong>
					<span class="price cart_block_tax_cost ajax_cart_tax_cost"><?php echo $_smarty_tpl->tpl_vars['tax_cost']->value;?>
</span>
				</div>
			<?php }?>
			<div class="layer_cart_row">
				<strong class="dark">
					<?php echo smartyTranslate(array('s'=>'Total','mod'=>'blockcart'),$_smarty_tpl);?>

					<?php if ($_smarty_tpl->tpl_vars['use_taxes']->value&&$_smarty_tpl->tpl_vars['display_tax_label']->value&&$_smarty_tpl->tpl_vars['show_tax']->value) {?>
						<?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?>
							<?php echo smartyTranslate(array('s'=>'(tax excl.)','mod'=>'blockcart'),$_smarty_tpl);?>

						<?php } else { ?>
							<?php echo smartyTranslate(array('s'=>'(tax incl.)','mod'=>'blockcart'),$_smarty_tpl);?>

						<?php }?>
					<?php }?>
				</strong>
				<span class="ajax_block_cart_total">
					<?php if ($_smarty_tpl->tpl_vars['cart_qties']->value>0) {?>
						<?php if ($_smarty_tpl->tpl_vars['priceDisplay']->value==1) {?>
							<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['cart']->value->getOrderTotal(false)),$_smarty_tpl);?>

						<?php } else { ?>
							<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['cart']->value->getOrderTotal(true)),$_smarty_tpl);?>

						<?php }?>
					<?php }?>
				</span>
			</div>
			<div class="button-container">
				<span class="continue btn btn-default button exclusive-medium" title="<?php echo smartyTranslate(array('s'=>'Continue shopping','mod'=>'blockcart'),$_smarty_tpl);?>
">
					<span>
						<i class="icon-chevron-left left"></i><?php echo smartyTranslate(array('s'=>'Continue shopping','mod'=>'blockcart'),$_smarty_tpl);?>

					</span>
				</span>
				<a class="btn btn-default button button-medium"	href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['link']->value->getPageLink(((string)$_smarty_tpl->tpl_vars['order_process']->value),true), ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo smartyTranslate(array('s'=>'Proceed to checkout','mod'=>'blockcart'),$_smarty_tpl);?>
" rel="nofollow">
					<span>
						<?php echo smartyTranslate(array('s'=>'Proceed to checkout','mod'=>'blockcart'),$_smarty_tpl);?>
<i class="icon-chevron-right right"></i>
					</span>
				</a>
			</div>
		</div>
	</div>
	<div class="crossseling"></div>
</div> <!-- #layer_cart -->
<div class="layer_cart_overlay"></div>
<?php }?>
<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['addJsDef'][0][0]->addJsDef(array('CUSTOMIZE_TEXTFIELD'=>$_smarty_tpl->tpl_vars['CUSTOMIZE_TEXTFIELD']->value),$_smarty_tpl);?>
<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['addJsDef'][0][0]->addJsDef(array('img_dir'=>preg_replace("%(?<!\\\\)'%", "\'",$_smarty_tpl->tpl_vars['img_dir']->value)),$_smarty_tpl);?>
<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['addJsDef'][0][0]->addJsDef(array('generated_date'=>intval(time())),$_smarty_tpl);?>
<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['addJsDef'][0][0]->addJsDef(array('ajax_allowed'=>$_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['boolval'][0][0]->boolval($_smarty_tpl->tpl_vars['ajax_allowed']->value)),$_smarty_tpl);?>
<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['addJsDef'][0][0]->addJsDef(array('hasDeliveryAddress'=>(isset($_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)&&$_smarty_tpl->tpl_vars['cart']->value->id_address_delivery)),$_smarty_tpl);?>
<?php $_smarty_tpl->smarty->_tag_stack[] = array('addJsDefL', array('name'=>'customizationIdMessage')); $_block_repeat=true; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'customizationIdMessage'), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
<?php echo smartyTranslate(array('s'=>'Customization #','mod'=>'blockcart','js'=>1),$_smarty_tpl);?>
<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'customizationIdMessage'), $_block_content, $_smarty_tpl, $_block_repeat); } array_pop($_smarty_tpl->smarty->_tag_stack);?>
<?php $_smarty_tpl->smarty->_tag_stack[] = array('addJsDefL', array('name'=>'removingLinkText')); $_block_repeat=true; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'removingLinkText'), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
<?php echo smartyTranslate(array('s'=>'remove this product from my cart','mod'=>'blockcart','js'=>1),$_smarty_tpl);?>
<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'removingLinkText'), $_block_content, $_smarty_tpl, $_block_repeat); } array_pop($_smarty_tpl->smarty->_tag_stack);?>
<?php $_smarty_tpl->smarty->_tag_stack[] = array('addJsDefL', array('name'=>'freeShippingTranslation')); $_block_repeat=true; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'freeShippingTranslation'), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
<?php echo smartyTranslate(array('s'=>'Free shipping!','mod'=>'blockcart','js'=>1),$_smarty_tpl);?>
<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'freeShippingTranslation'), $_block_content, $_smarty_tpl, $_block_repeat); } array_pop($_smarty_tpl->smarty->_tag_stack);?>
<?php $_smarty_tpl->smarty->_tag_stack[] = array('addJsDefL', array('name'=>'freeProductTranslation')); $_block_repeat=true; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'freeProductTranslation'), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
<?php echo smartyTranslate(array('s'=>'Free!','mod'=>'blockcart','js'=>1),$_smarty_tpl);?>
<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'freeProductTranslation'), $_block_content, $_smarty_tpl, $_block_repeat); } array_pop($_smarty_tpl->smarty->_tag_stack);?>
<?php $_smarty_tpl->smarty->_tag_stack[] = array('addJsDefL', array('name'=>'delete_txt')); $_block_repeat=true; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'delete_txt'), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
<?php echo smartyTranslate(array('s'=>'Delete','mod'=>'blockcart','js'=>1),$_smarty_tpl);?>
<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'delete_txt'), $_block_content, $_smarty_tpl, $_block_repeat); } array_pop($_smarty_tpl->smarty->_tag_stack);?>
<?php $_smarty_tpl->smarty->_tag_stack[] = array('addJsDefL', array('name'=>'toBeDetermined')); $_block_repeat=true; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'toBeDetermined'), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
<?php echo smartyTranslate(array('s'=>'To be determined','mod'=>'blockcart','js'=>1),$_smarty_tpl);?>
<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo $_smarty_tpl->smarty->registered_plugins['block']['addJsDefL'][0][0]->addJsDefL(array('name'=>'toBeDetermined'), $_block_content, $_smarty_tpl, $_block_repeat); } array_pop($_smarty_tpl->smarty->_tag_stack);?>

<!-- /MODULE Block cart-->

<?php }} ?>
