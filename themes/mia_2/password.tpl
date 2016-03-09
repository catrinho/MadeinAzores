{*
* 2007-2013 PrestaShop
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
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}<a href="{$link->getPageLink('authentication', true)}" title="{l s='Authentication'}" rel="nofollow">{l s='Authentication'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Forgot your password'}{/capture}
{*include file="$tpl_dir./breadcrumb.tpl"*}


<div class="row">
  <div class="col-lg-12 col-md-12 col-sm-12">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 section-title">
        <div class="row">
          
		<h1>{l s='Forgot your password?'}</h1>
        </div>
      </div>
    </div>
    <div class="row">
  		<div class="col-lg-12 col-md-12 col-sm-12 no-padding-row">

		{include file="$tpl_dir./errors.tpl"}

{if isset($confirmation) && $confirmation == 1}
<p class="alert alert-success">{l s='Your password has been successfully reset and a confirmation has been sent to your email address:'} {if isset($email)}{$email|escape:'htmlall':'UTF-8'|stripslashes}{/if}</p>
{elseif isset($confirmation) && $confirmation == 2}
<p class="alert alert-success">{l s='A confirmation email has been sent to your address:'} {if isset($email)}{$email|escape:'htmlall':'UTF-8'|stripslashes}{/if}</p>
{else}
<p>{l s='Please enter the email address you used to register. We will then send you a new password. '}</p>
<form action="{$request_uri|escape:'htmlall':'UTF-8'}" method="post" class="std" id="form_forgotpassword">
	<fieldset class="col-lg-12 col-md-12 col-sm-12 
	">
		<div class="row form-group ">
			<label class="control-label" >{l s='Email'}</label>
			<div class="controls">
			<input type="text" id="email" name="email" class="form-control col-lg-8 col-md-8 col-sm-10"  value="{if isset($smarty.post.email)}{$smarty.post.email|escape:'htmlall':'UTF-8'|stripslashes}{/if}" />
			</div>
		</div>
	
		<p class="submit">
			<input type="submit" class="btn btn-md btn-default" value="{l s='Retrieve Password'}" />
		</p>
	</fieldset>
</form>
{/if}
<p class="clear">
	<ul class="col-lg-12 col-md-12 col-sm-12 no-padding-row footer_links clearfix">
	<li class="f_right"><a href="{$base_dir}"  alt="{l s='Home'}"><div class="myaccount rounded">&#xf015;</div> {l s='Home'}</a></li>
</ul>
	
</p>

</div>
    </div>
    </div>
    </div>