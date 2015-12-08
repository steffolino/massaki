
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
			var defaultDocument;
			if($("#chkDefaultDocCredit").is(':checked')){
				defaultDocument = "yes";
			}else{
				defaultDocument ="no";
			}
			
			var content = hot.getData();
			var header = hot.getSettings().colHeaders;
			var counterType = $('#nummernkreisSelect option:selected').text();
			var jva = $("#select2-chosen-1").text();
		if($("#CreditExample").is(':visible')){
			$.ajax({ 
			  method: "POST",
			  type: "json",
			  url: "index.php?r=document/getTableData",
			  data: { 	content: content,
						headers: header,
						counterType : counterType,
						docType: buttonPressed,
						jva: jva,
						defaultDocument: defaultDocument,
										}
			})
			  .done(function( data ) {
					alert("data transferred to PHP");
				
			  });
				
		}	
		
	});

});
</script>
<?php 
echo '
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-heading">Gutschrift</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-12">
				<form id="items">
				<div id="CreditExample" class="handsontable"></div>
				</form>
			</div>
			<br>
				<div>
					<div class="checkbox">
					<label><input type="checkbox" value="" name="defaultDocCredit" id="chkDefaultDocCredit">Standard Dokument?</label>
					</div>
				</div>
		</div>
	</div>
</div>';						
?>