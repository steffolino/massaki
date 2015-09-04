<?php 
if(isset($jvaEditFormModel) && $jvaEditFormModel !== ""){
	$form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
	'id'=>'jvaEditForm',
	//'enableAjaxValidation'=>true,
	//'focus'=>array($jvaEditFormModel,'jvaName'),
	)); 
	
	//TODO: create Form
	?>
	<fieldset>	
	<br>
	<?php
	
	echo $form->textField($jvaEditFormModel,'jvaName',array('class'=>'col-sm-5','id'=>'jvaName','disabled'=>true));
		echo $form->labelEx($jvaEditFormModel,'jvaName');
		?>
		<br>
		<br>
		<?php
	echo $form->textField($jvaEditFormModel,'jvaNameExt',array('class'=>'col-sm-5','id'=>'jvaNameExt','disabled'=>true));
		echo $form->labelEx($jvaEditFormModel,'jvaNameExt');
	
		?>
		<br>
		<br>
			<?php
	
	echo $form->textField($jvaEditFormModel,'jvaCustNumDesc',array('class'=>'col-sm-5','id'=>'jvaCustNumDesc'));
		echo $form->labelEx($jvaEditFormModel,'jvaCustNumDesc');
		?>
		<br>
		<br>
		<?php
		echo $form->textField($jvaEditFormModel,'jvaCustNum',array('class'=>'col-sm-5','id'=>'jvaCustNum'));
		echo $form->labelEx($jvaEditFormModel,'jvaCustNum');
	
	?>
	<br>
		<br>
		<?php
		echo $form->textField($jvaEditFormModel,'jvaFooter',array('class'=>'col-sm-5','id'=>'jvaFooter'));
		echo $form->labelEx($jvaEditFormModel,'jvaFooter');
	
	?>
	<br>
		<br>
		<?php
		echo $form->textArea($jvaEditFormModel,'jvaAddress',array('class'=>'col-sm-5','id'=>'jvaAddress'));
		echo $form->labelEx($jvaEditFormModel,'jvaAddress');
	
	?>
	<br>
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef1,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName1'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef2,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName2'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef3,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName3'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef4,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName4'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef5,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName5'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef6,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName6'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef7,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName7'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef8,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName8'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef9,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName9'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef10,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName10'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef11,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName11'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		<br>
		<br>
		<?php
		echo $form->dropDownList($jvaEditFormModel->defaultColConfig->colDef12,'colName',$colNames,array('class'=>'col-sm-5','id'=>'colName12'));
		echo $form->labelEx($jvaEditFormModel->defaultColConfig->colDef1,'colName');
		?><br>
		
	</fieldset>
	<?php
	$this->endWidget();
}else{
	?>
	<div class="hero-unit"><b>Bitte wählen Sie eine Aktion aus!</b></div>
	<?php
}
	// echo "<pre>";
		// var_dump($colNames);
	// echo "</pre>";
?>