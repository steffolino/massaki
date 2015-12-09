<?php
class SearchFormModel extends CFormModel
{
   public $freeSearchTerm;
   
   
   public $jvaName;
   public $docType;
   public $startDate;
   public $endDate;
   
   	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels()
	{
		return array(
			'freeSearchTerm'	=>	'Freitext-Suche',
			'docType'	=>	'Dokument-Typ',
			'dateRange'	=>	'Zeitraum',
		);
	}
	
	public function searchWithFilter(){
		$searchTerm = $this->freeSearchTerm;
		if(isset($this->jvaName)&& !isset($docType) && !isset($startDate) && !isset($endDate)){
			$document = Document::model()->with('jva','docType','jva.jvaColIk','jva.jvaColMemmel','documentvalues','jva.jvaColLoehne','jva.jvaColWitte')->findAll('jvaName=:jvaName AND (contact_person=:searchTerm OR  value1=:searchTerm OR value2=:searchTerm OR value3=:searchTerm OR value4=:searchTerm OR value5=:searchTerm OR value6=:searchTerm OR value7=:searchTerm OR value8=:searchTerm  OR value9=:searchTerm  OR value10=:searchTerm  OR value11=:searchTerm  OR value12=:searchTerm OR counter=:searchTerm)', array(':searchTerm'=>"%$searchTerm%",':jvaName'=>$this->jvaName));
		}else if(!isset($this->jvaName)&& isset($docType) && !isset($startDate) && !isset($endDate)){
			$document = Document::model()->with('jva','docType','jva.jvaColIk','jva.jvaColMemmel','documentvalues','jva.jvaColLoehne','jva.jvaColWitte')->findAll('(contact_person=:searchTerm OR jvaName=:searchTerm OR value1=:searchTerm OR value2=:searchTerm OR value3=:searchTerm OR value4=:searchTerm OR value5=:searchTerm OR value6=:searchTerm OR value7=:searchTerm OR value8=:searchTerm  OR value9=:searchTerm  OR value10=:searchTerm  OR value11=:searchTerm  OR value12=:searchTerm OR counter=:searchTerm) AND docTypeName=:docType', array(':searchTerm'=>"%$searchTerm%",':docType'=>$this->docType));	
		}else if(!isset($this->jvaName)&& !isset($docType) && isset($startDate) && isset($endDate)){
			$document = Document::model()->with('jva','docType','jva.jvaColIk','jva.jvaColMemmel','documentvalues','jva.jvaColLoehne','jva.jvaColWitte')->findAll('timestamp>:startDate AND timestamp <:endDate  AND(contact_person=:searchTerm OR  value1=:searchTerm OR value2=:searchTerm OR value3=:searchTerm OR value4=:searchTerm OR value5=:searchTerm OR value6=:searchTerm OR value7=:searchTerm OR value8=:searchTerm  OR value9=:searchTerm  OR value10=:searchTerm  OR value11=:searchTerm  OR value12=:searchTerm OR counter=:searchTerm)', array(':searchTerm'=>"%$searchTerm%",':startDate'=>$this->startDate,'endDate'=>$this->endDate));
		}else if(!isset($this->jvaName)&& isset($docType) && isset($startDate) && isset($endDate)){
			$document = Document::model()->with('jva','docType','jva.jvaColIk','jva.jvaColMemmel','documentvalues','jva.jvaColLoehne','jva.jvaColWitte')->findAll('timestamp>:startDate AND timestamp <:endDate  AND docTypeName=:docType AND (contact_person=:searchTerm OR  value1=:searchTerm OR value2=:searchTerm OR value3=:searchTerm OR value4=:searchTerm OR value5=:searchTerm OR value6=:searchTerm OR value7=:searchTerm OR value8=:searchTerm  OR value9=:searchTerm  OR value10=:searchTerm  OR value11=:searchTerm  OR value12=:searchTerm OR counter=:searchTerm)', array(':searchTerm'=>"%$searchTerm%",':docType'=>$this->docType,':startDate'=>$this->startDate,'endDate'=>$this->endDate));
		}else if(isset($this->jvaName)&& isset($docType) && !isset($startDate) && !isset($endDate)){
			$document = Document::model()->with('jva','docType','jva.jvaColIk','jva.jvaColMemmel','documentvalues','jva.jvaColLoehne','jva.jvaColWitte')->findAll('jvaName=:jvaName AND docTypeName=:docType AND(contact_person=:searchTerm OR  value1=:searchTerm OR value2=:searchTerm OR value3=:searchTerm OR value4=:searchTerm OR value5=:searchTerm OR value6=:searchTerm OR value7=:searchTerm OR value8=:searchTerm  OR value9=:searchTerm  OR value10=:searchTerm  OR value11=:searchTerm  OR value12=:searchTerm OR counter=:searchTerm)', array(':searchTerm'=>"%$searchTerm%",':docType'=>$this->docType,':jvaName'=>$this->jvaName));
		}else if(isset($this->jvaName)&& isset($docType) && isset($startDate) && isset($endDate)){
			$document = Document::model()->with('jva','docType','jva.jvaColIk','jva.jvaColMemmel','documentvalues','jva.jvaColLoehne','jva.jvaColWitte')->findAll('timestamp>:startDate AND timestamp <:endDate  AND(contact_person=:searchTerm OR  value1=:searchTerm OR value2=:searchTerm OR value3=:searchTerm OR value4=:searchTerm OR value5=:searchTerm OR value6=:searchTerm OR value7=:searchTerm OR value8=:searchTerm  OR value9=:searchTerm  OR value10=:searchTerm  OR value11=:searchTerm  OR value12=:searchTerm OR counter=:searchTerm)', array(':searchTerm'=>"%$searchTerm%",':startDate'=>$this->startDate,'endDate'=>$this->endDate,':docType'=>$this->docType,':jvaName'=>$this->jvaName));
		}else{
			$document = Document::model()->with('jva','docType','jva.jvaColIk','jva.jvaColMemmel','documentvalues','jva.jvaColLoehne','jva.jvaColWitte')->findAll('contact_person=:searchTerm OR jvaName=:searchTerm OR value1=:searchTerm OR value2=:searchTerm OR value3=:searchTerm OR value4=:searchTerm OR value5=:searchTerm OR value6=:searchTerm OR value7=:searchTerm OR value8=:searchTerm  OR value9=:searchTerm  OR value10=:searchTerm  OR value11=:searchTerm  OR value12=:searchTerm OR counter=:searchTerm', array(':searchTerm'=>"%$searchTerm%"));
		}
		return $document;
		
	}
	
	public function searchWithoutFilter(){
		$searchTerm = $this->freeSearchTerm ;
		
		$document = Document::model()->with('jva','docType','jva.jvaColIk','jva.jvaColMemmel','documentvalues','jva.jvaColLoehne','jva.jvaColWitte')->findAll('contact_person=:searchTerm OR jvaName=:searchTerm OR value1=:searchTerm OR value2=:searchTerm OR value3=:searchTerm OR value4=:searchTerm OR value5=:searchTerm OR value6=:searchTerm OR value7=:searchTerm OR value8=:searchTerm  OR value9=:searchTerm  OR value10=:searchTerm  OR value11=:searchTerm  OR value12=:searchTerm OR counter=:searchTerm', array(':searchTerm'=>$searchTerm));
			
		return $document;
		
	}

	
}