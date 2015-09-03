<?php

class JvaController extends Controller
{
	public function actionTest(){
		
		$jvaModel = new JvaModel;
				
		$jvaCol1 = "Artikelbeschreibung";
		$jvaCol2 = "Artikelnummer";
		$jvaCol3="";
		$jvaCol4="";
		$jvaCol5="";
		$jvaCol6="";
		$jvaCol7="";
		$jvaCol8="";
		$jvaCol9="";
		$jvaCol10="";
		$jvaCol11="";
		$jvaCol12="";
		$jvaCol13="";
		$jvaName = "JVA Hauptsi";
		$jvaAddress = "Hauptsi 30 96052 Bamberg";
		$jvaNameExt = "drunter";
		$jvaFooter = "Adela Tschuessikowski!";
		$jvaCustNum = '';
		$jvaCustNumDesc = '';
		
		$jvaOldName = "JVA Hauptsi";
		$jvaOldNameExt = "drunter";
		//$jvaModel->getAllJvas();
		//$jvaModel->getAllColNames();
		//$jvaModel->getAllJvasNamesAndExtensions();
		$jvaModel->insertJva($jvaName,$jvaNameExt,$jvaAddress,$jvaFooter,$jvaCustNum,$jvaCustNumDesc,$jvaCol1,$jvaCol2,$jvaCol3,$jvaCol4,$jvaCol5,$jvaCol6,$jvaCol7,$jvaCol8,$jvaCol9,$jvaCol10,$jvaCol11,$jvaCol12);
		//$jvaModel->updateJva($jvaOldName,$jvaOldNameExt,$jvaName,$jvaNameExt,$jvaAddress,$jvaFooter,$jvaCustNum,$jvaCustNumDesc,$jvaCol1,$jvaCol2,$jvaCol3,$jvaCol4,$jvaCol5,$jvaCol6,$jvaCol7,$jvaCol8,$jvaCol9,$jvaCol10,$jvaCol11,$jvaCol12);
		//$jvaModel->deleteJvaByName($jvaName,$jvaNameExt);
		//$jvaModel->getAllCols();
		$this->render('jvatest',array('jvaModel'=>$jvaModel));
	}

	public function actionListJVAs () {
		
		//TODO: create a list with all JVAs and pass it to view
		$criteria = new CDbCriteria();
		//$criteria->condition = 'jvaDataId=:jvaDataId';
		//$criteria->params = array('jvaDataId'=>0);
						
		$jvaList = JvaData::model()
		->with(
		'defaultColConfig',
		'defaultColConfig.colDef1',
		'defaultColConfig.colDef2',
		'defaultColConfig.colDef3',
		'defaultColConfig.colDef4',
		'defaultColConfig.colDef5',
		'defaultColConfig.colDef6',
		'defaultColConfig.colDef7',
		'defaultColConfig.colDef8',
		'defaultColConfig.colDef9',
		'defaultColConfig.colDef10',
		'defaultColConfig.colDef11',
		'defaultColConfig.colDef12'
		)->findAll($criteria);
		$jvaEditFormModel = ["hussa"];
		$this->render('jvaList', array('jvaListAR' => $jvaList, 'jvaEditFormModel' => $jvaEditFormModel));
	}
	
	public function actionLoadJVAEditForm () {
		if(isset($_POST['jvaID'])) {
			
			$jvaID = htmlspecialchars($_POST['jvaID']);
			
			$selectedJVA = JvaData::model()->with(
				'defaultColConfig',
				'defaultColConfig.colDef1',
				'defaultColConfig.colDef2',
				'defaultColConfig.colDef3',
				'defaultColConfig.colDef4',
				'defaultColConfig.colDef5',
				'defaultColConfig.colDef6',
				'defaultColConfig.colDef7',
				'defaultColConfig.colDef8',
				'defaultColConfig.colDef9',
				'defaultColConfig.colDef10',
				'defaultColConfig.colDef11',
				'defaultColConfig.colDef12'
			)->findByPK($jvaID);
			
			//$jvaEditFormModel = new JvaEditFormModel($selectedJVA);
			
			$this->renderPartial('_jvaEditForm', array('jvaEditFormModel'=> $selectedJVA), false, true);
			
			//echo "successfully received jvaID ". htmlspecialchars($_POST['jvaID']);
		} else {
			echo "ERROR: jvaID not set";
		}
	}
}