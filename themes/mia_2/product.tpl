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

{include file="$tpl_dir./errors.tpl"}
{if $errors|@count == 0}
	<script type="text/javascript">
// <![CDATA[

// PrestaShop internal settings
var currencySign = '{$currencySign|html_entity_decode:2:"UTF-8"}';
var currencyRate = '{$currencyRate|floatval}';
var currencyFormat = '{$currencyFormat|intval}';
var currencyBlank = '{$currencyBlank|intval}';
var taxRate = {$tax_rate|floatval};
var jqZoomEnabled = {if $jqZoomEnabled}true{else}false{/if};

//JS Hook
var oosHookJsCodeFunctions = new Array();

// Parameters
var id_product = '{$product->id|intval}';
var productHasAttributes = {if isset($groups)}true{else}false{/if};
var quantitiesDisplayAllowed = {if $display_qties == 1}true{else}false{/if};
var quantityAvailable = {if $display_qties == 1 && $product->quantity}{$product->quantity}{else}0{/if};
var allowBuyWhenOutOfStock = {if $allow_oosp == 1}true{else}false{/if};
var availableNowValue = '{$product->available_now|escape:'quotes':'UTF-8'}';
var availableLaterValue = '{$product->available_later|escape:'quotes':'UTF-8'}';
var productPriceTaxExcluded = {$product->getPriceWithoutReduct(true)|default:'null'} - {$product->ecotax};
var reduction_percent = {if $product->specificPrice AND $product->specificPrice.reduction AND $product->specificPrice.reduction_type == 'percentage'}{$product->specificPrice.reduction*100}{else}0{/if};
var reduction_price = {if $product->specificPrice AND $product->specificPrice.reduction AND $product->specificPrice.reduction_type == 'amount'}{$product->specificPrice.reduction|floatval}{else}0{/if};
var specific_price = {if $product->specificPrice AND $product->specificPrice.price}{$product->specificPrice.price}{else}0{/if};
var product_specific_price = new Array();
{foreach from=$product->specificPrice key='key_specific_price' item='specific_price_value'}
	product_specific_price['{$key_specific_price}'] = '{$specific_price_value}';
{/foreach}
var specific_currency = {if $product->specificPrice AND $product->specificPrice.id_currency}true{else}false{/if};
var group_reduction = '{1-$group_reduction}';
var default_eco_tax = {$product->ecotax};
var ecotaxTax_rate = {$ecotaxTax_rate};
var currentDate = '{$smarty.now|date_format:'%Y-%m-%d %H:%M:%S'}';
var maxQuantityToAllowDisplayOfLastQuantityMessage = {$last_qties};
var noTaxForThisProduct = {if $no_tax == 1}true{else}false{/if};
var displayPrice = {$priceDisplay};
var productReference = '{$product->reference|escape:'htmlall':'UTF-8'}';
var productAvailableForOrder = {if (isset($restricted_country_mode) AND $restricted_country_mode) OR $PS_CATALOG_MODE}'0'{else}'{$product->available_for_order}'{/if};
var productShowPrice = '{if !$PS_CATALOG_MODE}{$product->show_price}{else}0{/if}';
var productUnitPriceRatio = '{$product->unit_price_ratio}';
var idDefaultImage = {if isset($cover.id_image_only)}{$cover.id_image_only}{else}0{/if};
var stock_management = {$stock_management|intval};
{if !isset($priceDisplayPrecision)}
	{assign var='priceDisplayPrecision' value=2}
{/if}
{if !$priceDisplay || $priceDisplay == 2}
	{assign var='productPrice' value=$product->getPrice(true, $smarty.const.NULL, $priceDisplayPrecision)}
	{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(false, $smarty.const.NULL)}
{elseif $priceDisplay == 1}
	{assign var='productPrice' value=$product->getPrice(false, $smarty.const.NULL, $priceDisplayPrecision)}
	{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(true, $smarty.const.NULL)}
{/if}

var productPriceWithoutReduction = '{$productPriceWithoutReduction}';
var productPrice = '{$productPrice}';

// Customizable field
var img_ps_dir = '{$img_ps_dir}';
var customizationFields = new Array();
{assign var='imgIndex' value=0}
{assign var='textFieldIndex' value=0}
{foreach from=$customizationFields item='field' name='customizationFields'}
	{assign var="key" value="pictures_`$product->id`_`$field.id_customization_field`"}
	customizationFields[{$smarty.foreach.customizationFields.index|intval}] = new Array();
	customizationFields[{$smarty.foreach.customizationFields.index|intval}][0] = '{if $field.type|intval == 0}img{$imgIndex++}{else}textField{$textFieldIndex++}{/if}';
	customizationFields[{$smarty.foreach.customizationFields.index|intval}][1] = {if $field.type|intval == 0 && isset($pictures.$key) && $pictures.$key}2{else}{$field.required|intval}{/if};
{/foreach}

// Images
var img_prod_dir = '{$img_prod_dir}';
var combinationImages = new Array();

{if isset($combinationImages)}
	{foreach from=$combinationImages item='combination' key='combinationId' name='f_combinationImages'}
		combinationImages[{$combinationId}] = new Array();
		{foreach from=$combination item='image' name='f_combinationImage'}
			combinationImages[{$combinationId}][{$smarty.foreach.f_combinationImage.index}] = {$image.id_image|intval};
		{/foreach}
	{/foreach}
{/if}

combinationImages[0] = new Array();
{if isset($images)}
	{foreach from=$images item='image' name='f_leometrImages'}
		combinationImages[0][{$smarty.foreach.f_leometrImages.index}] = {$image.id_image};
	{/foreach}
{/if}

// Translations
var doesntExist = '{l s='This combination does not exist for this product. Please select another combination.' js=1}';
var doesntExistNoMore = '{l s='This product is no longer in stock' js=1}';
var doesntExistNoMoreBut = '{l s='with those attributes but is available with others.' js=1}';
var uploading_in_progress = '{l s='Uploading in progress, please be patient.' js=1}';
var fieldRequired = '{l s='Please fill in all the required fields before saving your customization.' js=1}';

{if isset($groups)}
	// Combinations
	{foreach from=$combinations key=idCombination item=combination}
		var specific_price_combination = new Array();
		var available_date = new Array();
		specific_price_combination['reduction_percent'] = {if $combination.specific_price AND $combination.specific_price.reduction AND $combination.specific_price.reduction_type == 'percentage'}{$combination.specific_price.reduction*100}{else}0{/if};
		specific_price_combination['reduction_price'] = {if $combination.specific_price AND $combination.specific_price.reduction AND $combination.specific_price.reduction_type == 'amount'}{$combination.specific_price.reduction}{else}0{/if};
		specific_price_combination['price'] = {if $combination.specific_price AND $combination.specific_price.price}{$combination.specific_price.price}{else}0{/if};
		specific_price_combination['reduction_type'] = '{if $combination.specific_price}{$combination.specific_price.reduction_type}{/if}';
		available_date['date'] = '{$combination.available_date}';
		available_date['date_formatted'] = '{dateFormat date=$combination.available_date full=false}';
		addCombination({$idCombination|intval}, new Array({$combination.list}), {$combination.quantity}, {$combination.price}, {$combination.ecotax}, {$combination.id_image}, '{$combination.reference|addslashes}', {$combination.unit_impact}, {$combination.minimal_quantity}, available_date, specific_price_combination);

	{/foreach}

{/if}

{if isset($attributesCombinations)}
	// Combinations attributes informations
	var attributesCombinations = new Array();
	{foreach from=$attributesCombinations key=id item=aC}
		tabInfos = new Array();
		tabInfos['id_attribute'] = '{$aC.id_attribute|intval}';
		tabInfos['attribute'] = '{$aC.attribute}';
		tabInfos['group'] = '{$aC.group}';
		tabInfos['id_attribute_group'] = '{$aC.id_attribute_group|intval}';
		attributesCombinations.push(tabInfos);
	{/foreach}
{/if}
//]]>

</script>
	

	<!-- STYLES -->
	<style type="text/css">
		.add-cart{
		background: url('{$img_dir}icon/ecommerce/cart_in.jpg') 0px 1px no-repeat;
		  width:  50px; /* width and height of the sprite image you want to display */
		  height: 32px;
		  position: relative;
		  display: inline-block;
		  cursor: pointer;
		}
		 .our_price_display{
		    font-family: 'Droid Sans', sans-serif;
		  font-weight: 700;
		  font-size: 20px;
		  color:#3d3d3d;
		  padding-bottom:5px; 
		  position: relative;
		}
	</style>
	<!-- END STYLES -->

	<script type="text/javascript">
		$(document).ready(function() {
		    $("#add-cart").bind( "click", function() {
		    	$( "#buy_block" ).submit();
		        return false;
		    });


$('.img-product-prvw').magnificPopup({
    items: [
    {foreach from=$images item=image name=thumbnails}
    {assign var=imageIds value="`$product->id`-`$image.id_image`"}
      {
        src: '{$link->getImageLink($product->link_rewrite, $imageIds, thickbox_MIA)}'
      },
    {/foreach}
    ],
    gallery: {
      enabled: true
    },
    type: 'image' // this is default type
});
		   


		});
	</script>

	<!-- START PRODUCT BLOCK -->
	<div id="product-detail section-show-produto">
		<div id="primary_block"  class="row">

			{if isset($adminActionDisplay) && $adminActionDisplay}
			<div id="admin-action">
				<p>{l s='This product is not visible to your customers.'}
				<input type="hidden" id="admin-action-product-id" value="{$product->id}" />
				<input type="submit" value="{l s='Publish'}" class="exclusive" onclick="submitPublishProduct('{$base_dir}{$smarty.get.ad|escape:'htmlall':'UTF-8'}', 0, '{$smarty.get.adtoken|escape:'htmlall':'UTF-8'}')"/>
				<input type="submit" value="{l s='Back'}" class="exclusive" onclick="submitPublishProduct('{$base_dir}{$smarty.get.ad|escape:'htmlall':'UTF-8'}', 1, '{$smarty.get.adtoken|escape:'htmlall':'UTF-8'}')"/>
				</p>
				<p id="admin-action-result"></p>
				</p>
			</div>
			{/if}

			{if isset($confirmation) && $confirmation}
			<p class="confirmation">
				{$confirmation}
			</p>
			{/if}
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="row section-title">
			        <div class="col-lg-12 col-md-12 col-sm-12 no-padding-row">
						<h1>{$product->name|escape:'htmlall':'UTF-8'}</h1>        
					</div>
			     </div>
				<div class="row no-padding-row">
				<div id="pb-right-column" class="col-lg-5  col-lg-push-7 col-md-5  col-md-push-7 col-sm-12 col-xs-12">
						<div class="images-block">
							<!-- product img-->
							<div id="image-block" class="view">
							{if $have_image}
								<span id="view_full_size">
									<a  href="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'thickbox_MIA')}" id="img-link" class="img-product-prvw" >								
								
										<img src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_MIA')}" {if $jqZoomEnabled}class="jqzoom" alt="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'thickbox_MIA')}"{else} title="{$product->name|escape:'htmlall':'UTF-8'}" alt="{$product->name|escape:'htmlall':'UTF-8'}" {/if} id="bigpic" width="{$largeSize.width}" height="{$largeSize.height}" class="img-responsive" />
										
										<div class="mask" style="width={$largeSize.width}; height={$largeSize.height};">
											<span class="mask-icon glyphicon glyphicon-search"></span>
										</div>
									</a>
								</span>
								
							{else}
								<span id="view_full_size">
									<img src="{$img_prod_dir}{$lang_iso}-default-large_leometr.jpg" id="bigpic" alt="" title="{$product->name|escape:'htmlall':'UTF-8'}" width="{$largeSize.width}" height="{$largeSize.height}" />
									
								</span>
							{/if}
							</div>
							{if isset($images) && count($images) > 0}
							<!-- thumbnails -->
							<div id="views_block" class="clearfix {if isset($images) && count($images) < 2}hidden{/if}">
							{if isset($images) && count($images) > 3}<span class="view_scroll_spacer"><a id="view_scroll_left" class="hidden" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">{l s='Previous'}</a></span>{/if}
							<div id="thumbs_list">
								<ul id="thumbs_list_frame">
									{if isset($images)}
										{foreach from=$images item=image name=thumbnails}
										{assign var=imageIds value="`$product->id`-`$image.id_image`"}
										<li id="thumbnail_{$image.id_image}">
											<a href="{$link->getImageLink($product->link_rewrite, $imageIds, thickbox_MIA)}" rel="other-views" id="slideshow" class="thickbox img-product-prvw {if $smarty.foreach.thumbnails.first}shown{/if}" title="{$image.legend|htmlspecialchars}" alt="{$product->name|escape:'htmlall':'UTF-8'}">
												<img id="thumb_{$image.id_image}" src="{$link->getImageLink($product->link_rewrite, $imageIds, 'medium_MIA')}" title="{$image.legend|htmlspecialchars}" alt="{$image.legend|htmlspecialchars}" height="{$mediumSize.height}" width="{$mediumSize.width}" class="img-responsive" />
											</a>
										</li> 
										{/foreach}
									{/if}
								</ul>
							</div>
							{if isset($images) && count($images) > 3}<a id="view_scroll_right" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">{l s='Next'}</a>{/if}
							</div>
							{/if}
						</div>
						{if isset($images) && count($images) > 1}<p class="resetimg clear"><span id="wrapResetImages" style="display: none;"><img src="{$img_dir}icon/cancel_11x13.gif" alt="{l s='Cancel'}" width="11" height="13"/> <a id="resetImages" href="{$link->getProductLink($product)}" onclick="$('span#wrapResetImages').hide('slow');return (false);">{l s='Display all pictures'}</a></span></p>{/if}
						
					</div>
					<!-- left infos-->
					<div id="pb-left-column" class="col-lg-7 col-lg-pull-5 col-md-7 col-md-pull-5 col-sm-12 col-xs-12 no-padding-left">

						<!-- description short -->
						<div id="description_block row">
								<h4>{l s='Description'}</h4>
						{if $product->description_short OR $product->description_short OR $packItems|@count > 0}
								{if $product->description}
									<div id="description_content" class="produto-descricao rte text_justify">{$product->description}</div>
								{elseif  $product->description_short}
									<div id="description_content" class="produto-descricao rte text_justify">{$product->description}</div>
								{/if}
						{else}
									<div id="description_content" class="produto-descricao rte text_justify"><b>{l s="This product don't have description. Sorry"}</b></div>
						{/if}	
						</div>
						<!-- end description short -->

					</div>


					<!-- right infos-->
					
				</div>	
				<div class="row no-padding-row">
					{if ($product->show_price AND !isset($restricted_country_mode)) OR isset($groups) OR $product->reference OR (isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS)}
						<!-- add to cart form-->
						<form id="buy_block" {if $PS_CATALOG_MODE AND !isset($groups) AND $product->quantity > 0}class="hidden"{/if} action="{$link->getPageLink('cart')}" method="post">

							<!-- hidden datas -->
							<p class="hidden">
								<input type="hidden" name="token" value="{$static_token}" />
								<input type="hidden" name="id_product" value="{$product->id|intval}" id="product_page_product_id" />
								<input type="hidden" name="add" value="1" />
								<input type="hidden" name="id_product_attribute" id="idCombination" value="" />
							</p>

							<div id="pb-left-column" class="col-lg-5 col-md-5 col-sm-5 no-padding-left">

								<!-- content prices -->
								<div class="content_prices clearfix">
									<div id="add_to_cart" class="add-cart rounded hint--top" data-hint="{l s='Add to cart'}">
										{if (!$allow_oosp && $product->quantity <= 0) OR !$product->available_for_order OR (isset($restricted_country_mode) AND $restricted_country_mode) OR $PS_CATALOG_MODE}
											<span class="exclusive">
											<span alt="{l s='Add to cart'}"></span>
											
											</span>
										{else}
											<!-- 	<span id="add-cart" class="add-cart"></span> -->
											<input type="submit" name="Submit" value="{l s='Add to cart'}"  style="opacity:0;" />

										{/if}
								
									</div>

									<!-- prices -->

									<div class="price">
									{if !$priceDisplay || $priceDisplay == 2}
										{assign var='productPrice' value=$product->getPrice(true, $smarty.const.NULL, $priceDisplayPrecision)}
										{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(false, $smarty.const.NULL)}
									{elseif $priceDisplay == 1}
										{assign var='productPrice' value=$product->getPrice(false, $smarty.const.NULL, $priceDisplayPrecision)}
										{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(true, $smarty.const.NULL)}
									{/if}

									<p class="our_price_display">
									{if $priceDisplay >= 0 && $priceDisplay <= 2}
										<span id="our_price_display">{convertPrice price=$productPrice}</span>
										<!--{if $tax_enabled  && ((isset($display_tax_label) && $display_tax_label == 1) OR !isset($display_tax_label))}
											{if $priceDisplay == 1}{l s='tax excl.'}{else}{l s='tax incl.'}{/if}
										{/if}-->
									{/if}
									</p>

									{if $product->show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}

									{if $product->online_only}
									<p class="online_only">{l s='Online only'}</p>
									{/if}

									{if $product->on_sale}
										<img src="{$img_dir}onsale_{$lang_iso}.gif" alt="{l s='On sale'}" class="on_sale_img"/>
										<span class="on_sale">{l s='On sale!'}</span>
									{elseif $product->specificPrice AND $product->specificPrice.reduction AND $productPriceWithoutReduction > $productPrice}
										<span class="discount">{l s='Reduced price!'}</span>
									{/if}
									{if $priceDisplay == 2}
										<br />
										<span id="pretaxe_price"><span id="pretaxe_price_display">{convertPrice price=$product->getPrice(false, $smarty.const.NULL)}</span>&nbsp;{l s='tax excl.'}</span>
									{/if}
									</div>
									<p id="reduction_percent" {if !$product->specificPrice OR $product->specificPrice.reduction_type != 'percentage'} style="display:none;"{/if}><span id="reduction_percent_display">{if $product->specificPrice AND $product->specificPrice.reduction_type == 'percentage'}-{$product->specificPrice.reduction*100}%{/if}</span></p>
									{*}<p id="reduction_amount" {if !$product->specificPrice OR $product->specificPrice.reduction_type != 'amount' && $product->specificPrice.reduction|intval ==0} style="display:none"{/if}>
										<span id="reduction_amount_display">
										{if $product->specificPrice AND $product->specificPrice.reduction_type == 'amount' AND $product->specificPrice.reduction|intval !=0}
											-{convertPrice price=$productPriceWithoutReduction-$productPrice|floatval}
										{/if}
										</span>
									</p>{*}
									{if $product->specificPrice AND $product->specificPrice.reduction}
										<p id="old_price"><span class="bold">
										{if $priceDisplay >= 0 && $priceDisplay <= 2}
											{if $productPriceWithoutReduction > $productPrice}
												<span id="old_price_display">{convertPrice price=$productPriceWithoutReduction}</span>
												<!-- {if $tax_enabled && $display_tax_label == 1}
													{if $priceDisplay == 1}{l s='tax excl.'}{else}{l s='tax incl.'}{/if}
												{/if} -->
											{/if}
										{/if}
										</span>
										</p>
									{/if}
									{if $packItems|@count && $productPrice < $product->getNoPackPrice()}
										<p class="pack_price">{l s='instead of'} <span style="text-decoration: line-through;">{convertPrice price=$product->getNoPackPrice()}</span></p>
										<br class="clear" />
									{/if}
									{if $product->ecotax != 0}
										<p class="price-ecotax">{l s='include'} <span id="ecotax_price_display">{if $priceDisplay == 2}{$ecotax_tax_exc|convertAndFormatPrice}{else}{$ecotax_tax_inc|convertAndFormatPrice}{/if}</span> {l s='for green tax'}
											{if $product->specificPrice AND $product->specificPrice.reduction}
											<br />{l s='(not impacted by the discount)'}
											{/if}
										</p>
									{/if}
									{if !empty($product->unity) && $product->unit_price_ratio > 0.000000}
										 {math equation="pprice / punit_price"  pprice=$productPrice  punit_price=$product->unit_price_ratio assign=unit_price}
										<p class="unit-price"><span id="unit_price_display">{convertPrice price=$unit_price}</span> {l s='per'} {$product->unity|escape:'htmlall':'UTF-8'}</p>
									{/if}
									{*close if for show price*}
									{/if}
									
									
									
								<div class="clear"></div>
								</div>
								<!-- content prices -->
								<div class="col-lg-12 col-md-12 col-sm-12 no-padding-row">
								<br/><br/>
										{if isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS}{$HOOK_PRODUCT_ACTIONS}{/if}	

									<div class="col-lg-12 col-md-12 col-sm-12 no-padding-row">
										<!-- availability -->
										<small id="availability_statut"{if ($product->quantity <= 0 && !$product->available_later && $allow_oosp) OR ($product->quantity > 0 && !$product->available_now) OR !$product->available_for_order OR $PS_CATALOG_MODE} style="display: none;"{/if}>
											<label id="availability_label">{l s='Availability:'}</label>
											<span id="availability_ball" class="ball {if $product->quantity <= 0}red{elseif $product->quantity < 10 }yellow{else}green{/if}" ></span>
											<span id="availability_value">
											{if $product->quantity <= 0}{if $allow_oosp}{$product->available_later}{else}{l s='This product is no longer in stock'}{/if}{else}{$product->available_now}{/if}
											</span>
										</small>
										
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 no-padding-row">
										<!-- quantity wanted -->	
										<small id="quantity_wanted_p"{if (!$allow_oosp && $product->quantity <= 0) OR $virtual OR !$product->available_for_order OR $PS_CATALOG_MODE} style="display: none;"{/if}>
											<label>{l s='Quantity:'}</label>
											<input type="text" name="qty" id="quantity_wanted" class="text" style="border"value="{if isset($quantityBackup)}{$quantityBackup|intval}{else}{if $product->minimal_quantity > 1}{$product->minimal_quantity}{else}1{/if}{/if}" size="2" maxlength="3" {if $product->minimal_quantity > 1}onkeyup="checkMinimalQuantity({$product->minimal_quantity});"{/if} />
											&nbsp;  &nbsp;
												<span style="top:-9px;" class="arrows arrow-up no-padding-row" rel="nofollow"  id="ProductAddQuantity"  title="{l s='Add'}"></span><span style="top:12px;left:-10px;" class="arrows arrow-down no-padding-row" rel="nofollow"  id="ProductSubtractQuantity"  title="{l s='Subtract'}"></span>&nbsp;  &nbsp;
											 


										</small>
										<!-- number of item in stock -->
										{if ($display_qties == 1 && !$PS_CATALOG_MODE && $product->available_for_order)}
										<small id="pQuantityAvailable"{if $product->quantity <= 0} style="display: none;"{/if}>
											<span id="quantityAvailable">{$product->quantity|intval}</span>
											<span {if $product->quantity > 1} style="display: none;"{/if} id="quantityAvailableTxt">{l s='item in stock'}</span>
											<span {if $product->quantity == 1} style="display: none;"{/if} id="quantityAvailableTxtMultiple">{l s='items in stock'}</span>
										</small>
										{/if}		
									</div>
									
									<div class="col-lg-12 col-md-12 col-sm-12 no-padding-row">
										<small id="product_reference" {if isset($groups) OR !$product->reference}style="display: none;"{/if}>
											<label for="product_reference">{l s='Reference:'} </label>
											<span class="editable">{$product->reference|escape:'htmlall':'UTF-8'}</span>
										</small>

									<!-- minimal quantity wanted -->
									<p id="minimal_quantity_wanted_p"{if $product->minimal_quantity <= 1 OR !$product->available_for_order OR $PS_CATALOG_MODE} style="display: none;"{/if}>
										{l s='This product is not sold individually. You must select at least'} <b id="minimal_quantity_label">{$product->minimal_quantity}</b> {l s='quantity for this product.'}
									</p>
									{if $product->minimal_quantity > 1}
									<script type="text/javascript">
										checkMinimalQuantity();
									</script>
									{/if}

									
									

									<!-- Out of stock hook -->
									<p id="oosHook"{if $product->quantity > 0} style="display: none;"{/if}>
										{$HOOK_PRODUCT_OOS}
									</p>

									<p class="warning_inline" id="last_quantities"{if ($product->quantity > $last_qties OR $product->quantity <= 0) OR $allow_oosp OR !$product->available_for_order OR $PS_CATALOG_MODE} style="display: none"{/if} >{l s='Warning: Last items in stock!'}</p>
									
										
									</div>



								</div>
									
							</div>
							<div id="pb-right-column" class="col-lg-7 col-md-7 col-sm-7">
								<!-- attributes -->
								<div class="product_attributes row">
									{if isset($groups)}
									<!-- attributes -->
									<div id="attributes">
									{foreach from=$groups key=id_attribute_group item=group}
										{if $group.attributes|@count}
											<fieldset class="attribute_fieldset col-lg-4 col-md-4 col-sm-4">
												<label class="attribute_label" for="group_{$id_attribute_group|intval}">{$group.name|escape:'htmlall':'UTF-8'} :</label>
												{assign var="groupName" value="group_$id_attribute_group"}
												<div class="attribute_list">
												{if ($group.group_type == 'select')}
													<select name="{$groupName}" id="group_{$id_attribute_group|intval}" class="form-control attribute_select" onchange="findCombination();getProductAttribute();{if $colors|@count > 0}$('#wrapResetImages').show('slow');{/if};">
														{foreach from=$group.attributes key=id_attribute item=group_attribute}
															<option value="{$id_attribute|intval}"{if (isset($smarty.get.$groupName) && $smarty.get.$groupName|intval == $id_attribute) || $group.default == $id_attribute} selected="selected"{/if} title="{$group_attribute|escape:'htmlall':'UTF-8'}">{$group_attribute|escape:'htmlall':'UTF-8'}</option>
														{/foreach}
													</select>
												{elseif ($group.group_type == 'color')}
													<ul id="color_to_pick_list" class="clearfix">
														{assign var="default_colorpicker" value=""}
														{foreach from=$group.attributes key=id_attribute item=group_attribute}
														<li{if $group.default == $id_attribute} class="selected"{/if}>
															<a id="color_{$id_attribute|intval}" class="color_pick{if ($group.default == $id_attribute)} selected{/if}" style="background: {$colors.$id_attribute.value};" title="{$colors.$id_attribute.name}" onclick="colorPickerClick(this);getProductAttribute();{if $colors|@count > 0}$('#wrapResetImages').show('slow');{/if}">
																{if file_exists($col_img_dir|cat:$id_attribute|cat:'.jpg')}
																	<img src="{$img_col_dir}{$id_attribute}.jpg" alt="{$colors.$id_attribute.name}" width="20" height="20" /><br>
																{/if}
															</a>
														</li>
														{if ($group.default == $id_attribute)}
															{$default_colorpicker = $id_attribute}
														{/if}
														{/foreach}
													</ul>
													<input type="hidden" class="color_pick_hidden" name="{$groupName}" value="{$default_colorpicker}" />
												{elseif ($group.group_type == 'radio')}
													{foreach from=$group.attributes key=id_attribute item=group_attribute}
														<input type="radio" class="attribute_radio" name="{$groupName}" value="{$id_attribute}" {if ($group.default == $id_attribute)} checked="checked"{/if} onclick="findCombination();getProductAttribute();{if $colors|@count > 0}$('#wrapResetImages').show('slow');{/if}">
														{$group_attribute|escape:'htmlall':'UTF-8'}<br/>
													{/foreach}
												{/if}
												</div>
											</fieldset>
										{/if}
									{/foreach}
									</div>
									{/if}
									
						
								</div>
								<!-- end attributes -->	
							</div>
								
						</form>
					{/if}
						
					{if isset($HOOK_EXTRA_RIGHT) && $HOOK_EXTRA_RIGHT}{$HOOK_EXTRA_RIGHT}{/if}	
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding-row">
			{if isset($packItems) && $packItems|@count > 0}
				<div id="blockpack">
					<h2>{l s='Pack content'}</h2>
					{include file="$tpl_dir./product-list.tpl" products=$packItems}
				</div>
			{/if}	
			{if isset($HOOK_PRODUCT_FOOTER) && $HOOK_PRODUCT_FOOTER}{$HOOK_PRODUCT_FOOTER}{/if}
			
				
		</div>
	</div>
	<!-- END PRODUCT BLOCK -->
{/if}	