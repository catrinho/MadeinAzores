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
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- MODULE Block specials -->
<section  id="products_carousel" class="row">
    


<div id="categoriesprodtabs" class="block products_block exclusive blockleoprodcarousel col-lg-12 blue no-padding-row">
	{*<div class="col-lg-12 col-md-12 col-sm-12 section-title">
        <div class="row">
          <h3>{l s='Latest Products' mod='blockleoprodcarousel'}</h3>
        </div>
      </div>*}
	<div class="col-lg-12 col-md-12 col-sm-12 no-padding-row">	
		{if !empty($products )}
			{$tabname="leoproductcarousel"}
			{include file="{$product_tpl}"} 
		{/if}
	</div>
</div>
<!-- /MODULE Block specials -->
<script>
$(document).ready(function() {
    $('#leoproductcarousel').each(function(){
        $(this).carousel({
            pause: "hover",
            interval: false
        });
    });
  /*  $('#leoproductcarousel').on('slid', function() {
            var to_slide = $('#leoproductcarousel .carousel-inner .item.active').attr('id');
            $('#leoproductcarousel .carousel-indicators').children().removeClass('active');
            $('#leoproductcarousel .carousel-indicators [data-slide-to=' + to_slide + ']').addClass('active');
          });*/
	 
});
</script>
 </section>