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
		
		$jvaModel = new JvaModel;
		$jvaModel->getAllJvas();
		$jvaModel->getAllColNames();
		$colNames = $jvaModel->allColNames;
		$jvaListModel = $jvaModel->allJvas;
		$jvaAddFormModel= new JvaAddModel;
		$jvaEditFormModel="";
		 $this->render('jvaList', array('jvaListModel' => $jvaListModel, 'jvaAddFormModel' => $jvaAddFormModel,'jvaEditFormModel' => $jvaEditFormModel, 'colNames'=>$colNames));
	}
	
	public function actionLoadJVAEditForm () {
		if(isset($_POST['jvaID'])) {
			$jvaID = htmlspecialchars($_POST['jvaID']);
			// $jvaID = $_POST['jvaID'];
			$jvaModel = new JvaModel;
			$jvaModel->getAllColNames();
			$colNames = $jvaModel->allColNames;
			$selectedJVA = $jvaModel->getJvaById($jvaID);
			//var_dump($selectedJVA);
			$this->renderPartial('_jvaEditForm', array('jvaEditFormModel'=> $selectedJVA ,'colNames'=>$colNames), false, true);
			
		} else {
			echo "ERROR: jvaID not set";
		}
	}
	
	public function actionSaveJVAEditForm(){
		$jvaModel = new JvaModel;
		$jvaModel->getAllColNames();
		$colNames = $jvaModel->allColNames;
		if(isset($_POST['data'])){
			$jvaName = $_POST['data'][0];
			$jvaNameExt = $_POST['data'][1];
			$jvaCustName = $_POST['data'][2];
			$jvaCustNameDesc = $_POST['data'][3];
			$jvaFooter = $_POST['data'][4];
			$jvaAddress = $_POST['data'][5];
			$jvaColIk1 = $_POST['data'][6];
			$jvaColIk2 = $_POST['data'][7];
			$jvaColIk3 = $_POST['data'][8];
			$jvaColIk4 = $_POST['data'][9];
			$jvaColIk5 = $_POST['data'][10];
		
			$jvaColMemmel1 = $_POST['data'][11];
			$jvaColMemmel2 = $_POST['data'][12];
			$jvaColMemmel3 = $_POST['data'][13];
			$jvaColMemmel4 = $_POST['data'][14];
			$jvaColMemmel5 = $_POST['data'][15];
	
			$jvaColLoehne1 = $_POST['data'][16];
			$jvaColLoehne2 = $_POST['data'][17];
			$jvaColLoehne3 = $_POST['data'][18];
			$jvaColLoehne4 = $_POST['data'][19];
			$jvaColLoehne5 = $_POST['data'][20];
		
			$jvaColWitte1 = $_POST['data'][21];
			$jvaColWitte2 = $_POST['data'][22];
			$jvaColWitte3 = $_POST['data'][23];
			$jvaColWitte4 = $_POST['data'][24];
			$jvaColWitte5 = $_POST['data'][25];

			$jvaColEk1 = $_POST['data'][26];
			$jvaColEk2 = $_POST['data'][27];
			$jvaColEk3 = $_POST['data'][28];
			$jvaColEk4 = $_POST['data'][29];
			$jvaColEk5 = $_POST['data'][30];

			$jvaPrintAmountIk = $_POST['data'][31];
			$jvaPrintAmountMemmel = $_POST['data'][32];
			$jvaPrintAmountLoehne = $_POST['data'][33];
			$jvaPrintAmountWitte = $_POST['data'][34];
			$jvaPrintAmountEk = $_POST['data'][35];
			//echo $jvaCol9;
			// $jvaCol10 = $_POST['data'][15];
			// $jvaCol11 = $_POST['data'][16];
			// $jvaCol12 = $_POST['data'][17];
			// $jvaModel->updateJva($jvaName,$jvaNameExt,$jvaAddress,$jvaFooter,$jvaCustName,$jvaCustNameDesc,$jvaCol1,$jvaCol2,$jvaCol3,$jvaCol4,$jvaCol5,$jvaCol6,$jvaCol7,$jvaCol8,$jvaCol9,$jvaCol10,$jvaCol11,$jvaCol12);

			//97,98,99 hardcoded for MwSt
			$jvaModel->updateJva($jvaName,$jvaNameExt,$jvaAddress,$jvaFooter,$jvaCustName,$jvaCustNameDesc,$jvaColIk1,$jvaColIk2,$jvaColIk3,$jvaColIk4,$jvaColIk5,'Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',$jvaColMemmel1,$jvaColMemmel2,$jvaColMemmel3,$jvaColMemmel4,$jvaColMemmel5,'Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',$jvaColLoehne1,$jvaColLoehne2,$jvaColLoehne3,$jvaColLoehne4,$jvaColLoehne5,'Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',$jvaColWitte1,$jvaColWitte2,$jvaColWitte3,$jvaColWitte4,$jvaColWitte5,'Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',$jvaColEk1,$jvaColEk2,$jvaColEk3,$jvaColEk4,$jvaColEk5,'Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',$jvaPrintAmountIk ,$jvaPrintAmountMemmel ,$jvaPrintAmountLoehne ,$jvaPrintAmountWitte,$jvaPrintAmountEk);
			
			$selectedJVA = $jvaModel->getJvaByName($jvaName,$jvaNameExt);
			$this->renderPartial('_jvaEditForm', array('jvaEditFormModel'=> $selectedJVA ,'colNames'=>$colNames), false, true);
		} else {
			echo "data not set";
		}
		
	}
	
	
	public function actionSaveJVAAddForm(){
		$jvaModel = new JvaModel;
		$jvaModel->getAllColNames();
		$colNames = $jvaModel->allColNames;
		if(isset($_POST['data'])){
			$jvaName = $_POST['data'][0];
			$jvaNameExt = $_POST['data'][1];
			$jvaCustName = $_POST['data'][2];
			$jvaCustNameDesc = $_POST['data'][3];
			$jvaFooter = $_POST['data'][4];
			$jvaAddress = $_POST['data'][5];
			$jvaColIk1 = $_POST['data'][6];
			$jvaColIk2 = $_POST['data'][7];
			$jvaColIk3 = $_POST['data'][8];
			$jvaColIk4 = $_POST['data'][9];
			$jvaColIk5 = $_POST['data'][10];
		
			$jvaColMemmel1 = $_POST['data'][11];
			$jvaColMemmel2 = $_POST['data'][12];
			$jvaColMemmel3 = $_POST['data'][13];
			$jvaColMemmel4 = $_POST['data'][14];
			$jvaColMemmel5 = $_POST['data'][15];
	
			$jvaColLoehne1 = $_POST['data'][16];
			$jvaColLoehne2 = $_POST['data'][17];
			$jvaColLoehne3 = $_POST['data'][18];
			$jvaColLoehne4 = $_POST['data'][19];
			$jvaColLoehne5 = $_POST['data'][20];
		
			$jvaColWitte1 = $_POST['data'][21];
			$jvaColWitte2 = $_POST['data'][22];
			$jvaColWitte3 = $_POST['data'][23];
			$jvaColWitte4 = $_POST['data'][24];
			$jvaColWitte5 = $_POST['data'][25];

			$jvaColEk1 = $_POST['data'][26];
			$jvaColEk2 = $_POST['data'][27];
			$jvaColEk3 = $_POST['data'][28];
			$jvaColEk4 = $_POST['data'][29];
			$jvaColEk5 = $_POST['data'][30];
			
			$jvaPrintAmountIk = $_POST['data'][31];
			$jvaPrintAmountMemmel = $_POST['data'][32];
			$jvaPrintAmountLoehne = $_POST['data'][33];
			$jvaPrintAmountWitte = $_POST['data'][34];
			$jvaPrintAmountEk = $_POST['data'][35];
			// $jvaCol10 = $_POST['data'][15];
			// $jvaCol11 = $_POST['data'][16];
			// $jvaCol12 = $_POST['data'][17];
			// $jvaModel->insertJva($jvaName,$jvaNameExt,$jvaAddress,$jvaFooter,$jvaCustName,$jvaCustNameDesc,$jvaCol1,$jvaCol2,$jvaCol3,$jvaCol4,$jvaCol5,$jvaCol6,$jvaCol7,$jvaCol8,$jvaCol9,$jvaCol10,$jvaCol11,$jvaCol12);

			//97,98,99 hardcoded for MwSt
			$jvaModel->insertJva($jvaName,$jvaNameExt,$jvaAddress,$jvaFooter,$jvaCustName,$jvaCustNameDesc,$jvaColIk1,$jvaColIk2,$jvaColIk3,$jvaColIk4,$jvaColIk5,'Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',$jvaColMemmel1,$jvaColMemmel2,$jvaColMemmel3,$jvaColMemmel4,$jvaColMemmel5,'Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',$jvaColLoehne1,$jvaColLoehne2,$jvaColLoehne3,$jvaColLoehne4,$jvaColLoehne5,'Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',$jvaColWitte1,$jvaColWitte2,$jvaColWitte3,$jvaColWitte4,$jvaColWitte5,'Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',$jvaColEk1,$jvaColEk2,$jvaColEk3,$jvaColEk4,$jvaColEk5,'Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',$jvaPrintAmountIk ,$jvaPrintAmountMemmel ,$jvaPrintAmountLoehne ,$jvaPrintAmountWitte,$jvaPrintAmountEk );
			//$this->renderPartial('_jvaEditForm', array('jvaEditFormModel'=> $selectedJVA ,'colNames'=>$colNames), false, true);

			$jvaModel = new JvaModel;
			$jvaModel->getAllJvas();
			$jvaListModel = $jvaModel->allJvas;
			$this->renderPartial('_jvaList', array('jvaListModel' => $jvaListModel), false, true);
		}
	}
	
	
	public function actionDeactivateJVAById(){
		$jvaModel = new JvaModel;
		$jvaModel->getAllColNames();
		// $colNames = $jvaModel->allColNames;
		if(isset($_POST['jvaID'])) {
			$jvaID = htmlspecialchars($_POST['jvaID']);
			$deactivateResult = $jvaModel->deactivateJvaById($jvaID);
		} else {
			echo "Error deactivation";
		}
		$jvaModel->getAllJvas();
		$jvaList = $jvaModel->allJvas;
		// $jvaAddFormModel= new JvaAddModel;
		// $jvaEditFormModel="";
		 $this->renderPartial('_jvaList', array('jvaListModel' => $jvaList), false, true);
	}
	
	public function actionGetJvaAsJson () {
		if(isset($_GET['jvaSearchTerm'])) {
			$searchTerm = htmlspecialchars($_GET['jvaSearchTerm']);
			$jvaModel = new JVAModel();
			$jvaNamesArray = $jvaModel->getAllJvaNames($searchTerm);
			// $jvaNamesArray = $jvaModel->allJvas;
			echo CJSON::encode($jvaNamesArray);
			return;
		}
		echo "Error in Controller";
	}
}