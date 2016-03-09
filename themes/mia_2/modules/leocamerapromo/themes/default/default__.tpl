<div class="col-lg-12 leocamerapromo_container" style="width:100%;">
    <div id="leo-camera" class="camera_wrap {$leocamerapromo.theme}">

        {foreach from=$leocamerapromo_slides item=item}
        <img class="img-responsive" src="{$item.mainimage}">
            <!-- <div data-thumb="{$item.thumbnail}" data-src="{$item.mainimage}" > -->
                {if $item.title and $leocamerapromo.show_desc}                            
                    <div class="camera_caption fadeFromBottom" >             
                        <div class="leo_camera_title" >
                            {if $leocamerapromo.show_title}
                                <a href="{$item.url}" title="{$item.title}">{$item.title}</a>
                            {/if}                            
                        </div>
                        <div class="leo_camara_desc">
                            {$item.description}
                        </div>
                    </div>
                {/if}
            </div>
        {/foreach}    
    </div>
</div>

