

	

	





/*----- Responsive THings*/

$(document).ready(function() {

	


	

  $(window).scroll(function(){

		if($('#header').is(':visible')) {
			$('#top_row').addClass('header-menu');
		}	

 //      if ($(this).scrollTop() > 135) {
 //      	alert('143');
 //          $('#top_row').css('position','fixed');
 //      } else {
 //      	alert('143');
 //         $('#top_row').css('position','fixed');
 //      }
  });



function highdpiInit()
{
	if (typeof highDPI === 'undefined')
		return;
	if(highDPI && $('.replace-2x').css('font-size') == "1px")
	{
		var els = $("img.replace-2x").get();
		for(var i = 0; i < els.length; i++)
		{
			src = els[i].src;
			extension = src.substr( (src.lastIndexOf('.') +1) );
			src = src.replace("." + extension, "2x." + extension);

			var img = new Image();
			img.src = src;
			img.height != 0 ? els[i].src = src : els[i].src = els[i].src;
		}
	}
}


// Used to compensante Chrome/Safari bug (they don't care about scroll bar for width)


/*
function blockHover(status)
{
	var screenLg = $('body').find('.container').width() == 1170;

	if ($('.product_list').is('.grid'))
		if (screenLg)
			$('.product_list .button-container').hide();
		else
			$('.product_list .button-container').show();

	$(document).off('mouseenter').on('mouseenter', '.product_list.grid li.ajax_block_product .product-container', function(e){
		if (screenLg)
		{
			var pcHeight = $(this).parent().outerHeight();
			var pcPHeight = $(this).parent().find('.button-container').outerHeight() + $(this).parent().find('.comments_note').outerHeight() + $(this).parent().find('.functional-buttons').outerHeight();
			$(this).parent().addClass('hovered').css({'height':pcHeight + pcPHeight, 'margin-bottom':pcPHeight * (-1)});
			$(this).find('.button-container').show();
		}
	});

	$(document).off('mouseleave').on('mouseleave', '.product_list.grid li.ajax_block_product .product-container', function(e){
		if (screenLg)
		{
			$(this).parent().removeClass('hovered').css({'height':'auto', 'margin-bottom':'0'});
			$(this).find('.button-container').hide();
		}
	});
}

function quick_view()
{
	$(document).on('click', '.quick-view:visible, .quick-view-mobile:visible', function(e){
		e.preventDefault();
		var url = this.rel;
		var anchor = '';

		if (url.indexOf('#') != -1)
		{
			anchor = url.substring(url.indexOf('#'), url.length);
			url = url.substring(0, url.indexOf('#'));
		}

		if (url.indexOf('?') != -1)
			url += '&';
		else
			url += '?';

		if (!!$.prototype.fancybox)
			$.fancybox({
				'padding':  0,
				'width':    1087,
				'height':   610,
				'type':     'iframe',
				'href':     url + 'content_only=1' + anchor
			});
	});
}

function bindGrid()
{
	var storage = false;
	if (typeof(getStorageAvailable) !== 'undefined') {
		storage = getStorageAvailable();
	}
	if (!storage) {
		return;
	}

	var view = $.totalStorage('display');

	if (!view && (typeof displayList != 'undefined') && displayList)
		view = 'list';

	if (view && view != 'grid')
		display(view);
	else
		$('.display').find('#ViewGrid').addClass('active');

	$(document).on('click', '#grid', function(e){
		e.preventDefault();
		display('grid');
	});

	$(document).on('click', '#list', function(e){
		e.preventDefault();
		display('list');
	});
}

function display(view)
{
	if (view == 'list')
	{
		$('ul.product_list').removeClass('grid').addClass('list row');
		$('.product_list > li').removeClass('col-xs-12 col-sm-6 col-md-4').addClass('col-xs-12');
		$('.product_list > li').each(function(index, element) {
			var html = '';
			html = '<div class="product-container"><div class="row">';
			html += '<div class="left-block col-xs-4 col-sm-5 col-md-4">' + $(element).find('.left-block').html() + '</div>';
			html += '<div class="center-block col-xs-4 col-sm-7 col-md-4">';
			html += '<div class="product-flags">'+ $(element).find('.product-flags').html() + '</div>';
			html += '<h5 itemprop="name">'+ $(element).find('h5').html() + '</h5>';
			var hookReviews = $(element).find('.hook-reviews');
			if (hookReviews.length) {
				html += hookReviews.clone().wrap('<div>').parent().html();
			}
			html += '<p class="product-desc">'+ $(element).find('.product-desc').html() + '</p>';
			var colorList = $(element).find('.color-list-container').html();
			if (colorList != null) {
				html += '<div class="color-list-container">'+ colorList +'</div>';
			}
			var availability = $(element).find('.availability').html();	// check : catalog mode is enabled
			if (availability != null) {
				html += '<span class="availability">'+ availability +'</span>';
			}
			html += '</div>';
			html += '<div class="right-block col-xs-4 col-sm-12 col-md-4"><div class="right-block-content row">';
			var price = $(element).find('.content_price').html();       // check : catalog mode is enabled
			if (price != null) {
				html += '<div class="content_price col-xs-5 col-md-12">'+ price + '</div>';
			}
			html += '<div class="button-container col-xs-7 col-md-12">'+ $(element).find('.button-container').html() +'</div>';
			html += '<div class="functional-buttons clearfix col-sm-12">' + $(element).find('.functional-buttons').html() + '</div>';
			html += '</div>';
			html += '</div></div>';
			$(element).html(html);
		});
		$('.display').find('#viewList').addClass('active');
		$('.display').find('#viewGrid').removeAttr('class');
		$.totalStorage('display', 'list');
	}
	else
	{
		$('ul.product_list').removeClass('list').addClass('grid row');
		$('.product_list > li').removeClass('col-xs-12').addClass('col-xs-12 col-sm-6 col-md-4');
		$('.product_list > li').each(function(index, element) {
			var html = '';
			html += '<div class="product-container">';
			html += '<div class="left-block">' + $(element).find('.left-block').html() + '</div>';
			html += '<div class="right-block">';
			html += '<div class="product-flags">'+ $(element).find('.product-flags').html() + '</div>';
			html += '<h5 itemprop="name">'+ $(element).find('h5').html() + '</h5>';
			var hookReviews = $(element).find('.hook-reviews');
			if (hookReviews.length) {
				html += hookReviews.clone().wrap('<div>').parent().html();
			}
			html += '<p itemprop="description" class="product-desc">'+ $(element).find('.product-desc').html() + '</p>';
			var price = $(element).find('.content_price').html(); // check : catalog mode is enabled
			if (price != null) {
				html += '<div class="content_price">'+ price + '</div>';
			}
			html += '<div itemprop="offers" itemscope itemtype="https://schema.org/Offer" class="button-container">'+ $(element).find('.button-container').html() +'</div>';
			var colorList = $(element).find('.color-list-container').html();
			if (colorList != null) {
				html += '<div class="color-list-container">'+ colorList +'</div>';
			}
			var availability = $(element).find('.availability').html(); // check : catalog mode is enabled
			if (availability != null) {
				html += '<span class="availability">'+ availability +'</span>';
			}
			html += '</div>';
			html += '<div class="functional-buttons clearfix">' + $(element).find('.functional-buttons').html() + '</div>';
			html += '</div>';
			$(element).html(html);
		});
		$('.display').find('#viewGrid').addClass('active');
		$('.display').find('#viewList').removeAttr('class');
		$.totalStorage('display', 'grid');
	}
}
function dropDown()
{
	elementClick = '#header .current';
	elementSlide =  'ul.toogle_content';
	activeClass = 'active';

	$(elementClick).on('click', function(e){
		e.stopPropagation();
		var subUl = $(this).next(elementSlide);
		if(subUl.is(':hidden'))
		{
			subUl.slideDown();
			$(this).addClass(activeClass);
		}
		else
		{
			subUl.slideUp();
			$(this).removeClass(activeClass);
		}
		$(elementClick).not(this).next(elementSlide).slideUp();
		$(elementClick).not(this).removeClass(activeClass);
		e.preventDefault();
	});

	$(elementSlide).on('click', function(e){
		e.stopPropagation();
	});

	$(document).on('click', function(e){
		e.stopPropagation();
		var elementHide = $(elementClick).next(elementSlide);
		$(elementHide).slideUp();
		$(elementClick).removeClass('active');
	});
}

function accordionFooter(status)
{
	if(status == 'enable')
	{
		$('#footer .footer-block h4').on('click', function(e){
			$(this).toggleClass('active').parent().find('.toggle-footer').stop().slideToggle('medium');
			e.preventDefault();
		})
		$('#footer').addClass('accordion').find('.toggle-footer').slideUp('fast');
	}
	else
	{
		$('.footer-block h4').removeClass('active').off().parent().find('.toggle-footer').removeAttr('style').slideDown('fast');
		$('#footer').removeClass('accordion');
	}
}

function accordion(status)
{
	if(status == 'enable')
	{
		var accordion_selector = '#right_column .block .title_block, #left_column .block .title_block, #left_column #newsletter_block_left h4,' +
								'#left_column .shopping_cart > a:first-child, #right_column .shopping_cart > a:first-child';

		$(accordion_selector).on('click', function(e){
			$(this).toggleClass('active').parent().find('.block_content').stop().slideToggle('medium');
		});
		$('#right_column, #left_column').addClass('accordion').find('.block .block_content').slideUp('fast');
		if (typeof(ajaxCart) !== 'undefined')
			ajaxCart.collapse();
	}
	else
	{
		$('#right_column .block .title_block, #left_column .block .title_block, #left_column #newsletter_block_left h4').removeClass('active').off().parent().find('.block_content').removeAttr('style').slideDown('fast');
		$('#left_column, #right_column').removeClass('accordion');
	}
}
*/





