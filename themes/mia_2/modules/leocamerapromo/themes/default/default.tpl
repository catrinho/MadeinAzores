
     <div class="Slider-Promo">
            <div id="carousel-promo" class="carouselpromo slide">
              <!-- Indicators -->
              <ol class="carouselpromo-indicators">
                {assign var='nslides' value=0 }
                 {foreach from=$leocamerapromo_slides item=item}  
                    <li data-target="#carousel-promo" data-slide-to="{$nslides}" {if $nslides==0}class="active"{/if}></li>
                    {assign var='nslides' value=$nslides+1}    
                {/foreach} 
              </ol>

              <!-- Wrapper for slides -->
               <div class="carousel-inner">
                 {assign var='nslide' value=0 } 
                  {foreach from=$leocamerapromo_slides item=item}  
                      
                  <div id="{$nslide}"class="item {if $nslide==0}active{/if}">
                    <img src="{$item.mainimage}" class="img-responsive"  alt="{$item.title}">
                    <div class="carousel-caption-promo">
                      {if $leocamerapromo.show_title}
                      <h4 class="title">{$item.title}</h4>
                      {/if}
                      <p class="qote"> <a href="{$item.url}" title="{$item.title}">{$item.description}</a></p>
                    </div>
                  </div>
                 {assign var='nslide' value=$nslide+1}
                 {/foreach}   
               </div>

            </div>  
       </div><!-- end slider -->
