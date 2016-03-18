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
		</div><!--  FIM COLUNA DO CENTRO-->	

<!-- COLUNA DA DIREITA -->
<div class="col-lg-2  col-md-2 col-sm-2 col-xs-2 right-col hidden-print">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			{if !empty($HOOK_HEADERRIGHT)}
			<div id="header_right">
				{$HOOK_HEADERRIGHT}	
			</div>
			{/if}

			{$HOOK_RIGHT_COLUMN}

			
		</div>
	</div>
</div>
<!--  FIM COLUNA DA DIREITA-->
		{if $HOOK_BOTTOM}
			<section id="bottom hidden-print">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						 {$HOOK_BOTTOM} 
					</div>
				</div>
			</section>
			{/if}
					</div><!-- 	END of row -->
				</div><!-- 	END of col-lg-12 -->
			</div><!-- 	END of row -->
			 <footer class="row hidden-print">
			    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			      <div class="footer-line col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 ">
			        <div class="col-lg-12 col-md-12 col-sm-12">
			        	{$HOOK_FOOTER}
			        	 
						{if $PS_ALLOW_MOBILE_DEVICE}
							<p class="center clearBoth hidden-desktop"><a href="{$link->getPageLink('index', true)}?mobile_theme_ok">{l s='Browse the mobile site'}</a></p>
						{/if}
			        </div>
			        {if $HOOK_FOOTNAV}
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><div class="footnav">{$HOOK_FOOTNAV}</div></div>		
						{/if}
			       
						</div>
					    
			        </div>
			    </div>
			 </footer>  			
		</div><!-- 	END of container -->

<!-- Footer -->




	{/if}
	
		
		
		<script type="text/javascript">		  
			$('.title_block').each(function(){
				var me = $(this);
				me.html( me.text().replace(/(^\w+|\s+\w+)/,'<span class="tcolor">$1</span>') );
			});

		</script>
<!-- Kissmetrics tracking snippet -->
<script type="text/javascript">var _kmq = _kmq || [];
var _kmk = _kmk || '361dd363dc695c2c91ccb876fb7c0125de16241f';
function _kms(u){
  setTimeout(function(){
    var d = document, f = d.getElementsByTagName('script')[0],
    s = d.createElement('script');
    s.type = 'text/javascript'; s.async = true; s.src = u;
    f.parentNode.insertBefore(s, f);
  }, 1);
}
_kms('//i.kissmetrics.com/i.js');
_kms('//scripts.kissmetrics.com/' + _kmk + '.2.js');
</script>


	</body>
</html>