

<!-- Block categories module -->

 <div class="row show-grid">
                <div class="col-lg-12 col-md-12 col-sm-12 cat-produtos ">
                  <ul class="list-unstyled " style="display:block;position:static;margin-bottom:5px;">
                  	{foreach from=$blockCategTree.children item=child name=blockCategTree}
						{if $smarty.foreach.blockCategTree.last}
							{include file="$branche_tpl_path" node=$child last='true'}
						{else}
							{include file="$branche_tpl_path" node=$child}
						{/if}
					{/foreach}
                  </ul>
                </div>
 </div>
 <script type="text/javascript">

	//$('.cat-produtos ul li ul').hide();
 
	// 		// ADD SLIDEDOWN ANIMATION TO DROPDOWN //
	 $('.dropdown').on('show.bs.dropdown', function(e){
		
	 	 $(this).children('.dropdown-menu').first().stop(true, true).slideDown();
	 });

 //  	// ADD SLIDEUP ANIMATION TO DROPDOWN //
 //  $('.dropdown').on('hide.bs.dropdown', function(e){
 //     $(this).children('.dropdown-menu').first().stop(true, true).slideUp();
 //  });

		</script>
<!-- /Block categories module -->
  