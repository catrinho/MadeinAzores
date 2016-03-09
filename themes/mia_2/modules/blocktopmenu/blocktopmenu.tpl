{if $MENU != ''}
	<!-- Menu -->
	{*
<!-- 	<div class="sf-contener clearfix">
		<ul class="sf-menu clearfix">
			{$MENU}
			{if $MENU_SEARCH}
				<li class="sf-search noBack" style="float:right">
					<form id="searchbox" action="{$link->getPageLink('search')}" method="get">
						<p>
							<input type="hidden" name="controller" value="search" />
							<input type="hidden" value="position" name="orderby"/>
							<input type="hidden" value="desc" name="orderway"/>
							<input type="text" name="search_query" value="{if isset($smarty.get.search_query)}{$smarty.get.search_query|escape:'htmlall':'UTF-8'}{/if}" />
						</p>
					</form>
				</li>
			{/if}
		</ul>
		<div class="sf-right">&nbsp;</div> -->
	<!--/ Menu -->
*}
	 <div class="col-lg-9  col-md-9 col-sm-9 col-xs-9 no-padding-row">
       <ol class="breadcrumb menu-top no-padding-row">
       <li><a href="{$base_dir}">Home</a></li>
        <!-- <li><a href="#">Informações</a></li>
        <li><a href="#">Contactos</a></li>
        <li><a href="#">Condições</a></li>-->
 			{$MENU}
      </ol> 
    </div>
   
{/if}