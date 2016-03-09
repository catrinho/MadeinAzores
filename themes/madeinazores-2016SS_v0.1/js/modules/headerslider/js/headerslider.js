/*
* 2007-2015 PrestaShop
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
*  @copyright  2007-2015 PrestaShop SA
*  @version  Release: $Revision$
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

$(document).ready(function(){

	if (typeof(headerslider_speed) == 'undefined')
		headerslider_speed = 500;
	if (typeof(headerslider_pause) == 'undefined')
		headerslider_pause = 3000;
	if (typeof(headerslider_loop) == 'undefined')
		headerslider_loop = true;
	// if (typeof(headerslider_width) == 'undefined')
	// 	headerslider_width = 779;


	// $('.headerslider-description').click(function () {
	// 	window.location.href = $(this).prev('a').prop('href');
	// });

	// if ($('#htmlcontent_top').length > 0)
	// 	$('#headerpage-slider').addClass('col-xs-8');
	// else
	// 	$('#headerpage-slider').addClass('col-xs-12');

	if (!!$.prototype.bxSlider)
		$('#headerslider').bxSlider({
			useCSS: false,
			maxSlides: 1,
			randomStart:true,
			//slideWidth: headerslider_width,
			infiniteLoop: headerslider_loop,
			//hideControlOnEnd: true,
			pager: false,
			autoHover: true,
			//auto: headerslider_loop,
			speed: parseInt(headerslider_speed),
			pause: headerslider_pause,
			controls: false
		});
});