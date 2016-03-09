<script type="text/javascript">
$('document').ready(function()
{
	$('img[rel^=ajax_id_favoriteproduct_]').click(function()
	{
		var idFavoriteProduct =  $(this).attr('rel').replace('ajax_id_favoriteproduct_', '');
		var parent = $(this).parent().parent();

		$.ajax({
			url: "{$link->getModuleLink('favoriteproducts', 'actions', ['process' => 'remove'], true)}",
			type: "POST",
			data: {
				'id_product': idFavoriteProduct,
				'ajax': true
			},
			success: function(result)
			{
				if (result == '0')
				{
					parent.fadeOut("normal", function()
					{
						parent.remove();
					});
				}
 		 	}
		});
	});
});
</script>

{capture name=path}
	<a href="{$link->getPageLink('my-account.php', true)|escape:'htmlall':'UTF-8'}">
		{l s='My account' mod='favoriteproducts'}</a>
		<span class="navigation-pipe">{$navigationPipe}</span>{l s='My favorite products' mod='favoriteproducts'}
{/capture}
{*include file="$tpl_dir./breadcrumb.tpl"*}

<div class="row">
  <div class="col-lg-12">
    <div class="row">
      <div class="col-lg-12 section-title">
        <div class="row">
          <h1>{l s='My favorite products' mod='favoriteproducts'}</h1>
        </div>
      </div>
    </div>
    <div class="row">
  		<div class="col-lg-12 no-padding-row">


<div id="favoriteproducts_block_account">
	
	{if $favoriteProducts}
		<div>
			{foreach from=$favoriteProducts item=favoriteProduct}
			<div class="favoriteproduct clearfix">
				<a href="{$link->getProductLink($favoriteProduct.id_product, null, null, null, null, $favoriteProduct.id_shop)|escape:'htmlall':'UTF-8'}" class="product_img_link">
					<img src="{$link->getImageLink($favoriteProduct.link_rewrite, $favoriteProduct.image, 'medium')|escape:'htmlall':'UTF-8'}" alt=""/></a>
				<h3><a href="{$link->getProductLink($favoriteProduct.id_product, null, null, null, null, $favoriteProduct.id_shop)|escape:'htmlall':'UTF-8'}">{$favoriteProduct.name|escape:'htmlall':'UTF-8'}</a></h3>
				<div class="product_desc">{$favoriteProduct.description_short|strip_tags|escape:'htmlall':'UTF-8'}</div>

				<div class="remove">
					<img rel="ajax_id_favoriteproduct_{$favoriteProduct.id_product}" src="{$img_dir}icon/delete.gif" alt="" class="icon" />
				</div>
			</div>
			{/foreach}
		</div>
	{else}
		<p class="warning">{l s='No favorite products yet.' mod='favoriteproducts'}</p>
	{/if}

<ul class="col-lg-12 no-padding-row footer_links">
	<li><a href="{$link->getPageLink('my-account', true)}"><img src="{$img_dir}icon/my-account.gif" alt="" class="icon" /> {l s='Back to your account'}</a></li>
	<li class="f_right"><a href="{$base_dir}"><img src="{$img_dir}icon/home.gif" alt="" class="icon" /> {l s='Home'}</a></li>
</ul>
	</ul>
</div>
  		</div>
	</div>  
  </div>
</div> 