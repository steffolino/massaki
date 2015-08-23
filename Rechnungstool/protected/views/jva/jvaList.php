<!-- HEAD -->
<div class=row>
	<p>Test head</p>
</div>

<!-- MAIN -->
<div class=row>
	<div class=" jumbotron col-md-10 col-md-offset-1">
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

<!-- FOOT -->
<div class=row>
</div>
