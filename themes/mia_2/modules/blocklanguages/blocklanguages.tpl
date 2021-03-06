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

<!-- Block languages module -->
<div class="col-lg-3 col-md-3 col-sm-3 no-padding-row"> 

                   {if count($languages) > 1} 
                    <div id="countries" class="col-lg-9 col-md-9 col-sm-9 pull-right no-padding-row countries">
                      <ul id="first-languages" class="languages pull-right  no-padding-right"> 
                      	{foreach from=$languages key=k item=language name="languages"}
                      		
                        		<li>
										{assign var=indice_lang value=$language.id_lang}
										{if isset($lang_rewrite_urls.$indice_lang)}
									 <a href="{$lang_rewrite_urls.$indice_lang|escape:htmlall}" title="{$language.name}"
										{else}
									<a  href="{$link->getLanguageLink($language.id_lang)|escape:htmlall}" title="{$language.name}"
										{/if}
                        			{if $language.iso_code == $lang_iso} class="active"{/if}>{$language.iso_code} </a></li>
                        		
                        {/foreach}
                      </ul>
                    </div>
                    {/if}
    </div>            
          
<!-- /Block languages module -->
