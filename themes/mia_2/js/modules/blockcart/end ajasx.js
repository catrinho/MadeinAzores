
if (!$.isFunction(window.changeAddressDelivery)) {
	//alert('ok');
}else{
$(document).ready(function()
{
$('.cart_quantity_up').bind("click", function(){
	console.log('ok');
	console.log($(this).attr('id').replace('cart_quantity_up_', ''));
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
				$('input[name=quantity_'+ id +']').val($('input[name=quantity_'+ id +'_hidden]').val());
			}
			else
			{

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

function downQuantity(id, qty)
{
	var val = $('input[name=quantity_'+id+']').val();
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
	console.log(newVal);
	console.log(val+'-'+qty);
	if (newVal > 0 || $('##cart_block_product_'+id+'_gift').length)
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
		deleteProductFromSummary(id);
	}
}
function updateCustomizedDatas(json)
{
	for(var i in json)
		for(var j in json[i])
			for(var k in json[i][j])
				for(var l in json[i][j][k])
				{
					console.log(json[i][j][k][l]['quantity']); 

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
function deleteProductFromSummary(id)
{
	var customizationId = 0;
	var productId = 0;
	var productAttributeId = 0;
	var id_address_delivery = 0;
	var ids = 0;
	ids = id.split('_');
	productId = parseInt(ids[0]);
	alter_id=parseInt(ids[0])+'_'+parseInt(ids[1])+'_'+parseInt(ids[3]);
	console.log(ids);
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
				{console.log(alter_id);
					console.log($('#cart_block_product_'+ alter_id));
					$('#cart_block_product_'+ alter_id).fadeOut('slow', function() {
						
						$(this).remove();
						console.log($(this));
						//cleanSelectAddressDelivery();
						if (!customizationId)
							//refreshOddRow();
						ajaxCart.refresh();
					});
					var exist = false;
					console.log('lol2');
					console.log(jsonData.summary.products);
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
}