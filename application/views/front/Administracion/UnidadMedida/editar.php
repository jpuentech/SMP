<form class="form-horizontal " id="form-editarUnidad_Medida" action="<?php echo  base_url();?>index.php/Unidad_Medida/editar" method="POST">
	<div class="item form-group">
		<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Descripción <span class="required">*</span>
		</label>
		<div class="col-md-6 col-sm-6 col-xs-12">
			<input id="hdId" name="hdId" value="<?=$unidadMedida->id_unidad;?>" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2"  placeholder="Descripción" required="required" type="hidden">
			<input id="txtDescripcion" name="txtDescripcion" value="<?=$unidadMedida->descripcion;?>" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2"  placeholder="Descripción" required="required" autocomplete="off" type="text">
		</div>
	</div>
	<div class="ln_solid"></div>
	<div class="form-group">
		<div class="col-md-6 col-md-offset-3">
			<button type="submit" class="btn btn-success">
				<span class="glyphicon glyphicon-floppy-disk"></span>
				Guardar
			</button>
			<button class="btn btn-danger" data-dismiss="modal" onclick="removeModal();">
				<span class="glyphicon glyphicon-remove"></span>
				Cancelar
			</button>
		</div>
	</div>
</form>
<script>
	$(function()
	{
		$('#form-editarUnidad_Medida').formValidation(
		{
			framework: 'bootstrap',
			excluded: [':disabled', ':hidden', ':not(:visible)', '[class*="notValidate"]'],
			live: 'enabled',
			message: '<b style="color: #9d9d9d;">Asegúrese que realmente no necesita este valor.</b>',
			trigger: null,
			fields:
			{
				txtDescripcion:
				{
					validators: 
					{
						notEmpty:
						{
							message: '<b style="color: red;">El campo "Descripción" es requerido.</b>'
						}
					}
				}
			}
		});
	});
</script>