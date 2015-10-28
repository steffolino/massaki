<?php
class SearchFormModel extends CFormModel
{
   public $freeSearchTerm;

   public $jvaName;
   public $docType;
   public $dateRange;
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

	
}