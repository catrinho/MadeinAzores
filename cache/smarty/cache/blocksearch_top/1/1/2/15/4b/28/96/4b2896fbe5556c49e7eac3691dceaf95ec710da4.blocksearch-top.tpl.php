<?php /*%%SmartyHeaderCode:12197150856998fa4c54101-89044415%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4b2896fbe5556c49e7eac3691dceaf95ec710da4' => 
    array (
      0 => '/Users/ruirocha/Sites/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/themes/default-bootstrap/modules/blocksearch/blocksearch-top.tpl',
      1 => 1448561398,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12197150856998fa4c54101-89044415',
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_56999336952781_62173941',
  'has_nocache_code' => false,
  'cache_lifetime' => 31536000,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56999336952781_62173941')) {function content_56999336952781_62173941($_smarty_tpl) {?><!-- Block search module TOP -->
<div id="search_block_top" class="col-sm-4 clearfix">
	<form id="searchbox" method="get" action="//localhost/PROJECTOS/MADE_IN_AZORES/NOVO-TEMA-2016/prestashop/pt/pesquisa" >
		<input type="hidden" name="controller" value="search" />
		<input type="hidden" name="orderby" value="position" />
		<input type="hidden" name="orderway" value="desc" />
		<input class="search_query form-control" type="text" id="search_query_top" name="search_query" placeholder="Pesquisar" value="" />
		<button type="submit" name="submit_search" class="btn btn-default button-search">
			<span>Pesquisar</span>
		</button>
	</form>
</div>
<!-- /Block search module TOP --><?php }} ?>
