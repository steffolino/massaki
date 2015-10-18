<?php

class LastusedcounterImplementierung extends Lastusedcounter
{
	public function getLastUsedCounterById($counterId){
		$lastUsedCounter = Lastusedcounter::model()->findByPK($counterId);
		return $lastUsedCounter;
	}
	
	public function incrementCounter($counterTypeId){
		$lastUsedCounter = $this-> getLastUsedCounterById($counterTypeId);
		$lastUsedCounter->lastUsedCounterStatus = $lastUsedCounter->lastUsedCounterStatus +1;
		$lastUsedCounter->save();
		
	}
}
