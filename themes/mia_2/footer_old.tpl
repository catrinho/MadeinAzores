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

		{if !$content_only}
		{include file="$tpl_dir./layout/{$LEO_LAYOUT_DIRECTION}/footer.tpl"  }
		{if $HOOK_BOTTOM}
			<section id="bottom">
				<div class="row">
					<div class="col-lg-12">
						 {$HOOK_BOTTOM}
					</div>
				</div>
			</section>
			{/if}
					</div><!-- 	END of row -->
				</div><!-- 	END of col-lg-12 -->
			</div><!-- 	END of row -->
			 <footer class="row">
			    <div class="col-lg-12">
			      <div class="footer-line col-lg-offset-3 col-lg-6">
			        <div class="col-lg-12">
			        	{$HOOK_FOOTER}
						{if $PS_ALLOW_MOBILE_DEVICE}
							<p class="center clearBoth hidden-desktop"><a href="{$link->getPageLink('index', true)}?mobile_theme_ok">{l s='Browse the mobile site'}</a></p>
						{/if}
			        </div>
			        {if $HOOK_FOOTNAV}
								<div class="col-lg-12"><div class="footnav">{$HOOK_FOOTNAV}</div></div>		
						{/if}
			        <div class="col-lg-12">
						<div class="copyright">
								Copyright {date('Y')} Powered by PrestaShop. All Rights Reserved. nao eskecer...!!
						</div>
						</div>
					    
			        </div>
			    </div>
			 </footer>  			
		</div><!-- 	END of container -->

<!-- Footer -->
	{/if}
	{if $LEO_PANELTOOL}
    	{include file="$tpl_dir./info/paneltool.tpl"}
    {/if}
		<script type="text/javascript">		  
			$('.title_block').each(function(){
				var me = $(this);
				me.html( me.text().replace(/(^\w+|\s+\w+)/,'<span class="tcolor">$1</span>') );
			});

		</script>
		<script type="text/javascript">
			var classBody = "{$LEO_PATTERN}";
			$("body").addClass( classBody.replace(/\.\w+$/,"")  );
		</script>

	</body>
</html>
