<?php
/***

ActiveRecord Class to represent JVAs

***/

class Jva_data extends CActiveRecord {

	//MUST HAVE
	public static function model($className=__CLASS__) {
			return parent::model($className);
		}

	public function relations()
    {
		
		//EXAMPLE: 'VarName'=>array('RelationsTyp', 'KlassenName', 'FremdSchlüssel', ...Zusätzliche Optionen)
        /*return array(
			'ownUserStories' => array(self::HAS_MANY, 'UserDescriptions', array('userID'=>'userID')),
			'contacts' => array(self::HAS_MANY, 'UserContacts', array('userID'=>'userID')),
        );
		*/
    }

}

?>