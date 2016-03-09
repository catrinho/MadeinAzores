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



<li class="dropdown
	{*if $node.children|@count > 0}
		dropdown
	{/if*}
	{if isset($currentCategoryId) && $node.id == $currentCategoryId}open active{/if}
	{if $node.children|@count > 0}
		{if isset($currentCategoryId)}
			{foreach from=$node.children item=child name=idNumber}
				{if $child.id == $currentCategoryId}
					open
				{/if}
			{/foreach}
		{/if}
	{/if}

">
	<a href="{$node.link|escape:'htmlall':'UTF-8'}"
	 data-target="{$node.link|escape:'htmlall':'UTF-8'}"
	{if $node.children|@count > 0}class="dropdown-toggle" data-toggle="dropdown" role="button" {/if} 
	{if isset($currentCategoryId) && $node.id == $currentCategoryId}class="selected"{/if}
	title="{$node.desc|escape:'htmlall':'UTF-8'}">{$node.name|escape:'htmlall':'UTF-8'}
</a>
	{if $node.children|@count > 0}
		<ul class="dropdown-menu list-unstyled" role="menu">
		{foreach from=$node.children item=child name=categoryTreeBranch}
			{if $smarty.foreach.categoryTreeBranch.last}
				{include file="$branche_tpl_path" node=$child last='true'}
			{else}
				{include file="$branche_tpl_path" node=$child last='false'}
			{/if}
		{/foreach}
		</ul>
	{/if}
</li>

{*}
<li class="
	{if $node.children|@count > 0}
		drop-down
	{/if}
	{if isset($currentCategoryId) && $node.id == $currentCategoryId}open active{/if}
	{if $node.children|@count > 0}
		{if isset($currentCategoryId)}
			{foreach from=$node.children item=child name=idNumber}
				{if $child.id == $currentCategoryId}
					open
				{/if}
			{/foreach}
		{/if}
	{/if}

">

	<a href="{$node.link|escape:'htmlall':'UTF-8'}"
	{if $node.children|@count > 0}{/if} 
	{if isset($currentCategoryId) && $node.id == $currentCategoryId}class="selected"{/if}
	title="{$node.desc|escape:'htmlall':'UTF-8'}">{$node.name|escape:'htmlall':'UTF-8'}
</a>
	{if $node.children|@count > 0}
		<ul class="submenu "role="menu">
		{foreach from=$node.children item=child name=categoryTreeBranch}
			{if $smarty.foreach.categoryTreeBranch.last}
				{include file="$branche_tpl_path" node=$child last='true'}
			{else}
				{include file="$branche_tpl_path" node=$child last='false'}
			{/if}
		{/foreach}
		</ul>
	{/if}

</li>
{*}



