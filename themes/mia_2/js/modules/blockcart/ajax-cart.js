/*
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
*/

// Retrocompatibility with 1.4
if (typeof baseUri === "undefined" && typeof baseDir !== "undefined")
	baseUri = baseDir;

//JS Object : update the cart by ajax actions
var ajaxCart = {
	nb_total_products: 0,

	//override every button in the page in relation to the cart
	overrideButtonsInThePage : function(){
		//for every 'add' buttons...
		$('.ajax_add_to_cart_button').unbind('click').click(function(){
			var idProduct =  $(this).attr('rel').replace('nofollow', '').replace('ajax_id_product_', '');
			if ($(this).attr('disabled') != 'disabled')
				ajaxCart.add(idProduct, null, false, this);
			return false;
		});
		//for product page 'add' button...
		$('#add_to_cart input').unbind('click').click(function(){
			ajaxCart.add( $('#product_page_product_id').val(), $('#idCombination').val(), true, null, $('#quantity_wanted').val(), null);
			return false;
		});

		//for 'delete' buttons in the cart block...
		$('.cart_quantity_up').unbind('click').click(function(){
			var ids = $(this).attr('id')/*.split('_')*/;
			//alert('ok'+ids );
			
			//console.log($(this).attr('id').replace('cart_quantity_up_', ''));
			upQuantity($(this).attr('id').replace('cart_quantity_up_', ''));
			 return false;



		});
	$('.cart_quantity_down').unbind('click').click(function(){downQuantity($(this).attr('id').replace('cart_quantity_down_', '')); return false;});


		$(' .cart_product_delete').unbind('click').click(function(){
			//alert(".cart_product_delete - work");
		
			// Customized product management
			var customizationId = 0;
			var productId = 0;
			var productAttributeId = 0;
			var customizableProductDiv = $($(this).parent().parent()).find("div[id^=deleteCustomizableProduct_]");

			if (customizableProductDiv && $(customizableProductDiv).length)
			{
				$(customizableProductDiv).each(function(){
					var ids = $(this).attr('id').split('_');
					
					if (typeof(ids[1]) != 'undefined')
					{
						customizationId = parseInt(ids[1]);
						productId = parseInt(ids[2]);
						if (typeof(ids[3]) != 'undefined')
							productAttributeId = parseInt(ids[3]);
						return false;
					}
				});
			}
			
			// Common product management
			if (!customizationId)
			{
				//alert($(this).attr('data-shopcart'));

				if($(this).attr('data-shopcart')== 'true'){
					//alert($(this).attr('data-shopcart'));
					var firstCut = $(this).attr('id').replace('cart_product_delete_', '');
					//alert(firstCut);
				}else{

					//retrieve idProduct and idCombination from the displayed product in the block cart
					//alert($(this).parent().parent().attr('id'));
					//console.log($(this).parent().parent().attr('id'));
					var firstCut = $(this).parent().parent().attr('id').replace('cart_block_product_', '');
				}
				firstCut = firstCut.replace('deleteCustomizableProduct_', '');
				ids = firstCut.split('_');
				productId = parseInt(ids[0]);
				if (typeof(ids[1]) != 'undefined')
					productAttributeId = parseInt(ids[1]);
			}
				if($(this).attr('data-shopcart')== 'true'){
					var idAddressDelivery = $(this).attr('id').match(/.*_\d+_\d+_(\d+)/)[1];
				}else{
					var idAddressDelivery = $(this).parent().parent().attr('id').match(/.*_\d+_\d+_(\d+)/)[1];
				}	
				

			// Removing product from the cart
			ajaxCart.remove(productId, productAttributeId, customizationId, idAddressDelivery);
			//alert("calling ajaxCart.remove" + productId+ "_"+productAttributeId+ "_"+productAttributeId+ "_"+productAttributeId+ "_");
			return false;
		});
	},

	// try to expand the cart
	expand : function(){
		if ($('#cart_block_list').hasClass('collapsed'))
		{
			$('#cart_block_summary').slideUp(200, function(){
				$(this).addClass('collapsed').removeClass('expanded');
				$('#cart_block_list').slideDown({
					duration: 450,
					complete: function(){$(this).addClass('expanded').removeClass('collapsed');}
				});
			});
			$('#cart_prices').slideDown('slow', function(){
				$(this).addClass('expanded').removeClass('collapsed');
				// $('#cart_block_summary').slideDown(450, function(){
				// 	$(this).addClass('expanded').removeClass('collapsed');
				// });
			});
			// toogle the button expand/collapse button
			$('#block_cart_expand').fadeOut('slow', function(){
				$('#block_cart_collapse').fadeIn('fast');
			});

			// save the expand statut in the user cookie
			$.ajax({
				type: 'POST',
				headers: { "cache-control": "no-cache" },
				url: baseDir + 'modules/blockcart/blockcart-set-collapse.php' + '?rand=' + new Date().getTime(),
				async: true,
				cache: false,
				data: 'ajax_blockcart_display=expand'
			});


		}
	},
	// Fix display when using back and previous browsers buttons
	refresh : function(){
		$.ajax({
			type: 'POST',
			headers: { "cache-control": "no-cache" },
			url: baseUri + '?rand=' + new Date().getTime(),
			async: true,
			cache: false,
			dataType : "json",
			data: 'controller=cart&ajax=true&token=' + static_token,
			success: function(jsonData)
			{
				ajaxCart.updateCart(jsonData);
			}
		});
	},

	// try to collapse the cart
	collapse : function(){

		if ($('#cart_block_list').hasClass('expanded'))
		{
			$('#cart_block_list').slideUp('slow', function(){
				$(this).addClass('collapsed').removeClass('expanded');
				$('#cart_block_summary').slideDown(450, function(){
					$(this).addClass('expanded').removeClass('collapsed');
				});
			});
			$('#cart_prices').slideUp('slow', function(){
				$(this).addClass('collapsed').removeClass('expanded');
				// $('#cart_block_summary').slideDown(450, function(){
				// 	$(this).addClass('expanded').removeClass('collapsed');
				// });
			});


			$('#block_cart_collapse').fadeOut('slow', function(){
				$('#block_cart_expand').fadeIn('fast');
			});

			// save the expand statut in the user cookie
			$.ajax({
				type: 'POST',
				headers: { "cache-control": "no-cache" },
				url: baseDir + 'modules/blockcart/blockcart-set-collapse.php' + '?rand=' + new Date().getTime(),
				async: true,
				cache: false,
				data: 'ajax_blockcart_display=collapse' + '&rand=' + new Date().getTime()
			});
		}
	},

	// Update the cart information
	updateCartInformation : function (jsonData, addedFromProductPage)
	{
		ajaxCart.updateCart(jsonData);

		//reactive the button when adding has finished
		if (addedFromProductPage)
			$('#add_to_cart input').removeAttr('disabled').addClass('exclusive').removeClass('exclusive_disabled');
		else
			$('.ajax_add_to_cart_button').removeAttr('disabled');
	},

	// add a product in the cart via ajax
	add : function(idProduct, idCombination, addedFromProductPage, callerElement, quantity, whishlist){
		//console.log('ADD');
		if (addedFromProductPage && !checkCustomizations())
		{
			alert(fieldRequired);
			return ;
		}
		emptyCustomizations();
		//disabled the button when adding to not double add if user double click
		if (addedFromProductPage)
		{
			$('#add_to_cart input').attr('disabled', true).removeClass('exclusive').addClass('exclusive_disabled');
			$('.filled').removeClass('filled');
		}
		else
			$(callerElement).attr('disabled', true);

		if ($('#cart_block_list').hasClass('collapsed'))
			this.expand();
		//send the ajax request to the server
		$.ajax({
			type: 'POST',
			headers: { "cache-control": "no-cache" },
			url: baseUri + '?rand=' + new Date().getTime(),
			async: true,
			cache: false,
			dataType : "json",
			data: 'controller=cart&add=1&ajax=true&qty=' + ((quantity && quantity != null) ? quantity : '1') + '&id_product=' + idProduct + '&token=' + static_token + ( (parseInt(idCombination) && idCombination != null) ? '&ipa=' + parseInt(idCombination): ''),
			success: function(jsonData,textStatus,jqXHR)
			{
				// add appliance to whishlist module
				if (whishlist && !jsonData.errors)
					WishlistAddProductCart(whishlist[0], idProduct, idCombination, whishlist[1]);

				// add the picture to the cart
				var $element = $(callerElement).parent().parent().find('a.product_image img,a.product_img_link img');
				if (!$element.length)
					$element = $('#bigpic');
				var $picture = $element.clone();
				var pictureOffsetOriginal = $element.offset();

				if ($picture.size())
					$picture.css({'position': 'absolute', 'top': pictureOffsetOriginal.top, 'left': pictureOffsetOriginal.left});

				var pictureOffset = $picture.offset();
				if ($('#cart_block')[0] && $('#cart_block').offset().top && $('#cart_block').offset().left)
					var cartBlockOffset = $('#cart_block').offset();
				else
					var cartBlockOffset = $('#shopping_cart').offset();

				// Check if the block cart is activated for the animation
				if (cartBlockOffset != undefined && $picture.size())
				{
					$picture.appendTo('body');
					$picture.css({ 'position': 'absolute', 'top': $picture.css('top'), 'left': $picture.css('left'), 'z-index': 4242 })
					.animate({ 'width': $element.attr('width')*0.66, 'height': $element.attr('height')*0.66, 'opacity': 0.2, 'top': cartBlockOffset.top + 30, 'left': cartBlockOffset.left + 15 }, 1000)
					.fadeOut(100, function() {
						ajaxCart.updateCartInformation(jsonData, addedFromProductPage);
					});
				}
				else
					ajaxCart.updateCartInformation(jsonData, addedFromProductPage);
			},
			error: function(XMLHttpRequest, textStatus, errorThrown)
			{
				alert("Impossible to add the product to the cart.\n\ntextStatus: '" + textStatus + "'\nerrorThrown: '" + errorThrown + "'\nresponseText:\n" + XMLHttpRequest.responseText);
				//reactive the button when adding has finished
				if (addedFromProductPage)
					$('#add_to_cart input').removeAttr('disabled').addClass('exclusive').removeClass('exclusive_disabled');
				else
					$(callerElement).removeAttr('disabled');
			}
		});
	},

	//remove a product from the cart via ajax
	remove : function(idProduct, idCombination, customizationId, idAddressDelivery){
		//send the ajax request to the server
		/*$.ajax({
			type: 'POST',
			headers: { "cache-control": "no-cache" },
			url: baseUri + '?rand=' + new Date().getTime(),
			async: true,
			cache: false,
			dataType : "json",
			data: 'controller=cart&delete=1&id_product=' + idProduct + '&ipa=' + ((idCombination != null && parseInt(idCombination)) ? idCombination : '') + ((customizationId && customizationId != null) ? '&id_customization=' + customizationId : '') + '&id_address_delivery=' + idAddressDelivery + '&token=' + static_token + '&ajax=true',
			success: function(jsonData)	{
				ajaxCart.updateCart(jsonData);
				if ($('body').attr('id') == 'order' || $('body').attr('id') == 'order-opc')*/
					//alert("remove "+idProduct+'_'+idCombination+'_'+customizationId+'_'+idAddressDelivery);
					deleteProductFromSummary(idProduct+'_'+idCombination+'_'+customizationId+'_'+idAddressDelivery);
			/*},
			error: function() {alert('ERROR: unable to delete the product');}
		});*/
	},

	//hide the products displayed in the page but no more in the json data
	hideOldProducts : function(jsonData) {
		//delete an eventually removed product of the displayed cart (only if cart is not empty!)
		if ($('#cart_block_list #cart_products').length > 0)
		{

			
			var removedProductId = null;
			var removedProductData = null;
			var removedProductDomId = null;
			//look for a product to delete...
				//console.log($("#cart_products div[id$='cart_block']"));
			$("#cart_products div[id$='cart_block']").each(function(){
				//retrieve idProduct and idCombination from the displayed product in the block cart
				var domIdProduct = $(this).attr('id');
				//console.log(domIdProduct);
				var firstCut =  $(this).attr('id')/*.replace('cart_block_product_', '')*/;
				//console.log(firstCut);
				//console.log(firstCut);
				var ids = firstCut.split('_');
				//console.log(ids);

				//try to know if the current product is still in the new list
				var stayInTheCart = false;

				for (aProduct in jsonData.products)
				{
					//we've called the variable aProduct because IE6 bug if this variable is called product
					//if product has attributes
					if (jsonData.products[aProduct]['id'] == ids[0] && (!ids[1] || jsonData.products[aProduct]['idCombination'] == ids[1]))
					{

						stayInTheCart = true;
						// update the product customization display (when the product is still in the cart)
						ajaxCart.hideOldProductCustomizations(jsonData.products[aProduct], domIdProduct);
					}
				}
				//remove product if it's no more in the cart
				if (!stayInTheCart)
				{
					removedProductId = $(this).attr('id');

					if (removedProductId != null)
					{
						var firstCut =  removedProductId.replace('cart_block_product_', '');
						var ids = firstCut.split('_');

						$('#'+removedProductId).addClass('strike').fadeTo('slow', 0, function(){
							$(this).slideUp('slow', function(){
								$(this).remove();
								// If the cart is now empty, show the 'no product in the cart' message and close detail
								if($('#cart_block div.products div').length == 0)
								{
									$("#header #cart_block").stop(true, true).slideUp(200);
									$('#cart_block_no_products:hidden').slideDown(450);
									$('#cart_block div.products').remove();
								}
							});
						});
						$('#cart_block_combination_of_' + ids[0] + (ids[1] ? '_'+ids[1] : '') + (ids[2] ? '_'+ids[2] : '')).fadeTo('fast', 0, function(){
							$(this).slideUp('fast', function(){
								$(this).remove();
							});
						});
					}
				}
			});
		}
	},

	hideOldProductCustomizations : function (product, domIdProduct)
	{
		var customizationList = $('#customization_' + product['id'] + '_' + product['idCombination']);
		if(customizationList.length > 0)
		{
			$(customizationList).find("li").each(function(){
				$(this).find("div").each(function() {
					var customizationDiv = $(this).attr('id');
					var tmp = customizationDiv.replace('deleteCustomizableProduct_', '');
					var ids = tmp.split('_');
					if ((parseInt(product.idCombination) == parseInt(ids[2])) && !ajaxCart.doesCustomizationStillExist(product, ids[0]))
						$('#' + customizationDiv).parent().addClass('strike').fadeTo('slow', 0, function(){
							$(this).slideUp('slow');
							$(this).remove();
						});
				});
			});
		}
		var removeLinks = $('#cart_block_product_' + domIdProduct).find('a.ajax_cart_block_remove_link');
		if (!product.hasCustomizedDatas && !removeLinks.length)
			$('#' + domIdProduct + ' span.remove_link').html('<a class="ajax_cart_block_remove_link" rel="nofollow" href="' + baseUri + '?controller=cart&amp;delete=1&amp;id_product=' + product['id'] + '&amp;ipa=' + product['idCombination'] + '&amp;token=' + static_token + '"> </a>');
		if (product.is_gift)
			$('#' + domIdProduct + ' span.remove_link').html('');
	},

	doesCustomizationStillExist : function (product, customizationId)
	{
		var exists = false;

		$(product.customizedDatas).each(function() {
			if (this.customizationId == customizationId)
			{
				exists = true;
				// This return does not mean that we found nothing but simply break the loop
				return false;
			}
		});
		return (exists);
	},

	//refresh display of vouchers (needed for vouchers in % of the total)
	refreshVouchers : function (jsonData) {
		if (typeof(jsonData.discounts) == 'undefined' || jsonData.discounts.length == 0)
			$('#vouchers').hide();
		else
		{
			$('#vouchers tbody').html('');
		
			for (i=0;i<jsonData.discounts.length;i++)
			{
				if (parseFloat(jsonData.discounts[i].price_float) > 0)
				{
					var delete_link = '';
					if (jsonData.discounts[i].code.length)
						delete_link = '<a class="delete_voucher" href="'+jsonData.discounts[i].link+'" title="'+delete_txt+'"><img src="'+img_dir+'icon/delete.gif" alt="'+delete_txt+'" class="icon" /></a>';
					$('#vouchers tbody').append($(
						'<tr class="bloc_cart_voucher" id="bloc_cart_voucher_'+jsonData.discounts[i].id+'">'
						+'	<td class="quantity">1x</td>'
						+'	<td class="name" title="'+jsonData.discounts[i].description+'">'+jsonData.discounts[i].name+'</td>'
						+'	<td class="price">-'+jsonData.discounts[i].price+'</td>'
						+'	<td class="delete">' + delete_link + '</td>'
						+'</tr>'
					));
				}
			}

			$('#vouchers').show();
		}

	},

	// Update product quantity
	updateProductQuantity : function (product, quantity) {

		var IdProduct= product.id + '_' + (product.idCombination ? product.idCombination : '0')+ '_' + (product.idAddressDelivery ? product.idAddressDelivery : '0');

		$('#cart_block_product_' + IdProduct + ' .quantity').fadeTo('fast', 0, function() {
			$(this).text(quantity);

			if ($('input[name=quantity_'+ IdProduct +']').length ) {
			    // Do something 
			    //console.log('exist');
			}
			$('input[name=quantity_'+ product.id +']').val(quantity);
			$('input[name=quantity_'+ product.id +'_hidden]').val(quantity)
			$(this).fadeTo('fast', 1, function(){
				$(this).fadeTo('fast', 0, function(){
					$(this).fadeTo('fast', 1, function(){
						$(this).fadeTo('fast', 0, function(){
							$(this).fadeTo('fast', 1);
						});
					});
				});
			});
		});
		$('#numQuantity_' + product.id + '_' + (product.idCombination ? product.idCombination : '0')+ '_' + (product.idAddressDelivery ? product.idAddressDelivery : '0') ).fadeTo('fast', 0, function() {
			$(this).text(quantity);

			 
			$(this).fadeTo('fast', 1, function(){
				$(this).fadeTo('fast', 0, function(){
					$(this).fadeTo('fast', 1, function(){
						$(this).fadeTo('fast', 0, function(){
							$(this).fadeTo('fast', 1);
						});
					});
				});
			});
		});
	},


	//display the products witch are in json data but not already displayed
	displayNewProducts : function(jsonData) {

		//add every new products or update displaying of every updated products
		$(jsonData.products).each(function(){
			//fix ie6 bug (one more item 'undefined' in IE6)
			if (this.id != undefined)
			{
				//create a container for listing the products and hide the 'no product in the cart' message (only if the cart was empty)
				
				if ($('#cart_block div.products').length == 0)
				{
					//$('#cart_block_no_products').before('<dl class="products"></dl>');
					$('#cart_block_no_products').before('<div class="products" id="cart_products">');
					
					$('#cart_block_no_products').hide();
				}
				//if product is not in the displayed cart, add a new product's line
				var domIdProduct = this.id + '_' + (this.idCombination ? this.idCombination : '0') + '_' + (this.idAddressDelivery ? this.idAddressDelivery : '0');
				var domIdProductAttribute = this.id + '_' + (this.idCombination ? this.idCombination : '0');
				if ($('#cart_block_product_'+ domIdProduct).length == 0)
				{
					var productId = parseInt(this.id);
					var productAttributeId = (this.hasAttributes ? parseInt(this.attributes) : 0);
					var content =  '<div  id="cart_block_product_' + domIdProduct + '" class="hidden row row-arrow">';
					var name = (this.name.length > 12 ? this.name.substring(0, 10) + '...' : this.name);
					content += '<div class="col-lg-7 col-md-5 col-sm-5 col-xs-5 no-padding-row"><a href="' + this.link + '" title="' + this.name + '"><input type="text" readonly class="form-control input-sm cart-item cart_block_product_name" title="' + this.name + '" value="' + name;
					if (this.hasAttributes)
						  content += ' '+this.attributes;

					content +=  ' "width="100%" ></a></div>';

					


					content += '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-arrow ">';
					content +=' <button class="arrows arrow-up no-padding-row cart_quantity_up" rel="nofollow"  id="cart_quantity_up_' + domIdProduct + '" href="' + baseUri + '?controller=cart&add=&id_product=' + productId + '&ipa=' + parseInt(this.idCombination) + '&id_address_delivery=' + parseInt(this.idAddressDelivery) + '&amp;id_customization=&amp;token=" title="{l s=\'Add\'}">1</button>';
					//content+= '<button rel="nofollow" id="cart_quantity_up_' + domIdProduct + '" href="' + baseUri + '?controller=cart&add=&id_product=' + productId + '&ipa=' + parseInt(this.idCombination) + '&id_address_delivery=' + parseInt(this.idAddressDelivery) + '&amp;id_customization=&amp;token=" class="arrows arrow-up no-padding-row cart_quantity_up">1</button>';
					content += '<input type="hidden" value="' + this.quantity + '" name="quantity_' + domIdProduct + '_hidden"/><input type="hidden" value="' + this.quantity + '" name="quantity_' + domIdProduct + '"/><span class="number no-padding-row quantity">' + this.quantity + '</span>';
					content += '<button  rel="nofollow" id="cart_quantity_down_' + domIdProduct + '" href="' + baseUri + '?controller=cart&add=&id_product=' + productId + '&ipa=' + parseInt(this.idCombination) + '&id_address_delivery=' + parseInt(this.idAddressDelivery) + '&amp;id_customization=&amp;op=down&amp;token=" class="arrows arrow-down no-padding-row cart_quantity_down">1</button></div>';

					if (parseFloat(this.price_float) > 0)
						content += '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><a href="#" rel="nofollow" id="cart_product_delete_' + domIdProduct + '" style="color:#000;" class="cart_product_delete" ><span class="glyphicon glyphicon-trash"></span></a></div>';
					else
						content += '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><span class="glyphicon glyphicon-trash"></span></div>';
					/*if (typeof(freeProductTranslation) != 'undefined')
						content += '<span class="price">' + (parseFloat(this.price_float) > 0 ? this.priceByLine : freeProductTranslation) + '</span>';
					content += '</dt>';
				href="' + baseUri + '?controller=cart&delete=1&id_product=' + productId + '&token=' + static_token + (this.hasAttributes ? '&ipa=' + parseInt(this.idCombination) : '') + '"
					*/
					
					if (this.hasCustomizedDatas)
						content += ajaxCart.displayNewCustomizedDatas(this);
					// if (this.hasAttributes) content += '</div>';
					content += '</div>';
					$('#cart_block div.products').append(content);
					ajaxCart.refresh();
				}
				//else update the product's line
				else
				{
					var jsonProduct = this;

					if($.trim($('#cart_block_product_' + domIdProduct + ' .quantity').html()) != jsonProduct.quantity || $.trim($('#cart_block_product_' + domIdProduct + ' .price').html()) != jsonProduct.priceByLine)
					{
						$('input[name=quantity_'+domIdProduct+'_hidden]').val(jsonProduct.quantity);
						$('input[name=quantity_'+domIdProduct+']').val(jsonProduct.quantity);
						//console.log($.trim($('#cart_block_product_' + domIdProduct + ' .quantity').html()));
						// Usual product
						if (!this.is_gift)
							$('#cart_block_product_' + domIdProduct + ' .price').text(jsonProduct.priceByLine);
						else
							$('#cart_block_product_' + domIdProduct + ' .price').html(freeProductTranslation);
						ajaxCart.updateProductQuantity(jsonProduct, jsonProduct.quantity);

						// Customized product
						if (jsonProduct.hasCustomizedDatas)
						{
							customizationFormatedDatas = ajaxCart.displayNewCustomizedDatas(jsonProduct);
							if (!$('#customization_' + domIdProductAttribute).length)
							{
								if (jsonProduct.hasAttributes)
									$('#cart_block_combination_of_' + domIdProduct).append(customizationFormatedDatas);
								else
									$('#cart_block div.products').append(customizationFormatedDatas);
							}
							else
							{
								$('#customization_' + domIdProductAttribute).html('');
								$('#customization_' + domIdProductAttribute).append(customizationFormatedDatas);
							}
						}
					}
				}
				$('#cart_block div.products .hidden').slideDown(450).removeClass('hidden');

			var removeLinks = $('#cart_block_product_' + domIdProduct).find('a.ajax_cart_block_remove_link');
			if (this.hasCustomizedDatas && removeLinks.length)
				$(removeLinks).each(function() {
					$(this).remove();
				});
			}
		});
	},

	displayNewCustomizedDatas : function(product)
	{
		var content = '';
		var productId = parseInt(product.id);
		var productAttributeId = typeof(product.idCombination) == 'undefined' ? 0 : parseInt(product.idCombination);
		var hasAlreadyCustomizations = $('#customization_' + productId + '_' + productAttributeId).length;

		if (!hasAlreadyCustomizations)
		{
			if (!product.hasAttributes)
				content += '<dd id="cart_block_combination_of_' + productId + '" class="hidden">';
			if ($('#customization_' + productId + '_' + productAttributeId).val() == undefined)
				content += '<ul class="cart_block_customizations" id="customization_' + productId + '_' + productAttributeId + '">';
		}

		$(product.customizedDatas).each(function()
		{
			var done = 0;
			customizationId = parseInt(this.customizationId);
			productAttributeId = typeof(product.idCombination) == 'undefined' ? 0 : parseInt(product.idCombination);
			content += '<li name="customization"><div class="deleteCustomizableProduct" id="deleteCustomizableProduct_' + customizationId + '_' + productId + '_' + (productAttributeId ?  productAttributeId : '0') + '"><a rel="nofollow" class="ajax_cart_block_remove_link" href="' + baseUri + '?controller=cart&amp;delete=1&amp;id_product=' + productId + '&amp;ipa=' + productAttributeId + '&amp;id_customization=' + customizationId + '&amp;token=' + static_token + '"></a></div><span class="quantity-formated"><span class="quantity">' + parseInt(this.quantity) + '</span>x</span>';

			// Give to the customized product the first textfield value as name
			$(this.datas).each(function(){
				if (this['type'] == CUSTOMIZE_TEXTFIELD)
				{
					$(this.datas).each(function(){
						if (this['index'] == 0)
						{
							content += ' ' + this.truncatedValue.replace(/<br \/>/g, ' ');
							done = 1;
							return false;
						}
					})
				}
			});

			// If the customized product did not have any textfield, it will have the customizationId as name
			if (!done)
				content += customizationIdMessage + customizationId;
			if (!hasAlreadyCustomizations) content += '</li>';
			// Field cleaning
			if (customizationId)
			{
				$('#uploadable_files li div.customizationUploadBrowse img').remove();
				$('#text_fields input').attr('value', '');
			}
		});

		if (!hasAlreadyCustomizations)
		{
			content += '</ul>';
			if (!product.hasAttributes) content += '</dd>';
		}
		return (content);
	},


	//genarally update the display of the cart
	updateCart : function(jsonData) {
		//user errors display
		if (jsonData.hasError)
		{
			var errors = '';
			for(error in jsonData.errors)
				//IE6 bug fix
				if(error != 'indexOf')
					errors += jsonData.errors[error] + "\n";
			alert(errors);
		}
		else
		{
			ajaxCart.updateCartEverywhere(jsonData);
			ajaxCart.hideOldProducts(jsonData);
			ajaxCart.displayNewProducts(jsonData);
			ajaxCart.refreshVouchers(jsonData);

			//update 'first' and 'last' item classes
			$('#cart_block .products div').removeClass('first_item').removeClass('last_item').removeClass('item');
			$('#cart_block .products div:first').addClass('first_item');
			$('#cart_block .products div:not(:first,:last)').addClass('item');
			$('#cart_block .products div:last').addClass('last_item');

			//reset the onlick events in relation to the cart block (it allow to bind the onclick event to the new 'delete' buttons added)
			ajaxCart.overrideButtonsInThePage();
		}
	},

	//update general cart informations everywhere in the page
	updateCartEverywhere : function(jsonData) {
		//console.log($.trim(jsonData.productTotal));
		$('.ajax_cart_total').text($.trim(jsonData.productTotal));
		
		if (parseFloat(jsonData.shippingCostFloat) > 0 || jsonData.nbTotalProducts < 1)
			$('.ajax_cart_shipping_cost').text(jsonData.shippingCost);
		else if (typeof(freeShippingTranslation) != 'undefined')
				$('.ajax_cart_shipping_cost').html(freeShippingTranslation);
		$('.ajax_cart_tax_cost').text(jsonData.taxCost);
		$('.cart_block_wrapping_cost').text(jsonData.wrappingCost);
		$('.ajax_block_cart_total').text(jsonData.total);

		this.nb_total_products = jsonData.nbTotalProducts;
		
		if (parseInt(jsonData.nbTotalProducts) > 0)
		{
			$('.ajax_cart_no_product').hide();
			$('.ajax_cart_quantity').text(jsonData.nbTotalProducts);
			$('.ajax_cart_quantity').fadeIn('slow');
			$('.ajax_cart_total').fadeIn('slow');

			if (parseInt(jsonData.nbTotalProducts) > 1)
			{
				$('.ajax_cart_product_txt').each( function () {
					$(this).hide();
				});

				$('.ajax_cart_product_txt_s').each( function () {
					$(this).show();
				});
			}
			else
			{
				$('.ajax_cart_product_txt').each( function () {
					$(this).show();
				});

				$('.ajax_cart_product_txt_s').each( function () {
					$(this).hide();
				});
			}
		}
		else
		{
			$('.ajax_cart_quantity, .ajax_cart_product_txt_s, .ajax_cart_product_txt, .ajax_cart_total').each(function(){
				$(this).hide();
			});
			$('.ajax_cart_no_product').show('slow');
		}
	}
};

function HoverWatcher(selector){
	this.hovering = false;
	var self = this;

	this.isHoveringOver = function() {
		return self.hovering;
	}

	$(selector).hover(function() {
		self.hovering = true;
	}, function() {
		self.hovering = false;
	})
}

//when document is loaded...
$(document).ready(function(){
	// expand/collapse management
	$('#block_cart_collapse').click(function(){
			ajaxCart.collapse();
	});
	$('#block_cart_expand').click(function(){
			ajaxCart.expand();
	});
	ajaxCart.overrideButtonsInThePage();
	ajaxCart.refresh();

	/* roll over cart */
	var cart_block = new HoverWatcher('#cart_block');
	var shopping_cart = new HoverWatcher('#shopping_cart');

	$("#shopping_cart a:first").hover(
		function() {
			$(this).css('border-radius', '3px 3px 0px 0px');
			if (ajaxCart.nb_total_products > 0)
				$("#cart_block").stop(true, true).slideDown(450);
		},
		function() {
			$('#header #shopping_cart a').css('border-radius', '3px');
			setTimeout(function() {
				if (!shopping_cart.isHoveringOver() && !cart_block.isHoveringOver())
					$("#header #cart_block").stop(true, true).slideUp(450);
			}, 200);
		}
	);

	$("#cart_block").hover(
		function() {
			$('#shopping_cart a').css('border-radius', '3px 3px 0px 0px');
		},
		function() {
			$('#shopping_cart a').css('border-radius', '3px');
			setTimeout(function() {
				if (!shopping_cart.isHoveringOver())
					$("#header #cart_block").stop(true, true).slideUp(450);
			}, 200);
		}
	);
	
	$('.delete_voucher').bind('click', function() {
		$.ajax({
			type: 'POST',			
			headers: { "cache-control": "no-cache" },
			async: true,
			cache: false,			
			url:$(this).attr('href') + '?rand=' + new Date().getTime()
		});
		$(this).parent().parent().remove();
		if ($('body').attr('id') == 'order' || $('body').attr('id') == 'order-opc')
		{
			if (typeof(updateAddressSelection) != 'undefined')
				updateAddressSelection();
			else
				location.reload();
		}
		return false;
	});
});

/*if ($.isFunction(window.changeAddressDelivery)) {
	alert('ok');
}else{*/
	$(document).ready(function()
	{
		$('.cart_quantity_up').bind("click", function(){
		upQuantity($(this).attr('id').replace('cart_quantity_up_', ''));

		 return false;
	});
	$('.cart_quantity_down').bind('click', function(){downQuantity($(this).attr('id').replace('cart_quantity_down_', '')); return false;});

	});
	function upQuantity(id, qty)
	{
		if (typeof(qty) == 'undefined' || !qty)
			qty = 1;
		var customizationId = 0;
		var productId = 0;
		var productAttributeId = 0;
		var id_address_delivery = 0;
		var ids = 0;
		ids = id.split('_');
		productId = parseInt(ids[0]);
		if (typeof(ids[1]) !== 'undefined')
			productAttributeId = parseInt(ids[1]);
		if (typeof(ids[2]) !== 'undefined' && ids[2] !== 'nocustom')
			customizationId = parseInt(ids[2]);
		if (typeof(ids[3]) !== 'undefined')
			id_address_delivery = parseInt(ids[3]);

		$.ajax({
			type: 'POST',
			headers: { "cache-control": "no-cache" },
			url: baseUri + '?rand=' + new Date().getTime(),
			async: true,
			cache: false,
			dataType: 'json',
			data: 'controller=cart'
				+'&ajax=true'
				+'&add=true'
				+'&getproductprice=true'
				+'&summary=true'
				+'&id_product=' + productId
				+'&ipa=' + productAttributeId
				+'&id_address_delivery=' + id_address_delivery
				+ ((customizationId !== 0) ? '&id_customization=' + customizationId : '')
				+'&qty=' + qty
				+'&token=' + static_token
				+'&allow_refresh=1',
			success: function(jsonData)
			{

				if (jsonData.hasError)
				{
					var errors = '';
					for(var error in jsonData.errors)
						//IE6 bug fix
						if(error !== 'indexOf')
							errors += jsonData.errors[error] + "\n";
					alert(errors);
					//console.log($('input[name=quantity_'+ id +']').val());
					$('input[name=quantity_'+ id +'_hidden]').val()
				}
				else
				{
					//console.log(jsonData);

					
					
					if (jsonData.refresh)
						location.reload();
					//updateCartSummary(jsonData.summary);
					ajaxCart.refresh();
					if (customizationId !== 0)
						updateCustomizedDatas(jsonData.customizedDatas);
					updateHookShoppingCart(jsonData.HOOK_SHOPPING_CART);
					updateHookShoppingCartExtra(jsonData.HOOK_SHOPPING_CART_EXTRA);
					if (typeof(getCarrierListAndUpdate) !== 'undefined')
						getCarrierListAndUpdate();
					if (typeof(updatePaymentMethodsDisplay) !== 'undefined')
						updatePaymentMethodsDisplay();					
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				if (textStatus !== 'abort')
					alert("TECHNICAL ERROR: unable to save update quantity \n\nDetails:\nError thrown: " + XMLHttpRequest + "\n" + 'Text status: ' + textStatus);
			}
		});

	}
	function updateCustomizedDatas(json)
	{
		for(var i in json)
			for(var j in json[i])
				for(var k in json[i][j])
					for(var l in json[i][j][k])
					{
						//console.log(json[i][j][k][l]['quantity']); 

						var quantity = json[i][j][k][l]['quantity'];
						$('input[name=quantity_'+i+'_'+j+'_'+l+'_'+k+'_hidden]').val(quantity);
						$('input[name=quantity_'+i+'_'+j+'_'+l+'_'+k+']').val(quantity);
					}
	}
	function updateHookShoppingCart(html)
	{
		$('#HOOK_SHOPPING_CART').html(html);
	}
	function updateHookShoppingCartExtra(html)
	{
		$('#HOOK_SHOPPING_CART_EXTRA').html(html);
	}
	function downQuantity(id, qty)
{
	var val = $('input[name=quantity_'+id+']').val();
	//console.log('input val'+ val);
	var newVal = val;
	if(typeof(qty) == 'undefined' || !qty)
	{
		qty = 1;
		newVal = val - 1;
	}
	else if (qty < 0)
		qty = -qty;
	
	var customizationId = 0;
	var productId = 0;
	var productAttributeId = 0;
	var id_address_delivery = 0;
	var ids = 0;
	
	ids = id.split('_');
	productId = parseInt(ids[0]);
	if (typeof(ids[1]) !== 'undefined')
		productAttributeId = parseInt(ids[1]);
	if (typeof(ids[2]) !== 'undefined' && ids[2] !== 'nocustom')
		customizationId = parseInt(ids[2]);
	if (typeof(ids[3]) !== 'undefined')
		id_address_delivery = parseInt(ids[3]);
	//console.log('newval'+newVal);
	//console.log('val'+val+'- id'+id);
	if (newVal > 0 || $('#cart_block_product_'+id+'_gift').length)
	{
		$.ajax({
			type: 'POST',
			headers: { "cache-control": "no-cache" },
			url: baseUri + '?rand=' + new Date().getTime(),
			async: true,
			cache: false,
			dataType: 'json',
			data: 'controller=cart'
				+'&ajax=true'
				+'&add=true'
				+'&getproductprice=true'
				+'&summary=true'
				+'&id_product='+productId
				+'&ipa='+productAttributeId
				+'&id_address_delivery='+id_address_delivery
				+'&op=down'
				+ ((customizationId !== 0) ? '&id_customization='+customizationId : '')
				+'&qty='+qty
				+'&token='+static_token
				+'&allow_refresh=1',
			success: function(jsonData)
			{
				if (jsonData.hasError)
				{
					var errors = '';
					for(var error in jsonData.errors)
						//IE6 bug fix
						if(error !== 'indexOf')
							errors += jsonData.errors[error] + "\n";
					alert(errors);
					$('input[name=quantity_'+ id +']').val($('input[name=quantity_'+ id +'_hidden]').val());
				}
				else
				{

					$('input[name=quantity_'+id+']').val(newVal);
					$('input[name=quantity_'+id+'_hidden]').val(newVal);
					if (jsonData.refresh)
						location.reload();
						ajaxCart.refresh();

					//updateCartSummary(jsonData.summary);
					if (customizationId !== 0)					
						updateCustomizedDatas(jsonData.customizedDatas);
					updateHookShoppingCart(jsonData.HOOK_SHOPPING_CART);
					updateHookShoppingCartExtra(jsonData.HOOK_SHOPPING_CART_EXTRA);
					
					if (newVal == 0)
						$('#product_'+id).hide();
					
					if (typeof(getCarrierListAndUpdate) !== 'undefined')
						getCarrierListAndUpdate();
					if (typeof(updatePaymentMethodsDisplay) !== 'undefined')
						updatePaymentMethodsDisplay();							
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				if (textStatus !== 'abort')
					alert("TECHNICAL ERROR: unable to save update quantity \n\nDetails:\nError thrown: " + XMLHttpRequest + "\n" + 'Text status: ' + textStatus);
			}
		});

	}
	else
	{
		//console.log('go to deleteProductFromSummary();'+id)
		deleteProductFromSummary(id);
	}
}

function deleteProductFromSummary(id)
{
	//alert(' deleteProductFromSummary ' +id)
	var customizationId = 0;
	var productId = 0;
	var productAttributeId = 0;
	var id_address_delivery = 0;
	var ids = 0;
	ids = id.split('_');
	productId = parseInt(ids[0]);
	alter_id=parseInt(ids[0])+'_'+parseInt(ids[1])+'_'+parseInt(ids[3]);
	//console.log(ids);
	if (typeof(ids[1]) !== 'undefined')
		productAttributeId = parseInt(ids[1]);
	if (typeof(ids[2]) !== 'undefined' && ids[2] !== 'nocustom')
		customizationId = parseInt(ids[2]);
	if (typeof(ids[3]) !== 'undefined')
		id_address_delivery = parseInt(ids[3]);
	$.ajax({
		type: 'POST',
		headers: { "cache-control": "no-cache" },
		url: baseUri + '?rand=' + new Date().getTime(),
		async: true,
		cache: false,
		dataType: 'json',
		data: 'controller=cart'
			+'&ajax=true&delete=true&summary=true'
			+'&id_product='+productId
			+'&ipa='+productAttributeId
			+'&id_address_delivery='+id_address_delivery 
			+ ((customizationId !== 0) ? '&id_customization=' + customizationId : '')
			+'&token=' + static_token
			+'&allow_refresh=1',
		success: function(jsonData)
		{
			if (jsonData.hasError)
			{
				var errors = '';
				for(var error in jsonData.errors)
				//IE6 bug fix
				if (error !== 'indexOf')
					errors += jsonData.errors[error] + "\n";
			}
			else
			{
				//alert('dd');
				if (jsonData.refresh)
					location.reload();
						ajaxCart.refresh();
				if (parseInt(jsonData.summary.products.length) == 0)
				{
					if (typeof(orderProcess) == 'undefined' || orderProcess !== 'order-opc')
						document.location.href = document.location.href; // redirection
					else
					{
						$('#center_column').children().each(function() {
							if ($(this).attr('id') !== 'emptyCartWarning' && $(this).attr('class') !== 'breadcrumb' && $(this).attr('id') !== 'cart_title')
							{
								
								$(this).fadeOut('slow', function () {
									$(this).remove();
								});
							}
						});
						$('#summary_products_label').remove();
						$('#emptyCartWarning').fadeIn('slow');
					}
					
				}
				else
				{
					//alert('id'+id);
					//console.log($('#cart_block_product_'+ alter_id));
					//console.log($('#product_'+ alter_id').parents('));
					//$('#product_'+ id).parents().slideUp('slow');
					//$('#cart_summary #product_'+ alter_id).slideUp('slow', function() {$(this).remove();});
					$('#product_'+ id).fadeOut('slow', function() {
						$(this).remove();
					});	
					$('#cart_block_product_'+ alter_id).slideUp('slow', function() {
						
						$(this).remove();
						//console.log($(this));
						//cleanSelectAddressDelivery();
						if (!customizationId)
							//refreshOddRow();
						ajaxCart.refresh();
					});
					var exist = false;
					// console.log('lol2');
					// console.log(jsonData.summary.products);
					for (i=0;i<jsonData.summary.products.length;i++)
					{
						if (jsonData.summary.products[i].id_product == productId
							&& jsonData.summary.products[i].id_product_attribute == productAttributeId
							&& jsonData.summary.products[i].id_address_delivery == id_address_delivery
							&& (parseInt(jsonData.summary.products[i].customization_quantity) > 0))
								exist = true;
					}
					// if all customization removed => delete product line
					if (!exist && customizationId)
						$('#cart_block_product_' + productId + '_' + productAttributeId + '_0_' + id_address_delivery).fadeOut('slow', function() {
							$(this).remove();
							var line = $('#cart_block_product_' + productId + '_' + productAttributeId + '_nocustom_' + id_address_delivery);
							if (line.length > 0)
							{
								line.find('input[name^=quantity_], .cart_quantity_down, .cart_quantity_up, .cart_quantity_delete').each(function(){
									if (typeof($(this).attr('name')) != 'undefined')
										$(this).attr('name', $(this).attr('name').replace(/nocustom/, '0'));
									if (typeof($(this).attr('id')) != 'undefined')
										$(this).attr('id', $(this).attr('id').replace(/nocustom/, '0'));
								});
								line.find('span[id^=total_product_price_]').each(function(){
									$(this).attr('id', $(this).attr('id').replace(/_nocustom/, ''));
								});
								line.attr('id', line.attr('id').replace(/nocustom/, '0'));
							}
							refreshOddRow();
						});
				}
				ajaxCart.refresh();
				//updateCartSummary(jsonData.summary);
				updateCustomizedDatas(jsonData.customizedDatas);
				updateHookShoppingCart(jsonData.HOOK_SHOPPING_CART);
				updateHookShoppingCartExtra(jsonData.HOOK_SHOPPING_CART_EXTRA);
				if (typeof(getCarrierListAndUpdate) !== 'undefined' && jsonData.summary.products.length > 0)
					getCarrierListAndUpdate();
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			if (textStatus !== 'abort')
				alert("TECHNICAL ERROR: unable to save update quantity \n\nDetails:\nError thrown: " + XMLHttpRequest + "\n" + 'Text status: ' + textStatus);
		}
	});
}

/*}*/