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

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	        <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

		<title>{$meta_title|escape:'htmlall':'UTF-8'}</title>
{if isset($meta_description) AND $meta_description}
		<meta name="description" content="{$meta_description|escape:html:'UTF-8'}" />
{/if}
{if isset($meta_keywords) AND $meta_keywords}
		<meta name="keywords" content="{$meta_keywords|escape:html:'UTF-8'}" />
{/if}		
		<meta name="p:domain_verify" content="c3bc5bb555712bd1b0e1006e02954862"/>
		
		<meta name="viewport" content="width=device-width">
		<meta http-equiv="content-language" content="{$meta_language}" />
		<meta name="generator" content="PrestaShop" />
		<meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
		<link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
		
		<script type="text/javascript"   >
			var baseDir = '{$content_dir}';
			var baseUri = '{$base_uri}';
			var static_token = '{$static_token}';
			var token = '{$token}';
			var priceDisplayPrecision = {$priceDisplayPrecision*$currency->decimals};
			var priceDisplayMethod = {$priceDisplay};
			var roundMode = {$roundMode};
		</script> 
		
	
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->



<link rel="stylesheet" type="text/css" href="{$BOOTSTRAP_CSS_URI}"/>
<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700|PT+Sans+Narrow' rel='stylesheet' type='text/css'>
<link href='//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
{if isset($css_files)}
	{foreach from=$css_files key=css_uri item=media}
	<link href="{$css_uri}" rel="stylesheet" type="text/css"/>
	{/foreach}
{/if}

	
		{*{$js_uri|@print_r}  retirou-se o "async"   *}
		
		{if isset($js_files)}
			{foreach from=$js_files item=js_uri}
			
			<script type="text/javascript" src="{$js_uri}"></script>
			{/foreach}
			
		{/if}
			
	{$HOOK_HEADER}


	<!-- SUMOME ACCOUNT VERIFICATION - rmvrocha@gmail.com -->

		<script src="//load.sumome.com/" data-sumo-site-id="538024e9e0fda4588c9c2939dec98ce184b49bd80a575f2bc5e84858c1aa21c7" async="async"></script>


	</head>
	
	<body {if isset($page_name)}id="{$page_name|escape:'htmlall':'UTF-8'}"{/if} class="pattern7">
	
	{if !$content_only}
		{if isset($restricted_country_mode) && $restricted_country_mode}
		<div id="restricted-country">
			<p>{l s='You cannot place a new order from your country.'} <span class="bold">{$geolocation_country}</span></p>
		</div>
		{/if}
		<div id="page" class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					{if !empty($HOOK_TOP)}
					<div clas="row hidden-print">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						{$HOOK_TOP}	
						</div>
					</div>
					{/if}
					<div class="row">

						<!-- COLUNA DA ESQUERDA -->
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2  left-col">
							<div class="row show-grid">
						        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  logo">
						            <a id="header_logo" href="{$base_dir}" title="{$shop_name|escape:'htmlall':'UTF-8'}">
										<img class="img-responsive logo-mia" src="{$logo_url}" alt="{$shop_name|escape:'htmlall':'UTF-8'}" {if $logo_image_width}width="{$logo_image_width}"{/if} {if $logo_image_height}height="{$logo_image_height}" {/if} />
										
									</a>
									
									
						        </div>
						    </div>
						   <div class="hidden-print">
							<!-- $HOOK_LEFT_COLUMN) -->
								{$HOOK_LEFT_COLUMN}	
						   </div>	
						</div><!--  FIM COLUNA ESQUERDA-->
						 
						<!-- COLUNA DO CENTRO -->
						<div class="col-lg-8 col-md-8 col-sm-8  col-xs-8 center-col ">
							<!-- $HOOK_TOPNAVIGATION) -->
							{if !empty($HOOK_TOPNAVIGATION) }
							<div class="row hidden-print">
						        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding-row">
										 {$HOOK_TOPNAVIGATION}
								</div>
							</div>
							{/if}
							<!-- $HOOK_SLIDESHOW -->
							{if $HOOK_SLIDESHOW && in_array($page_name,array('index')) }


							<div class="row"> <!--  ,,,,,,,,,,,,,,,,,,,,,,Image-Slider,,,,,,,,,,,,,,,,,,--> 
						        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding-row slider-top ">
									
										 {$HOOK_SLIDESHOW}
									
								</div>
							</div>
							{/if}


								{include file="$tpl_dir./breadcrumb.tpl"}	

							<!-- $HOOK_PROMOTETOP -->
							{if $HOOK_PROMOTETOP && in_array($page_name,array('index')) }

							<div class="row"> <!--  ,,,,,,,,,,,,,,,,,,,,,,PROMO-Slider,,,,,,,,,,,,,,,,,,--> 
						       
									
										 {$HOOK_PROMOTETOP}

							</div>
							
							{/if}
							<!-- $HOOK_CONTENTBOTTOM -->
							{if $HOOK_CONTENTBOTTOM && in_array($page_name,array('index')) }
							<div id="contentbottom" class="row">
									{$HOOK_CONTENTBOTTOM}
							</div>
							{/if}

							<!-- <div class="row">
						              <div class="col-lg-12 no-padding-row"> -->
					

	{/if}