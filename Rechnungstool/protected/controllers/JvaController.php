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
		//$jvaModel->insertJva($jvaName,$jvaNameExt,$jvaAddress,$jvaFooter,$jvaCustNum,$jvaCustNumDesc,$jvaCol1,$jvaCol2,$jvaCol3,$jvaCol4,$jvaCol5,$jvaCol6,$jvaCol7,$jvaCol8,$jvaCol9,$jvaCol10,$jvaCol11,$jvaCol12);
		//$jvaModel->updateJva($jvaOldName,$jvaOldNameExt,$jvaName,$jvaNameExt,$jvaAddress,$jvaFooter,$jvaCustNum,$jvaCustNumDesc,$jvaCol1,$jvaCol2,$jvaCol3,$jvaCol4,$jvaCol5,$jvaCol6,$jvaCol7,$jvaCol8,$jvaCol9,$jvaCol10,$jvaCol11,$jvaCol12);
		//$jvaModel->deleteJvaByName($jvaName,$jvaNameExt);
		//$jvaModel->getAllCols();
		$this->render('jvatest',array('jvaModel'=>$jvaModel));
	}
}