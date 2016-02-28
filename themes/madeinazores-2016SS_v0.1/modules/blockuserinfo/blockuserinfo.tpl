
<!-- Block user information module HEADER -->
<div id="header_user" class="col-sm-2" {if $PS_CATALOG_MODE}header_user_catalog{/if}">
	<p id="header_user_info">
		{if $logged}
			<a href="{$link->getPageLink('my-account', true)|escape:'html'}" title="{l s='View my customer account' mod='blockuserinfo'}" class="account" rel="nofollow"><span>{$cookie->customer_firstname} {$cookie->customer_lastname}</span></a>
			<a href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html'}" title="{l s='Log me out' mod='blockuserinfo'}" class="logout" rel="nofollow">{l s='Sign out' mod='blockuserinfo'}</a>
		{else}
			<a href="{$link->getPageLink('my-account', true)|escape:'html'}" title="{l s='Log in to your customer account' mod='blockuserinfo'}" class="login" rel="nofollow">{l s='Sign in' mod='blockuserinfo'}</a>
		{/if}
	</p>
</div>
<!-- /Block user information module HEADER -->
