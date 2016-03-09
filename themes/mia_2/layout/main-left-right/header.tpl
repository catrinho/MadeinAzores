{if !empty($HOOK_LEFT_COLUMN)&& empty($HOOK_RIGHT_COLUMN)}
{assign var='LAYOUT_COLUMN_SPANS' value=array(3,9,0) scope='global'}
{elseif empty($HOOK_LEFT_COLUMN)&& !empty($HOOK_RIGHT_COLUMN)}
{assign var='LAYOUT_COLUMN_SPANS' value=array(0,9,3) scope='global'}
{elseif empty($HOOK_LEFT_COLUMN)&&empty($HOOK_RIGHT_COLUMN)}
{assign var='LAYOUT_COLUMN_SPANS' value=array(0,12,0) scope='global'}
{else}
{assign var='LAYOUT_COLUMN_SPANS' value=array(3,6,3) scope='global'}
{/if}

<!-- COLUNA DA ESQUERDA -->
<div class="col-lg-2 left-col">
	<div class="row show-grid">
        <div class="col-lg-12 logo">
            <a id="header_logo" href="{$base_dir}" title="{$shop_name|escape:'htmlall':'UTF-8'}">
				<img class="img-responsive logo-mia" src="{$logo_url}" alt="{$shop_name|escape:'htmlall':'UTF-8'}" {if $logo_image_width}width="{$logo_image_width}"{/if} {if $logo_image_height}height="{$logo_image_height}" {/if} />
			</a>
        </div>
    </div>
    <div class="row  show-grid">
	    <div class="col-lg-12 fb-follow">
	      <a href="#"><img src="{$img_dir}/followme_facebook.png" class="img-responsive follow-facebook"></a>
	    </div>
	</div>
	<!-- $HOOK_LEFT_COLUMN) -->
		{$HOOK_LEFT_COLUMN}	
	
</div><!--  FIM COLUNA ESQUERDA-->
 
<!-- COLUNA DO CENTRO -->
<div class="col-lg-8 center-col">
	<!-- $HOOK_TOPNAVIGATION) -->
	{if !empty($HOOK_TOPNAVIGATION) }
	<div class="row">
        <div class="col-lg-12 no-padding-row">
				 {$HOOK_TOPNAVIGATION}
		</div>
	</div>
	{/if}
	<!-- $HOOK_SLIDESHOW -->
	{if $HOOK_SLIDESHOW && in_array($page_name,array('index')) }
	{*if $HOOK_SLIDESHOW *}

	<div class="row"> <!--  ,,,,,,,,,,,,,,,,,,,,,,Image-Slider,,,,,,,,,,,,,,,,,,--> 
        <div class="col-lg-12 slider-top ">
			<!-- <div class="row"> -->
				 {$HOOK_SLIDESHOW}
			<!-- </div> -->
		</div>
	</div>
	{/if}


		{include file="$tpl_dir./breadcrumb.tpl"}	

	<!-- $HOOK_PROMOTETOP -->
	{if $HOOK_PROMOTETOP && in_array($page_name,array('index')) }
	{*if $HOOK_PROMOTETOP*}
	<div class="row"> <!--  ,,,,,,,,,,,,,,,,,,,,,,PROMO-Slider,,,,,,,,,,,,,,,,,,--> 
       
			
				 {$HOOK_PROMOTETOP}

	</div>
	
	{/if}
	<!-- $HOOK_CONTENTBOTTOM -->
	{if $HOOK_CONTENTBOTTOM && in_array($page_name,array('index')) }
	<div id="contentbottom" class="row">
			{$HOOK_CONTENTBOTTOM}
	</div>
	{/if}

	<!-- <div class="row">
              <div class="col-lg-12 no-padding-row"> -->
                