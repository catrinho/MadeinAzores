<?php 
/**
 * Leo Slideshow Module
 * 
 * @version		$Id: file.php $Revision
 * @package		modules
 * @subpackage	$Subpackage.
 * @copyright	Copyright (C) September 2012 LeoTheme.Com <@emai:leotheme@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
 */
 
/**
 * @since 1.5.0
 * @version 1.2 (2012-03-14)
 */

if( !class_exists("LeoImagesSource") ){	
	
	class LeoImagesSource extends LeoBaseSource{
		
		public $name = "ImagesSource";
		
		public function getData( $params , $table='leocamera'){
			
			$this->context = Context::getContext();
			$id_shop = $this->context->shop->id;
			$id_lang = $this->context->language->id;

			$sliders = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
				SELECT hs.`id_'.$table.'_slides` as id_slide,
						   hssl.`image`,
						   hss.`position`,
						   hss.`active`,
						   hssl.`title`,
						   hssl.`url`,
						   hssl.`legend`,
						   hssl.`description`
				FROM '._DB_PREFIX_.$table.' hs
				LEFT JOIN '._DB_PREFIX_.$table.'_slides hss ON (hs.id_leocamera_slides = hss.id_'.$table.'_slides)
				LEFT JOIN '._DB_PREFIX_.$table.'_slides_lang hssl ON (hss.id_leocamera_slides = hssl.id_'.$table.'_slides)
				WHERE (id_shop = '.(int)$id_shop.')
				AND hssl.id_lang = '.(int)$id_lang.' AND hss.`active` = 1
				ORDER BY hss.position DESC');
			
			
			$iwidth  = $params->get('imgwidth',940);
			$iheight = $params->get('imgheight',438);
			$twidth  = $params->get('thumbwidth',160);
			$theight = $params->get('thumbheight',90);
			 
			$site_url = Tools::htmlentitiesutf8('http://'.$_SERVER['HTTP_HOST'].__PS_BASE_URI__).'modules/'.$this->module.'/images/';
		
			foreach( $sliders as $i => $slider ){
				$slider['image'] = $site_url.$slider['image'];
				$sliders[$i]['thumbnail'] = $slider['image'];
				$sliders[$i]['mainimage'] = $slider['image'];
				if( $params->get('cropthumb',1) ){
					$sliders[$i]['mainimage'] = $this->renderThumb( $slider['image'], $iwidth, $iheight );
					$sliders[$i]['thumbnail'] =  $this->renderThumb( $slider['image'], $twidth, $theight );		
				}
			}			
		  
			return $sliders;
		}
		
		/**
		 * render its parameters 
		 */
		public function renderForm( $params ){
			 
			
			 
			return '';
		}
		
		public function getParams(){
			return array();
		}
		
	}
}
