<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="language" content="en">

	
	<?php 	
		//yiistrap stuff
		Yii::app()->bootstrap->register(); 
	?>

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>

<div class="container" id="page">
	<div id="header">
	</div><!-- header -->

	<div id="mainmenu">

	<?php
		$this->widget('bootstrap.widgets.TbNavbar', array(
		'color' => TbHtml::NAVBAR_COLOR_INVERSE,
        'items' => array(
				array(
					'class' => 'bootstrap.widgets.TbNav',
					'items' => array(
						array('label'=>'<span class="glyphicon glyphicon-shopping-cart">', 'url'=>array('/site/index')),
//						array('label' => Html::tag('span','','class' => 'glyphicon glyphicon-lock')),
						array('label'=>'About', 'url'=>array('/site/page', 'view'=>'about')),
						array('label'=>'Contact', 'url'=>array('/site/contact')),
						array('label'=>'Login', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
						array('label'=>'Logout ('.Yii::app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest)
					),
				),
		)
		)); ?>

  
	</div><!-- mainmenu -->
	
			),
		)); 
		?>
	</div><!-- mainmenu -->

	<?php echo $content; ?>

	<div class="clear"></div>

	<div id="footer">
		Copyright &copy; <?php echo date('Y'); ?> by Stefan Stretz - Medientechnik - Hu ha ha.<br/>
	</div><!-- footer -->

</div><!-- page -->

</body>

</html>
