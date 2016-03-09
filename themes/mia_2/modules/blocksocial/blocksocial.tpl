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

<div class="row">
    <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding-row">
      		{if $facebook_url != ''}<a href="{$facebook_url|escape:html:'UTF-8'}" target="_blank" > <div class="icon facebook-bt rounded">&#xf09a;</div> </a>{/if}
		    {if $twitter_url != ''}<a href="{$twitter_url|escape:html:'UTF-8'}" target="_blank" ><div class="icon twitter-bt rounded">&#xf099;</div></a>{/if}
			{if $google_plus_url != ''}<a href="{$google_plus_url|escape:html:'UTF-8'}" target="_blank" ><div class="icon google-bt rounded">&#xf0d5;</div></a>{/if}
			{if $pinterest_url != ''}<a href="{$pinterest_url|escape:html:'UTF-8'}" target="_blank" ><div class="icon pinterest-bt rounded">&#xf0d2;</div></a>{/if}
			</br> </br>
    </div>
</div>