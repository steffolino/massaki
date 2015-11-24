
<?php

$baseUrl = Yii::app()->baseUrl; 
$cs = Yii::app()->getClientScript();
$cs->registerScriptFile($baseUrl.'/js/handsontable-0.19.0/dist/handsontable.full.js');
$cs->registerCssFile($baseUrl.'/js/handsontable-0.19.0/dist/handsontable.full.css');
$cs->registerScriptFile($baseUrl.'/js/handsontable-0.19.0/lib/ruleJS/dist/full/ruleJS.all.full.js');
$cs->registerScriptFile($baseUrl.'/js/handsontable-0.19.0/dist/handsontable-ruleJS/src/handsontable.formula.js');
// C:\inetpub\wwwroot\massaki\Rechnungstool\js\handsontable-0.19.0\dist

?>
<style>
.invoiceExtra {
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>

<script>

$(document).ready(function () {
	
  $(document).on("click","#writingDoc",function(){
			//var $container = $('#example');
			//var handsontable = $container.data('handsontable');
			//alert(container);
			var buttonPressed;
			$("#docSelection .btn").each(function() {
				if($(this).hasClass('active')) {
					buttonPressed = $(this).text();
				}
			});
			
			var content = hot.getData();
			var header = hot.getSettings().colHeaders;
			console.log(header);
			var counterType = $('#nummernkreisSelect option:selected').text();
			var jva = $("#select2-chosen-1").text();
			
			var contentNumeric = Array();
			contentNumeric = getTableDataNumeric(contentNumeric);
			
			var invoiceExtraHTML = getInvoiceExtraHTML(invoiceExtraHTML);
		
			
		if($("#InvoiceExample").is(':visible')){
						
			$.ajax({
			  method: "POST",
			  type: "json",
			  url: "index.php?r=document/getTableData",
			  data: { 	
						invoiceExtra: invoiceExtraHTML,
						content: content,
						contentNumeric: contentNumeric,
						headers: header,
						counterType : counterType,
						docType: buttonPressed,
						jva: jva,
				}
			})
			  .done(function( data ) {
					alert("data transferred to PHP");				
			  });	
		}	
	});
  
	function getTableDataNumeric (tableData) {
			// var tableData = Array();// = JSON.stringify(hot.getData());			
			// var header = Array();
			// $(".htCore thead tr th").each(function(i, v){
					// header[i] = $(this).text();
			// })
			// header = header.slice(0,2);
			
			var htCoreData = $(".htCore tbody tr");
			htCoreData.each(function(i, v){
				tableData[i] = Array();
				$(this).children('td').each(function(ii, vv){
					tableData[i][ii] = $(this).text();
				}); 
			});
			tableData = tableData.slice(0, hot.countRows());
			// tableData = JSON.stringify(tableData);
			// console.log("tData: "+tableData);
			// console.log(hot.countRows());

		 return (tableData);
	}
	
	function getInvoiceExtraHTML(invoiceExtra) {

	var invoiceExtraKids = $("#invoiceExtraContainer .invoiceExtra .form-group .control-label");
	var invoiceExtraVals = $("#invoiceExtraContainer .invoiceExtra .form-group .form-control");

		// alert(invoiceExtraKids);
		// alert(invoiceExtraVals);
		
		invoiceExtra = Array();
		
		// for(var i = 0; i < invoiceExtraKids.length; i++) {
			// invoiceExtra[i] = invoiceExtraVals[i].val();
		// }
		
		// invoiceExtraKids.each(function(i, v){
			// invoiceExtra[i] = Array();
			// invoiceExtra[i] = $(this).text();
			// invoiceExtra[i][0] = invoiceExtraVals[i];
			// console.log();
			var j=0;
		
			invoiceExtraVals.each(function(i, v){
				if(j == 5) {
					//DATE  
					invoiceExtra[i] = $(this).val();					
				} else {
					invoiceExtra[i] = parseFloat($(this).val());
				}
				j++;
				console.log($(this).val());
			});
			
		// });

		return invoiceExtra;

	}

});
</script>
<?php 
echo '
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-heading">Rechnung</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-12">
				<form id="items">
				<div id="InvoiceExample" class="handsontable"></div>
				<br/>
				<div id="invoiceExtraContainer">
					<div class="row invoiceExtra">
						<div class="form-group form-group-sm">
							<label class="col-md-2 col-md-offset-6 control-label" for="warenwertNetto">Warenwert netto</label>
							<div class="col-md-2 form-group-sm">
								<input type="text" id="warenwertNetto" class="form-control" placeholder="Warenwert netto">
							</div>
						</div>
					</div>
					<div class="row invoiceExtra">
					<div class="form-group form-group-sm">
							<label class="col-md-2 col-md-offset-6 control-label" for="mwst0">MwSt (0%)</label>
							<div class="col-md-2 form-group-sm">
								<input type="text" id="mwst0" class="form-control" placeholder="MwSt (0%)">
							</div>
						</div>
					</div>
					<div class="row invoiceExtra">
						<div class="form-group form-group-sm">
							<label class="col-md-2 col-md-offset-6 control-label" for="mwst7">MwSt (7%)</label>
							<div class="col-md-2 form-group-sm">
								<input type="text" id="mwst7" class="form-control" placeholder="MwSt (7%)">
							</div>
						</div>
					</div>
					<div class="row invoiceExtra">
						<div class="form-group form-group-sm">
							<label class="col-md-2 col-md-offset-6 control-label" for="mwst19">MwSt (19%)</label>
							<div class="col-md-2 form-group-sm">
								<input type="text" id="mwst19" class="form-control" placeholder="MwSt (19%)">
							</div>
						</div>
					</div>
					<div class="row invoiceExtra">
						<div class="form-group form-group-sm">
							<label class="col-md-2 col-md-offset-6 control-label" for="warenwertBrutto">Warenwert brutto</label>
							<div class="col-md-2 form-group-sm">
								<input type="text" id="warenwertBrutto" class="form-control" placeholder="Warenwert brutto">
							</div>
						</div>
					</div>
					<div class="row invoiceExtra">
						<div class="form-group form-group-sm">
							<label class="col-md-2 col-md-offset-6 control-label" for="bezahltExternDate">Bezahlt von Externen</label>
							<div class="col-md-2 form-group-sm">
								<input type="text" id="bezahltExternDate" class="form-control" placeholder="Datum">
							</div>
							<div class="col-md-2 form-group-sm">
								<input type="text" id="bezahltExternVal" class="form-control" placeholder="Betrag">
							</div>
						</div>
					</div>
					<div class="row invoiceExtra">
						<div class="form-group form-group-sm">
							<label class="col-md-2 col-md-offset-6 control-label" for="bereitsBerechnet">Bereits berechnet</label>
							<div class="col-md-2 form-group-sm">
								<input type="text" id="bereitsBerechnet" class="form-control" placeholder="Bereits berechnet">
							</div>
						</div>
					</div>
					<div class="row invoiceExtra">
						<div class="form-group form-group-sm">
							<label class="col-md-2 col-md-offset-6 control-label" for="restbetrag">Restbetrag</label>
							<div class="col-md-2 form-group-sm">
								<input type="numeric" step="0.01" min="0.00" id="restbetrag" class="form-control" placeholder="Restbetrag">
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>';						
?>