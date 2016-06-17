<?php

class YearcounterImplementierung extends Yearcounter
{
	public function getYearCounterById($counterId){
		$YearCounter = YearCounter::model()->findByPK($counterId);
		return $YearCounter;
	}
	
	public function getYearFromYearCounter($counterId){
		$YearCounter = $this->getYearCounterById($counterId);
		$Year = $YearCounter->yearCounter;
		return $Year;
	}
	
	
}

?>