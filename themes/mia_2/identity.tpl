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
*  @version  Release: $Revision: 6599 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}<a href="{$link->getPageLink('my-account', true)}">{l s='My account'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Your personal information'}{/capture}
{*include file="$tpl_dir./breadcrumb.tpl"*}
 <div class="row">
  <div class="col-lg-12 col-md-12 col-sm-12">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 section-title">
        <div class="row">
          
		<h1>{l s='Your personal information'}</h1>
        </div>
      </div>
    </div>
    <div class="row">
  		<div class="col-lg-12 col-md-12 col-sm-12 no-padding-row">


{include file="$tpl_dir./errors.tpl"}

{if isset($confirmation) && $confirmation}
	<p class="alert alert-success">
		{l s='Your personal information has been successfully updated.'}
		{if isset($pwd_changed)}<br />{l s='Your password has been sent to your e-mail:'} {$email}{/if}
	</p>
{else}
	<h4>{l s='Please be sure to update your personal information if it has changed.'}</h4>
	<p class="required"><sup>*</sup>{l s='Required field'}</p>
	<form action="{$link->getPageLink('identity', true)}" method="post" class="std form-horizontal" role="form">
			
		<div class="row form-group  text">
			
			<div class="col-lg-8 col-md-12 col-sm-12">
				<label for="title" class="col-sm-2 no-padding-left" >{l s='Title'}</label>
				{foreach from=$genders key=k item=gender}
				
					<label for="id_gender{$gender->id}" class="col-sm-2 radio"><input type="radio" name="id_gender" id="id_gender{$gender->id}" value="{$gender->id|intval}" {if isset($smarty.post.id_gender) && $smarty.post.id_gender == $gender->id}checked="checked"{/if} />{$gender->name}</label>
				{/foreach}
                
            </div>
		</div>

            <div class="row form-group ">
                <div class="col-lg-8 col-md-12 col-sm-12">
					<label for="firstname">{l s='First name'} <sup>*</sup></label>
				    <input type="text" id="firstname" name="firstname" value="{$smarty.post.firstname}" class="form-control" />
                </div>
			</div>
            <div class="row form-group ">
                <div class="col-lg-8 col-md-12 col-sm-12">
				<label for="lastname"  >{l s='Last name'} <sup>*</sup></label>
				    <input type="text" name="lastname" id="lastname" value="{$smarty.post.lastname}" class="form-control" />
                </div>
			</div>
			<div class="row form-group ">

                <div class="col-lg-8 col-md-12 col-sm-12">
                				<label  for="email">{l s='E-mail'} <sup>*</sup></label>
				    <input type="email" name="email" id="email" value="{$smarty.post.email}" class="form-control" />
                </div>
            </div>
            <div class="row form-group ">
                <div class="col-lg-8 col-md-12 col-sm-12">
                	<label for="old_passwd"  >{l s='Current Password'} <sup>*</sup></label>	
				    <input type="password" name="old_passwd" id="old_passwd" class="form-control" />
                </div>
			</div>
			<div class="row form-group ">
				<div class="col-lg-8 col-md-12 col-sm-12">
					<label   for="passwd">{l s='New Password'}</label>
                    <input type="password" name="passwd" id="passwd" class="form-control" />
                </div>
            </div>
            <div class="row form-group ">
                <div class="col-lg-8 col-md-12 col-sm-12">
                	<label   for="confirmation">{l s='Confirmation'}</label>
				    <input type="password" name="confirmation" id="confirmation" class="form-control" />
                </div>
			</div>
			
				
				<div class="row form-group select">
					<div class="col-lg-8 col-md-12 col-sm-12">
					<label>{l s='Date of Birth'}&nbsp;&nbsp;&nbsp;</label>
					<select id="days" name="days" class="input-sm" >
						<option value="">-</option>
						{foreach from=$days item=day}
							<option value="{$day}" {if ($sl_day == $day)} selected="selected"{/if}>{$day}&nbsp;&nbsp;</option>
						{/foreach}
					</select>
				{*
						  {l s='January'}
						  {l s='February'}
						  {l s='March'}
						  {l s='April'}
						  {l s='May'}
						  {l s='June'}
						  {l s='July'}
						  {l s='August'}
						  {l s='September'}
						  {l s='October'}
						  {l s='November'}
						  {l s='December'}
					  *}
					<select id="months" name="months" class="input-sm">
						<option value="">-</option>
						{foreach from=$months key=k item=month}
							<option value="{$k}" {if ($sl_month == $k)} selected="selected"{/if}>{l s=$month}&nbsp;</option>
						{/foreach}
					</select>
					<select id="years" name="years" class="input-sm">
						<option value="">-</option>
						{foreach from=$years item=year}
							<option value="{$year}" {if ($sl_year == $year)} selected="selected"{/if}>{$year}&nbsp;&nbsp;</option>
						{/foreach}
					</select>
				</div>
            </div>
			{if $newsletter}
			<div class="row form-group ">
                <div class="col-lg-8 col-md-12 col-sm-12">
           		     <label for="newsletter"  >{l s='Sign up for our newsletter'}</label>                
				    <input type="checkbox" id="newsletter" name="newsletter" value="1" {if isset($smarty.post.newsletter) && $smarty.post.newsletter == 1} checked="checked"{/if} />
                </div>
            </div>
			<div class="row form-group ">
                
                <div class="col-lg-8 col-md-12 col-sm-12">
                	<label for="optin"  >{l s='Receive special offers from our partners'}</label>
				    <input type="checkbox" name="optin" id="optin" value="1" {if isset($smarty.post.optin) && $smarty.post.optin == 1} checked="checked"{/if} />
                </div>
            </div>
			{/if}
			<div class="row form-group ">
                <div class="col-lg-8 col-md-12 col-sm-12">
				    <input type="submit" class="btn btn-default" name="submitIdentity" value="{l s='Save'}" />
                </div>
            </div>
            <div class="row form-group ">
                <div class="col-lg-8 col-md-12 col-sm-12">
				{l s='[Insert customer data privacy clause or law here, if applicable]'}
			    </div>
            </div>
	</form>
{/if}

<ul class="col-lg-12 col-md-12 col-sm-12 no-padding-row footer_links">
	<li><a href="{$link->getPageLink('my-account', true)}"><div class="myaccount rounded">&#xf007;</div> {l s='Back to your account'}</a></li>
	<li class="f_right"><a href="{$base_dir}"><div class="myaccount rounded">&#xf015;</div> {l s='Home'}</a></li>
</ul>
  		</div>
	</div>  
  </div>
</div>                