<?php


class CounterconfigImplementierung extends Counterconfig
{
	public function getCounterIdWithDocType($docTypeId){
		
		$counterTypeId = CounterConfig::model()->find(
				'docTypeId=:docTypeId',
				array(':docTypeId'=>$docTypeId)
			);
			if($counterTypeId !== NULL){
				return $counterTypeId->counterTypeId;
			}else{
				return NULL;
			}
		
		
	}
}
