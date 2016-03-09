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

{capture name=path}{l s='Top sellers'}{/capture}
{*include file="$tpl_dir./breadcrumb.tpl"*}
<h1>asd{l s='Top sellers'}</h1>

{if $products}
	<div class="content_sortPagiBar">
		<div class="row-fluid sortPagiBar clearfix">
			<div class=" col-md-6 col-sm-6 col-lg-6"><div class="inner">
			{include file="./product-sort.tpl"}
			</div></div>
			
			<div class=" col-md-4 col-sm-4 col-lg-4"><div class="inner">
			{include file="./product-compare.tpl"}
			</div></div>
		</div>
	</div>
	{include file="$tpl_dir./product-list.tpl" products=$products}
	{include file="$tpl_dir./pagination.tpl"}
{else}
	<p class="alert alert-warning">{l s='No top sellers.'}</p>
{/if}
