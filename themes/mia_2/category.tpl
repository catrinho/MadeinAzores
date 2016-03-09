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
*  @version  Release: $Revision: 6844 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{*include file="$tpl_dir./breadcrumb.tpl"*}
{include file="$tpl_dir./errors.tpl"}

    
{if isset($category)}
	{if $category->id AND $category->active}
	
		
			
				
		
		{if $scenes || $category->description || $category->id_image}
		<div class="row content_scene_cat">
			{if $scenes}
				<!-- Scenes -->
				{include file="$tpl_dir./scenes.tpl" scenes=$scenes}
			{else}
				<!-- Category image -->
				{if $category->id_image}
				<div class="col-lg-12  col-md-12 col-sm-12  text_center no-padding-row">
					<img src="{$link->getCatImageLink($category->link_rewrite, $category->id_image, 'category_leometr')}" alt="{$category->name|escape:'htmlall':'UTF-8'}" title="{$category->name|escape:'htmlall':'UTF-8'}" id="categoryImage" width="100%{*$categorySize.width*}" class="image-responsive"  />
				</div>
				{/if}
			{/if}

			{if $category->description}
				<div class="cat_desc">
				{if strlen($category->description) > 120}
					<p id="category_description_short">{$category->description|truncate:120}</p>
					<p id="category_description_full" style="display:none">{$category->description}</p>
					<a href="#" onclick="$('#category_description_short').hide(); $('#category_description_full').show(); $(this).hide(); return false;" class="lnk_more">{l s='More'}</a>
				{else}
					<p>{$category->description}</p>
				{/if}
				</div>
			{/if}
			  <div class="col-lg-12  col-md-12 col-sm-12 section-title">
		        <div class="row">
		         	 <h1>
						{strip}
							{$category->name|escape:'htmlall':'UTF-8'}
							{if isset($categoryNameComplement)}
								{$categoryNameComplement|escape:'htmlall':'UTF-8'}
							{/if}
						{/strip}
					</h1>
					
		        </div>
		        {*<span class="resumecat category-product-count">
						 {include file="$tpl_dir./category-count.tpl"}
					</span>*}
		        </div>
		     
		</div>
		{else}
		     <div class="col-lg-12 col-md-12 col-sm-12  section-title">
		        <div class="row">
		         	 <h1>
						{strip}
							{$category->name|escape:'htmlall':'UTF-8'}
							{if isset($categoryNameComplement)}
								{$categoryNameComplement|escape:'htmlall':'UTF-8'}
							{/if}
						{/strip}
					</h1>
					
		        </div>
		        {*<span class="resumecat category-product-count">
						 {include file="$tpl_dir./category-count.tpl"}
					</span>*}
		        </div>
		{/if}
		{*}
		{if isset($subcategories)}
		<!-- Subcategories -->
		<div id="subcategories">
			<div class="col-lg-12 col-md-12 col-sm-12 section-title">
		        <div class="row">
		         	<h3>{l s='Subcategories'}</h3>
		        </div>
			</div>
			
			<div class="inline_list">
			{foreach from=$subcategories item=subcategory name=subcategories}
				{if $subcategory@iteration%4==1}
				<div class="row-fluid">
				{/if}
					
				<div class="col-lg-3">
					<div class="category-container">
						<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{$subcategory.name|escape:'htmlall':'UTF-8'}" class="img">
							{if $subcategory.id_image}
								<img src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'large_default')}" alt=""/>
							{else}
								<img src="{$img_cat_dir}default-large_default.jpg" alt="" width="{$largeSize.width}" height="{$largeSize.height}" />
							{/if}
						</a>
						<div class="col-lg-12 col-md-12 col-sm-12 section-title">
					        <div class="row">
					         	<h4><a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" class="cat_name s_title_block">{$subcategory.name|escape:'htmlall':'UTF-8'}</a></h4>
					        </div>
						</div>
						
						{if $subcategory.description}
							<p class="cat_desc">{$subcategory.description|escape|truncate:60:'...':true}</p>
						{/if}
					</div>
				</div>
				{if $subcategory@iteration%4==0||$smarty.foreach.subcategories.last}
				</div>
				{/if}
			{/foreach}
			</div>
			<br class="clear"/>
		</div>
		{/if}
{*}
	{if $products}
		<div class="products-list">
			<div class="content_sortPagiBar">
				<div class="row sortPagiBar">                    
					{*<div class="col-lg-3 hidden-phone">
						<div class="inner">
						  <div class="btn-group" id="productsview">
							<a class="btn" href="#" rel="view-grid"><span class="glyphicon glyphicon-th"></span></a>
							<a class="btn" href="#"  rel="view-list"><span class="glyphicon glyphicon-th-list"></span></a>
						  </div>
						</div>
					</div>
					<div class="col-lg-3  col-md-3 col-sm-3"><div class="inner">
                    {include file="./product-compare.tpl"}
                    </div></div>*}
                    <div class="col-lg-6  col-md-6 col-sm-6  pull-right no-padding-row hidden-phone"><div class="inner">
					{include file="./product-sort.tpl"}
                    </div></div>
					
					
				</div>
			</div>
			
			{include file="./product-list.tpl" products=$products}
			
			{include file="$tpl_dir./pagination.tpl"}
			
		</div>
		{/if}
	{elseif $category->id}
		<p class="alert alert-warning">{l s='This category is currently unavailable.'}</p>
	{/if}
{/if}

