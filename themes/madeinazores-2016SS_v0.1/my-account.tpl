
{capture name=path}{l s='My account'}{/capture}

<h1 class="page-heading text-center">{l s='My account'}</h1>
{if isset($account_created)}
	<p class="alert alert-success">
		{l s='Your account has been created.'}
	</p>
{/if}
<p class="info-account text-center">{l s='Welcome to your account. Here you can manage all of your personal information and orders.'}</p>
<div class="row addresses-lists">
	<div class="col-xs-12 col-sm-6 col-lg-4 align-center">
		<ul class="myaccount-link-list">
            {if $has_customer_an_address}
            <li><a href="{$link->getPageLink('address', true)|escape:'html':'UTF-8'}" title="{l s='Add my first address'}"><!-- <i class="icon-building"></i> --><span>{l s='Add my first address'}</span></a></li>
            {/if}
            <li><a href="{$link->getPageLink('history', true)|escape:'html':'UTF-8'}" title="{l s='Orders'}"><i class="icon-list-ol"></i><span>{l s='Order history and details'}</span></a></li>
            {if $returnAllowed}
                <li><a href="{$link->getPageLink('order-follow', true)|escape:'html':'UTF-8'}" title="{l s='Merchandise returns'}"><!-- <i class="icon-refresh"></i> --><span>{l s='My merchandise returns'}</span></a></li>
            {/if}
            <li><a href="{$link->getPageLink('order-slip', true)|escape:'html':'UTF-8'}" title="{l s='Credit slips'}"><!-- <i class="icon-file-o"></i> --><span>{l s='My credit slips'}</span></a>
            </li>
            <li><a href="{$link->getPageLink('addresses', true)|escape:'html':'UTF-8'}" title="{l s='Addresses'}"><!-- <i class="icon-building"></i> --><span>{l s='My addresses'}</span></a></li>
            <li><a href="{$link->getPageLink('identity', true)|escape:'html':'UTF-8'}" title="{l s='Information'}"><!-- <i class="icon-user"></i> --><span>{l s='My personal information'}</span></a></li>
            
            <li><a class="logout" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log me out' mod='blockuserinfo'}"<!-- <i class="icon-user"></i><span>{l s='Sign out' mod='blockuserinfo'}</span></a></li>
            
        </a>
        </ul>
	</div>
{if $voucherAllowed || isset($HOOK_CUSTOMER_ACCOUNT) && $HOOK_CUSTOMER_ACCOUNT !=''}
	<div class="col-xs-12 col-sm-6 col-lg-4">
        <ul class="myaccount-link-list">
            {if $voucherAllowed}
                <li><a href="{$link->getPageLink('discount', true)|escape:'html':'UTF-8'}" title="{l s='Vouchers'}"><!-- <i class="icon-barcode"></i> --><span>{l s='My vouchers'}</span></a></li>
            {/if}
            {$HOOK_CUSTOMER_ACCOUNT}
        </ul>
    </div>
{/if}
</div>
<ul class="footer_links clearfix">
<li><a class="btn button-black btn-default button button-small" href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}" title="{l s='Home'}"><span> {l s='Home'}</span></a></li>
</ul>
