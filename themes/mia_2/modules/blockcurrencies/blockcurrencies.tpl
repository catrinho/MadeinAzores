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

<!-- Block currencies module -->
   
              <div class="col-lg-3 col-md-3 col-sm-3 pull-right no-padding-row">
                <div id="currencies" class="col-lg-12 col-md-12 col-sm-12 pull-left no-padding-row">
                        <form id="setCurrency" action="{$request_uri}" method="post">
                      		<input type="hidden" name="id_currency" id="id_currency" value=""/>
							<input type="hidden" name="SubmitCurrency" value="" />
							
							<ul id="first-currencies" class="languages no-padding-left pull-right">
								{foreach from=$currencies key=k item=f_currency}
									<li>
										<a {if $cookie->id_currency == $f_currency.id_currency}class="active"{/if}href="javascript:setCurrency({$f_currency.id_currency});" title="{$f_currency.name}">{$f_currency.sign}</a>
									</li>
								{/foreach}
							</ul>
						</form>		
                </div>
              </div> 
            
<!-- /Block currencies module -->
