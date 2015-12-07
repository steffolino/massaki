<?php
if(isset($jvaAddFormModel)){
	
	$form = $this->beginWidget(
		'booster.widgets.TbActiveForm',
		array(
			'type' => 'horizontal',
			'id'=>'jvaAddForm',
			'htmlOptions' => array(
				'class' => 'well'
			),
		)
	); ?>
		
		<fieldset>
		<br/>
		<?php
	//		echo $form->labelEx($jvaAddFormModel, 'jvaName');
			echo $form->textFieldGroup($jvaAddFormModel,'jvaName');
			echo $form->textFieldGroup($jvaAddFormModel,'jvaNameExt');
			echo $form->textFieldGroup($jvaAddFormModel,'jvaFooter');
			echo $form->textAreaGroup($jvaAddFormModel,'jvaAddress');
			echo $form->textFieldGroup($jvaAddFormModel,'jvaCustNum');
			echo $form->textFieldGroup($jvaAddFormModel,'jvaCustNumDesc');
			//TODO: doesnt work like this --> cf. jvaEditForm - labelEx
			$tabs = array(
				array('label' => 'IK', 'content' => '<br/>'),
				array('label' => 'Logistik Memmelsdorf', 'content' => '<br/>'),
				array('label' => 'Logistik Löhne', 'content' => '<br/>'),
				// array('label' => 'Sammelrechnung', 'content' => '<br/>'),
			);
			
			array_splice($colNames, -3);
			
			//Awesome C like fix
			foreach($tabs as &$tab) {
				for($i=1;$i<10;$i++){
					$tab['content'] .= $form->dropDownListGroup($jvaAddFormModel,'colName'.$i, array('widgetOptions'=>array('data'=>$colNames),'class'=>'col-sm-5','id'=>'addColName'.$i));
				}
			}
		    echo "<br/>";
			$this->widget(
				'booster.widgets.TbTabs',
				array(
					'type' => 'tabs',
					'justified' => true,
					'tabs' => $tabs
				)
			); 
		
		?>
		</fieldset>
		
		<?php
	
}else{
	echo "Huha";
	
} 
$this->endWidget();
?>