
<?php

$baseUrl = Yii::app()->baseUrl; 
$cs = Yii::app()->getClientScript();
$cs->registerScriptFile($baseUrl.'/js/handsontable-0.19.0/dist/handsontable.full.js');
$cs->registerCssFile($baseUrl.'/js/handsontable-0.19.0/dist/handsontable.full.css');
$cs->registerScriptFile($baseUrl.'/js/handsontable-0.19.0/lib/ruleJS/dist/full/ruleJS.all.full.js');
$cs->registerScriptFile($baseUrl.'/js/handsontable-0.19.0/dist/handsontable-ruleJS/src/handsontable.formula.js');
// C:\inetpub\wwwroot\massaki\Rechnungstool\js\handsontable-0.19.0\dist

?>


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
		
			
		if($("#InvoiceExample").is(':visible')){
						
			$.ajax({
			  method: "POST",
			  type: "json",
			  url: "index.php?r=document/getTableData",
			  data: { 	
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
			console.log("tData: "+tableData);
			// console.log(hot.countRows());

		 return (tableData);
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
				<div class="row">
					<div class="col-md-2 col-md-offset-7">
						Warenwert netto
					</div>
					<div class="col-md-2 col-md-offset-1">
					Wert
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-md-offset-7">
					MwSt 19%
					</div>
					<div class="col-md-2 col-md-offset-1">
					Wert
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-md-offset-7">
						MwSt 7%
					</div>
					<div class="col-md-2 col-md-offset-1">
					Wert
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-md-offset-7">
						MwSt 0%
					</div>
					<div class="col-md-2 col-md-offset-1">
					Wert
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-md-offset-7">
						Warenwert brutto
					</div>
					<div class="col-md-2 col-md-offset-1">
					Wert
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-md-offset-7">
						Bezahlt von Extern:
					</div>
					<div class="col-md-2 col-md-offset-1">
					Wert
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-md-offset-7">
						Bereits berechnet
					</div>
					<div class="col-md-2 col-md-offset-1">
					Wert
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-md-offset-7">
						Restbetrag
					</div>
					<div class="col-md-2 col-md-offset-1">
					Wert
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>';						
?>