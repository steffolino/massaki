<?php
/* @var $this SiteController */
?>
<!-- HEAD -->
<!--div class=row>
<p> test head </p>
</div-->

<!-- MAIN -->
<div class=row>
	<div class="jumbotron col-md-10 col-md-offset-1">
		<div class=row>
			<div class="col-md-8 col-md-offset-2" style="text-align:center">
				<!--h2>Willkommen</h2-->
				<h1 class=lead>Was m&ouml;chten Sie tun? </h1>
			</div>
		</div>

		<!-- ACTION 1 -->
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class='col-sm-6 col-md-4'>
					<div class='thumbnail' style='height:420px; text-align:center;'>
					<!--i class='img-circle icon-ok' style='max-height:160px;' alt="JVAs verwalten"></i-->
					<span class="glyphicon glyphicon-shopping-cart" style="text-align:center; padding:20px 20px; font-size:5em; border-radius:50%;  background-color:#dddddd;" aria-label="JVas bearbeiten" aria-hidden="true"></span> 
					<div class='caption'>				
						<h3 style='text-align:center'>JVAs verwalten</h3>
							<div style='height:130px'><p>
							<ul style="text-align:left;">
								<li>Neue JVAs erstellen</li>
								<li>Bestehende JVAs bearbeiten</li>
								<li>JVAs löschen</li>
							</ul></p></div>
						<div class='modal-footer'><p>
						<?php
							echo TbHtml::button('Aktion starten', array(
								'color' => TbHtml::BUTTON_COLOR_PRIMARY,
								'submit' => Yii::app()->createUrl('jva/listJVAs')
						));
						echo "</p></div>
						</div>
					</div>
				</div>";
				?>

				<!-- ACTION 2-->
				<div class='col-sm-6 col-md-4'>
					<div class='thumbnail' style='height:420px; text-align:center;'>
					<!--i class='img-circle icon-ok' style='max-height:160px;' alt="JVAs verwalten"></i-->
					<span class="glyphicon glyphicon-file" style="text-align:center; padding:20px 20px; font-size:5em; border-radius:50%;  background-color:#dddddd;" aria-label="JVas bearbeiten" aria-hidden="true"></span> 
					<div class='caption'>
						<h3 style='text-align:center'>Rechnungen schreiben</h3>
							<div style='height:130px'><p>
							<ul style="text-align:left;">
								<li>Rechnungen, Lieferscheine und Sammelrechnungen erstellen</li>
							</ul></p></div>
						<div class='modal-footer'><p>
						<?php
							echo TbHtml::button('Aktion starten', array(
							'color' => TbHtml::BUTTON_COLOR_PRIMARY,
						));
						echo "</p></div>
						</div>
					</div>
				</div>";
				?>
				<!-- ACTION 3 -->
				<div class='col-sm-6 col-md-4'>
					<div class='thumbnail' style='height:420px; text-align:center;'>
					<!--i class='img-circle icon-ok' style='max-height:160px;' alt="JVAs verwalten"></i-->
					<span class="glyphicon glyphicon-search" style="text-align:center; padding:20px 20px; font-size:5em; border-radius:50%;  background-color:#dddddd;" aria-label="JVas bearbeiten" aria-hidden="true"></span> 
					<div class='caption'>
						<h3 style='text-align:center'>Suchen</h3>
							<div style='height:130px'><p>
							<ul style="text-align:left;">
								<li>Rechnungen, Lieferscheine und Sammelrechnungen <strong>durchsuchen</strong></li>
								<li>Rechnungen, Lieferscheine und Sammelrechnungen <strong>ausdrucken</strong></li>
							</ul></p></div>
						<div class='modal-footer'><p>
						<?php
							echo TbHtml::button('Aktion starten', array(
							'color' => TbHtml::BUTTON_COLOR_PRIMARY,
						));
						echo "</p></div>
						</div>
					</div>
				</div>";
				?>
			</div>
		</div>
	</div>
</div>

<!-- FOOT -->
<div class=row>
</div>
