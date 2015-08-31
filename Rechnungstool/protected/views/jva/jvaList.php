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
									echo "<div style='margin-left:20px; font-size:1.2em;' class='radio'><label><input class='jvaListItem' type='radio' name='jvaRadios' value='".$jva->jvaDataId."'>".$jva->jvaName ."</label></div>";
								}
								?>
							</div>
							<div class="panel-footer">
								<div class="row">
									<div class="col-md-12">
										<div class="btn-group btn-group-lg btn-group-justified" role="group" aria-label="JVA Liste bearbeiten">
											<a role=button class="btn btn-danger"><i class='fa fa-minus'> JVA entfernen</i></a>								
											<a role=button class="btn btn-success"><i class='fa fa-plus'> JVA hinzuf&uuml;gen</i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="jvaDetailsContainer" class="col-md-7">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-heading">Details zu JVA ...</h3>
							</div>
							<div class="panel-content">
								<!--dl class="dl-horizontal"-->								
										<div id="jvaDetailsContent">
										   <?php $this->renderPartial('_jvaEditForm', array('jvaEditFormModel'=>$jvaEditFormModel)); ?>
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
											<a role=button class="btn btn-warning"><i class='fa fa-close'> Änderungen Verwerfen</i></a>								
											<a role=button class="btn btn-info"><i class='fa fa-check'> Änderungen übernehmen</i></a>
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
			$(".jvaListItem").on('click', function () {
				console.log("clicked " + $(this).val());
				submitJVAId($(this).val());
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
			$("#jvaDetailsContent").html(data);
		  });
	}
 
</script>