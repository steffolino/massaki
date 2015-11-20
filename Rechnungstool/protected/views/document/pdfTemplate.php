<?php
/* @var $this SiteController */
$baseUrl = Yii::app()->baseUrl; 
$cs = Yii::app()->getClientScript();
$cs->registerScriptFile($baseUrl.'/js/handsontable-0.19.0/dist/handsontable.full.js');
$cs->registerCssFile($baseUrl.'/js/handsontable-0.19.0/dist/handsontable.full.css');
$cs->registerScriptFile($baseUrl.'/js/handsontable-0.19.0/lib/ruleJS/dist/full/ruleJS.all.full.js');
$cs->registerScriptFile($baseUrl.'/js/handsontable-0.19.0/dist/handsontable-ruleJS/src/handsontable.formula.js');

//TODO: rewrite php.ini
// require_once(__DIR___.'/pdf/pdf_constants.php');
// echo ($baseUrl.'/pdf/pdf_constants.php');

$adresse_klein = 'Massak Logistik GmbH  Hollfelder Str. 23  96123 Litzendorf';

?>
<!-- MAIN -->
<!-- TOOD: replace by constants in own config file -->
<script>
    var js_header = "<?php echo $header; ?>";
    var js_displayData = "<?php echo $displayData; ?>";
	$(document).ready(function () {
		$("#info").val(JSON.decode(js_header) + " " + JSON.stringify(js_displayData));
	});
</script>
<style>
@media print {
	p {
		font-size: 10pt;
		color: #000;
	}
	.table-bordered td{
		border: 1px solid #444444;
	}
	.table-bordered thead tr td{
		font-weight: bold;
		font-size: 10pt;
		text-align: center;
		color: #222222;
		padding: 2pt 7pt;
	}
	.table-bordered tbody tr td{
		font-weight: 500;
		font-size: 9pt;
		color: #111111;
		padding: 1pt 5pt;
	}
	.table-bordered tbody tr td:nth-last-child(3) {
		font-weight: 500;
		font-size: 12pt;
		color: #123987;
		text-align: right;
		padding: 1pt 5pt;
	}
	.table-bordered>tbody>tr:nth-last-child(1) {
		font-weight: 800;
		font-size: 10pt;
		background: #dddddd;
	}
	.footer {
		bottom: 10pt;
	}
	.small {
		font-size: 6pt;
	}
	.table > thead > tr > td.active,
	.table > tbody > tr > td.active,
	.table > tfoot > tr > td.active,
	.table > thead > tr > th.active,
	.table > tbody > tr > th.active,
	.table > tfoot > tr > th.active,
	.table > thead > tr.active > td,
	.table > tbody > tr.active > td,
	.table > tfoot > tr.active > td,
	.table > thead > tr.active > th,
	.table > tbody > tr.active > th,
	.table > tfoot > tr.active > th {
	  background-color: #ecf0f1;
	}

}

</style>
<div class="row">
	<div class=" col-xs-10 col-xs-offset-1" media="screen">
		<h1>Rechnung Massak Logistik GmbH + Logo</h1>
	</div>
</div>
<p id="info">Info: </p>
<hr/>
<div class=row>
		<div class=" col-xs-5 col-xs-offset-1">
			<p class="small"> <?php echo $adresse_klein; ?></p>
			<p> <?php echo $jva->jvaName; ?></p>
			<?php
			if(!empty($jva->jvaNameExt)) {
				echo "<p>".$jva->jvaNameExt."</p>";
			}
			?>
			<p><?php echo $jva->jvaAddress; ?></p>
		</div>
		<div class=" col-xs-4 col-xs-offset-1">
			<p>Briefanschrift Logistik</p>
			<p>Briefanschrift Logistik Zentrum Loehne</p>
			<p>Bankverbindung</p>
		</div>
</div>
<br/>
<!-- Invoice Meta -->
<div class=row>
	<div class="col-xs-2 col-xs-offset-1">
		<?php
		echo "<p>*Dokumenttyp*</p>";
		?>
	</div>
	<div class="col-xs-2 col-xs-offset-1">
		<?php
		echo "<p>Nummernkreis</p>";
		?>
	</div>
	<div class="col-xs-2 col-xs-offset-2">
		<?php $date = date('d.m.Y'); 
		echo "<p>".$date."</p>";
		?>
	</div>
</div>
<div class=row>
	<div class=" col-xs-10 col-xs-offset-1">
		<table id="invoiceTable" class="table table-bordered">
			<thead class="thead">
				<tr class="thead"> <?php foreach($header as $headerItem) {echo "<td>".$headerItem."</td>";} ?></tr>
			</thead>
			<tbody>
				<?php 
				$lastKey = end(array_keys($displayData));
				foreach($displayData as $row) {
						if($row == $lastKey) {
							echo "<tr class='active'>";
						} else {
							echo "<tr class='info'>";
						}
						foreach ($row as $data) {
							echo "<td>".$data."</td>";
						}
						echo "</tr>";
					} ?>
			</tbody>
			<!--tfoot>
				<tr><td>Zu bezahlen:</td><td></td><td>15</td><td>20</td><td>35</td></tr>
			</tfoot-->
		</table>		
	</div>
</div>
<div class=row>
	<div class="col-xs-4 col-xs-offset-1">
		<p><?php echo $jva->jvaFooter; ?></p>
	</div>
	<div class="col-xs-4 col-xs-offset-2">
		<p>Ware erhalten, Unterschrift</p>
		<p>____________________________</p>
	</div>
</div>
<hr/>
<!-- FOOT -->
<div class="row footer" style="margin-bottom:10px;">
	<div class="col-xs-6 col-xs-offset-3" style="font-size:150px;">
		<p> Massak Logistik GmbH Footer </p>
		<p> Ust-Id Nr, Steuernummer, Geschäftsführer </p>
	</div>
</div>
<script>
	$(document).ready(function () {
		var data = [
  ["", "Ford", "Volvo", "Toyota", "Honda"],
  ["2014", 10, 11, 12, 13],
  ["2015", 20, 11, 14, 13],
  ["2016", 30, 15, 12, 13]
];

	var html = '<table><tr>';
      for (var i = 0; i < 6; i++) { // For each entry
            if (i == 3) { // Start of next row
                  html += '</tr><tr>'; // Add row separator
            }
            // Add image in cell
            html += '<td><img src="http://graph.facebook.com/' + data[i] + '/picture"></td>';
      }
      html += '</tr></table>'; // Finish up

      $('#tableContainer').append(html); // And add to container
	  
			 container = document.getElementById('tableContainer');
			hot = new Handsontable(container, {
			  data: data,
			  // language: de,
			  // minSpareRows: 1,
			  formulas: true,
			  rowHeaders: true,
			  // colHeaders: js_header,
			  manualColumnResize: true,
			  manualRowMove: true,
			  colWidths: [160, 160, 160, 160, 100, 100, 100],
			  contextMenu: true,
			 // columns: 
					// function (instance, td, row, col, prop, value) {
						// if(row == instance.countRows() - 1 && typeof(col.data != 'undefined')){
							// console.log("found last row " + row);
							// td.style.fontWeight = 'bold';
							// td.style.textAlign = 'right';
							// td.innerText = 'Gesamt: ';
							// return;
						// }
						// if(row == instance.countRows() - 1){

						// }
						// Handsontable.NumericRenderer.apply(this, arguments);
					// }
			}); 
			
			var diffRenderer = function (instance, td, row, col, prop, value, cellProperties) {
				Handsontable.cellTypes['formula'].renderer.apply(this, arguments);
				td.style.backgroundColor = '#c3f89c';
				td.style.fontWeight = 'bold';
				};
	});
</script>