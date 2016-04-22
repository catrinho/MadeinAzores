<!--MODULE Block cart -->

<div id="shopping_cart">
	<div id="cart-trigger">
	<a class="cd-img-replace" href="#0">{*l s='Cart' mod='blockcart'*}
		<span class="cart-icon"></span>
		<!-- Quantidade de Produtos no Carrinho -->
		<span class="ajax_cart_quantity{if $cart_qties == 0} unvisible{/if}">{$cart_qties}</span>
		<!-- Carrinho Vazio = 0 ->empty -->
		<span class="ajax_cart_no_product{if $cart_qties > 0} unvisible{/if}">0</span>
	</a></div>
	</div>

{counter name=active_overlay assign=active_overlay}
{if !$PS_CATALOG_MODE && $active_overlay == 1}

<div id="layer_cart">
	<!-- OVERLAYER CART -->
	<div class="clearfix">
		<div class="layer_cart_product col-xs-12 col-md-6">
			<span class="cross" title="{l s='Close window' mod='blockcart'}"></span>
			<span class="title">
				<i class="icon-check"></i>{l s='Product successfully added to your shopping cart' mod='blockcart'}
			</span>
			<div class="product-image-container layer_cart_img">
			</div>
			<div class="layer_cart_product_info">
				<span id="layer_cart_product_title" class="product-name"></span>
				<span id="layer_cart_product_attributes"></span>
				<div>
					<strong class="dark">{l s='Quantity' mod='blockcart'}</strong>
					<span id="layer_cart_product_quantity"></span>
				</div>
				<div>
					<strong class="dark">{l s='Total' mod='blockcart'}</strong>
					<span id="layer_cart_product_price"></span>
				</div>
			</div>
		</div>
		<div class="layer_cart_cart col-xs-12 col-md-6">
			<span class="title">
				<!-- Plural Case [both cases are needed because page may be updated in Javascript] -->
				<span class="ajax_cart_product_txt_s {if $cart_qties < 2} unvisible{/if}">
					{l s='There are [1]%d[/1] items in your cart.' mod='blockcart' sprintf=[$cart_qties] tags=['<span class="ajax_cart_quantity">']}
				</span>
				<!-- Singular Case [both cases are needed because page may be updated in Javascript] -->
				<span class="ajax_cart_product_txt {if $cart_qties > 1} unvisible{/if}">
					{l s='There is 1 item in your cart.' mod='blockcart'}
				</span>
			</span>
			<div class="layer_cart_row">
				<strong class="dark">
					{l s='Total products' mod='blockcart'}
					{if $use_taxes && $display_tax_label && $show_tax}
						{if $priceDisplay == 1}
							{l s='(tax excl.)' mod='blockcart'}
						{else}
							{l s='(tax incl.)' mod='blockcart'}
						{/if}
					{/if}
				</strong>
				<span class="ajax_block_products_total">
					{if $cart_qties > 0}
						{convertPrice price=$cart->getOrderTotal(false, Cart::ONLY_PRODUCTS)}
					{/if}
				</span>
			</div>

			{if $show_wrapping}
				<div class="layer_cart_row">
					<strong class="dark">
						{l s='Wrapping' mod='blockcart'}
						{if $use_taxes && $display_tax_label && $show_tax}
							{if $priceDisplay == 1}
								{l s='(tax excl.)' mod='blockcart'}
							{else}
								{l s='(tax incl.)' mod='blockcart'}
							{/if}
						{/if}
					</strong>
					<span class="price cart_block_wrapping_cost">
						{if $priceDisplay == 1}
							{convertPrice price=$cart->getOrderTotal(false, Cart::ONLY_WRAPPING)}
						{else}
							{convertPrice price=$cart->getOrderTotal(true, Cart::ONLY_WRAPPING)}
						{/if}
					</span>
				</div>
			{/if}
			<div class="layer_cart_row">
				<strong class="dark{if $shipping_cost_float == 0 && (!$cart_qties || $cart->isVirtualCart() || !isset($cart->id_address_delivery) || !$cart->id_address_delivery)} unvisible{/if}">
					{l s='Total shipping' mod='blockcart'}&nbsp;{if $use_taxes && $display_tax_label && $show_tax}{if $priceDisplay == 1}{l s='(tax excl.)' mod='blockcart'}{else}{l s='(tax incl.)' mod='blockcart'}{/if}{/if}
				</strong>
				<span class="ajax_cart_shipping_cost{if $shipping_cost_float == 0 && (!$cart_qties || $cart->isVirtualCart() || !isset($cart->id_address_delivery) || !$cart->id_address_delivery)} unvisible{/if}">
					{if $shipping_cost_float == 0}
						 {if (!isset($cart->id_address_delivery) || !$cart->id_address_delivery)}{l s='To be determined' mod='blockcart'}{else}{l s='Free shipping!' mod='blockcart'}{/if}
					{else}
						{$shipping_cost}
					{/if}
				</span>
			</div>
			{if $show_tax && isset($tax_cost)}
				<div class="layer_cart_row">
					<strong class="dark">{l s='Tax' mod='blockcart'}</strong>
					<span class="price cart_block_tax_cost ajax_cart_tax_cost">{$tax_cost}</span>
				</div>
			{/if}
			<div class="layer_cart_row">
				<strong class="dark">
					{l s='Total' mod='blockcart'}
					{if $use_taxes && $display_tax_label && $show_tax}
						{if $priceDisplay == 1}
							{l s='(tax excl.)' mod='blockcart'}
						{else}
							{l s='(tax incl.)' mod='blockcart'}
						{/if}
					{/if}
				</strong>
				<span class="ajax_block_cart_total">
					{if $cart_qties > 0}
						{if $priceDisplay == 1}
							{convertPrice price=$cart->getOrderTotal(false)}
						{else}
							{convertPrice price=$cart->getOrderTotal(true)}
						{/if}
					{/if}
				</span>
			</div>
			<div class="button-container">
				<span class="continue btn btn-default button exclusive-medium" title="{l s='Continue shopping' mod='blockcart'}">
					<span>
						<i class="icon-chevron-left left"></i>{l s='Continue shopping' mod='blockcart'}
					</span>
				</span>
				<a class="btn btn-default button button-medium"	href="{$link->getPageLink("$order_process", true)|escape:"html":"UTF-8"}" title="{l s='Proceed to checkout' mod='blockcart'}" rel="nofollow">
					<span>
						{l s='Proceed to checkout' mod='blockcart'}<i class="icon-chevron-right right"></i>
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
		<div class="cart-subheader {if $products}visible{else}hidden{/if} ">
				<span class="visible-xs">{l s='Product' mod='blockcart'}</span>
				<span class="hidden-xs">{l s='Product Description' mod='blockcart'}</span>
				<span>{l s='Quantity' mod='blockcart'}</span>
				<span>{l s='Price' mod='blockcart'}</span>
		</div>
		{if $products}
			<!-- <div class="products-container"> -->
				<dl class="products">
				{foreach from=$products item='product' name='myLoop'}
					{assign var='productId' value=$product.id_product}
					{assign var='productAttributeId' value=$product.id_product_attribute}
					<dt data-id="cart_block_product_{$product.id_product|intval}_{if $product.id_product_attribute}{$product.id_product_attribute|intval}{else}0{/if}_{if $product.id_address_delivery}{$product.id_address_delivery|intval}{else}0{/if}"

					class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if}">
						
						<div class="cart-info">
							<a class="cart-images" href="{$link->getProductLink($product.id_product, $product.link_rewrite, $product.category)|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}"><img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'cart_default')}" alt="{$product.name|escape:'html':'UTF-8'}" /></a>
							<div class="product-name">
								<a class="cart_block_product_name" href="{$link->getProductLink($product, $product.link_rewrite, $product.category, null, null, $product.id_shop, $product.id_product_attribute)|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}">{$product.name|truncate:50:'...'|escape:'html':'UTF-8'}
								{if isset($product.attributes_small)}
									{$product.attributes_small}
								{/if}
								</a>
							</div>
							<div class="product-quantity">
								<span class="quantity-formated"><span class="quantity">{$product.cart_quantity}</span>&nbsp;x&nbsp;</span>
							</div>
							<div class="product-price">
								<span class="price">
								{if !isset($product.is_gift) || !$product.is_gift}
									{if $priceDisplay == $smarty.const.PS_TAX_EXC}{displayWtPrice p="`$product.total`"}{else}{displayWtPrice p="`$product.total_wt`"}{/if}
		                            <div class="hookDisplayProductPriceBlock-price">
		                                {hook h="displayProductPriceBlock" product=$product type="price" from="blockcart"}
		                            </div>
								{else}
									{l s='Free!' mod='blockcart'}
								{/if}
								</span>	
							</div>
							
							<div class="product-remove">
								<span class="remove_link">
											{if !isset($customizedDatas.$productId.$productAttributeId) && (!isset($product.is_gift) || !$product.is_gift)}
												<a class="ajax_cart_block_remove_link" data-id="cart_block_product_{$product.id_product|intval}_{if $product.id_product_attribute}{$product.id_product_attribute|intval}{else}0{/if}_{if $product.id_address_delivery}{$product.id_address_delivery|intval}{else}0{/if}"
					
					 href="{$link->getPageLink('cart', true, NULL, "delete=1&id_product={$product.id_product|intval}&ipa={$product.id_product_attribute|intval}&id_address_delivery={$product.id_address_delivery|intval}&token={$static_token}")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='remove this product from my cart' mod='blockcart'}"><span class="cross"></span></a>
											{/if}
										</span>
							</div>
						</div>
							
					</dt>
					{if isset($product.attributes_small)}
						<dd data-id="cart_block_combination_of_{$product.id_product|intval}{if $product.id_product_attribute}_{$product.id_product_attribute|intval}{/if}_{$product.id_address_delivery|intval}" class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if}">
					{/if}
					<!-- Customizable datas -->
					{if isset($customizedDatas.$productId.$productAttributeId[$product.id_address_delivery])}
						{if !isset($product.attributes_small)}
							<dd data-id="cart_block_combination_of_{$product.id_product|intval}_{if $product.id_product_attribute}{$product.id_product_attribute|intval}{else}0{/if}_{if $product.id_address_delivery}{$product.id_address_delivery|intval}{else}0{/if}" class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if}">
						{/if}
						<ul class="cart_block_customizations" data-id="customization_{$productId}_{$productAttributeId}">
							{foreach from=$customizedDatas.$productId.$productAttributeId[$product.id_address_delivery] key='id_customization' item='customization' name='customizations'}
								<li name="customization">
									<div data-id="deleteCustomizableProduct_{$id_customization|intval}_{$product.id_product|intval}_{$product.id_product_attribute|intval}_{$product.id_address_delivery|intval}" class="deleteCustomizableProduct">
										<a class="ajax_cart_block_remove_link" href="{$link->getPageLink('cart', true, NULL, "delete=1&id_product={$product.id_product|intval}&ipa={$product.id_product_attribute|intval}&id_customization={$id_customization|intval}&token={$static_token}")|escape:'html':'UTF-8'}" rel="nofollow">&nbsp;</a>
									</div>
									{if isset($customization.datas.$CUSTOMIZE_TEXTFIELD.0)}
										{$customization.datas.$CUSTOMIZE_TEXTFIELD.0.value|replace:"<br />":" "|truncate:28:'...'|escape:'html':'UTF-8'}
									{else}
										{l s='Customization #%d:' sprintf=$id_customization|intval mod='blockcart'}
									{/if}
								</li>
							{/foreach}
						</ul>
						{if !isset($product.attributes_small)}</dd>{/if}
					{/if}
					{if isset($product.attributes_small)}</dd>{/if}
				{/foreach}
				</dl>
			<!-- </div> -->
			
		{/if}
		<h3 class="cart_block_no_products{if $products} unvisible{/if}">
			{l s='No products' mod='blockcart'}
		</h3>
	</div>
	<div class="bottom">
		<div class="cart-total">
			<p class="price cart_block_total ajax_block_cart_total">{l s='Total' mod='blockcart'}: <span>{$total}</span></p>
		</div> <!-- cd-cart-total -->
		<div class="cart-buttons">
			<a id="button_order_cart" class="checkout-btn" href="{$link->getPageLink("$order_process", true)|escape:"html":"UTF-8"}" title="{l s='Check out' mod='blockcart'}" rel="nofollow">
				{l s='Check out' mod='blockcart'}
			</a>
		</div>
	</div>
		<!-- DROPDOWN CART -->

</div> 

<div class="layer_cart_overlay"></div>
{/if}
{counter name=active_overlay assign=active_overlay}
{if !$PS_CATALOG_MODE && $active_overlay == 1}
<div id="layer_cart">
	<div class="clearfix">
		<div class="layer_cart_product col-xs-12 col-md-6">
			<span class="cross" title="{l s='Close window' mod='blockcart'}"></span>
			<span class="title">
				<i class="icon-check"></i>{l s='Product successfully added to your shopping cart' mod='blockcart'}
			</span>
			<div class="product-image-container layer_cart_img">
			</div>
			<div class="layer_cart_product_info">
				<span id="layer_cart_product_title" class="product-name"></span>
				<span id="layer_cart_product_attributes"></span>
				<div>
					<strong class="dark">{l s='Quantity' mod='blockcart'}</strong>
					<span id="layer_cart_product_quantity"></span>
				</div>
				<div>
					<strong class="dark">{l s='Total' mod='blockcart'}</strong>
					<span id="layer_cart_product_price"></span>
				</div>
			</div>
		</div>
		<div class="layer_cart_cart col-xs-12 col-md-6">
			<span class="title">
				<!-- Plural Case [both cases are needed because page may be updated in Javascript] -->
				<span class="ajax_cart_product_txt_s {if $cart_qties < 2} unvisible{/if}">
					{l s='There are [1]%d[/1] items in your cart.' mod='blockcart' sprintf=[$cart_qties] tags=['<span class="ajax_cart_quantity">']}
				</span>
				<!-- Singular Case [both cases are needed because page may be updated in Javascript] -->
				<span class="ajax_cart_product_txt {if $cart_qties > 1} unvisible{/if}">
					{l s='There is 1 item in your cart.' mod='blockcart'}
				</span>
			</span>
			<div class="layer_cart_row">
				<strong class="dark">
					{l s='Total products' mod='blockcart'}
					{if $use_taxes && $display_tax_label && $show_tax}
						{if $priceDisplay == 1}
							{l s='(tax excl.)' mod='blockcart'}
						{else}
							{l s='(tax incl.)' mod='blockcart'}
						{/if}
					{/if}
				</strong>
				<span class="ajax_block_products_total">
					{if $cart_qties > 0}
						{convertPrice price=$cart->getOrderTotal(false, Cart::ONLY_PRODUCTS)}
					{/if}
				</span>
			</div>

			{if $show_wrapping}
				<div class="layer_cart_row">
					<strong class="dark">
						{l s='Wrapping' mod='blockcart'}
						{if $use_taxes && $display_tax_label && $show_tax}
							{if $priceDisplay == 1}
								{l s='(tax excl.)' mod='blockcart'}
							{else}
								{l s='(tax incl.)' mod='blockcart'}
							{/if}
						{/if}
					</strong>
					<span class="price cart_block_wrapping_cost">
						{if $priceDisplay == 1}
							{convertPrice price=$cart->getOrderTotal(false, Cart::ONLY_WRAPPING)}
						{else}
							{convertPrice price=$cart->getOrderTotal(true, Cart::ONLY_WRAPPING)}
						{/if}
					</span>
				</div>
			{/if}
			<div class="layer_cart_row">
				<strong class="dark{if $shipping_cost_float == 0 && (!$cart_qties || $cart->isVirtualCart() || !isset($cart->id_address_delivery) || !$cart->id_address_delivery)} unvisible{/if}">
					{l s='Total shipping' mod='blockcart'}&nbsp;{if $use_taxes && $display_tax_label && $show_tax}{if $priceDisplay == 1}{l s='(tax excl.)' mod='blockcart'}{else}{l s='(tax incl.)' mod='blockcart'}{/if}{/if}
				</strong>
				<span class="ajax_cart_shipping_cost{if $shipping_cost_float == 0 && (!$cart_qties || $cart->isVirtualCart() || !isset($cart->id_address_delivery) || !$cart->id_address_delivery)} unvisible{/if}">
					{if $shipping_cost_float == 0}
						 {if (!isset($cart->id_address_delivery) || !$cart->id_address_delivery)}{l s='To be determined' mod='blockcart'}{else}{l s='Free shipping!' mod='blockcart'}{/if}
					{else}
						{$shipping_cost}
					{/if}
				</span>
			</div>
			{if $show_tax && isset($tax_cost)}
				<div class="layer_cart_row">
					<strong class="dark">{l s='Tax' mod='blockcart'}</strong>
					<span class="price cart_block_tax_cost ajax_cart_tax_cost">{$tax_cost}</span>
				</div>
			{/if}
			<div class="layer_cart_row">
				<strong class="dark">
					{l s='Total' mod='blockcart'}
					{if $use_taxes && $display_tax_label && $show_tax}
						{if $priceDisplay == 1}
							{l s='(tax excl.)' mod='blockcart'}
						{else}
							{l s='(tax incl.)' mod='blockcart'}
						{/if}
					{/if}
				</strong>
				<span class="ajax_block_cart_total">
					{if $cart_qties > 0}
						{if $priceDisplay == 1}
							{convertPrice price=$cart->getOrderTotal(false)}
						{else}
							{convertPrice price=$cart->getOrderTotal(true)}
						{/if}
					{/if}
				</span>
			</div>
			<div class="button-container">
				<span class="continue btn btn-default button exclusive-medium" title="{l s='Continue shopping' mod='blockcart'}">
					<span>
						<i class="icon-chevron-left left"></i>{l s='Continue shopping' mod='blockcart'}
					</span>
				</span>
				<a class="btn btn-default button button-medium"	href="{$link->getPageLink("$order_process", true)|escape:"html":"UTF-8"}" title="{l s='Proceed to checkout' mod='blockcart'}" rel="nofollow">
					<span>
						{l s='Proceed to checkout' mod='blockcart'}<i class="icon-chevron-right right"></i>
					</span>
				</a>
			</div>
		</div>
	</div>
	<div class="crossseling"></div>
</div> <!-- #layer_cart -->
<div class="layer_cart_overlay"></div>
{/if}
{strip}
{addJsDef CUSTOMIZE_TEXTFIELD=$CUSTOMIZE_TEXTFIELD}
{addJsDef img_dir=$img_dir|escape:'quotes':'UTF-8'}
{addJsDef generated_date=$smarty.now|intval}
{addJsDef ajax_allowed=$ajax_allowed|boolval}
{addJsDef hasDeliveryAddress=(isset($cart->id_address_delivery) && $cart->id_address_delivery)}

{addJsDefL name=customizationIdMessage}{l s='Customization #' mod='blockcart' js=1}{/addJsDefL}
{addJsDefL name=removingLinkText}{l s='remove this product from my cart' mod='blockcart' js=1}{/addJsDefL}
{addJsDefL name=freeShippingTranslation}{l s='Free shipping!' mod='blockcart' js=1}{/addJsDefL}
{addJsDefL name=freeProductTranslation}{l s='Free!' mod='blockcart' js=1}{/addJsDefL}
{addJsDefL name=delete_txt}{l s='Delete' mod='blockcart' js=1}{/addJsDefL}
{addJsDefL name=toBeDetermined}{l s='To be determined' mod='blockcart' js=1}{/addJsDefL}
{/strip}
<!-- /MODULE Block cart-->

