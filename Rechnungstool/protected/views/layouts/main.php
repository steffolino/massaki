<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="language" content="en">
	<?php Yii::app()->bootstrap->register(); ?>
	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection">
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print">
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection">
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css">
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css">

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>

<div class="container" id="page">

	- header -->

	<div id="mainmenu">
	<?php $this->widget('bootstrap.widgets.TbNavbar', array(
		'type'=>'inverse', // null or 'inverse'
		'brand'=>'Project name',
		'brandUrl'=>'#',
		'collapse'=>true, // requires bootstrap-responsive.css
		'items'=>array(
			array(
				'class'=>'bootstrap.widgets.TbMenu',
				'items'=>array(
					array('label'=>'Home', 'url'=>'#', 'active'=>true),
				),
			),
		),
	)); ?>
	</div><!-- mainmenu -->
	

	<?php echo $content; ?>

	<div class="clear"></div>

	<div id="footer">
		Copyright &copy; <?php echo date('Y'); ?> by Stefan Stretz Medienfabrik.<br/>
		All Rights Reserved.<br/>
		
	</div><!-- footer -->

</div><!-- page -->

</body>
</html>
