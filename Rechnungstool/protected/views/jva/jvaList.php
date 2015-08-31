<!-- HEAD -->
<!--div class=row>
	<p>Test head</p>
</div-->

<!-- MAIN -->
<div class=row>
		<div class="col-md-10 col-md-offset-1">
			<div class=jumbotron>
				<div class=row>
					<div id="jvaListContainer" class="col-md-6 col-md-offset-1">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-heading">Liste aller JVAs</h3>
							</div>
							<div class="panel-content">
							</div>
						</div>
					</div>
					<div id="jvaDetailsContainer" class="col-md-4 col-md-offset-1">
					b
					</div>
				</div>
				<?php
						if(isset($jvaListAR)) {
							echo "<pre>";
							var_dump($jvaListAR);
							echo "</pre>";
						} else {
							echo "jva list not set";
						}
					?>
			</div>
		</div>
</div>

<!-- FOOT -->
<div class=row>
</div>
