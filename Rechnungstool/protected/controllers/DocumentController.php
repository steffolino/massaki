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
		$counterType = "IK";
		$newDoc = new DocumentImplementierung;
		//$result = $newDoc->insertNewDocument($docType,$jvaId,$contactPerson,$allRows,$counterType);
		$result = $newDoc->getColumnValuesPerSelectedJva($jvaId);
		$this->render('enterNewDoc',array('allRows'=>$allRows, 'result'=>$result));
	}
	
	public function actionLoadTableData(){
		$jvaModel = new JvaModel;
		$jvaNamePlusExt = $_POST["jva"];
		$jvaNamePlusExtArray = array();
		$jvaNamePlusExtArray = explode("|",$jvaNamePlusExt);
		$jvaName = $jvaNamePlusExtArray[0];
		$jvaExt = $jvaNamePlusExtArray[1];
		$jva = $jvaModel->getJvaByName(trim($jvaName), trim($jvaExt));
		
		$defaultColConfig = $jvaModel->getDefColByJva($jva);
		$headerAndData = array();
		$header = array();
		$data = array();
		$allData = array();
		$counter = 0;
		
	
		$col1 = $jvaModel->getColNameById($defaultColConfig->col1);
		if($col1 !== NULL && $col1 !== ' '){
			array_push($header,$col1);
			$counter++;
		}
		$col2 = $jvaModel->getColNameById($defaultColConfig->col2);
		if($col2 !== NULL && $col2 !== ' '){
			array_push($header,$col2);
			$counter++;
		}
		$col3 = $jvaModel->getColNameById($defaultColConfig->col3);
		if($col3 !== NULL && $col3 !== ' '){
			array_push($header,$col3);
			$counter++;
		}
		$col4 = $jvaModel->getColNameById($defaultColConfig->col4);
		if($col4 !== NULL && $col4 !== " "){
			array_push($header,$col4);
			$counter++;
		}
		$col5 = $jvaModel->getColNameById($defaultColConfig->col5);
		if($col5 !== NULL && $col5 !== " "){
			array_push($header,$col5);
			$counter++;
		}
		$col6 = $jvaModel->getColNameById($defaultColConfig->col6);
		if($col6 !== NULL && $col6 !== " "){
			array_push($header,$col6);
			$counter++;
		}
		$col7 = $jvaModel->getColNameById($defaultColConfig->col7);
		if($col7 !== NULL && $col7 !== " "){
			array_push($header,$col7);
			$counter++;
		}
		$col8 = $jvaModel->getColNameById($defaultColConfig->col8);
		if($col8 !== NULL && $col8 !== " "){
			array_push($header,$col8);
			$counter++;
		}
		$col9 = $jvaModel->getColNameById($defaultColConfig->col9);
		if($col9 !== NULL && $col9 !== " "){
			array_push($header,$col9);
			$counter++;
		}
		$col10 = $jvaModel->getColNameById($defaultColConfig->col10);
		if($col10 !== NULL && $col10 !== " "){
			array_push($header,$col10);
			$counter++;
		}
		$col11 = $jvaModel->getColNameById($defaultColConfig->col11);
		if($col11 !== NULL && $col11 !== " "){
			array_push($header,$col11);
			$counter++;
		}
		$col12 = $jvaModel->getColNameById($defaultColConfig->col12);
		if($col12 !== NULL && $col12 !== " "){
			array_push($header,$col12);
			$counter++;
		}
		$docValues = new DocumentvaluesImplementierung;
		$doc = new DocumentImplementierung;
		$lastUsedDocId = $doc->getLastUsedDocumentId(trim($jvaName),trim($jvaExt));
		$documentValues = $docValues->getDocumentValuesByDocumentId($lastUsedDocId);
		
		foreach($documentValues as $rows){
			
			$data = array();
			$value1 = $rows->value1;
			if($value1 !== NULL ){
				array_push($data,$value1);
			}
			
			$value2 = $rows->value2;
			if($value2 !== NULL ){
				array_push($data,$value2);
			}
			$value3 = $rows->value3;
			if($value3 !== NULL ){
				array_push($data,$value3);
			}
			$value4 = $rows->value4;
			if($value4 !== NULL ){
				array_push($data,$value4);
			}
			$value5 = $rows->value5;
			if($value5 !== NULL ){
				array_push($data,$value5);
			}
			$value6 = $rows->value6;
			if($value6 !== NULL ){
				array_push($data,$value6);
			}
			$value7 = $rows->value7;
			if($value7 !== NULL ){
				array_push($data,$value7);
			}
			$value8 = $rows->value8;
			if($value8 !== NULL ){
				array_push($data,$value8);
			}
			$value9 = $rows->value9;
			if($value9 !== NULL ){
				array_push($data,$value9);
			}
			$value10 = $rows->value10;
			if($value10 !== NULL ){
				array_push($data,$value10);
			}
			$value11 = $rows->value11;
			if($value11 !== NULL ){
				array_push($data,$value11);
			}
			$value12 = $rows->value12;
			if($value12 !== NULL ){
				array_push($data,$value12);
			}
			
			array_push($allData,$data);
		}
		
		$everything = array();
		array_push($everything,$header);
		array_push($everything,$allData);
		
		//var_dump($header);
		echo json_encode($everything);
		
	}

	
	public function actionGetTableData()
	{	
		$jvaModel = new JvaModel;
		$counterType = $_POST["counterType"];
		$docType = $_POST["docType"];
		$jvaNamePlusExt = $_POST["jva"];
		$jvaNamePlusExtArray = array();
		$jvaNamePlusExtArray = explode("|",$jvaNamePlusExt);
		$jvaName = $jvaNamePlusExtArray[0];
		$jvaExt = $jvaNamePlusExtArray[1];
		$jva = $jvaModel->getJvaByName(trim($jvaName), trim($jvaExt));
		
		$jvaId = $jva->jvaDataId;
		$header = $_POST["headers"];
		$content = $_POST["content"];
		
		$allRows = array();
		$row  = array();
		$counter = 0;
		foreach($content as $zeile){
			foreach($zeile as $cell){
				array_push($row,$cell);
				$counter++;
			}
			for($counter;$counter <= 11;$counter++){
				array_push($row,NULL);
			}
			$counter++;
			foreach($header as $colHeader){
				array_push($row,$colHeader);
				$counter++;
			}
			for($counter;$counter <= 23;$counter++){
				array_push($row,NULL);
			}
			$allRows = array_merge($allRows,$row);
			
			$counter = 0;
		}
		$neuDoc = new DocumentImplementierung;
		//$result = $neuDoc->insertNewDocument($docType,$jvaId,$contactPerson,$allRows,$counterType);
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