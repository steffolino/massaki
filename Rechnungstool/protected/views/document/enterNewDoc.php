<div class="row col-md-1 col-md-offset-11" style="position:fixed; z-index:6; bottom: 40px;">
	<div class="pull-right">
		<a id="scrollUpa" style="cursor:pointer; "><i alt="Scroll Top" class="fa fa-2x fa-angle-double-up"></i></a>
	</div>
</div>
<!-- MAIN -->
<div class=row>
		<div class="col-md-12 panel panel-primary">
				<div class="row panel-heading">
					<form id="invoiceMeta">
						<div class="col-md-3">
							<label>JVA Name:<br/>
							<?php
							$this->widget(
								'booster.widgets.TbSelect2',
									array(
										'asDropDownList' => false,
										'name' => 'jvaName',
										'options' => array(
											'width' => '260px',
											'minimumInputLength'=>'4',
											'placeholder' => 'JVA Name',
											'ajax'       => array(
													   'url'       => Yii::app()->controller->createUrl('jva/getJvaAsJson'),
														'delay' => 300,
													   'dataType'  => 'json',
													   'data'      => 	'js:function(term, page) { return {jvaSearchTerm: term, page: page}; }',
														'results'	=>  'js:function (data) {
															return {
																results: $.map(data, function (item) {
																	return {
																		text: item.jvaName + " " + item.jvaNameExt,
																		value: item.jvaDataId,
																		id: item.jvaDataId
																	}
																})
															};
														}'
												),
												'events' => array(
													'select' => 'js:function () { console.log(item); }'
												),
										),
									)
							);
							?>
							</label>
						</div>
						<div class="col-md-5 col-md-offset-1">
							<label>Dokument Typ:
									<div id="docSelection">
										<form >
													<div class="btn-group btn-group-sm" role=group>
														<button type="button" class="btn btn-default" id="newInvoiceRadio">Rechnung</button>
														<button type="button" class="btn btn-default" id="newCollectiveInvoiceRadio">Sammelrechnung</button>
														<button type="button" class="btn btn-default" id="newDeliveryNoticeRadio">Lieferschein</button>
														<button type="button" class="btn btn-default" id="newCreditNoteRadio">Gutschrift</button>
													</div>
										</form>
									</div>
							</label>
						</div>
						<div class="col-md-2 ">
								 <div class="input-group input-group-sm">
								  <label for="Nummernkreis">Nummernkreis</label>
								  <select class="form-control" id="Nummernkreis">
									<option value='ik'>IK</option>
									<option value='ek'>EK</option>
									<option value='reg'>Normal</option>
									<option value='v'>V</option>
								  </select>
								</div>
						</div>
					</div>
				</form>
					<div id="docContentEmpty" class="row panel-body">
						Bitte waehlen Sie einen Dokument-Typ
					</div>
					<div id="docContentInvoice" class="row panel-body">
						<?php $this->renderPartial('_invoice'); ?>
					</div>
					<div id="docContentCollectiveInvoice" class="row panel-body">
						<?php $this->renderPartial('_collectiveInvoice'); ?>
					</div>
					<div id="docContentDeliveryNotice" class="row panel-body">
						<?php $this->renderPartial('_deliveryNotice'); ?>
					</div>
					<div id="docContentCreditNote" class="row panel-body">
						<?php $this->renderPartial('_creditNote'); ?>
					</div>
					<div class="row panel-footer">
							<div class="row">
								<div class="col-md-4 col-md-offset-8">
									<div class="btn-group btn-group btn-group-justified" role="group" aria-label="JVA Liste bearbeiten">
										<a role=button class="btn btn-danger"><i class="fa fa-close"> Abbrechen</i></a>
										<a role=button class="btn btn-success"><i class="fa fa-check"> Schreiben</i></a>
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
	
	$(document).on("click", "#docSelection form .btn-group .btn", function () {
			$(this).addClass('active');
			$(this).siblings('.btn').removeClass('active');
	});

	$(document).on("mouseenter", "#docSelection form .btn-group .btn", function () {
			$(this).addClass('btn-primary');
	});

	$(document).on("mouseleave", "#docSelection form .btn-group .btn", function () {
			$(this).removeClass('btn-primary');
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
			default:
				$("#docContentEmpty").show();
				$("#docContentInvoice").hide();
				$("#docContentCollectiveInvoice").hide();
				$("#docContentDeliveryNotice").hide();
				$("#docContentCreditNote").hide();
				break;
		}
		
	}


</script>