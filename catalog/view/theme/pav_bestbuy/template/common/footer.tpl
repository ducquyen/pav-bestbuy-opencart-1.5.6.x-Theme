<?php 
	/******************************************************
	 * @package Pav Megamenu module for Opencart 1.5.x
	 * @version 1.0
	 * @author http://www.pavothemes.com
	 * @copyright	Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
	 * @license		GNU General Public License version 2
	*******************************************************/

	require_once( DIR_TEMPLATE.$this->config->get('config_template')."/template/libs/module.php" );
	$themeConfig = $this->config->get('themecontrol');
	$themeName = basename( dirname(dirname(dirname(__FILE__))) );
	$helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
	$LANGUAGE_ID = $this->config->get( 'config_language_id' );  

?>
</div></div></div></section>
<?php
	/**
	 * Footer Top Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'mass_bottom' ); 
	$ospans = array(1=>4,2=>4,3=>4);
	if( count($modules) ) { 
		$cols = isset($themeConfig['block_mass_bottom'])&& $themeConfig['block_mass_bottom']?(int)$themeConfig['block_mass_bottom']:count($modules);
	$class = $helper->calculateSpans( $ospans, $cols );
?>
<section id="pav-mass-bottom">
	<div class="container">
		<div class="container-inner">
		<?php $j=1;foreach ($modules as $i =>  $module) {   ?>
			<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row-fluid"><?php } ?>	
			<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
			<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>
		</div>
	</div>	
</section>
<?php } ?>



<section id="footer">
	<?php
	/**
	 * Footer Top Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_top' ); 
	$ospans = array(1=>9);
	
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_top'])&& $themeConfig['block_footer_top']?(int)$themeConfig['block_footer_top']:count($modules);
	//if( $cols < count($modules) ){ $cols = count($modules); }
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<div class="footer-top">
		<div class="container">
			<div class="container-inner">
			<?php $j=1;foreach ($modules as $i =>  $module) {   ?>
				<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row-fluid"><?php } ?>	
				<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
				<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
			<?php  $j++;  } ?>
			</div>
		</div>
	</div>
	<?php } ?>

	<?php
	/**
	 * Footer Center Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_center' ); 
	$ospans = array();
	
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_center'])&& $themeConfig['block_footer_center']?(int)$themeConfig['block_footer_center']:count($modules);
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<div class="footer-center">
		<div class="container">
			<div class="container-inner">
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
				<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row-fluid"><?php } ?>	
				<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
				<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
			<?php  $j++;  } ?>	
			</div>
		</div>
	</div>
<?php } elseif((isset($themeConfig['enable_footer_center'])&&$themeConfig['enable_footer_center'])) { ?>
<div class="footer-center">
		<div class="container">
			<div class="container-inner">
				<div class="row-fluid">
		 <!-- <?php if ($informations) { ?>
			<div class="column span3">
				<div class="box no-box">
					<h3><?php echo $text_information; ?></h3>
					<ul class="list">
					  <?php foreach ($informations as $information) { ?>
					  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
					  <?php } ?>
					</ul>
				</div>
			</div>
		  <?php } ?>-->

		   <?php if( isset($themeConfig['widget_about_data'][$LANGUAGE_ID]) ) { ?>
		<div class="column span3">
			<div class="box no-box">
				<!--<h3><?php echo $this->language->get('text_contact_us'); ?></h3>-->
				<?php echo html_entity_decode( $themeConfig['widget_about_data'][$LANGUAGE_ID], ENT_QUOTES, 'UTF-8' ); ?>
		</div>
		</div>
		 <?php } ?>
		  
		<div class="column span2">
			<div class="box no-box">
				<h3><?php echo $text_service; ?></h3>
				<ul class="list">
				  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				  <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				</ul>
			</div>
		</div>
		  
		 <div class="column span2">
			<div class="box no-box">
			<h3><?php echo $text_extra; ?></h3>
			<ul class="list">
			  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
			  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
			  <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
			  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
			</ul>
		  </div>
		</div>
		  
		<div class="column span2">
			<div class="box no-box">
				<h3><?php echo $text_account; ?></h3>
				<ul class="list">
				  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			</div>
		</div>

		 <?php if( isset($themeConfig['widget_contact_data'][$LANGUAGE_ID]) ) { ?>
		<div class="column span3">
			<div class="box contact box-line">
				<?php echo html_entity_decode( $themeConfig['widget_contact_data'][$LANGUAGE_ID], ENT_QUOTES, 'UTF-8' ); ?>
		</div>
		</div>
		 <?php } ?>

		 </div> 
	</div></div>
</div>
<?php  } ?>	

	<?php
	/**
	 * Footer Bottom
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_bottom' ); 
	$ospans = array();
	
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_bottom'])&& $themeConfig['block_footer_bottom']?(int)$themeConfig['block_footer_bottom']:count($modules);	
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<div class="footer-bottom">
		<div class="container">
			<div class="container-inner">
			<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
					<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row-fluid"><?php } ?>	
					<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
					<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
			<?php  $j++;  } ?>	
			</div>
		</div>
	</div>
	<?php } ?>

</section>
	<!--
	OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
	Please donate via PayPal to donate@opencart.com
	//-->
<div id="powered">
	<div class="container">
		<div class="row-fluid">
		<div class="copyright span9">
			<?php if( isset($themeConfig['enable_custom_copyright']) && $themeConfig['enable_custom_copyright'] ) { ?>
				<?php echo $themeConfig['copyright'];?>
			<?php } else { ?>
				<?php echo $powered; ?>. 
			<?php } ?><br />
			Design By <a href="http://www.pavothemes.com" title="pavethemes - opencart themes clubs">PavoThemes</a>
		</div>
		<div class="span3">
			 <?php if( isset($themeConfig['widget_social_data'][$LANGUAGE_ID]) ) { ?>
					<div class="social"><?php echo html_entity_decode( $themeConfig['widget_social_data'][$LANGUAGE_ID], ENT_QUOTES, 'UTF-8' ); ?></div>
				 <?php } ?>
		</div>
		</div>
	</div>
</div>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<?php if( isset($themeConfig['enable_paneltool']) && $themeConfig['enable_paneltool'] ){  ?>
	<?php include( dirname(__FILE__).'/addon/panel.tpl' );?>
<?php } ?>
</div> 
</body></html>