<?php
	$baseUrl = Yii::app()->baseUrl; 
	$cs = Yii::app()->getClientScript();
	// $cs->registerScriptFile($baseUrl.'/js/handsontable-master/dist/handsontable.full.js');
	// $cs->registerCssFile($baseUrl.'/js/handsontable-master/dist/handsontable.full.css');
	// $cs->registerScriptFile($baseUrl.'/js/handsontable-master/dist/moment/moment.js');
	// $cs->registerScriptFile($baseUrl.'/js/handsontable-master/lib/numeral/languages.js');
	$cs->registerScriptFile($baseUrl."/js/hot-essential/handsontable.full.js");
	$cs->registerCssFile($baseUrl."/js/hot-essential/handsontable.full.min.css");
	$cs->registerScriptFile($baseUrl."/js/hot-essential/de.js");
	$cs->registerScriptFile($baseUrl.'/js/handsontable-master/dist/handsontable-ruleJS/src/handsontable.formula.js');
	$cs->registerScriptFile($baseUrl.'/js/handsontable-master/lib/numeral/numeral.js');
	$cs->registerScriptFile($baseUrl.'/js/handsontable-master/lib/ruleJS/dist/full/ruleJS.all.full.js');
?>

<script>
var hot;
var G_HOT_INIT = 0;
</script>

<style>
.invoiceExtra, .creditNoteExtra, .deliveryNoticeExtra {
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>


<!--ALERTS -->
<div class="row col-md-9 col-md-offset-1" style="position:fixed; z-index:500; top:50px;">
	<div id="successAlert" class="col-md-11 col-md-offset-0 alert alert-success" style="display:none; text-align:center;">
		<button type="button" class="customClose" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 style="margin-top: 10px; margin-bottom:10px;" id="successAlertContent"></h4>
	</div>
</div>
<div class="row col-md-10 col-md-offset-1" style="position:fixed; z-index:500; top:50px;">
	<div id="errorAlert" class="col-md-12 col-md-offset-0 alert alert-danger" style="display:none; text-align:center;">
		<button type="button" class="customClose" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 style="margin-top:10px; margin-bottom:10px;" id="errorAlertContent"></h4>
	</div>
</div>

<!-- INFO BAR -->
<div id="infoBarContainer" class="row col-md-3 col-md-offset-9" style="position:fixed; z-index:1111; bottom: 440px; display:none;">
	<div class="alert alert-success well-sm" style="box-shadow: 5px 5px 10px #888888;">
		<span id="infoBar">Einen Moment bitte ...</span>
	</div>
</div>

<!-- MAIN -->
<div class=row>
		<div class="col-md-12 panel panel-primary">
				<div class="row panel-heading">
					<form id="docMeta">
						<div class="col-md-3">
							<label>JVA Name:<br/>
							<?php
							$this->widget(
								'booster.widgets.TbSelect2',
									array(
										'asDropDownList' => false,
										'name' => 'jvaName',
										'id' => 'jvaName',
										'options' => array(
											'width' => '260px',
											'minimumInputLength'=>'4',
											'placeholder' => 'JVA Name',
											'ajax'       => array(
														'url'       => Yii::app()->controller->createUrl('jva/getJvaAsJson'),
														'delay' => 300,
														'dataType'  => 'json',
														'data'      => 	'js:function(term, page) { return {jvaSearchTerm: term, page: page}; }',
														'results'	=>  'js:function (data) {
															return {
																results: $.map(data, function (item) {
																	return {
																		text: item.jvaName + " | " + item.jvaNameExt,
																		value: item.jvaDataId,
																		id: item.jvaDataId
																	}
																})
															};
														}'
												),
												'events' => array(
													'select' => 'js:function () { console.log(item); }'
												),
										),
									)
							);
							?>
							</label>
						</div>
						<div class="col-md-5 col-md-offset-1">
							<label>Dokument Typ:
									<div id="docSelection">
										<form >
													<div class="btn-group btn-group-sm" role=group>
														<button type="button" class="btn btn-default" id="newInvoiceRadio">Rechnung</button>
														<button type="button" class="btn btn-default" id="newCollectiveInvoiceRadio">Sammelrechnung</button>
														<button type="button" class="btn btn-default" id="newDeliveryNoticeRadio">Lieferschein</button>
														<button type="button" class="btn btn-default" id="newCreditNoteRadio">Gutschrift</button>
													</div>
										</form>
									</div>
							</label>
						</div>
						<div class="col-md-2 ">
								 <div class="input-group input-group-sm">
								  <label for="Nummernkreis">Nummernkreis</label>
								  <select class="form-control" placeholder="--Nummernkreis--" id="nummernkreisSelect">
									<option disabled selected value=''>-- Nummernkreis --</option>
									<option value='ik'>IK</option>
									<option value='memmel'>Logistik Memmelsdorf</option>
									<option value='loehne'>Logistik Loehne</option>
									<option value='witte'>Wittekindshof</option>
									<option value='ek'>EK</option>
								  </select>
								</div>
						</div>
					</div>
				
				</form>
					<div id="docContentEmpty" class="row panel-body panel-body-exclusive">
							<h4 style="text-align: center">Bitte w&auml;hlen Sie einen <b>JVA-Namen</b>, einen <b>Dokumenten-Typ</b> und einen <b>Nummernkreis</b>.</h4>
							<!--embed id='pdfFilePath' src="http://localhost:8888/massaki/rechnungstool/pdf/temp/JVAElPalmar_Rechnung_20160112_002446.pdf" width="510px" height="590px"-->
					</div>
					<div id="docContentInvoice" class="row panel-body panel-body-exclusive">
						<?php $this->renderPartial('_invoice'); ?>
					</div>
					<div id="docContentCollectiveInvoice" class="row panel-body panel-body-exclusive">
						<?php $this->renderPartial('_collectiveInvoice'); ?>
					</div>
					<div id="docContentDeliveryNotice" class="row panel-body panel-body-exclusive">
						<?php $this->renderPartial('_deliveryNotice'); ?>
					</div>
					<div id="docContentCreditNote" class="row panel-body panel-body-exclusive">
						<?php $this->renderPartial('_creditNote'); ?>
					</div>
					<div class="row panel-footer">
							<div class="row">
								<div class="col-md-4 col-md-offset-8">
									<div class="btn-group btn-group btn-group-justified" id="previewCancelGroup" role="group" aria-label="JVA Liste bearbeiten">
										<a role=button class="btn btn-danger"><i class="fa fa-close"id="cancelDoc"> Abbrechen</i></a>
										<a role=button class="btn btn-success"><i class="fa fa-check" id="writingDoc"> Vorschau</i></a>
									</div>
								</div>
							</div>
					</div>
		</div>
</div>
<div class="modal " id="previewModal">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<h4 class="modal-title">Vorschau</h4>
	  </div>
	  <div class="modal-body">
		<embed id="pdfFilePath" src="" width="550px" height="480px">
	  </div>
	  <div class="modal-footer">
		<div class="alert alert-info col-md-7" style="font-size: 14px; padding:12px;">
			<p>Dieses Dokument sollte <span id="printAmountLabel"></span> mal gedruckt werden.</p>
			<input type="checkbox"  id="printed" > Schon gedruckt?<br>
		</div>
		<button id="deleteButton" type="button" class="btn btn-default" data-dismiss="modal">Abbrechen</button>
		<a id="saveButton" type="submit" class="btn btn-primary">Speichern</a>
		<input id="counterType" type=hidden />
	  </div>
	</div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal " id="previewModalCollect">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<h4 class="modal-title">Vorschau</h4>
	  </div>
	  <div class="modal-body">
		<embed id="pdfFilePathCollect" src="" width="550px" height="480px">
	  </div>
	  <div class="modal-footer">
		<div class="alert alert-info col-md-7" style="font-size: 14px; padding:12px;">
			<input type="checkbox"  id="printedCollect" > Schon gedruckt?<br>
			<!--p>Dieses Dokument sollte <div id="printAmountLabelCollect"></div> mal gedruckt werden.</p-->
		 </div>
		<button id="deleteButtonCollect" type="button" class="btn btn-default" data-dismiss="modal">Abbrechen</button>
		<a id="saveButtonCollect" type="submit" class="btn btn-primary">Speichern</a>
		<input id="counterTypeCollect" type=hidden />
		<input id="collectiveId" type=hidden />
	  </div>
	</div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
<script>

	// $(document).on('hide.bs.modal','#previewModal', function () {
		// console.log("hiding modal");
		// var filePath = $("#pdfFilePath").attr('src');
		// console.log("filePath:" + filePath);
		// $.ajax({
			// method: "POST",
			// type: "json",
			// url: "index.php?r=document/deleteThatPdf",
			// data: { 
				// filePath: filePath,
			// },
			// })
		// .done(function(data) {
			// setTimeout(function() {
				// $("#previewModal").modal("hide");
				// showCancelMessage(data);
			// }, 500);
		// });
	// });
	
	// $(document).on("click", ".modal-backdrop in", function (e) {
		// e.preventDefault();
	// })

	$(document).ajaxStart(function () {
		$("#infoBarContainer").show();
	});

	$(document).ajaxComplete(function () {
		setTimeout(function () {
			$("#infoBarContainer").hide();
		}, 500);
	});

	$(document).on("click", ".customClose", function (e) {
		console.log("closing");
		e.preventDefault();
		parent = $(this).closest('.alert');
		parent.slideUp('fast');
	});
		
	$(document).on("click", "#deleteButton", function() {
		var filePath = $("#pdfFilePath").attr('src');
		var counterType = $("#counterType").val();
		console.log("filePath:" + filePath);
		if(typeof(filePath) !== 'undefined' && typeof(counterType) !== 'undefined') {
			$.ajax({
				method: "POST",
				type: "json",
				url: "index.php?r=document/deleteThatPdf",
				data: { 
					filePath: filePath,
					counterType: counterType
				},
				})
			.done(function(data) {
				setTimeout(function() {
					$("#previewModal").modal("hide");
					showCancelMessage(data);
				}, 500);
			});
		} else {
			alert("Es ist ein Fehler beim Löschen aufgetreten");
		}
	});
		$(document).on("click", "#deleteButtonCollect", function() {
		var filePath = $("#pdfFilePathCollect").attr('src');
		var counterType = $("#counterTypeCollect").val();
		var collId = $("#collectiveId").val();
		console.log("filePath:" + filePath);
		if(typeof(filePath) !== 'undefined' && typeof(counterType) !== 'undefined') {
			$.ajax({
				method: "POST",
				type: "json",
				url: "index.php?r=document/deleteThatPdf",
				data: { 
					filePath: filePath,
					counterType: counterType,
					docType: "Sammelrechnung",
					collId: collId,
				},
				})
			.done(function(data) {
				setTimeout(function() {
					$("#previewModalCollect").modal("hide");
					showCancelMessage(data);
				}, 500);
			});
		} else {
			alert("Es ist ein Fehler beim Löschen aufgetreten");
		}
	});
	$(document).on("click", "#saveButton", function() {
		var filePath = $("#pdfFilePath").attr('src');
		console.log("filePath:" + filePath);
		$.ajax({
			method: "POST",
			type: "json",
			url: "index.php?r=document/saveThatPdf",
			data: { 
				filePath: filePath,
			},
			})
		.success(function(data) {
			setTimeout(function() {
				$("#previewModal").modal("hide");
				showSaveSuccessAlert(data);
			}, 500);
		})
		.error(function(data) {
			setTimeout(function() {
				$("#previewModal").modal("hide");
				showSaveErrorAlert(data);
			}, 500);
		});
	});
	$(document).on("click", "#saveButtonCollect", function() {
		var filePath = $("#pdfFilePathCollect").attr('src');
		console.log("filePath:" + filePath);
		$.ajax({
			method: "POST",
			type: "json",
			url: "index.php?r=document/saveThatPdf",
			data: { 
				filePath: filePath,
				docType:"Sammelrechnung",
			},
			})
		.success(function(data) {
			setTimeout(function() {
				$("#previewModalCollect").modal("hide");
				showSaveSuccessAlert(data);
				readyWhenYouAre();
				
			}, 500);
		})
		.error(function(data) {
			setTimeout(function() {
				$("#previewModalCollect").modal("hide");
				showSaveErrorAlert(data);
			}, 500);
		});
	});
	
	function showCancelMessage (data) {
		$("#successAlertContent").html("Entwurf wurde verworfen.");
		$("#successAlert").slideDown('fast');
	}

	function showSaveSuccessAlert (filePath) {
		$("#successAlertContent").html("PDF wurde gespeichert unter " + filePath);
		$("#successAlert").slideDown('fast');
	}

	function showSaveErrorAlert (errorCode) {
		$("#errorAlertContent").html("Es ist ein Fehler beim Speichern aufgetreten: " + errorCode + "<br/> Bitte versuchen Sie es erneut.");
		$("#errorAlert").slideDown('fast');
	}
	
	$(document).ready(function () {
		$('#previewModal').modal({backdrop: 'static', keyboard: false});
		$("#previewModal").modal("hide");
		$(".panel-body-exclusive").hide();
		$("#previewCancelGroup").hide('fast');
		$("#docContentEmpty").show();
	});

	/***
	** !!! TODO: fixed!
	** CHANGING docSelection shows handsontable every time --> changing nummernkreis & jvaName does not	
	**/
	$(document).on("select2-selecting", "#jvaName", function(e) {
		setTimeout(function () {

			var radio = "";
			$("#docSelection .btn").each(function() {
				if($(this).hasClass('active')) {
					radio = "#"+$(this).attr('id');
				}
			});

			var nameSet = $("#select2-chosen-1").text();
			if (nameSet.indexOf('Wittekindshof') !== -1) {
				console.log("we have a witte");
				doTheWitte();
			}
			if(readyWhenYouAre()) {	
				//MAGIIIIIIC!!!!!! --> doesnt work
				// $("#docContentInvoice").load(location.href+" #docContentInvoice>*","");
				// $("#docContentCollectiveInvoice").load(location.href+" #docContentCollectiveInvoice>*","");
				// $("#docContentDeliveryNotice").load(location.href+" #docContentDeliveryNotice>*","");
				// $("#docContentCreditNote").load(location.href+" #docContentCreditNote>*","");
				if(hot  && radio.indexOf("Collective") === -1) {
					hot.destroy();
				}
				showCorrectDocContent();
			}
		}, 500);
	});
	
	function doTheWitte() {
		$("#nummernkreisSelect").val('witte');
	}

	$(document).on("change", "#nummernkreisSelect", function () {
			console.log("changed event");
			
			setTimeout(function () {

				var radio = "";
				$("#docSelection .btn").each(function() {
					if($(this).hasClass('active')) {
						radio = "#"+$(this).attr('id');
					}
				});				

				if(readyWhenYouAre()) {	
					//MAGIIIIIIC!!!!!! --> doesnt work
					// $("#docContentInvoice").load(location.href+" #docContentInvoice>*","");
					// $("#docContentCollectiveInvoice").load(location.href+" #docContentCollectiveInvoice>*","");
					// $("#docContentDeliveryNotice").load(location.href+" #docContentDeliveryNotice>*","");
					// $("#docContentCreditNote").load(location.href+" #docContentCreditNote>*","");
					if(hot  && radio.indexOf("Collective") === -1) {
						hot.destroy();
					}
					showCorrectDocContent();
				}
			}, 500);
	});
	
	$(document).on("click", "#docSelection .btn-group .btn", function () {

			$(this).addClass('active');
			$(this).siblings('.btn').removeClass('active');
			setTimeout(function () {
				if(readyWhenYouAre()) {
					//hot instance does exist?
					if(hot) {
						//hot instance has not been destroyed already?
						// --> switch between sammelrechnung and rechnung/gutschrift/lieferschein
						if(hot.rootElement !== null) {
							hot.destroy();
						}
					}
					console.log("after");
					showCorrectDocContent();
				}
			}, 500);
	});

	$(document).on("mouseenter", "#docSelection .btn-group .btn", function () {
			$(this).addClass('btn-primary');
	});

	$(document).on("mouseleave", "#docSelection .btn-group .btn", function () {
			$(this).removeClass('btn-primary');
	});
	
	function readyWhenYouAre() {
		var nameSet = $("#select2-chosen-1").text();
		var nrKreisSet = $("#nummernkreisSelect").val();
		var docTypeSet = false;

		$("#docSelection .btn").each(function() {
			if($(this).hasClass('active')) {
				docTypeSet = true;
				buttonPressed = $(this).text();
			}
		});
		// console.log("nameSet + nameSet.length + nrKreisSet + docTypeSet: " + nameSet + " ; " + nameSet.length + " ; " + nrKreisSet + " ; " + docTypeSet);

		if((nameSet !== "JVA Name" && nameSet !== "" && nameSet.length > 3) && nrKreisSet !== null && docTypeSet === true) {
			console.log("readyTogo: "+nameSet + " " + nrKreisSet + " " + docTypeSet);
			$.ajax({
				method: "POST",
				type: "json",
				url: "index.php?r=document/loadTableData",
				data: { 
					docType: buttonPressed,				
					jva: nameSet,
					colConfig : nrKreisSet,
				}
			})
			.done(function(data) {
				//alert(data);
				
				var dataArr;
				switch(buttonPressed){
					case "Rechnung":
					dataArr = jQuery.parseJSON(data);
					$('#printAmountLabel').text(dataArr.printAmount);
						loadInvoiceData(dataArr.dataVal, buttonPressed);
						// console.log("dataButton: "+data + " " + buttonPressed);
						//alert("data Loaded");
						break;
					case "Sammelrechnung":
						//loadInvoiceData(JSON.parse(data,buttonPressed));
						//$('#printAmountLabel').text(trim(dataArr.printAmount));
						loadCollectiveData(data);
						// console.log("dataButton: "+data + " " + buttonPressed);
						break;
					case "Lieferschein":
						dataArr = jQuery.parseJSON(data);
						$('#printAmountLabel').text(dataArr.printAmount);
						loadInvoiceData(dataArr.dataVal, buttonPressed);
						// console.log("dataButton: "+data + " " + buttonPressed);
						break;
					case "Gutschrift":
						dataArr = jQuery.parseJSON(data);
						$('#printAmountLabel').text(dataArr.printAmount);
						loadInvoiceData(dataArr.dataVal, buttonPressed);
						// console.log("dataButton: "+data + " " + buttonPressed);
						break;
					default:
						break;
				}
		
		  });
			return true;
		} else {
			console.log("nono: "+nameSet + " " + nrKreisSet + " " + docTypeSet);
			return false;
		}
	}
		
	function showCorrectDocContent(){
		var radio = "empty";
		
		$("#docSelection .btn").each(function() {
			if($(this).hasClass('active')) {
				radio = "#"+$(this).attr('id');
			}
		});
		// console.log(radio);
		switch(radio){
			case "empty":
				$("#previewCancelGroup").hide('fast');
				$("#docContentEmpty").siblings('.panel-body-exclusive').hide();
				$("#docContentEmpty").show();
				break;
			case "#newInvoiceRadio":
				$("#previewCancelGroup").show('fast');
				$("#docContentInvoice").siblings('.panel-body-exclusive').hide();
				$("#docContentInvoice").show();
				break;
			case "#newCollectiveInvoiceRadio":
				$("#previewCancelGroup").hide('fast');
				$("#docContentCollectiveInvoice").siblings('.panel-body-exclusive').hide();
				$("#docContentCollectiveInvoice").show();
				break;
			case "#newDeliveryNoticeRadio":
				$("#previewCancelGroup").show('fast');
				$("#docContentDeliveryNotice").siblings('.panel-body-exclusive').hide();
				$("#docContentDeliveryNotice").show();
				break;
			case "#newCreditNoteRadio":
				$("#previewCancelGroup").show('fast');
				$("#docContentCreditNote").siblings('.panel-body-exclusive').hide();
				$("#docContentCreditNote").show();
				break;
			default:
				$("#previewCancelGroup").hide('fast');
				$("#docContentEmpty").siblings('.panel-body-exclusive').hide();
				$("#docContentEmpty").show();
				break;
		}
		
	}
	
	
	function loadCollectiveData(data){
		//alert(data);
		$('#docContentCollectiveInvoice').html(data);
	}
	
	
	function loadInvoiceData(data, docType){
		console.log("data: " + data + " docType: " + docType);
		// console.log("document ready");
		var header = data[0];
		var displayData = data[1];
		var headerLength = header.length;
		var displayLength = displayData.length;
		
		console.log("displayData: " + displayData);
		console.log("displayData Lenght: " + displayData.length);
		console.log("header Lenght: " + headerLength);
		

		//Strings need to be converted to floats
		for (var i=0; i < displayLength; i++) {
			for(var j = 0; j<headerLength; j++) {
				//last six columns = mwst vals // need index 5,6,7
				if((headerLength - j < 7) && (headerLength - j > 3)) {
					console.log("doing index : " + j);
					displayData[i][j] = displayData[i][j].replace(",", ".");
					// displayData[i][j] = parseFloat(displayData[i][j]);
				}
			}
		}
		// $.each(displayData, (function (index, val) {
			// console.log(index + " " + val);
		// }));
		
		if(jQuery.isEmptyObject(displayData)) {
			switch(headerLength){
					case 0:
						displayData = [[""],[""]];
						break;
					case 1:
						displayData = [[""]];
						break;
					case 2:
						displayData = [["",""]];
						break;
					case 3:
						displayData = [["","",""]] 	;
						break;
					case 4:
						displayData = [
													["","","",""]
												];
						break;
					case 5:
						displayData = [["","","","",""]];
						break;
					case 6:
						displayData = [["","","","","",""]];
						break;
					case 7:
						displayData = [["","","","","","",""]];
						break;
					case 8:
						displayData = [["","","","","","","",""]];
						break;
					case 9:
						displayData = [["","","","","","","","",""]];
						break;
					case 10:
						displayData = [["","","","","","","","","",""]];
						break;
					case 11:
						displayData = [["","","","","","","","","","",""]];
						break;
					case 12:
						displayData = [["","","","","","","","","","","",""]];
						break;
					default:
						displayData = [[""]];						
						break;
			//DisplayData exists
			//need to clean "gesamt-row" for its generated automatically
			//UPDATE: cleaned before via PHP
			} 
		} 
		
		var container;
		console.log("buttonSwitch: " + buttonPressed);

		switch(buttonPressed){
					case "Rechnung":
						 container = document.getElementById('InvoiceExample');
						 initHandson(container, displayData, header);
						break;
					case "Sammelrechnung":
						 container = document.getElementById('CollectiveInvoiceExample');
						break;
					case "Lieferschein":
						 container = document.getElementById('DeliveryNoticeExample');
						 initHandson(container, displayData, header);
						 break;
					case "Gutschrift":
						container = document.getElementById('CreditNoteExample');
						 initHandson(container, displayData, header);
						 break;
					default:
						break;
					
		}
	}
	
	function initHandson(container, displayData, header) {
				
		hot = new Handsontable(container, {
		  data: displayData,
		  // language: 'de',
		  // minSpareRows: 1,
		  allowInvalid: true,
		  formulas: true,
		  rowHeaders: true,
		  colHeaders: header,
		  manualColumnResize: true,
		  manualRowMove: true,
		  colWidths: [120, 120, 120, 120, 75, 85, 85, 85, 85, 85, 85],
		  contextMenu: true,
		});
		
		var plugin = hot.getPlugin('autoRowSize');
		var plugin2 = hot.getPlugin('autoColumnSize');
		var lastVisRow = plugin.getLastVisibleRow();
		var lastVisCol = plugin2.getLastVisibleColumn();
		
		fakeValid = function (value, callback) {
			setTimeout(function(){
				callback(true);
			}, 750);
		};
		
		hot.updateSettings({
			cells: 
				function (row, col, prop) {						
					var cellProperties = {validator:fakeValid};
					//NOT LAST ROW, LAST 6 COLS
					if (row !== hot.countRows() && col > (lastVisCol - 6)) {
						cellProperties.type = 'numeric';
						cellProperties.format = '0,0.00';
						cellProperties.language = 'de';
						cellProperties.editor = Autocomplete2Editor;
						// cellProperties.format = '00.00€';
						// cellProperties.setValue = '123.45';
						// cellProperties.readOnly = true;
					}
					// LAST ROW, NOT LAST 3 COLS
					if(row == hot.countRows() && col < (lastVisCol - 3)){
						cellProperties.validator = fakeValid;
					}
					// LAST ROW, LAST 3 COLS
					if(row == hot.countRows() && col > (lastVisCol - 3)){
						cellProperties.validator = fakeValid;
						// cellProperties.renderer = totalRenderer;
						// cellProperties.format = '000.00';
						// cellProperties.type = 'formula';
					}
					// console.log(cellProperties);
					return cellProperties;
				}
			}
		);

	// Autocomplete2Editor Start
	  var Autocomplete2Editor = Handsontable.editors.HandsontableEditor.prototype.extend();

	Autocomplete2Editor.prototype.init = function () {
		Handsontable.editors.HandsontableEditor.prototype.init.apply(this, arguments);
	  };

	  Autocomplete2Editor.prototype.createElements = function() {
		Handsontable.editors.HandsontableEditor.prototype.createElements.apply(this, arguments);
	  };

	  Autocomplete2Editor.prototype.allowKeyEventPropagation = function(keyCode) {
		  return true;
	  };
	  
	  // var skipOne = false;
	  function onBeforeKeyDown(event) {
		// skipOne = false;
		var editor = this.getActiveEditor();
		var KEY_CODES = Handsontable.helper.KEY_CODES;
		if (Handsontable.helper.isPrintableChar(event.keyCode) || event.keyCode === KEY_CODES.BACKSPACE ||
		  event.keyCode === KEY_CODES.DELETE || event.keyCode === KEY_CODES.INSERT) {
			  console.log("trigga");
		}
		if((event.keyCode === KEY_CODES.ENTER) && (event.keyCode === KEY_CODES.SHIFT)) {
		  console.log("sth");
		  // var timeOffset = 0;
		}
		  // on ctl+c / cmd+c don't update suggestion list
		  if ((event.keyCode === KEY_CODES.ENTER) && (event.shiftKey)) {
		  // if (event.ctrlKey && event.Enter) {
			console.log("ctrlEnter");
			insertNewRows();
			return;
		  }
		  // if (!editor.isOpened()) {
			// timeOffset += 10;
		  // }

		  // if (editor.htEditor) {
			// editor.instance._registerTimeout(setTimeout(function() {
			  // console.log(editor.TEXTAREA.value);
			  // skipOne = true;
			// }, timeOffset));
		  // }
		// }
	  }

	  Autocomplete2Editor.prototype.prepare = function() {
		this.instance.addHook('beforeKeyDown', onBeforeKeyDown);
		Handsontable.editors.HandsontableEditor.prototype.prepare.apply(this, arguments);
	  };
	  
	  Autocomplete2Editor.prototype.close = function() {
		Handsontable.editors.HandsontableEditor.prototype.close.apply(this, arguments);
	  };
	  
	  Autocomplete2Editor.prototype.finishEditing = function(restoreOriginalValue) {
		if (!restoreOriginalValue) {
		  this.instance.removeHook('beforeKeyDown', onBeforeKeyDown);
		}
		var editor = hot.getActiveEditor();
		var valuu = editor.TEXTAREA.value;
		if(valuu.indexOf(',') <= -1) {
			console.log("got the comma");
			valuu = valuu.replace(" ", "");
			valuu = valuu.replace(",", ".");
			console.log(valuu);
			valuu = parseFloat(parseFloat(editor.TEXTAREA.value) * 0.01).toFixed(2);
			console.log(valuu);
			editor.TEXTAREA.value = valuu;
		}
		Handsontable.editors.HandsontableEditor.prototype.finishEditing.apply(this, arguments);
	  };

	var headerLength = header.length;
	createRowCallback();
	Handsontable.hooks.add('afterCreateRow', createRowCallback, hot);
	Handsontable.hooks.add('afterRemoveRow', removeRowCallback, hot);

	function removeRowCallback () {
			var plugin = hot.getPlugin('autoRowSize');
			var plugin2 = hot.getPlugin('autoColumnSize');
			var lastVisRow = plugin.getLastVisibleRow();
			var lastVisCol = plugin2.getLastVisibleColumn();
			var headerLength = lastVisCol;
			var a = 97;
			var charArray = {};
			for (var i = 0; i<26; i++) {
				charArray[i] = String.fromCharCode(a + i);
			}
			hot.setDataAtCell(parseInt(lastVisRow-1), 0, 'Gesamt:');
			hot.setDataAtCell(parseInt(lastVisRow-1), headerLength, '=SUM('+charArray[headerLength]+'1:'+charArray[headerLength]+parseInt(hot.countRows()-1)+')');
			hot.setDataAtCell(parseInt(lastVisRow-1), headerLength-1, '=SUM('+charArray[headerLength-1]+'1:'+charArray[headerLength-1]+parseInt(hot.countRows()-1)+')');
			hot.setDataAtCell(parseInt(lastVisRow-1), headerLength-2, '=SUM('+charArray[headerLength-2]+'1:'+charArray[headerLength-2]+parseInt(hot.countRows()-1)+')');
			hot.setCellMeta (parseInt(lastVisRow-1), 0, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow-1), headerLength, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow-1), headerLength-1, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow-1), headerLength-2, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow-1), headerLength-3, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow-1), headerLength-4, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow-1), headerLength-5, 'readOnly', true);
	}
	
	function createRowCallback () {
			var plugin = hot.getPlugin('autoRowSize');
			var plugin2 = hot.getPlugin('autoColumnSize');
			var lastVisRow = plugin.getLastVisibleRow();
			var lastVisCol = plugin2.getLastVisibleColumn();
			var headerLength = lastVisCol;
			// console.log("countRows: " + hot.countRows());
			// // console.log("lastRow: "+lastVisRow);
			// console.log("hL: " + headerLength);
			// console.log("lastVisROw: " + lastVisRow);
			var a = 97;
			var charArray = {};
			for (var i = 0; i<26; i++) {
				charArray[i] = String.fromCharCode(a + i);
			}
			for (var j = 0; j < parseInt(hot.countRows()); j++) {
					for (var k = 0; k < parseInt(hot.countCols()); k++) {
						//Found Gesamt but not in last Row
						hot.setCellMeta(j,k,'readOnly', false);
						//GESAMT
						if((hot.getDataAtCell(j,k) === 'Gesamt:' && j !== parseInt(hot.countRows() - 1))) {
							console.log("found wrong entry for Gesamt:  - deleting ...");
							var jDeletableRow = j;
						}
						if(j === jDeletableRow) {
							hot.setDataAtCell(j,k, '');
							hot.setDataAtCell(j+1,k, '');
						}
						if(G_HOT_INIT > 0) {
							if((parseInt(headerLength - k) > 2) && (parseInt(headerLength - k) < 6))  {  //&& (parseInt(j) !== lastVisRow)) {
								if(hot.getDataAtCell(parseInt(lastVisRow), headerLength-3) === null || hot.getDataAtCell(parseInt(lastVisRow), headerLength-3) === "") {
									hot.setDataAtCell(parseInt(lastVisRow), headerLength-3, '0.00');
									hot.setDataAtCell(parseInt(lastVisRow), headerLength-4, '0.00');
									hot.setDataAtCell(parseInt(lastVisRow), headerLength-5, '0.00');
									hot.setDataAtCell(parseInt(lastVisRow), headerLength-6, '0');
								} else {
									console.log("data at cell: " + hot.getDataAtCell(parseInt(lastVisRow), headerLength-3));
								}
							}
						}
						if((parseInt(headerLength - k) < 3))  {  //&& (parseInt(j) !== lastVisRow)) {
							hot.setDataAtCell(parseInt(j), k, '='+charArray[parseInt(headerLength-6)]+parseInt(j+1)+'*'+charArray[parseInt(k-3)]+parseInt(j+1));
						} 						
					}
			}
			// hot.setDataAtCell(parseInt(lastVisRow), 0, '');
			// hot.setDataAtCell(parseInt(lastVisRow), headerLength, '');
			// hot.setDataAtCell(parseInt(lastVisRow), headerLength-1, '');
			// hot.setDataAtCell(parseInt(lastVisRow), headerLength-2, '=SUM('+charArray[headerLength-2]+'1:'+charArray[headerLength-2]+parseInt(hot.countRows()-1)+')');
			hot.setDataAtCell(parseInt(lastVisRow+1), 0, 'Gesamt:');
			hot.setDataAtCell(parseInt(lastVisRow+1), headerLength, '=SUM('+charArray[headerLength]+'1:'+charArray[headerLength]+parseInt(hot.countRows()-1)+')');
			hot.setDataAtCell(parseInt(lastVisRow+1), headerLength-1, '=SUM('+charArray[headerLength-1]+'1:'+charArray[headerLength-1]+parseInt(hot.countRows()-1)+')');
			hot.setDataAtCell(parseInt(lastVisRow+1), headerLength-2, '=SUM('+charArray[headerLength-2]+'1:'+charArray[headerLength-2]+parseInt(hot.countRows()-1)+')');
			hot.setCellMeta (parseInt(lastVisRow+1), 0, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow+1), headerLength, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow+1), headerLength-1, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow+1), headerLength-2, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow+1), headerLength-3, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow+1), headerLength-4, 'readOnly', true);
			hot.setCellMeta (parseInt(lastVisRow+1), headerLength-5, 'readOnly', true);
			G_HOT_INIT += 1;
			console.log("global hot: " + G_HOT_INIT);
			// hot.alter('insert_row', lastVisRow);
		}		
	}
	
	$(document).on("keypress", function (e) {
		if (e.keyCode == 13 && e.shiftKey) {
			// prevent default behavior
			e.preventDefault();
			insertNewRows();
		}
	});
	
	function insertNewRows () {
		for (var j = 0; j < parseInt(hot.countRows()); j++) {
			for (var k = 0; k < parseInt(hot.countCols()); k++) {
				hot.setCellMeta(j,k,'readOnly', false);
				if(hot.getDataAtCell(j,k) === 'Gesamt:') {
					var GesamtIndex = j - 1;
				}
			}
		}
		hot.alter('insert_row', GesamtIndex+1);
	}
	
</script>