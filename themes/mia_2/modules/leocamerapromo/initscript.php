<script type="text/javascript">
	$(document).ready(function() {
		/*$('#leo-camera').camera({
			height:'<?php echo (int)$this->getParams()->get("imgheight",320);?>px',
			alignment			: '<?php echo $this->getParams()->get('alignment','center');?>',
			autoAdvance			: <?php echo ($this->getParams()->get('autoAdvance',1) ? 'true' : 'false');?>,
			barDirection			: '<?php echo $this->getParams()->get('barDirection','leftToRight');?>',
			barPosition			: '<?php echo $this->getParams()->get('barPosition','bottom');?>',
			cols	: 				<?php echo (int)$this->getParams()->get('cols',6);?>,
			easing			: '<?php echo $this->getParams()->get('easing','easeInOutExpo');?>',
			fx		: '<?php echo $this->getParams()->get('fx','random');?>',
			hover		: <?php echo ($this->getParams()->get('hover') ? 'true' : 'false');?>,
			loader		: '<?php echo $this->getParams()->get('loader','pie');?>',
			navigation		: <?php echo ($this->getParams()->get('navigation') ? 'true' : 'false');?>,
			navigationHover		: <?php echo ($this->getParams()->get('navigationHover') ? 'true' : 'false');?>,
			pagination		: <?php echo ($this->getParams()->get('pagination') ? 'true' : 'false');?>,
			playPause		: <?php echo ($this->getParams()->get('playPause') ? 'true' : 'false');?>,
			pauseOnClick		: <?php echo ($this->getParams()->get('pauseOnClick') ? 'true' : 'false');?>,
			thumbnails		: '<?php echo ($this->getParams()->get('thumbnails') ? 'true' : 'false');?>'
		});*/
$('.carouselpromo').carousel({
			  interval: 4000,
			  pause:'hover'
		});
		  
		  $('.carouselpromo').on('slid', function() {
		    var to_slide2 = $('.carouselpromo .carousel-inner .item.active').attr('id');
		    // console.log($('.carousel-inner .item.active'));
		    // console.log(to_slide2);
		    $('.carouselpromo-indicators').children().removeClass('active');
		    $('.carouselpromo-indicators [data-slide-to=' + to_slide2 + ']').addClass('active');
		  });
	});
</script>