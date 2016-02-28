{if $MENU != ''}
	<!-- Menu -->
	<div id="block_top_menu" class="unpad-left sf-contener col-lg-8 col-md-8 col-sm-6 col-xs-12">
		<div id="burgerking" class="visible-xs">
			<div class="burger">
	          <div class="burger-brick"></div>
	          <div class="burger-brick middle"></div>
	          <div class="burger-brick"></div>
	        </div>
	    </div>   
	    <div class="brand-mobile visible-xs"><span>Made in Azores</span></div> 
		<div class="cat-title">{l s="Menu" mod="blocktopmenu"}</div>
		<ul class="sf-menu menu-content">
			{$MENU}
			{if $MENU_SEARCH}
				<li class="sf-search noBack" style="float:right">
					<form id="searchbox" action="{$link->getPageLink('search')|escape:'html':'UTF-8'}" method="get">
						<p>
							<input type="hidden" name="controller" value="search" />
							<input type="hidden" value="position" name="orderby"/>
							<input type="hidden" value="desc" name="orderway"/>
							<input type="text" name="search_query" value="{if isset($smarty.get.search_query)}{$smarty.get.search_query|escape:'html':'UTF-8'}{/if}" />
						</p>
					</form>
				</li>
			{/if}
		</ul>
	</div>
	<!--/ Menu -->
{/if}