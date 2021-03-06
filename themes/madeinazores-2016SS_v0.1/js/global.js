

//global variables
var responsiveflag = false;

$(document).ready(function(){
	$( "select" ).removeClass('form-control').wrap( "<span class='custom-dropdown'></span>" );
	$("#center_column .nav .header_user_info").addClass('header_user_info-move');
	$("#center_column .nav .languages-block").addClass('languages-block-move');

	responsiveResize();
	$(window).resize(responsiveResize);
	if (navigator.userAgent.match(/Android/i))
	{
		var viewport = document.querySelector('meta[name="viewport"]');
		viewport.setAttribute('content', 'initial-scale=1.0,maximum-scale=1.0,user-scalable=0,width=device-width,height=device-height');
		window.scrollTo(0, 1);
	}
	
	//highdpiInit();

	// Menu Hamburger  - Mobile

	  $('.burger').on('click', function() {
	  	
	  	$('.burger').toggleClass('open');
	  	
	  	$('body').toggleClass('not-moving')/*.toggleClass('absolute')*/;
	  	$('#top_row').toggleClass('isOpen');  
	    $('#left_column').toggleClass('isOpen')/*.toggleClass('not-moving')*/;
	  });

			 $('#burgerking-upper,.arrow').on('click', function() {
			 	//e.preventDefault;
			 	$('html,body').animate({
		        scrollTop: $("#center_column").offset().top
		     }, 700);
		  	
			 });

	// Categorias DropDown

	// if($('.childMenu>li>a').hasClass('selected')){
	// 	console.log('yaaaaaa');
	// 	$(this).prev().prev().css('display','block !important');//.slideDown();
	// }
		$('li.subMenu>a').on('click', function(e) {
			
			 if(!$(this).next().is(":visible")){
			 	
				$("nav.block_content ul ul.childMenu").slideUp({
					start:function(){
						$('li.subMenu>a').removeClass('open').attr('href','javascript:void(0)');
					}	
				});
			 	$(this).next().slideDown(),
			 	$(this).addClass('open'),
			 	e.stopPropagation()
			 }else{
			 	$(this).attr('href',$(this).data('href'));
			 }
		});
	 

	// Close Alert messages
	$(".alert.alert-danger").on('click', this, function(e){
		if (e.offsetX >= 16 && e.offsetX <= 39 && e.offsetY >= 16 && e.offsetY <= 34)
			$(this).fadeOut();
	});

	// HOME PAGE SLIDERS 
		$('#homefeatured,#blockbestsellers').owlCarousel({
		    loop:false,
		    margin:0,
		    responsiveClass:true,
		    responsive:{
		        0:{
		            items:1,
		            //dot:true
		        },
		        600:{
		            items:2,
		            //nav:true
		        },
		        1000:{
		            items:3,
		            //dot:true,
		        }
		    }
		});

		// On change id contry

		$(document).on('change', '#id_country', function(e)
			{
				if(!$(this).hasClass('select-hidden')){
				 	StyleSelect();
				 }
			});	


	if (typeof quickView !== 'undefined' && quickView)
		//quick_view();
	//dropDown();

	if (typeof page_name != 'undefined' && !in_array(page_name, ['index', 'product']))
	{
		//bindGrid();

		$(document).on('change', '.selectProductSort', function(e){
			if (typeof request != 'undefined' && request)
				var requestSortProducts = request;
			var splitData = $(this).val().split(':');
			var url = '';
			if (typeof requestSortProducts != 'undefined' && requestSortProducts)
			{
				url += requestSortProducts ;
				if (typeof splitData[0] !== 'undefined' && splitData[0])
				{
					url += ( requestSortProducts.indexOf('?') < 0 ? '?' : '&') + 'orderby=' + splitData[0] + (splitData[1] ? '&orderway=' + splitData[1] : '');
					if (typeof splitData[1] !== 'undefined' && splitData[1])
						url += '&orderway=' + splitData[1];
				}
				document.location.href = url;
			}
		});

		

		$(document).on('change', 'select[name="currency_payment"]', function(){
			setCurrency($(this).val());
		});
	}

	if (typeof(FancyboxI18nClose) !== 'undefined' && typeof(FancyboxI18nNext) !== 'undefined' && typeof(FancyboxI18nPrev) !== 'undefined' && !!$.prototype.fancybox)
		$.extend($.fancybox.defaults.tpl, {
			closeBtn : '<a title="' + FancyboxI18nClose + '" class="fancybox-item fancybox-close" href="javascript:;"></a>',
			next     : '<a title="' + FancyboxI18nNext + '" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>',
			prev     : '<a title="' + FancyboxI18nPrev + '" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'
		});

	$(document).on('change', 'select[name="manufacturer_list"], select[name="supplier_list"]', function(){
		if (this.value != '')
			location.href = this.value;
	});

	$(document).on('change', 'select[name="n"]', function(){
			$(this.form).submit();
	});
	
	$(document).on('click', '.back', function(e){
		e.preventDefault();
		history.back();
	});	


	jQuery.curCSS = jQuery.css;
	if (!!$.prototype.cluetip)
		$('a.cluetip').cluetip({
			local:true,
			cursor: 'pointer',
			dropShadow: false,
			dropShadowSteps: 0,
			showTitle: false,
			tracking: true,
			sticky: false,
			mouseOutClose: true,
			fx: {
				open:       'fadeIn',
				openSpeed:  'fast'
			}
		}).css('opacity', 0.8);

	

	
}); //end doc ready


function responsiveResize()
{
	
	compensante = scrollCompensate();
	// console.log('scroll compensante -'+compensante);
	// console.log('windo w ' + $(window).width());
	//console.log('total' + $(window).width()+scrollCompensate());
	if (($(window).width()+scrollCompensate()) <= 768 && responsiveflag == false)
	{
		// Ecrãs menores que 768px

		responsiveflag = true;
		//remove a navegação do centro e coloca como fixa no top do ecra movel
		$('.nav').detach().appendTo('#top_row');
		//Remove a coluna da esquerda e coloca a seguir à div#page - slide menu
		$('#left_column').detach().insertAfter('#page');
		// Deslocação do Header menu, do centro, para o slide menu
		$(".nav .header_user_info-move, .nav .languages-block-move").detach().insertAfter('#header_logo');
		// Deslocação do footer para o fundo do slide menu
		$('#block_various_links_footer').detach().insertAfter('#categories_block_left').removeClass('col-xs-12').removeClass('col-sm-12');
		$('#block_various_links_footer>ul').removeClass('text-center').removeClass('align-center');


		// Se a Capa (header) estiver visivel, aplica a class header-menu
	  	if($('#header').is(':visible')) {
			$('#top_row').addClass('header-menu');
		}	

    // Code


	}
	else if (($(window).width()+scrollCompensate()) >= 768)
	{
		responsiveflag = false;
		//if(!$("body#index").hasClass()){
			// //deslocar a navegação do top do ecra movel para o top da #center_column
			 $('.nav').removeClass('col-xs-12').detach().prependTo('#center_column');
			 $('.header_user_info-move,.languages-block-move').detach().insertAfter('.nav #block_top_menu');
			// // Deslocação do Header menu, do centro, para o slide menu
			//$('.header_user_info,.languages-block').detach().insertAfter('#header_logo');
			// //desloca a coluna da esquerda e coloca a dentro da div#page - left-column
			 $('#left_column').detach().insertBefore('#center_column');
			// // Deslocação do footer para o fundo do  #center-colum
			 $('#block_various_links_footer').detach().appendTo('footer>.row:first-child').addClass('col-xs-12').addClass('col-sm-12');
			 $('#block_various_links_footer>ul').addClass('text-center').addClass('align-center');
		//}
		if (typeof bindUniform !=='undefined')
			bindUniform();
	}
	//blockHover();
}	


function bindUniform()
{
	if (!!$.prototype.uniform){
		$("form-control,input[type='radio'],input[type='checkbox']").not(".not_uniform,select").uniform();
	}

	// $('select').each(function(){
	// 	//console.log('sel')
	// 	 if(!$(this).hasClass('select-hidden')){
	// 	 	StyleSelect();
	// 	 }
	//});
}

function scrollCompensate()
{
	var inner = document.createElement('p');
	inner.style.width = "100%";
	inner.style.height = "200px";

	var outer = document.createElement('div');
	outer.style.position = "absolute";
	outer.style.top = "0px";
	outer.style.left = "0px";
	outer.style.visibility = "hidden";
	outer.style.width = "200px";
	outer.style.height = "150px";
	outer.style.overflow = "hidden";
	outer.appendChild(inner);

	document.body.appendChild(outer);
	var w1 = inner.offsetWidth;
	outer.style.overflow = 'scroll';
	var w2 = inner.offsetWidth;
	if (w1 == w2) w2 = outer.clientWidth;

	document.body.removeChild(outer);

	return (w1 - w2);
}

function StyleSelect(){
	$('select').each(function(){
		var $this = $(this), numberOfOptions = $(this).children('option').length;

		$this.addClass('select-hidden'); 
		$this.wrap('<div class="select"></div>');
		$this.after('<div class="select-styled"></div>');

		var $styledSelect = $this.next('div.select-styled');
		$styledSelect.text($this.children('option').eq(0).text());

		var $list = $('<ul />', {
		'class': 'select-options'
		}).insertAfter($styledSelect);

		for (var i = 0; i < numberOfOptions; i++) {
		$('<li />', {
		    text: $this.children('option').eq(i).text(),
		    rel: $this.children('option').eq(i).val()
		}).appendTo($list);
		}

		var $listItems = $list.children('li');

		$styledSelect.click(function(e) {
		e.stopPropagation();
		$('div.select-styled.active').each(function(){
		    $(this).removeClass('active').next('ul.select-options').hide();
		});
		$(this).toggleClass('active').next('ul.select-options').toggle();
		});

		$listItems.click(function(e) {
		e.stopPropagation();
		$styledSelect.text($(this).text()).removeClass('active');
		$this.val($(this).attr('rel'));
		$list.hide();
	//console.log($this.val());
	});

	$(document).click(function() {
	$styledSelect.removeClass('active');
		$list.hide();
	});
	//$('div.select >div.select').remove();
	});
}

$(function() {
  var lastScrollTop = 0,
    delta = 10,
    animationEnd = "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend";
  $(window).scroll(function(event) {
    var pxFromTop = $(this).scrollTop();
    var scrollpos = $(window).scrollTop();
    var oneHeight = $("#header").outerHeight();
    	oneHeight = oneHeight - 58;
  
     if (Math.abs(lastScrollTop - pxFromTop) <= delta) {
      return;
    }
    if (pxFromTop > lastScrollTop && pxFromTop > oneHeight) {
      // downscroll code while in first slide
		//console.log("fora do header"+pxFromTop )
		if($('#top_row').hasClass('header-menu')){
			$('#top_row').removeClass('header-menu');
		}

		//$('html,body').animate({scrollTop: $("#page").offset().bottom }, 700);
      /**/
    } else if (pxFromTop < lastScrollTop && scrollpos < oneHeight) {
      // upscroll code towards first slide
      if(!$('#top_row').hasClass('header-menu')){
			$('#top_row').addClass('header-menu');
		}
		// $('html,body').animate({scrollTop: $("#header").offset().top }, 700);
		// console.log("sobres do header"+pxFromTop )

      /**/
    }
    lastScrollTop = pxFromTop;
  });
});