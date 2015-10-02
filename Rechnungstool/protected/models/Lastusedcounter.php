<?php

/**
 * This is the model class for table "lastusedcounter".
 *
 * The followings are the available columns in table 'lastusedcounter':
 * @property integer $lastUsedCounterId
 * @property integer $lastUsedCounterTypeId
 * @property integer $lastUsedCounterStatus
 *
 * The followings are the available model relations:
 * @property Countertype $lastUsedCounterType
 */
class Lastusedcounter extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'lastusedcounter';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('lastUsedCounterTypeId, lastUsedCounterStatus', 'required'),
			array('lastUsedCounterTypeId, lastUsedCounterStatus', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('lastUsedCounterId, lastUsedCounterTypeId, lastUsedCounterStatus', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'lastUsedCounterType' => array(self::BELONGS_TO, 'Countertype', 'lastUsedCounterTypeId'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'lastUsedCounterId' => 'Last Used Counter',
			'lastUsedCounterTypeId' => 'Last Used Counter Type',
			'lastUsedCounterStatus' => 'Last Used Counter Status',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('lastUsedCounterId',$this->lastUsedCounterId);
		$criteria->compare('lastUsedCounterTypeId',$this->lastUsedCounterTypeId);
		$criteria->compare('lastUsedCounterStatus',$this->lastUsedCounterStatus);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Lastusedcounter the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}