<!-- HEAD -->
<!--div class=row>
	<p>Test head</p>
</div-->

<!-- MAIN -->
<div class=row>
		<div class="col-md-10 col-md-offset-1">
			<div class=jumbotron>
				<div class=row>
					<div id="jvaListContainer" class="col-md-5">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-heading">Liste aller JVAs</h3>
							</div>
							<div class="panel-content">
								<?php
								foreach ($jvaListAR as $jva) {
									echo "<div style='margin-left:20px; font-size:1.2em;' class='radio'><label><input class='jvaListItem' type='radio' name='jvaRadios' value='".$jva->jvaDataId."'>".$jva->jvaName ." ".$jva->jvaNameExt."</label></div>";
								}
								?>
							</div>
							<div class="panel-footer">
								<div class="row">
									<div class="col-md-12">
										<div class="btn-group btn-group-lg btn-group-justified" role="group" aria-label="JVA Liste bearbeiten">
											<a role=button class="btn btn-danger"><i class='fa fa-minus'> JVA entfernen</i></a>								
											<a role=button class="btn btn-success"><i class='fa fa-plus' id="buttonAddJva"> JVA hinzuf&uuml;gen</i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="jvaDetailsContainer" class="col-md-7">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-heading">Details zu <span id ="jvaNameHeading"></span></h3>
							</div>
							<div class="panel-content">
								<!--dl class="dl-horizontal"-->								
										<div id="jvaDetailsEditContent">
										   <?php $this->renderPartial('_jvaEditForm', array('jvaEditFormModel'=>$jvaEditFormModel,'colNames'=>$colNames)); ?>
										</div>	
									<div id="jvaDetailsAddContent">
										   <?php $this->renderPartial('_jvaAddForm', array('jvaEditFormModel'=>$jvaEditFormModel,'colNames'=>$colNames)); ?>
										</div>	

<?php										
/*											foreach ($jvaListAR as $jva) {
												echo "<dt style='margin-bottom: 5px;'>Name</dt><dd>".$jva->jvaName."</dd><dt>Adresse</dt><dd>".$jva->jvaAddress."</dd><dt>Grussformel</dt><dd>".$jva->jvaFooter."</dd>";
											}
*/										
							?>
							</div>
							<div class="panel-footer">
								<div class="row">
									<div class="col-md-12">
										<div class="btn-group btn-group-lg btn-group-justified" role="group" aria-label="JVA Liste bearbeiten">
											<a role=button class="btn btn-warning" ><i class='fa fa-close'> Änderungen Verwerfen</i></a>								
											<a role=button class="btn btn-info" id ='changeJva'><i class='fa fa-check'> Änderungen übernehmen</i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php
/*						if(isset($jvaListAR)) {
							echo "<pre>";
							var_dump($jvaListAR);
							echo "</pre>";
						} else {
							echo "jva list not set";
						}
	*/				?>
			</div>
		</div>
</div>

<!-- FOOT -->
<div class=row>
</div>

<script>
//TODO: put in extra file
	$(document).ready(function () {
			changeJvaNameHeader();
			$("#jvaDetailsAddContent").hide();
			$(".jvaListItem").on('click', function () {
				console.log("clicked " + $(this).val());
				submitJVAId($(this).val());
			});
			
			$("#buttonAddJva").on('click', function(){
				console.log("add");
				$("#jvaDetailsEditContent").hide();
				$("#jvaDetailsAddContent").show();
				
			});
			
			$("#changeJva").on('click', function(){
					saveJvaData();
			});	
	});
	
	function submitJVAId (jvaID) {
		$.ajax({
		  method: "POST",
		  url: "index.php?r=jva/loadJVAEditForm",
		  data: { jvaID: jvaID}
		})
		  .done(function( data ) {
			console.log( "Data Saved: " + data );
			$("#jvaDetailsEditContent").html(data);
			changeJvaNameHeader();
		  });
	}
 
	function saveJvaData(){
		var  jvaDataArray =[];
		jvaDataArray.push($('#jvaName').val());
		jvaDataArray.push($('#jvaNameExt').val());
		jvaDataArray.push($('#jvaCustNum').val());
		jvaDataArray.push($('#jvaCustNumDesc').val());
		jvaDataArray.push($('#jvaFooter').val());
		jvaDataArray.push($('#jvaAddress').val());
		jvaDataArray.push($('#colName1 option:selected').text());
		jvaDataArray.push($('#colName2 option:selected').text());
		jvaDataArray.push($('#colName3 option:selected').text());
		jvaDataArray.push($('#colName4 option:selected').text());
		jvaDataArray.push($('#colName5 option:selected').text());
		jvaDataArray.push($('#colName6 option:selected').text());
		jvaDataArray.push($('#colName7 option:selected').text());
		jvaDataArray.push($('#colName8 option:selected').text());
		jvaDataArray.push($('#colName9 option:selected').text());
		jvaDataArray.push($('#colName10 option:selected').text());
		jvaDataArray.push($('#colName11 option:selected').text());
		jvaDataArray.push($('#colName12 option:selected').text());
				//alert(jvaDataArray);
		$.ajax({
			method: "POST",
			url: "index.php?r=jva/saveJVAEditForm",
			data: {data: jvaDataArray}
		})
		.done(function( data ) {
			alert("data saved");			
		  });
		
	}
	
	function changeJvaNameHeader(){
		if($("#jvaName").val() != ""){
				$("#jvaNameHeading").text($('#jvaName').val());
				
			}else{
				
				$("#jvaNameHeading").text("JVA ...");
			}
		
		
		
	}
 
</script>