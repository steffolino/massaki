<?php

class DocumentController extends Controller
{
	public function actionIndex()
	{
		$this->render('index');
	}

	
	
	public function actionEnterNewDoc()
	{
		$this->render('enterNewDoc');
	}

	
	public function actionTestDocument()
	{
		//TO DO: This simulates the $_POST array which then comes from inserts of user
		$row1 = array(5,6,"Horst",7,NUll,Null,Null,NUll,NUll,NUll,NUll,NUll,"Artikelbeschreibung","Artikelnummer","Artikenanzahl","Rechnung",NUll,Null,Null,NUll,NUll,NUll,NUll,NUll);
		$row2 = array(6,7,"Detelef",8,NUll,Null,Null,NUll,NUll,NUll,NUll,NUll,"Artikelbeschreibung","Artikelnummer","Artikenanzahl","Rechnung",NUll,Null,Null,NUll,NUll,NUll,NUll,NUll);
		$allRows = array($row1,$row2);
		$contactPerson = "Alfred E. Neumann";
		$jvaId = 0;
		$docType = "Gutschrift";
		$newDoc = new DocumentImplementierung;
		//$result = $newDoc->insertNewDocument($docType,$jvaId,$contactPerson,$allRows);
		$result = $newDoc->getColumnValuesPerSelectedJva($jvaId);
		$this->render('enterNewDoc',array('allRows'=>$allRows, 'result'=>$result));
	}
	// Uncomment the following methods and override them if needed
	/*
	public function filters()
	{
		// return the filter configuration for this controller, e.g.:
		return array(
			'inlineFilterName',
			array(
				'class'=>'path.to.FilterClass',
				'propertyName'=>'propertyValue',
			),
		);
	}

	public function actions()
	{
		// return external action classes, e.g.:
		return array(
			'action1'=>'path.to.ActionClass',
			'action2'=>array(
				'class'=>'path.to.AnotherActionClass',
				'propertyName'=>'propertyValue',
			),
		);
	}
	*/
}