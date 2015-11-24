<script>
var hot;
</script>

<div class="row col-md-1 col-md-offset-11" style="position:fixed; z-index:6; bottom: 40px;">
	<div class="pull-right">
		<a id="scrollUpa" style="cursor:pointer; "><i alt="Scroll Top" class="fa fa-2x fa-angle-double-up"></i></a>
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
									<option value='ek'>EK</option>
									<option value='reg'>Normal</option>
									<option value='v'>V</option>
								  </select>
								</div>
						</div>
					</div>
				
				</form>
					<div id="docContentEmpty" class="row panel-body panel-body-exclusive">
							<h4 style="text-align: center">Bitte waehlen Sie einen <b>JVA-Namen</b>, einen <b>Dokumenten-Typ</b> und einen <b>Nummernkreis</b>.</h4>
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
									<div class="btn-group btn-group btn-group-justified" role="group" aria-label="JVA Liste bearbeiten">
										<a role=button class="btn btn-danger"><i class="fa fa-close"id="cancelDoc"> Abbrechen</i></a>
										<a role=button class="btn btn-success"><i class="fa fa-check" id="writingDoc"> Schreiben</i></a>
									</div>
								</div>
							</div>
					</div>
		</div>
</div>	
	
<script>
		
	
	
	$(document).ready(function () {
		$(".panel-body-exclusive").hide();
		$("#docContentEmpty").show();
	})
	
	$(document).on("change", "#jvaName, #nummernkreisSelect", function () {
			if(readyWhenYouAre()) {	
				showCorrectDocContent();
		}
	});
	
	$(document).on("click", "#docSelection .btn-group .btn", function () {
			$(this).addClass('active');
			$(this).siblings('.btn').removeClass('active');
			if(readyWhenYouAre()) {
				showCorrectDocContent();
			}
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
		if((nameSet !== "JVA Name" && nameSet !== "" && nameSet.length > 3) && nrKreisSet !== null && docTypeSet === true) {
			console.log("readyTogo: "+nameSet + " " + nrKreisSet + " " + docTypeSet);
			$.ajax({
				method: "POST",
				type: "json",
				url: "index.php?r=document/loadTableData",
				data: { 
					docType: buttonPressed,				
					jva: nameSet,
				}
			})
			.done(function(data) {
				//alert(data);
				switch(buttonPressed){
					case "Rechnung":
						loadInvoiceData(JSON.parse(data,buttonPressed));
						//alert("data Loaded");
						break;
					case "Sammelrechnung":
						loadInvoiceData(JSON.parse(data,buttonPressed));
						break;
					case "Lieferschein":
						loadInvoiceData(JSON.parse(data,buttonPressed));
						break;
					case "Gutschrift":
						loadInvoiceData(JSON.parse(data,buttonPressed));
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
				$("#docContentEmpty").siblings('.panel-body-exclusive').hide();
				$("#docContentEmpty").show();
				break;
			case "#newInvoiceRadio":
				$("#docContentInvoice").siblings('.panel-body-exclusive').hide();
				$("#docContentInvoice").show();
				break;
			case "#newCollectiveInvoiceRadio":
				$("#docContentCollectiveInvoice").siblings('.panel-body-exclusive').hide();
				$("#docContentCollectiveInvoice").show();
				break;
			case "#newDeliveryNoticeRadio":
				$("#docContentDeliveryNotice").siblings('.panel-body-exclusive').hide();
				$("#docContentDeliveryNotice").show();
				break;
			case "#newCreditNoteRadio":
				$("#docContentCreditNote").siblings('.panel-body-exclusive').hide();
				$("#docContentCreditNote").show();
				break;
			default:
				$("#docContentEmpty").siblings('.panel-body-exclusive').hide();
				$("#docContentEmpty").show();
				break;
		}
		
	}
	function loadInvoiceData(data,docType){
		
		// console.log("document ready");
		var header = data[0];
		var headerLength = header.length;
		console.log(headerLength);
		var displayData = data[1];
		if(jQuery.isEmptyObject(displayData)){
			switch(headerLength){
					case 0:
						displayData = [];
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
			}
			
		}
		
		
		var boldAndAlignRenderer = function (instance, td, row, col, prop, value, cellProperties) {
			Handsontable.renderers.TextRenderer.apply(this, arguments);
			td.style.fontWeight = 'bold';
			td.style.verticalAlign = 'middle';
			td.style.textAlign = 'center';
		};

		var container;
		switch(buttonPressed){
					case "Rechnung":
						 container = document.getElementById('InvoiceExample');
						break;
					case "Sammelrechnung":
						 container = document.getElementById('CollectiveInvoiceExample');
						break;
					case "Lieferschein":
						 container = document.getElementById('DeliveryExample');
						break;
					case "Gutschrift":
						container = document.getElementById('CreditExample');
						break;
					default:
						break;
					
		}
		
				
		if(!($(container).children().hasClass('ht_master handsontable'))){
						
			hot = new Handsontable(container, {
			  data: displayData,
			  // language: de,
			  // minSpareRows: 1,
			  formulas: true,
			  rowHeaders: true,
			  colHeaders: header,
			  manualColumnResize: true,
			  manualRowMove: true,
			  colWidths: [160, 160, 160, 160, 100, 100, 100],
			  contextMenu: true,
			}); 
			
			var diffRenderer = function (instance, td, row, col, prop, value, cellProperties) {
				Handsontable.cellTypes['formula'].renderer.apply(this, arguments);
				td.style.backgroundColor = '#c3f89c';
				td.style.fontWeight = 'bold';
			};
			 var totalRenderer = function(instance, td, row, col, prop, value, cellProperties) {
				Handsontable.renderers.TextRenderer.apply(this, arguments);
				// td.cellType = 'formula';
				td.style.fontWeight = 'bold';
				td.style.textAlign = 'right';
		  };
			
			var plugin = hot.getPlugin('autoRowSize');
			var plugin2 = hot.getPlugin('autoColumnSize');
			var lastVisRow = plugin.getLastVisibleRow();
			var lastVisCol = plugin2.getLastVisibleColumn();
			
			fakeValid = function (value, callback) {
				setTimeout(function(){
					callback(true);
				}, 1000);
			};
			
			hot.updateSettings({
				cells: 
					function (row, col, prop) {						
						var cellProperties = {};
						//NOT LAST ROW, LAST 3 COLS
						if (row !== hot.countRows() && col > (lastVisCol - 3)) {
							cellProperties.type = 'numeric';
							cellProperties.format = '000.00';
						}
						//LAST ROW, NOT LAST 3 COLS
						if(row == hot.countRows() && col < (lastVisCol - 3)){
							this.renderer = totalRenderer;
						}
						//LAST ROW, LAST 3 COLS
						if(row == hot.countRows() && col > (lastVisCol - 3)){
							cellProperties.validator = fakeValid;
							// cellProperties.renderer = totalRenderer;
							cellProperties.format = '000.00';
							cellProperties.type = 'numeric';
						}
						return cellProperties;
					},
			});
			
			Handsontable.hooks.add('afterCreateRow', createRowCallback, hot);
		}		
			
		function createRowCallback () {
				var plugin = hot.getPlugin('autoRowSize');
				var plugin2 = hot.getPlugin('autoColumnSize');
				var lastVisRow = plugin.getLastVisibleRow();
				var lastVisCol = plugin2.getLastVisibleColumn();
				console.log("lastRow: "+lastVisRow);

			var a = 97;
			var charArray = {};
			for (var i = 0; i<26; i++) {
				charArray[i] = String.fromCharCode(a + i);
			}
			// var tpl = ['Gesamt'];
			for (var j = 0; j < headerLength; j++) {
				if((headerLength - j) < 4) {
					hot.setDataAtCell(parseInt(lastVisRow+1), j, '=SUM('+charArray[j]+'1:'+charArray[j]+parseInt(lastVisRow+1)+')');
					hot.setDataAtCell(parseInt(lastVisRow+1), j, '=SUM('+charArray[j]+'1:'+charArray[j]+parseInt(lastVisRow+1)+')');
					hot.setDataAtCell(parseInt(lastVisRow+1), j, '=SUM('+charArray[j]+'1:'+charArray[j]+parseInt(lastVisRow+1)+')');
					console.log("pushing: " + (headerLength - j) +" at " + j);
					console.log("Value at "+ parseInt(lastVisRow+1)+" "+j+" : "+hot.getValue(parseInt(lastVisRow+1), j));
				}
			}
			hot.setDataAtCell(parseInt(lastVisRow+1), 0, 'Gesamt:');
		}	
	}

</script>