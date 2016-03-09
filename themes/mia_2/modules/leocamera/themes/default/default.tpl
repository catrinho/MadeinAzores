
<!-- <div class="col-lg-12 no-padding-row"> -->
     <div class="Slider-Top">
            <div id="carousel-destak" class="carousel slide">
               <!-- Indicators -->
        
              <!-- Wrapper for slides -->
               <div class="carousel-inner">
               {assign var='nslide' value=0 } 
              {foreach from=$leocamera_slides item=item}  
                    
                <div id="{$nslide}"class="item {if $nslide==0}active{/if}">
                  <a href="{$item.mainimage}" class="slide-preview">
                    <img src="{$item.mainimage}" class="img-responsive"  alt="{$item.title}">
                  </a>
                  {if $leocamera.show_title }
                  <div class="carousel-caption">
                    {if $leocamera.show_title}
                    <h4 class="title">$item.title}</h4>
                    {/if}
                    
                    <p class="qote"> <a href="{$item.url}" title="{$item.title}">{$item.description}</a></p>
                     
                  </div>
                   {/if}
                </div>
               {assign var='nslide' value=$nslide+1}
               {/foreach}   
              </div>

            </div>  
       </div><!-- end slider -->
        
