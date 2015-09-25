<div class="row col-md-1 col-md-offset-11" style="position:fixed; z-index:6; bottom: 40px;">
	<div class="pull-right">
		<a id="scrollUpa" style="cursor:pointer; "><i alt="Scroll Top" class="fa fa-2x fa-angle-double-up"></i></a>
	</div>
</div>
<!-- MAIN -->
<div class=row>
		<div class="col-md-12 col-md-offset-1">
			<div class=jumbotron>
				<div class=row>
					<div  class="col-md-10">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-heading">Bitte wählen Sie aus welches Dokument Sie erstellen wollen</h3>
							</div>
							<div id="docSelection" class="panel-content">
								<form >
								<br>
									<div class="row" align="center">	
										<div class="col-md-12">
											<div class="btn-group-lg" data-toggle="buttons">
												<label class="btn btn-info" id="newInvoiceRadio">
													<input type="radio"/> Rechnung
												</label> 
												<label class="btn btn-info"  id="newCollectiveInvoiceRadio">
													<input type="radio"/> Sammelrechnung
												</label> 
												<label class="btn btn-info" id="newDeliveryNoticeRadio" >
													<input type="radio"/> Lieferschein
												</label> 
												<label class="btn btn-info" id="newCreditNoteRadio">
													<input type="radio"/> Gutschrift
											</div>
										</div>
									</div>
									</form>
							</div>
							<br>
							<div id="docContentEmpty" class="panel-content">
								<div class="panel panel-danger">
									<div class="panel-heading">
										<h3 class="panel-heading">Bitte wählen Sie aus</h3>
									</div>
									
								</div>
							</div>
							<div id="docContentInvoice" class="panel-content">
								<?php $this->renderPartial('_invoice'); ?>
							</div>
							<div id="docContentCollectiveInvoice" class="panel-content">
								<?php $this->renderPartial('_collectiveInvoice'); ?>
							</div>
							<div id="docContentDeliveryNotice" class="panel-content">
								<?php $this->renderPartial('_deliveryNotice'); ?>
							</div>
							<div id="docContentCreditNote" class="panel-content">
								<?php $this->renderPartial('_creditNote'); ?>
							</div>
							<div class="panel-footer">
								<div class="row">
									<div class="col-md-12">
										
									</div>
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	
<script>
	$(document).ready(function () {
		showCorrectDocContent("empty");
		$("#newInvoiceRadio").on('click',function(){
			showCorrectDocContent("invoice");
		});
		$("#newCollectiveInvoiceRadio").on('click',function(){
				showCorrectDocContent("colInvoice");
		});
		$("#newDeliveryNoticeRadio").on('click',function(){
			showCorrectDocContent("delNot");
		});
		$("#newCreditNoteRadio").on('click',function(){
			showCorrectDocContent("credNot");
		});
		
	
	});
	
	function showCorrectDocContent(radio){
		switch(radio){
			case "empty":
				$("#docContentEmpty").show();
				$("#docContentInvoice").hide();
				$("#docContentCollectiveInvoice").hide();
				$("#docContentDeliveryNotice").hide();
				$("#docContentCreditNote").hide();
				break;
			case "invoice":
				$("#docContentEmpty").hide();
				$("#docContentInvoice").show();
				$("#docContentCollectiveInvoice").hide();
				$("#docContentDeliveryNotice").hide();
				$("#docContentCreditNote").hide();
				break;
			case "colInvoice":
				$("#docContentEmpty").hide();
				$("#docContentInvoice").hide();
				$("#docContentCollectiveInvoice").show();
				$("#docContentDeliveryNotice").hide();
				$("#docContentCreditNote").hide();
				break;
			case "delNot":
				$("#docContentEmpty").hide();
				$("#docContentInvoice").hide();
				$("#docContentCollectiveInvoice").hide();
				$("#docContentDeliveryNotice").show();
				$("#docContentCreditNote").hide();
				break;
			case "credNot":
				$("#docContentEmpty").hide();
				$("#docContentInvoice").hide();
				$("#docContentCollectiveInvoice").hide();
				$("#docContentDeliveryNotice").hide();
				$("#docContentCreditNote").show();
				break;
		}
		
	}


</script>