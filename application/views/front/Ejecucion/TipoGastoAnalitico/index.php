<div class="right_col" role="main">
	<div class="">
		<div class="clearfix"></div>
		<div class="">
			<div class="col-md-12 col-xs-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2><b>TIPO GASTO ANALÍTICO</b> </h2>
						<ul class="nav navbar-right panel_toolbox">
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<div class="" role="tabpanel" data-example-id="togglable-tabs">
							<ul id="myTab" class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active">
									<a href="#tab_Sector"  id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">
										<b>Gasto Analitico</b>
									</a>
								</li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<!-- /Contenido del sector -->
								<div role="tabpanel" class="tab-pane fade active in" id="tab_Sector" aria-labelledby="home-tab">
									<!-- /tabla de sector desde el row -->
									<div class="row">  
										<div class="col-md-12 col-sm-12 col-xs-12">
											<div class="x_panel">
												<button type="button" class="btn btn-primary " onclick="paginaAjaxDialogo(null, 'Registrar Nuevo Gasto Analítico', null, base_url+'index.php/Tipo_Gasto_Analitico/insertar', 'POST', null, null, false, true);">
													NUEVO
												</button>
												<div class="x_title">                                                              
										
													<div class="clearfix"></div>
												</div>
												<div class="x_content">
													<table id="table-Tipo_Gasto_Analitico"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
														<thead>
															<tr>
																<td>Descripcion</td>
																<td class="col-md-1 col-md-1 col-xs-12"></td>
															</tr>
														</thead>
														<tbody>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
										<!-- / fin tabla de sector desde el row -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>

<script>
	$(document).ready(function()
	{
		$('#table-Tipo_Gasto_Analitico').DataTable(
		{
			"language":idioma_espanol
		});
	});
</script>