
<!DOCTYPE html>
<html  class="full-back" lang="{$language_code|escape:'html':'UTF-8'}">
<head>
	<meta charset="utf-8">
	<title>{$meta_title|escape:'html':'UTF-8'}</title>
{if isset($meta_description)}
	<meta name="description" content="{$meta_description|escape:'html':'UTF-8'}">
{/if}
{if isset($meta_keywords)}
	<meta name="keywords" content="{$meta_keywords|escape:'html':'UTF-8'}">
{/if}
	<meta name="robots" content="{if isset($nobots)}no{/if}index,follow">
	<link rel="shortcut icon" href="{$favicon_url}">
       	<link href="{$css_dir}maintenance.css" rel="stylesheet">
       	<link href='//fonts.googleapis.com/css?family=Open+Sans:600' rel='stylesheet'>
</head>
<body>
    	<div class="container">
			 <div id="maintenance">
				<!-- <div class="logo"><img src="{$logo_url}" {if $logo_image_width}width="{$logo_image_width}"{/if} {if $logo_image_height}height="{$logo_image_height}"{/if} alt="logo" /></div> -->
	        <!--		{$HOOK_MAINTENANCE}
	        		<div id="message">
	             			<h1 class="maintenance-heading">{l s='We\'ll be back soon.'}</h1>
							{l s='We are currently updating our shop and will be back really soon.'}
							<br />
							{l s='Thanks for your patience.'}
					</div>
				</div>-->
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<h5>{l s='Maintenance'}</h5>
					<h1>{l s='We\'ll be back soon.'}</h1>

					<p>{l s='We are currently updating our shop and will be back really soon.'}</p>

					<p>{l s='Thanks for your patience.'}</p>

					<p><span>Made In Azores®</span></p>
				</div>
	        </div> 
		</div>


</body>
</html>
