<div class="col-lg-12 leocamera_container" style="width:100%;">
    <div id="leo-camera" class="camera_wrap {$leocamera.theme}">

        {foreach from=$leocamera_slides item=item}
        <img class="img-responsive" src="{$item.mainimage}">
            <!-- <div data-thumb="{$item.thumbnail}" data-src="{$item.mainimage}" > -->
                {if $item.title and $leocamera.show_desc}                            
                    <div class="camera_caption fadeFromBottom" >             
                        <div class="leo_camera_title" >
                            {if $leocamera.show_title}
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

{*
<div class="col-lg-12 slider-top ">
      <div class="Slider-Top">
            <div id="carousel-destak" class="carousel slide">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                {*assign var='nslides' value=0 *}
                 {foreach from=$leocamera_slides item=item}  
                    {*if $nslides==0*} 
                        {*assign var='activeClass' value='class="active"'* }
                    {*else*}  
                        {*assign var='activeClass' value='' *}
                    {*/if}
                    <li data-target="#carousel-destak" data-slide-to="{$nslides}" {$activeClass}></li>
                    {*assign var='nslides' value=$nslides+1*}    
                {*/foreach*} 
              </ol>

              <!-- Wrapper for slides -->
              <div class="carousel-inner">
                {*assign var='nlides' value=0* }
              {foreach from=$leocamera_slides item=item}  
                    {*if $nlides==0*} 
                        {*assign var='actClass' value='active' *}
                    {*else*}  
                        {*assign var='actClass' value='' *}
                    {*/if*}
                <div class="item {$actClass}">
                  <img src="{$item.mainimage}" class="img-responsive"  alt="{$item.title}">
                  <div class="carousel-caption">
                    {if $leocamera.show_title}
                    <a class="title" href="{$item.url}" title="{$item.title}"><h4 >{$item.title}</h4></a>
                    {/if}
                    <p class="qote">{$item.description}</p>
                  </div>
                </div>
             {*assign var='nlides' value=$nlides+1*}    
               {/foreach}   
              </div>
            </div> 
       </div><!-- end slider -->
</div>*}