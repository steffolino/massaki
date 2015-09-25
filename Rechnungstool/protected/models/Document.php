<?php

/**
 * This is the model class for table "document".
 *
 * The followings are the available columns in table 'document':
 * @property integer $documentId
 * @property integer $counterTypeId
 * @property string $counter
 * @property integer $yearCounter
 * @property integer $jvaId
 * @property string $docType
 * @property string $pdf_location
 * @property string $contact_person
 * @property string $printed
 *
 * The followings are the available model relations:
 * @property Collectiveinvoice[] $collectiveinvoices
 * @property Countertype $counterType
 * @property Jvadata $jva
 * @property Documentvalues[] $documentvalues
 */
class Document extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'document';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('counterTypeId, counter, yearCounter, jvaId, docType', 'required'),
			array('counterTypeId, yearCounter, jvaId', 'numerical', 'integerOnly'=>true),
			array('counter, docType', 'length', 'max'=>45),
			array('pdf_location, contact_person', 'length', 'max'=>255),
			array('printed', 'length', 'max'=>1),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('documentId, counterTypeId, counter, yearCounter, jvaId, docType, pdf_location, contact_person, printed', 'safe', 'on'=>'search'),
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
			'collectiveinvoices' => array(self::HAS_MANY, 'Collectiveinvoice', 'deliveryNoteId'),
			'counterType' => array(self::BELONGS_TO, 'Countertype', 'counterTypeId'),
			'jva' => array(self::BELONGS_TO, 'Jvadata', 'jvaId'),
			'documentvalues' => array(self::HAS_MANY, 'Documentvalues', 'documentId'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'documentId' => 'Document',
			'counterTypeId' => 'Counter Type',
			'counter' => 'Counter',
			'yearCounter' => 'Year Counter',
			'jvaId' => 'Jva',
			'docType' => 'Doc Type',
			'pdf_location' => 'Pdf Location',
			'contact_person' => 'Contact Person',
			'printed' => 'Printed',
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

		$criteria->compare('documentId',$this->documentId);
		$criteria->compare('counterTypeId',$this->counterTypeId);
		$criteria->compare('counter',$this->counter,true);
		$criteria->compare('yearCounter',$this->yearCounter);
		$criteria->compare('jvaId',$this->jvaId);
		$criteria->compare('docType',$this->docType,true);
		$criteria->compare('pdf_location',$this->pdf_location,true);
		$criteria->compare('contact_person',$this->contact_person,true);
		$criteria->compare('printed',$this->printed,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Document the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
