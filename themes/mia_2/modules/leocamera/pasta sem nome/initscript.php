<script type="text/javascript">
	$(function() {
		$('#leo-camera').camera({
			height:'<?php echo (int)$this->getParams()->get("imgheight",438);?>px',
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
			navigationHover		: <?php echo ($this->getParams()->get('navigationHover') ? 'false' : 'true');?>,
			pagination		: <?php echo ($this->getParams()->get('pagination') ? 'false' : 'true');?>,
			playPause		: <?php echo ($this->getParams()->get('playPause') ? 'true' : 'false');?>,
			pauseOnClick		: <?php echo ($this->getParams()->get('pauseOnClick') ? 'true' : 'false');?>,
			thumbnails		: '<?php echo ($this->getParams()->get('thumbnails') ? 'true' : 'false');?>'
		});
	// $('.carousel').carousel();
	// 	  $('.carousel').on('slide.bs.carouse', function() {
	// 	    var to_slide = $('.carousel-inner .item.active').attr('id');
	// 	    $('.carousel-indicators').removeAtrr('class');
	// 	    $('.carousel-indicators [data-slide-to=' + to_slide + ']').atrr('class','active');
	// 	  });

	});
</script>