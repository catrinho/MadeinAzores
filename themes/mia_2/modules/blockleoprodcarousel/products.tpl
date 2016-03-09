{if !empty($products)}
<div class=" carousel slide " id="{$tabname}">
	 {if count($products)>$itemsperpage}	
			  <!-- Controls -->
			  <div class="col-lg-12 col-md-12 col-sm-12">
			  	<a class="right-product pull-right" href="#{$tabname}" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right"></span>
			    </a>
			  	<a class="left-product pull-right" href="#{$tabname}" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left"></span>
				</a>
				  
			  </div>
			  	 

	{/if}
	<div class="carousel-inner">
		{$mproducts=array_chunk($products,$itemsperpage)}
		{foreach from=$mproducts item=products name=mypLoop} {assign var="nproduct" value=0}
			<div id="{$idslides}"class="item {if $smarty.foreach.mypLoop.first}active{/if}">
					{foreach from=$products item=product name=products}
					{if $product@iteration%$columnspage==1&&$columnspage>1}
					  <div class="row no-margin">
					{/if}
					
					<div class="p-item col-lg-4 col-md-4  col-sm-6 col-xs-6 product_block ajax_block_product  {if $smarty.foreach.products.first}first_item{elseif $smarty.foreach.products.last}last_item {/if}  {if $smarty.foreach.products.index % 2}alternate_item{else}p-item{/if} clearfix{if $nproduct== 2} hidden-sm hidden-xs{/if}">
						<div class="product-container row">
							<div class="product-img-div ">
	                          <a href="{$product.link}" title="{$product.name|escape:html:'UTF-8'}" ><img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'Mia_Home_carrousel')}" alt="{$product.name|escape:html:'UTF-8'}" class="product-img img-responsive"/>{if isset($product.new) && $product.new == 1}<span class="new">{l s='New' mod='blockleoprodcarousel'}</span>{/if}</a>
	                        </div>
	                       
							<div class="col-lg-12  col-md-12 col-sm-12 col-xs-12 txt-descricao">
	                          <div class="col-lg-12  col-md-12 col-sm-12 col-xs-12 no-padding-row ">
								<h5 class="s_title_block"><a href="{$product.link}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:30:'...'|escape:'htmlall':'UTF-8'}</a></h5>
								<p>{$product.description_short|strip_tags|truncate:120:'...'}</p>
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
	                        </div>
							 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding-row">
	                            <ol class="produto-links">
	                              <!-- <li><a href="{$product.link}" title="{l s='More' mod='blockleoprodcarousel'}">{l s='More' mod='blockleoprodcarousel'}</a></li> -->
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
					
					{if ($product@iteration%$columnspage==0||$smarty.foreach.products.last)&&$columnspage>1}
						</div>
					{/if}
						{assign var="nproduct" value=$nproduct+1}
						{if $nproduct> 2}
						   {assign var="nproduct" value=0}
						{/if}
					{/foreach}
					{*assign var="idslides" value=$idslides+1*}
			</div>		
		{/foreach}
	</div>
	{*	<!-- Indicators -->
	<ol class="carousel-indicators">
		{assign var="dataslide" value=0}
		{foreach from=$mproducts item=products name=mypLoop1}
		<li data-target="{$tabname}" data-slide-to="{$dataslide}" class=" {if $smarty.foreach.mypLoop1.first}active{/if}"></li>
		{assign var="dataslide" value=$dataslide+1}

		{/foreach}
	</ol>	
	*}				
</div>
{/if}