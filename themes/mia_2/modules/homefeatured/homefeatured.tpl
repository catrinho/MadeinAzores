{*
* 2007-2012 PrestaShop 
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
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 6594 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
 {assign var='limit' value=2}
 {assign var='tabname' value='homefeatured'}

<!-- MODULE Home Featured Products -->
<div id="featured-products_block_center" class="block products_block clearfix col-lg-6">
	<div class="col-lg-12 section-title">
        <div class="row">
          <h3>{l s='Featured products' mod='homefeatured'}</h3>
        </div>
      </div>
	{if isset($products) AND $products}
		<div class="block_content">
			{assign var='liHeight' value=140}
			{assign var='nbItemsPerLine' value=1}
			{assign var='nbLi' value=$limit}
			{math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
			{math equation="nbLines*liHeight" nbLines=$nbLines|ceil liHeight=$liHeight assign=ulHeight}
			<div style="min-height:{$ulHeight}px;" class=" carousel slide" id="{$tabname}" >
			 {if count($products)>$limit}	
			<a class="carousel-control left" href="#{$tabname}"   data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#{$tabname}"  data-slide="next">&rsaquo;</a>
			{/if}
			<div class="carousel-inner">{$mproducts=array_chunk($products,$limit)}
				{foreach from=$mproducts item=iproducts name=mypLoop}
				<div class="item {if $smarty.foreach.mypLoop.first}active{/if}">
				
					{foreach from=$iproducts item=product name=homeFeaturedProducts}
						{math equation="(total%perLine)" total=$smarty.foreach.homeFeaturedProducts.total perLine=$nbItemsPerLine assign=totModulo}
						{if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
						<div class="p-item ajax_block_product {if $smarty.foreach.homeFeaturedProducts.first}first_item{elseif $smarty.foreach.homeFeaturedProducts.last}last_item{else}item{/if} {if $smarty.foreach.homeFeaturedProducts.iteration%$nbItemsPerLine == 0}last_item_of_line{elseif $smarty.foreach.homeFeaturedProducts.iteration%$nbItemsPerLine == 1} {/if} {if $smarty.foreach.homeFeaturedProducts.iteration > ($smarty.foreach.homeFeaturedProducts.total - $totModulo)}last_line{/if}">
							<div class="product-container">
						<div class="produto-img">
                          <a href="{$product.link}" title="{$product.name|escape:html:'UTF-8'}" class="product_image"><img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_leometr')}" alt="{$product.name|escape:html:'UTF-8'}" class="responsive-image" width="100%"/>{if isset($product.new) && $product.new == 1}<span class="new">{l s='New' mod='blockleoprodcarousel'}</span>{/if}</a>
                        </div>

						<div class="row txt-descricao">
                          <div class="col-lg-12 col-md-12 ">
							<h5 class="s_title_block"><a href="{$product.link}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:30:'...'|escape:'htmlall':'UTF-8'}</a></h5>
							<p>{$product.description_short|strip_tags|truncate:65:'...'}</p>	
						  </div>
                        </div>
						<div class="row">
                          <div class="col-lg-12">
                            <ol class="produto-links">
                              <li><a href="{$product.link}" title="{l s='More' mod='blockleoprodcarousel'}"></a></li>
                              {if ($product.id_product_attribute == 0 OR (isset($add_prod_display) AND ($add_prod_display == 1))) AND $product.available_for_order AND !isset($restricted_country_mode) AND $product.minimal_quantity == 1 AND $product.customizable != 2 AND !$PS_CATALOG_MODE}
								{if ($product.quantity > 0 OR $product.allow_oosp)}
                              	<li><a class="exclusive ajax_add_to_cart_button" rel="ajax_id_product_{$product.id_product}" href="{$link->getPageLink('cart')}?qty=1&amp;id_product={$product.id_product}&amp;token={$static_token}&amp;add" title="{l s='Add to cart' mod='blockleoprodcarousel'}">{l s='Add to cart' mod='blockleoprodcarousel'}</a></li>
                              	{else}
								<li class="exclusive">{l s='Add to cart' mod='blockleoprodcarousel'}</li>
								{/if}
								{/if}
                              {if $product.show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
                              	<li><a href="#">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</a></li>
                              {/if}	
                            </ol>
                          </div>
                        </div>
						<div>
						</div>
					</div>
						</div>
					{/foreach}
				</div>	
				{/foreach}</div>				
			</div>
		</div>
	{else}
		<p>{l s='No featured products' mod='homefeatured'}</p>
	{/if}
</div>
<!-- /MODULE Home Featured Products -->
