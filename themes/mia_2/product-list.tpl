{*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if isset($products)}
	<!-- Products list -->
	<div id="product_list" class="row products_block view-grid list-products">
	{foreach from=$products item=product name=products}
		{if $product@iteration%Configuration::get('productlistcols')==1}
        <div class="row">
        {/if}
		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 p-item product_block ajax_block_product {if $product@iteration%Configuration::get('productlistcols')==1}first_item no-padding-left {elseif $product@iteration%Configuration::get('productlistcols')==0|| $smarty.foreach.products.last}last_item hidden-sm hidden-xs no-padding-right {else}no-padding-row alternate_item{/if} clearfix">
			
			<div class="center_block product-container ">
				<a href="{$product.link|escape:'htmlall':'UTF-8'}" class="product_img_link" title="{$product.name|escape:'htmlall':'UTF-8'}">
					<div class="product-img-div ">
						<img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'Mia_Home_carrousel')}" class="img-responsive" alt="{$product.legend|escape:'htmlall':'UTF-8'}" {*if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if*} />
						{if isset($product.new) && $product.new == 1}<span class="new">{l s='New'}</span>{/if}
					</div>	
				</a>	
					<div class="col-lg-12 col-md-12 col-sm-12 no-padding-row txt-descricao">
		             
							<h5 class="s_title_block"><a href="{$product.link|escape:'htmlall':'UTF-8'}" title="{$product.name|escape:'htmlall':'UTF-8'}">{$product.name|escape:'htmlall':'UTF-8'|truncate:50:'...'}</a></h5>
							<p>{$product.description_short|truncate:150:'...'}</p>
						<p>
							<div class="yotpo bottomLine" 
								data-appkey="{$yotpoAppkey}" 
								data-domain="{$yotpoDomain}" 
								data-product-id="{$product.id_product}"
								data-product-models="" 
								data-name="{$product.name|escape:'htmlall':'UTF-8'}" 
								data-url="{$product.link|escape:'htmlall':'UTF-8'}" 
								data-image-url="{$link->getImageLink($product.link_rewrite, $product.id_image, '')}" 
								data-description="{$product.description_short|strip_tags:'UTF-8'|truncate:360:'...'}"
								data-lang="{$yotpoLanguage|escape:'htmlall':'UTF-8'}" 
								data-bread-crumbs=""> 
							</div>
						</p>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 no-padding-row">
	                          
	                            <ol class="produto-links">
	                             {if $product.show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
	                              	<li><a href="#">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</a></li>
	                              {/if}
	                              {if ($product.id_product_attribute == 0 OR (isset($add_prod_display) AND ($add_prod_display == 1))) AND $product.available_for_order AND !isset($restricted_country_mode) AND $product.minimal_quantity == 1 AND $product.customizable != 2 AND !$PS_CATALOG_MODE}
									{if ($product.quantity > 0 OR $product.allow_oosp)}
	                              	<li><a class="exclusive ajax_add_to_cart_button" rel="ajax_id_product_{$product.id_product}" href="{$link->getPageLink('cart')}?qty=1&amp;id_product={$product.id_product}&amp;token={$static_token}&amp;add" title="{l s='Add to cart' mod='blockleoprodcarousel'}">{l s='Add to cart' }</a></li>
	                              	{else}
									<li class="exclusive">{l s='Add to cart'}</li>
									{/if}
									{/if}
	                              
	                               <li><a href="{$product.link}" title="{l s='More' mod='blockleoprodcarousel'}">{l s='More'}</a></li>	
	                            </ol>
	                          
					</div>
					
			</div>
		</div>
		{if $product@iteration%Configuration::get('productlistcols')==0||$smarty.foreach.products.last}
		</div>
		{/if}
		
	{/foreach}
	</div>
	<!-- /Products list -->
{/if}