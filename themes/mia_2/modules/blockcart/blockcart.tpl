{*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
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
*  @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}


{* IMPORTANT : If you change some data here, you have to report these changes in the ./blockcart-json.js (to let ajaxCart available) *}

{if $ajax_allowed}
<script type="text/javascript">
var CUSTOMIZE_TEXTFIELD = {$CUSTOMIZE_TEXTFIELD};
var img_dir = '{$img_dir}';
</script>
{/if}
<script type="text/javascript">
var customizationIdMessage = '{l s='Customization #' mod='blockcart' js=1}';
var removingLinkText = '{l s='remove this product from my cart' mod='blockcart' js=1}';
var freeShippingTranslation = '{l s='Free shipping!' mod='blockcart' js=1}';
var freeProductTranslation = '{l s='Free!' mod='blockcart' js=1}';
var delete_txt = '{l s='Delete' mod='blockcart' js=1}';
</script>
<style type="text/css">
                	.arrows{
				cursor: pointer;
				display: inline-block;
				width: 10px;
				height: 9px;
				text-indent: -9999em;
				overflow: hidden;
				border: 0;
				background: url('{$img_dir}icon/arrows.png') no-repeat;
				}
				
							.payment-creditcard{
								background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyOTQgMTk3IiA+PHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGZpbGw9IiMyMjIiIGQ9Ik0yOS45NzIgMjEuNzZoMjM0LjA1N3YyNC44MDN2MzEuMzk0djk3LjI4M0gyOS45NzJWNzcuOTU3VjQ2LjU2MyBWMjEuNzZ6IE00MS4wOTIgNDYuNTYzaDIxMS44MjF2MzEuNEg0MS4wOTJWNDYuNTYzeiIvPjwvc3ZnPg==) no-repeat center center;
								/*background: url('{$img_dir}icon/iconsPagamento.png') -10px -3px;*/
							  width:  40px; /* width and height of the sprite image you want to display */
							  height: 30px;
							  position: relative;
							  margin-right: 3.2px;
							}
							.payment-visa{
							  background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciICB2aWV3Qm94PSIwIDAgMjk0IDE5NyIgPjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBmaWxsPSIjMjIyIiBkPSJNMjkuOTcyIDIxLjc2aDIzNC4wNTd2NDkuNTkzdjU0LjI5M3Y0OS41OTRIMjkuOTcydi00OS41OTRWNzEuMzU0IFYyMS43NnogTTk5LjM0IDEyMS40MzlIODkuMjU4bC03LjEzMi0zOS43OTNsLTAuNTE3LTIuODc5TDcwLjQ1MyA3NS41NmgyMC4wMDNsNS44MTEgMzQuNzA3TDExNS4yNiA3NS41Nmg5LjM2NEw5OS4zNCAxMjEuNDM5eiBNMTE4LjczNyAxMjEuNDM5bDkuNjEtNDUuODc5aDkuNDI0bC05LjU3NiA0NS44NzlIMTE4LjczN3ogTTEzOC4zOTQgMTA2LjU3M2w4Ljk4Ny0wLjQ3MWMwLjExMiAyLjkgMC42IDQuOCAxLjUgNS44IGMxLjM4MSAxLjYgMy45IDIuNCA3LjYgMi40NDljMy4wOSAwIDUuMzIxLTAuNTU4IDYuNzAyLTEuNjUxYzEuMzgtMS4xMTYgMi4wNjgtMi40NTUgMi4wNjgtNC4wMDYgYzAtMS4zNjMtMC41Ni0yLjUxNS0xLjY5OS0zLjQ1NGMtMC43OTItMC42ODItMi45NzItMS44MS02LjUyMS0zLjM0OWMtMy41NTktMS41NDUtNi4xNTYtMi44MjYtNy43ODktMy44NjYgYy0xLjYzNC0xLjAzNC0yLjkyNi0yLjM3My0zLjg2NS00LjAxOWMtMC45NDctMS42NTYtMS40MTYtMy41NzEtMS40MTYtNS43OTJjMC0zLjg2NiAxLjQwNC03LjA2MiA0LjIwNi05LjYxMSBjMi43OTYtMi41MzggNi44MzgtMy44MTMgMTIuMTQzLTMuODEzYzUuMzg3IDAgOS42IDEuMyAxMi41IDMuNzg5YzIuOTQ4IDIuNSA0LjYgNS45IDQuOSAxMC4wODFsLTkuMDQ3IDAuNCBjLTAuMjM0LTIuMTg1LTEuMDIxLTMuODc4LTIuMzc5LTUuMDM1Yy0xLjM1Ni0xLjE2OS0zLjM1NC0xLjc1Ni02LjAwMy0xLjc1NmMtMi42MTUgMC00LjQ3OSAwLjQ1OC01LjU4OCAxLjQgYy0xLjEyNyAwLjkxNy0xLjY4IDIuMDgtMS42OCAzLjQ3OGMwIDEuMyAwLjUgMi40IDEuNSAzLjI1NWMxLjAyMSAwLjkgMy4zIDIuMSA2LjggMy42IGM1LjI5OSAyLjMgOC42IDQuMSAxMC4xIDUuNTM5YzIuMTQ1IDIuMSAzLjIgNC44IDMuMiA4LjA0MmMwIDQuMDU0LTEuNjA0IDcuNTE0LTQuODA1IDEwLjQgYy0zLjIwOCAyLjg2Ny03LjY2MSA0LjMwMS0xMy4zODQgNC4zMDFjLTMuOTQ3IDAtNy4zNjYtMC42NTgtMTAuMjQ0LTEuOTg2Yy0yLjg5MS0xLjMyOC00LjkzNi0zLjE2LTYuMTIxLTUuNTIxIEMxMzguODYzIDExMi4zIDEzOC4zIDEwOS42IDEzOC40IDEwNi42IE0yMDkuNzQ3IDExMS4zMDZoLTE4LjE4M2wtNS41MDMgMTAuMTMzaC05LjY5NWwyNS45MzEtNDUuODc5aDEwLjQ5Mmw3LjQ1IDQ1LjkgaC04Ljk2NkwyMDkuNzQ3IDExMS4zMDZ6IE0yMDguNTkgMTAzLjY2NGwtMi42NjEtMTguNDdsLTExLjA4IDE4LjQ3SDIwOC41OXogTTQxLjA4NiA3MS4zNTRoMjExLjgyN3Y1NC4yOTNINDEuMDg2VjcxLjM1NHoiLz48L3N2Zz4=) no-repeat center center;
							  /*background: url('{$img_dir}icon/iconsPagamento.png') -53px -3px;*/
							  width:  40px; /* width and height of the sprite image you want to display */
							  height: 30px;
							  position: relative;
							  margin-right: 3.2px;
							}
							.payment-mastercard{
						 	    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyOTQgMTk3IiA+PHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGZpbGw9IiMyMjIiIGQ9Ik0yOS45NzIgMjEuNzYxaDIzNC4wNTd2MTUzLjQ3OUgyOS45NzJWMjEuNzYxeiBNMTQ3LjAwNyA2My42IGM4LjYyOSA5LjEgMTMuOSAyMS4zIDEzLjkgMzQuODU5YzAgMTMuNDk5LTUuMjk5IDI1Ljc2LTEzLjkyOCAzNC44MzZjOS4yMTcgOS43IDIyLjIgMTUuNyAzNi42IDE1LjcgYzI3LjkyMiAwIDUwLjU2OC0yMi42NTEgNTAuNTY4LTUwLjU2N2MwLTI3LjkzNC0yMi42NDYtNTAuNTgtNTAuNTY4LTUwLjU4QzE2OS4yMjkgNDcuOSAxNTYuMiA1NCAxNDcgNjMuNiBjLTkuMjEyLTkuNjgyLTIyLjIyNS0xNS43MjEtMzYuNjQ2LTE1LjcyMWMtMjcuOTI4IDAtNTAuNTY4IDIyLjY0Ni01MC41NjggNTAuNThjMCAyNy45IDIyLjYgNTAuNiA1MC42IDUwLjYgYzE0LjQxNiAwIDI3LjQyMy02LjA1MSAzNi42NDYtMTUuNzMxYy04LjYzNy05LjA3LTEzLjkzLTIxLjMzNy0xMy45My0zNC44MzZDMTMzLjA3NyA4NSAxMzguNCA3Mi43IDE0NyA2My42Ii8+PC9zdmc+) no-repeat center center;
						 	  /*background: url('{$img_dir}icon/iconsPagamento.png') -96px -3px;*/
							  width:  40px; /* width and height of the sprite image you want to display */
							  height: 30px;
							  position: relative;
							  margin-right: 1px;
							}
							.payment-paypal{
							  background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyOTQgMTk3Ij48cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZmlsbD0iIzIyMiIgZD0iTTI5Ljk3NSAyMS43NjJoMjM0LjA1MXYxNTMuNDc3SDI5Ljk3NVYyMS43NjJ6IE05MS4zNDUgODUuNSBjLTAuMzIyIDIuMDIxLTAuOTY5IDMuOTM2LTEuOTA4IDUuNzU3Yy0wLjk0IDEuODItMi4wOTggMy4zMzYtMy41MDIgNC41N2MtMC44NTIgMC43NC0xLjc4NSAxLjQ0NS0yLjc0OSAyLjEgYy0wLjk5OSAwLjY0Ni0yLjA2MiAxLjE4Ny0zLjE5NiAxLjYzNGMtMS4xMzkgMC40MzUtMi4zODUgMC43OTktMy42NDcgMS4wNDVjLTEuMjggMC4yNDctMi43MiAwLjM3Ni00LjI1MyAwLjM3NmgtNS42OTIgYy0wLjc3IDQuNzI0LTEuNTU3IDkuNDQ2LTIuMzI3IDE0LjE1OEg1My4xOWMxLjE4Ny03LjIwMiAyLjM1NS0xNC40MjkgMy41MjUtMjEuNjQyYzEuMTc0LTcuMjAyIDIuMzYxLTE0LjQyOCAzLjUyMy0yMS42NDJoMTYuODA4IGMyLjQ4NSAwIDQuNiAwLjIgNi40IDAuNjkzYzEuNzIxIDAuNSAzLjMgMS4yIDQuNiAyLjE2MWMxLjQ1IDEuMSAyLjUgMi41IDMuMSA0LjMgQzkxLjYzOSA4MC45IDkxLjcgODMgOTEuMyA4NS41IE04MC4xMzEgODUuNzcxYzAuMTg4LTEuMjIzIDAuMDgyLTIuMjY4LTAuMzUzLTMuMTU1IGMtMC40MjktMC44ODctMS4wNTgtMS40OC0xLjc5OC0xLjgxNWMtMC45NzYtMC40NDYtMS45MDktMC43MDQtMi44NDMtMC43NzVjLTAuOTA0LTAuMDctMi4xOTctMC4xLTMuNzg5LTAuMWgtMS41MzMgYy0wLjcwNSA0LjMzLTEuNDEgOC42NTMtMi4xMTUgMTIuOTcxaDAuNzRjMS4wNTggMCAxLjk5OC0wLjAxMiAyLjkwOC0wLjAyOWMwLjkxLTAuMDIzIDEuNzM4LTAuMDgyIDIuNDQzLTAuMTkzIGMwLjU4Mi0wLjEwMSAxLjIyOS0wLjI5NCAxLjkyMS0wLjU4MmMwLjY4OC0wLjI3MSAxLjI1Ny0wLjU4NyAxLjY2My0wLjkzNGMwLjg1Mi0wLjcyMyAxLjQ2My0xLjQ2MyAxLjg1LTIuMjM4IEM3OS42MDggODguMSA3OS45IDg3LjEgODAuMSA4NS44IE0xMDkuMzkyIDEwNi42MjRjMC4zNTMtMi4yNjggMC43MjMtNC41NDcgMS4wOTMtNi44MTQgYy0xLjczMyAwLjE4My0zLjE2NyAwLjMxNy00LjI2NSAwLjQ0N2MtMS4wNzYgMC4xMTctMi4xOCAwLjM4Ny0zLjI3MiAwLjc0NmMtMC45MjkgMC4zMTEtMS43MDQgMC43ODEtMi4yOTcgMS40IGMtMC42MDUgMC42MjMtMC45NTggMS40NjktMS4xMjIgMi41MTVjLTAuMjQ3IDEuNTI3LTAuMDIzIDIuNiAwLjcgMy4xNmMwLjcxNyAwLjYgMS45IDAuOSAzLjUgMC45IGMwLjg5MyAwIDEuODQ1LTAuMjA1IDIuODQzLTAuNjE3QzEwNy41NjQgMTA3LjkgMTA4LjUgMTA3LjQgMTA5LjQgMTA2LjYgTTEwOC41NjMgMTExLjcgYy0wLjc4NyAwLjU3NS0xLjUxNiAxLjExNS0yLjEzMyAxLjU3NGMtMC42MjkgMC40NTgtMS40MjggMC45MTctMi40NDkgMS4zODZjLTAuOTc2IDAuNDQ3LTEuOTI4IDAuNzg3LTIuODM4IDEgYy0wLjg2MyAwLjIzNC0yLjEyMSAwLjM1Mi0zLjY3MiAwLjM1MmMtMi44NzggMC01LjEyOC0wLjk4LTYuNzA4LTIuOTAyYy0xLjU5My0xLjk1LTIuMTU2LTQuMzgyLTEuNjc1LTcuMzMxIGMwLjM5NS0yLjQyIDEuMTgyLTQuMzk1IDIuNDAzLTUuODc1YzEuMjIyLTEuNDg2IDIuODA4LTIuNjc4IDQuNzU4LTMuNTQ4YzEuOTk3LTAuODgxIDQuMjg4LTEuNTE2IDYuOTAzLTEuODU2IGMyLjYyNS0wLjM1MiA1LjQxLTAuNjIzIDguMzk1LTAuODE2YzAuMDEyLTAuMDY0IDAuMDM1LTAuMTIzIDAuMDM1LTAuMTgyYzAuMzA1LTEuNzkyLTAuMTc3LTMuMDU1LTEuMzg3LTMuNzM2IGMtMS4yMTYtMC42ODItMy4xNzItMS4wMjItNS44MjItMS4wMjJjLTEuMTk3IDAtMi42MjUgMC4yMDYtNC4zMjkgMC42NDZjLTEuNjU2IDAuNDM1LTMuMzM3IDAuOTk5LTQuOTcgMS42OEg5NC4yIGMwLjQzNS0yLjYzMSAwLjg3NS01LjI2MyAxLjI4Ni03Ljg4M2MxLjA1OC0wLjI5NCAyLjczNy0wLjY0NiA1LjA0LTEuMDM0YzIuMzE0LTAuMzk5IDQuNjQyLTAuNiA2Ljg5Ni0wLjYgYzUuNjUyIDAgOS42IDAuOSAxMS45IDIuODE0czMuMDc4IDQuNyAyLjQgOC41NjRjLTAuNjA1IDMuNjk1LTEuMTk4IDcuNDA4LTEuNzk3IDExLjEgYy0wLjYwNSAzLjY4OC0xLjIwNSA3LjQwMS0xLjgwNCAxMS4wOTFoLTEwLjExNkMxMDguMTg3IDExNCAxMDguNCAxMTIuOCAxMDguNiAxMTEuNyBNMTU5LjY4MyA4Mi41IGMtMy45NTkgNy40NDItNy45NDIgMTQuODk3LTExLjg3MiAyMi4zMjNjLTMuOTQyIDcuNDM3LTcuOTQ4IDE0Ljg3NC0xMS44ODQgMjIuM2gtMTAuOTE1YzIuMzI2LTQuMjMgNC42NjQtOC40ODIgNy4wMDgtMTIuNzI1IGMtMS4xNDYtNS4zMTItMi4yNDktMTAuNjM0LTMuMzc4LTE1Ljk1Yy0xLjEzMy01LjMxNi0yLjI3OS0xMC42MjYtMy40MjQtMTUuOTQ4aDEwLjcwOWMwLjU4NyAzLjQgMS4yIDYuOCAxLjggMTAuMyBjMC41NjQgMy40IDEuMiA2LjggMS44IDEwLjI1YzEuNjM5LTMuNDEyIDMuMjQ5LTYuODQ0IDQuODY0LTEwLjI1YzEuNjI3LTMuNDE5IDMuMjgzLTYuODI2IDQuOTE2LTEwLjI1N0gxNTkuNjgzeiBNMTk1LjE1OCA4NS41MTJjLTAuMzIyIDIuMDIxLTAuOTg2IDMuOTMtMS45MzIgNS43NTdjLTAuOTM5IDEuODItMi4wODYgMy4zMjQtMy41MDIgNC41N2MtMC44NCAwLjc0LTEuNzYyIDEuNDQ1LTIuNzM2IDIuMSBjLTAuOTg4IDAuNjQ2LTIuMDU3IDEuMTc1LTMuMjA5IDEuNjM0Yy0xLjEyNyAwLjQyOC0yLjMzOCAwLjc5OS0zLjY0NiAxLjA0NWMtMS4yODEgMC4yNDctMi43MjEgMC4zNzYtNC4yNDggMC4zNzZoLTUuNjk3IGMtMC43NjQgNC43MjQtMS41MjcgOS40NDYtMi4zMDMgMTQuMTU4SDE1Ny4wMWMxLjE4MS03LjIwMiAyLjM1LTE0LjQyOSAzLjUyNS0yMS42NDJjMS4xNjgtNy4yMDIgMi4zNTUtMTQuNDI4IDMuNTItMjEuNjQyaDE2LjgwNyBjMi40ODQgMCA0LjYgMC4yIDYuNCAwLjY5M2MxLjcxNSAwLjQgMy4zIDEuMiA0LjUgMi4xNjFjMS40NDUgMS4xIDIuNSAyLjUgMy4xIDQuMyBDMTk1LjQ2NSA4MC45IDE5NS42IDgzIDE5NS4yIDg1LjUgTTE4My45NDUgODUuNzcxYzAuMTkzLTEuMjIzIDAuMDQ3LTIuMjY4LTAuMzcxLTMuMTU1IGMtMC40MjgtMC44NzUtMS4wMzktMS40OC0xLjc3OS0xLjgxNWMtMC45NzUtMC40NDYtMS45MTYtMC43MDQtMi44NDQtMC43NzVjLTAuOTE2LTAuMDctMi4xOTctMC4xLTMuNzk1LTAuMWgtMS41MzMgYy0wLjY5OSA0LjMzLTEuNDA0IDguNjUzLTIuMTA5IDEyLjk3MWgwLjc0YzEuMDQxIDAgMS45ODYtMC4wMTIgMi45MDItMC4wMjljMC45MS0wLjAyMyAxLjc0NC0wLjA5NCAyLjQyNi0wLjE5MyBjMC42MDUtMC4xMDEgMS4yNDYtMC4yOTQgMS45NTctMC41ODJjMC42ODItMC4yNzEgMS4yMzQtMC41ODcgMS42NTYtMC45MzRjMC44NDYtMC43MjMgMS40NDUtMS40NjkgMS44MzItMi4yMzggQzE4My40MjIgODguMSAxODMuNyA4Ny4xIDE4My45IDg1LjggTTIxMy4yMDUgMTA2LjYyNGMwLjM0OC0yLjI2OCAwLjcyMy00LjU0NyAxLjEtNi44MTQgYy0xLjc1MiAwLjE4My0zLjE3NCAwLjMxNy00LjI3NyAwLjQ0N2MtMS4wNzQgMC4xMTctMi4xNzQgMC4zODctMy4yNjYgMC43NDZjLTAuOTQxIDAuMzExLTEuNjkzIDAuNzgxLTIuMzAzIDEuNCBjLTAuNjExIDAuNjIzLTAuOTc3IDEuNDY5LTEuMTQxIDIuNTE1Yy0wLjI0NiAxLjUgMCAyLjYgMC43IDMuMTZjMC43MTcgMC42IDEuOSAwLjkgMy41IDAuOSBjMC44OTggMCAxLjg1NS0wLjIwNSAyLjg0OC0wLjYxN0MyMTEuMzU1IDEwNy45IDIxMi4zIDEwNy40IDIxMy4yIDEwNi42IE0yMTIuMzc3IDExMS43IGMtMC44MTEgMC41NzUtMS41MTYgMS4wOTgtMi4xNjIgMS41NzRjLTAuNjIzIDAuNDU4LTEuNDIyIDAuOTI5LTIuNDIgMS4zODZjLTAuOTg2IDAuNDU5LTEuOTUxIDAuNzg3LTIuODQ0IDEgYy0wLjg4MSAwLjIzNC0yLjExMyAwLjM1Mi0zLjY2NiAwLjM1MmMtMi44OTUgMC01LjEyNy0wLjk4Ni02LjcwNy0yLjkwMmMtMS42MDktMS45NS0yLjE4LTQuMzgyLTEuNzA1LTcuMzMxIGMwLjM4OS0yLjQyIDEuMjE3LTQuMzgzIDIuNDM0LTUuODc1YzEuMTk3LTEuNDggMi44MDEtMi42NzIgNC43NTgtMy41NDhjMS45NzMtMC44NzUgNC4yNjQtMS41MTYgNi45MDItMS44NTYgYzIuNjAyLTAuMzUyIDUuNDEtMC42MjMgOC4zODMtMC44MTZjMC4wMjMtMC4wNjQgMC4wNDctMC4xMjMgMC4wNTMtMC4xODJjMC4yOTktMS43OTItMC4xOTMtMy4wNDMtMS40MTYtMy43MzYgYy0xLjE5Ny0wLjY4Mi0zLjE0OC0xLjAyMi01Ljc5Ny0xLjAyMmMtMS4xODIgMC0yLjYzOSAwLjIwNi00LjMzIDAuNjQ2Yy0xLjY2MiAwLjQzNS0zLjMzOCAwLjk5OS00Ljk3MSAxLjY4aC0wLjg2OSBjMC40My0yLjYzMSAwLjg0Ni01LjI2MyAxLjI4MS03Ljg4M2MxLjA1Ny0wLjI5NCAyLjczNi0wLjY0NiA1LjAyNy0xLjAzNGMyLjMyOC0wLjM5OSA0LjY0My0wLjYgNi45MDQtMC42IGM1LjY1NiAwIDkuNiAwLjkgMTEuOSAyLjgxNGMyLjI2OCAxLjkgMy4xIDQuNyAyLjQgOC41NjRjLTAuNjA0IDMuNjk1LTEuMTkxIDcuNDA4LTEuNzk3IDExLjEgYy0wLjYwNSAzLjY4OC0xLjIxMSA3LjQwMS0xLjgwMyAxMS4wOTFoLTEwLjExN0MyMTIuMDAyIDExNCAyMTIuMiAxMTIuOCAyMTIuNCAxMTEuNyBNMjM3Ljg4NSAxMTUuMTMxaC0xMC4xNzYgYzEuMjQ2LTcuNTMxIDIuNDY3LTE1LjA4NiAzLjY3OC0yMi42MTdjMS4yMzQtNy41MzEgMi40NTUtMTUuMDc5IDMuNzAxLTIyLjYyMmgxMC4xNjhjLTEuMjM4IDcuNTQzLTIuNDU1IDE1LjA5MS0zLjY4OSAyMi42IEMyNDAuMzQgMTAwIDIzOS4xIDEwNy42IDIzNy45IDExNS4xIi8+PC9zdmc+) no-repeat center center;
							  /*background: url('{$img_dir}icon/iconsPagamento.png') -140px -3px;*/
							  width:  40px; /* width and height of the sprite image you want to display */
							  height: 30px;
							  position: relative;
							  margin-left: 2.2px;

							}
 </style> 

<!-- MODULE Block cart -->
<div id="cart_block" class="row block exclusive">
	<div class="col-lg-12 col-md-12 col-sm-12">
		<div class="row title-line">
	        <div class="col-lg-2 col-md-2 col-sm-2 no-padding-row">
	            {*<img src="{$img_dir}icon/ecommerce/cart.jpg" class="icon-cart-lista">*}
	            <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciICB2aWV3Qm94PSIwIDAgMzU2IDMyMCI+PHBvbHlnb24gcG9pbnRzPSIyOTAuOSwyODUuMSA5OC45LDI4NS4xIDQyLjIsMjkuNCA0LDI5LjQgNCw1LjQgNjEuNSw1LjQgMTE4LjIsMjYxLjEgMjkwLjksMjYxLjEiLz48cG9seWdvbiBwb2ludHM9IjMyMC4xLDIwNi4yIDkxLDIwNi4yIDkxLDE3OS4yIDMwMC45LDE3OS4yIDMyMi42LDg3IDY5LjksODcgNjkuOSw2MSAzNTIuNiw2MSIvPjxyZWN0IHg9Ijk3LjMiIHk9IjgzIiB3aWR0aD0iMTMuNyIgaGVpZ2h0PSIxMDQuOCIvPjxyZWN0IHg9IjcyLjIiIHk9IjgxLjIiIHdpZHRoPSIxMS4yIiBoZWlnaHQ9IjcxIi8+PHJlY3QgeD0iMTIzLjciIHk9IjgzLjYiIHdpZHRoPSIxMy4zIiBoZWlnaHQ9IjEwMC4xIi8+PHJlY3QgeD0iMTUwLjQiIHk9IjgzLjYiIHdpZHRoPSIxMy4zIiBoZWlnaHQ9IjEwMC4xIi8+PHJlY3QgeD0iMTc3LjciIHk9IjgyLjUiIHdpZHRoPSIxMy44IiBoZWlnaHQ9IjEwNy4yIi8+PHJlY3QgeD0iMjAzLjkiIHk9IjgzLjEiIHdpZHRoPSIxMy44IiBoZWlnaHQ9IjEwNy4yIi8+PHJlY3QgeD0iMjMwLjYiIHk9IjgzLjYiIHdpZHRoPSIxMy44IiBoZWlnaHQ9IjEwNy4yIi8+PHJlY3QgeD0iMjU2LjkiIHk9IjgyLjgiIHdpZHRoPSIxMy44IiBoZWlnaHQ9IjEwNy4yIi8+PHJlY3QgeD0iMjg0IiB5PSI4My42IiB3aWR0aD0iMTMuOCIgaGVpZ2h0PSIxMDcuMiIvPjxyZWN0IHg9IjMxMS4yIiB
5PSI4My4zIiB3aWR0aD0iMTIuNCIgaGVpZ2h0PSI4NS42Ii8+PHJlY3QgeD0iNzEuNiIgeT0iOTkuOCIgd2lkdGg9IjI1Ny4xIiBoZWlnaHQ9IjEzLjMiLz48cmVjdCB4PSI3MS42IiB5PSIxMjYuOSIgd2lkdGg9IjI1Ny4xIiBoZWlnaHQ9IjEzLjMiLz48cmVjdCB4PSI3Ny44IiB5PSIxNTMuMyIgd2lkdGg9IjI0MS44IiBoZWlnaHQ9IjEyLjkiLz48cGF0aCBkPSJNMTU2Ljg4MyAyODguNjczYzAgNy4zMS01LjkzNSAxMy4yNTEtMTMuMjUgMTMuMjUxYy03LjMyOSAwLTEzLjI3LTUuOTQxLTEzLjI3LTEzLjI1MWMwLTcuMzIxIDUuOTQxLTEzLjI2MyAxMy4yNy0xMy4yNjMgQzE1MC45NDggMjc1LjQgMTU2LjkgMjgxLjQgMTU2LjkgMjg4LjY3M3oiLz48cGF0aCBkPSJNMTQzLjYzMyAzMDYuOTUyYy0xMC4wOTEgMC0xOC4yOTktOC4xOTUtMTguMjk5LTE4LjI3OXM4LjIwOC0xOC4yOTEgMTguMjk5LTE4LjI5MWMxMC4wNzcgMCAxOC4zIDguMiAxOC4zIDE4LjMgUzE1My43MSAzMDcgMTQzLjYgMzA2Ljk1MnogTTE0My42MzMgMjgwLjQ0Yy00LjU0MSAwLTguMjQxIDMuNjk5LTguMjQxIDguMjMyYzAgNC41IDMuNyA4LjIgOC4yIDguMiBjNC41MzMgMCA4LjIyLTMuNjg3IDguMjItOC4yMjJDMTUxLjg1NCAyODQuMSAxNDguMiAyODAuNCAxNDMuNiAyODAuNDR6Ii8+PHBhdGggZD0iTTI2NS4yNzMgMjg4LjY3M2MwIDcuMzEtNS45MjggMTMuMjUxLTEzLjI1IDEzLjI1MXMtMTMuMjYzLTUuOTQxLTEzLjI2My0xMy4yNTFjMC03Lj
MyMSA1Ljk0LTEzLjI2MyAxMy4yNjMtMTMuMjYzIFMyNjUuMjczIDI4MS40IDI2NS4zIDI4OC42NzN6Ii8+PHBhdGggZD0iTTI1Mi4wMjMgMzA2Ljk1MmMtMTAuMDg0IDAtMTguMjkyLTguMTk1LTE4LjI5Mi0xOC4yNzlzOC4yMDgtMTguMjkxIDE4LjI5Mi0xOC4yOTFzMTguMjc5IDguMiAxOC4zIDE4LjMgUzI2Mi4xMDcgMzA3IDI1MiAzMDYuOTUyeiBNMjUyLjAyMyAyODAuNDRjLTQuNTM0IDAtOC4yMzQgMy42OTktOC4yMzQgOC4yMzJjMCA0LjUgMy43IDguMiA4LjIgOC4yIHM4LjIyMS0zLjY4NyA4LjIyMS04LjIyMkMyNjAuMjQ0IDI4NC4xIDI1Ni42IDI4MC40IDI1MiAyODAuNDR6Ii8+PC9zdmc+" class="icon-cart-lista">
	        </div>
	        <div class="col-lg-10 col-md-10 col-sm-10 no-padding-row">              
				<h6>
					<a class="nolink" href="{$link->getPageLink("$order_process", true)}" title="{l s='View my shopping cart' mod='blockcart'}" rel="nofollow">{l s='Cart' mod='blockcart'}
					{if $ajax_allowed}
					<span id="block_cart_expand" {if isset($colapseExpandStatus) && $colapseExpandStatus eq 'expanded' || !isset($colapseExpandStatus)}class="hidden"{/if}>&nbsp;</span>
					<span id="block_cart_collapse" {if isset($colapseExpandStatus) && $colapseExpandStatus eq 'collapsed'}class="hidden"{/if}>&nbsp;</span>
					{/if}</a>
				</h6>
			</div>
		</div>	

		<div class=" row cart-list block_content">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<!-- block summary -->
				<div id="cart_block_summary" class="{if isset($colapseExpandStatus) && $colapseExpandStatus eq 'expanded' || !$ajax_allowed || !isset($colapseExpandStatus)}collapsed{else}expanded{/if}">
					{*}<span class="ajax_cart_quantity" {if $cart_qties <= 0}style="display:none;"{/if}>{$cart_qties}</span>{*}
					
					{*}<span class="ajax_cart_product_txt_s" {if $cart_qties <= 1}style="display:none"{/if}>{l s='products' mod='blockcart'}</span>{*}
					{*}<span class="ajax_cart_product_txt" {if $cart_qties > 1}style="display:none"{/if}>{l s='product' mod='blockcart'}</span>{*}
					{*}<span class="ajax_cart_total" {if $cart_qties == 0}style="display:none"{/if}>
						{if $cart_qties > 0}
							{if $priceDisplay == 1}
								{convertPrice price=$cart->getOrderTotal(false)}
							{else}
								{convertPrice price=$cart->getOrderTotal(true)}
							{/if}
						{/if}
					</span>{*}
					{*}<span class="ajax_cart_no_product" {if $cart_qties != 0}style="display:none"{/if}>{l s='(empty)' mod='blockcart'}</span>{*}
				</div>
				
				<!-- block list of products -->
				<div id="cart_block_list" class="{if isset($colapseExpandStatus) && $colapseExpandStatus eq 'expanded' || !$ajax_allowed || !isset($colapseExpandStatus)}expanded{else}collapsed{/if}">
				{assign var='quantityDisplayed' value=0}	
				{if $products}

				<div class="products" id="cart_products">
				{foreach from=$products item='product' name='myLoop'}
						{assign var='productId' value=$product.id_product}
						{assign var='productAttributeId' value=$product.id_product_attribute}
				         <div id="cart_block_product_{$product.id_product}_{if $product.id_product_attribute}{$product.id_product_attribute}{else}0{/if}_{if $product.id_address_delivery}{$product.id_address_delivery}{else}0{/if}" class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if} row row-arrow">
		                    <div class="col-lg-7 col-md-5 col-sm-5 no-padding-row">

                            	<a class="cart_block_product_name" href="{$link->getProductLink($product, $product.link_rewrite, $product.category, null, null, $product.id_shop, $product.id_product_attribute)}" title="{$product.name|escape:html:'UTF-8'}">
                              		<input type="text"  readonly  class="form-control input-sm cart-item cart_block_product_name" title="{$product.name|escape:html:'UTF-8'}" value="{$product.name|escape:html:'UTF-8'}&nbsp;{if isset($product.attributes_small)}{$product.attributes_small}{/if}" width="100%"> 
                              	</a>
                            </div>
                            
                            <div class="col-lg-2 col-md-2 col-sm-2 col-arrow">
                           		 <button class="arrows arrow-up no-padding-row cart_quantity_up" rel="nofollow"  id="cart_quantity_up_{$product.id_product}_{$product.id_product_attribute}_{$product.id_address_delivery|intval}" href="{$link->getPageLink('cart', true, NULL, "add&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;id_address_delivery={$product.id_address_delivery}&amp;id_customization=&amp;token=")}" title="{l s='Add'}">1</button>
                           		 <input type="hidden" value="{$product.cart_quantity}"   name="quantity_{$product.id_product}_{$product.id_product_attribute}__{$product.id_address_delivery|intval}_hidden"/>
                           		  <input type="hidden" value="{$product.cart_quantity}"   name="quantity_{$product.id_product}_{$product.id_product_attribute}__{$product.id_address_delivery|intval}"/>
                           		 
                              <span class="number no-padding-row quantity">{$product.cart_quantity}</span>
		                                  
		                                 
		                       {if $product.minimal_quantity < ($product.cart_quantity - $quantityDisplayed) OR $product.minimal_quantity <= 1}
								<button class="arrows arrow-down no-padding-row cart_quantity_down" rel="nofollow"  id="cart_quantity_down_{$product.id_product}_{$product.id_product_attribute}__{$product.id_address_delivery|intval}" href="{$link->getPageLink('cart', true, NULL, "add&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;id_address_delivery={$product.id_address_delivery}&amp;id_customization=&amp;op=down&amp;token=")}" title="{l s='Subtract'}">3</button>
								{else}
								 <button class="arrows arrow-down no-padding-row cart_quantity_down" style="opacity: 0.3;" id="cart_quantity_down_{$product.id_product}_{$product.id_product_attribute}_" href="#" title="{l s='Subtract'}">3</button>
								{/if}
		                                </div>  
		                                <div class="col-lg-2 col-md-2 col-sm-2">
		                              
		                                 {if !isset($customizedDatas.$productId.$productAttributeId) && (!isset($product.is_gift) || !$product.is_gift)}<a style="color:#000;" rel="nofollow" class="cart_product_delete" href="#" title="{l s='Delete'}"><span class="glyphicon glyphicon-trash"></span></a>{/if}
		                                </div>  
		                              </div>{*href="{$link->getPageLink('cart', true, NULL, "delete=1&amp;id_product={$product.id_product}&amp;ipa={$product.id_product_attribute}&amp;id_address_delivery={$product.id_address_delivery}&amp;token={$static_token}", true)}"*}
		        {/foreach}   
		        </div>   
				{/if}
					<p class="cart_block_no_products{if $products} hidden{/if}" id="cart_block_no_products">{l s='No products' mod='blockcart'}</p>
				{if $discounts|@count > 0}
					<table id="vouchers">
						<tbody>
								{foreach from=$discounts item=discount}
									{if $discount.value_real > 0}
									<tr class="bloc_cart_voucher" id="bloc_cart_voucher_{$discount.id_discount}">
										<td class="quantity">1x</td>
										<td class="name" title="{$discount.description}">{$discount.name|cat:' : '|cat:$discount.description|truncate:18:'...'|escape:'htmlall':'UTF-8'}</td>
										<td class="price">-{if $priceDisplay == 1}{convertPrice price=$discount.value_tax_exc}{else}{convertPrice price=$discount.value_real}{/if}</td>
										<td class="delete">
											{if strlen($discount.code)}
												<a class="delete_voucher" href="{$link->getPageLink('$order_process', true)}?deleteDiscount={$discount.id_discount}" title="{l s='Delete' mod='blockcart'}" rel="nofollow"><img src="{$img_dir}icon/delete.gif" alt="{l s='Delete' mod='blockcart'}" class="icon" /></a>
											{/if}
										</td>
									</tr>
									{/if}
								{/foreach}
						</tbody>
					</table>
					{/if}
					
					
				</div>
			</div>	
		</div>
		<div id="cart-prices" class="row ">
						<div class="row price_detail">
							<div class="col-lg-5 col-md-5 col-sm-5 no-padding-left">
								<h6>{l s='Shipping' mod='blockcart'}:</h6>
								
							</div>
							<div class="col-lg-7 col-md-7 col-sm-7 no-padding-right">
								<span id="cart_block_shipping_cost" class="price ajax_cart_shipping_cost">{$shipping_cost}</span>
							</div>
						</div>
						{if $show_wrapping}
							{assign var='cart_flag' value='Cart::ONLY_WRAPPING'|constant}
							<div class="col-lg-12 col-md-12 col-sm-12 price_detail">
							<span id="cart_block_wrapping_cost" class="price cart_block_wrapping_cost">{if $priceDisplay == 1}{convertPrice price=$cart->getOrderTotal(false, $cart_flag)}{else}{convertPrice price=$cart->getOrderTotal(true, $cart_flag)}{/if}</span>
							<h6>{l s='Wrapping' mod='blockcart'}:</h6>
							</div>
						{/if}
						{if $show_tax && isset($tax_cost)}
							<div class="row price_detail">
							<div class="col-lg-5 col-md-5 col-sm-5 no-padding-left">
								<h6>{l s='Tax' mod='blockcart'}:</h6>
							</div>
							<div class="col-lg-7  col-md-7 col-sm-7 no-padding-right">
								<span id="cart_block_tax_cost" class="price ajax_cart_tax_cost">{$tax_cost}</span>
							</div>
							</div>
						{/if}
						<div class="row price_detail">
						
						
							<div class="col-lg-5 col-md-5 col-sm-5 no-padding-left">
								<h6>{l s='Total' mod='blockcart'}:</h6>
							</div>
							<div class="col-lg-7 col-md-7 col-sm-7 no-padding-right">
								<span id="cart_block_total" class="price ajax_block_cart_total">{$total}</span>
							</div>
						</div>
					</div>
					{*}{if $use_taxes && $display_tax_label == 1 && $show_tax}
						{if $priceDisplay == 0}
							<p class="row" id="cart-price-precisions">
								{l s='Prices are tax included' mod='blockcart'}
							</p>
						{/if}
						{if $priceDisplay == 1}
							<p class="row" id="cart-price-precisions">
								{l s='Prices are tax excluded' mod='blockcart'}
							</p>
						{/if}
					{/if}{*}
					<p id="cart-buttons">
					{* 
						{ if $order_process == 'order' }<a href="{ $link->getPageLink("$order_process", true) *" class="button_small" title="{ l s='View my shopping cart' mod='blockcart'}" rel="nofollow">{l s='Cart' mod='blockcart'}</a>{/if}
						<a href="{ $link->getPageLink("$order_process", true) }" id="button_order_cart" class="exclusive{ if $order_process == 'order-opc'}_large{/if}" title="{ l s='Check out' mod='blockcart'}" rel="nofollow"><span></span>{l s='Check out' mod='blockcart'}</a>
					*}
					 	
					</p>
				</div>
	</div>
<!-- /MODULE Block cart -->
         
</div>



 	<div class="col-lg-12 col-md-12 col-sm-12">
	 	<div class="row title-line">
		        <div class="col-lg-2 col-md-2 col-sm-2 no-padding-row">
		            {*<img src="{$img_dir}icon/ecommerce/cart_out.jpg" class="icon-cart-finalizar">*}
		            <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNTYgMzIwIiA+PHBvbHlnb24gcG9pbnRzPSIyOTEuNSwyOTMuMSA5OS42LDI5My4xIDQyLjksMzcuNCA0LjcsMzcuNCA0LjcsMTMuNCA2Mi4xLDEzLjQgMTE4LjgsMjY5LjEgMjkxLjUsMjY5LjEiLz48cG9seWdvbiBwb2ludHM9IjMyMC43LDIxNC4yIDkxLjcsMjE0LjIgOTEuNywxODcuMiAzMDEuNSwxODcuMiAzMjMuMiw5NSA3MC42LDk1IDcwLjYsNjkgMzUzLjIsNjkiLz48cmVjdCB4PSI5Ny45IiB5PSI5MSIgd2lkdGg9IjEzLjciIGhlaWdodD0iMTA0LjgiLz48cmVjdCB4PSI3Mi45IiB5PSI4OS4yIiB3aWR0aD0iMTEuMiIgaGVpZ2h0PSI3MSIvPjxyZWN0IHg9IjEyNC40IiB5PSI5MS42IiB3aWR0aD0iMTMuMyIgaGVpZ2h0PSIxMDAuMSIvPjxyZWN0IHg9IjE1MSIgeT0iOTEuNiIgd2lkdGg9IjEzLjMiIGhlaWdodD0iMTAwLjEiLz48cmVjdCB4PSIxNzguMyIgeT0iOTAuNSIgd2lkdGg9IjEzLjgiIGhlaWdodD0iMTA3LjIiLz48cmVjdCB4PSIyMDQuNiIgeT0iOTEuMSIgd2lkdGg9IjEzLjgiIGhlaWdodD0iMTA3LjIiLz48cmVjdCB4PSIyMzEuMyIgeT0iOTEuNiIgd2lkdGg9IjEzLjgiIGhlaWdodD0iMTA3LjIiLz48cmVjdCB4PSIyNTcuNSIgeT0iOTAuOCIgd2lkdGg9IjEzLjgiIGhlaWdodD0iMTA3LjIiLz48cmVjdCB4PSIyODQuNiIgeT0iOTEuNiIgd2lkdGg9IjEzLjgiIGhlaWdodD0iMTA3LjIiLz48cmVjdCB
4PSIzMTEuOCIgeT0iOTEuMyIgd2lkdGg9IjEyLjQiIGhlaWdodD0iODUuNiIvPjxyZWN0IHg9IjcyLjMiIHk9IjEwNy44IiB3aWR0aD0iMjU3LjEiIGhlaWdodD0iMTMuMyIvPjxyZWN0IHg9IjcyLjMiIHk9IjEzNC45IiB3aWR0aD0iMjU3LjEiIGhlaWdodD0iMTMuMyIvPjxyZWN0IHg9Ijc4LjUiIHk9IjE2MS4zIiB3aWR0aD0iMjQxLjgiIGhlaWdodD0iMTIuOSIvPjxwYXRoIGQ9Ik0xNTcuNTQ2IDI5Ni42NzNjMCA3LjMxLTUuOTM1IDEzLjI1MS0xMy4yNSAxMy4yNTFjLTcuMzI5IDAtMTMuMjctNS45NDEtMTMuMjctMTMuMjUxYzAtNy4zMjEgNS45NDEtMTMuMjYzIDEzLjI3LTEzLjI2MyBDMTUxLjYxMiAyODMuNCAxNTcuNSAyODkuNCAxNTcuNSAyOTYuNjczeiIvPjxwYXRoIGQ9Ik0xNDQuMjk3IDMxNC45NTNjLTEwLjA5MSAwLTE4LjI5OS04LjE5NS0xOC4yOTktMTguMjc5czguMjA4LTE4LjI5MSAxOC4yOTktMTguMjkxYzEwLjA3NyAwIDE4LjMgOC4yIDE4LjMgMTguMyBTMTU0LjM3NCAzMTUgMTQ0LjMgMzE0Ljk1M3ogTTE0NC4yOTcgMjg4LjQ0MWMtNC41NDEgMC04LjI0MSAzLjY5OS04LjI0MSA4LjIzMmMwIDQuNSAzLjcgOC4yIDguMiA4LjIgYzQuNTMzIDAgOC4yMi0zLjY4NyA4LjIyLTguMjIyQzE1Mi41MTcgMjkyLjEgMTQ4LjggMjg4LjQgMTQ0LjMgMjg4LjQ0MXoiLz48cGF0aCBkPSJNMjY1LjkzNyAyOTYuNjczYzAgNy4zMS01LjkyOCAxMy4yNTEtMTMuMjUgMTMuMjUxcy0xMy4yNjMtNS45NDEtMTMuMj
YzLTEzLjI1MWMwLTcuMzIxIDUuOTQtMTMuMjYzIDEzLjI2My0xMy4yNjMgUzI2NS45MzcgMjg5LjQgMjY1LjkgMjk2LjY3M3oiLz48cGF0aCBkPSJNMjUyLjY4NyAzMTQuOTUzYy0xMC4wODQgMC0xOC4yOTItOC4xOTUtMTguMjkyLTE4LjI3OXM4LjIwOC0xOC4yOTEgMTguMjkyLTE4LjI5MXMxOC4yNzkgOC4yIDE4LjMgMTguMyBTMjYyLjc3MSAzMTUgMjUyLjcgMzE0Ljk1M3ogTTI1Mi42ODcgMjg4LjQ0MWMtNC41MzQgMC04LjIzNCAzLjY5OS04LjIzNCA4LjIzMmMwIDQuNSAzLjcgOC4yIDguMiA4LjIgczguMjIxLTMuNjg3IDguMjIxLTguMjIyQzI2MC45MDggMjkyLjEgMjU3LjIgMjg4LjQgMjUyLjcgMjg4LjQ0MXoiLz48cG9seWxpbmUgZmlsbD0iI0ZGRkZGRiIgcG9pbnRzPSIxMjQuNCw2OC45IDEyNC40LDk0LjIgMTYxLjcsOTQgMTYxLjcsMTMyLjIgMjM3LjQsMTMyLjIgMjM3LjQsOTQgMjc0LjQsOTQuMiAyNzQuNCw2OC45Ii8+PHBvbHlnb24gcG9pbnRzPSIyMjUsMTE5LjQgMTc0LDExOS40IDE3NC4yLDgxLjIgMTM2LDgwLjkgMTk4LjksNS44IDI2MS44LDgwLjkgMjI0LjgsODAuOSIvPjwvc3ZnPg==" class="icon-cart-finalizar">
		        </div>
		        <div class="col-lg-10 col-md-10 col-sm-10 no-padding-row">
		          <a href="{$link->getPageLink("$order_process", true)}" class="nolink" rel="nofollow"  title="{l s='Check out' mod='blockcart'}">
		          	<h6>{l s='Check out' mod='blockcart'}</h6>
		          </a>	
		        </div>
		</div>
		<div class="row">
	      <div class="col-lg-12 col-md-12 col-sm-12 no-padding-row">
	       
	        	
		          <ul class="payments no-padding-row">
		          		<a href="{$link->getCMSLink('5', 'secure-payment')}" rel="nofollow" title="{l s='Secure payment'}">
			                <li class="payment-creditcard"></li></a>
			            <a href="{$link->getCMSLink('5', 'secure-payment')}" rel="nofollow" title="{l s='Secure payment'}">    
			                <li class="payment-visa"></li></a> 
			            <a href="{$link->getCMSLink('5', 'secure-payment')}" rel="nofollow" title="{l s='Secure payment'}">    
			                <li class="payment-mastercard"></li></a>
		                <a href="{$base_dir_ssl}modules/paypal/about.php"} rel="nofollow"  title="{l s='Check out' mod='blockcart'}">
		           			<li class="payment-paypal"></li>
		           		</a>
		          </ul>  
	        	
	   
	      </div>
	    </div>
    </div>
  