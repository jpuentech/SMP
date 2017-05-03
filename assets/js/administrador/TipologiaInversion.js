$(document).on("ready" ,function(){

                listaTipologiaInversion();/*llamar a mi datatablet listar funcion*/
              //abrir el modal para registrar


//REGISTARAR NUEVA tipologia inversion
   $("#form-AddTipologiaInversion").submit(function(event)
                  {
                      event.preventDefault();
                      $.ajax({
                          url:base_url+"index.php/pip/AddTipologiaInversion",
                          type:$(this).attr('method'),
                          data:$(this).serialize(),
                          success:function(resp){
                           alert(resp);
                          $('#dynamic-table-TipologiaInversion').dataTable()._fnAjaxUpdate();//para actualizar mi datatablet datatablet   funcion   
                             formReset();
                         }
                      });
                  });

      //limpiar campos
          function formReset()
          {
          document.getElementById("form-AddTipologiaInversion").reset();
          document.getElementById("form-EditTipologiaInversion").reset();
          }
       //formulario para ediotar
             $("#form-EditTipologiaInversion").submit(function(event)
                  {
                      event.preventDefault();
                      $.ajax({
                          url:base_url+"index.php/pip/UpdateTipologiaInversion",
                          type:$(this).attr('method'),
                          data:$(this).serialize(),
                          success:function(resp){
                           alert(resp);
                          $('#dynamic-table-TipologiaInversion').dataTable()._fnAjaxUpdate();//para actualizar mi datatablet datatablet   funcion   
                             formReset();
                         }
                      });
                  });


			});
			   /*listra */
                var listaTipologiaInversion=function()
                {
                    var myTable=$("#dynamic-table-TipologiaInversion").DataTable({
                     "processing":true,
                     "serverSide":false,
                     destroy:true,

                         "ajax":{
                                    "url":base_url+"index.php/pip/get_TipologiaInversion",
									"method":"POST",
									"dataSrc":""
                                    },
                                "columns":[
                                   {"defaultContent":" <label class='pos-rel'><input type='checkbox' class='ace' /><span class='lbl'></span></label>"},
                                  {"data":"IDTIPOLOGIAINVERSION"  },
								  {"data":"NOMBRETIPOLOGIA"},
			        			  {"data":"DESCRIPCIONTIPOLOGIA"},
                                  {"defaultContent":"<button type='button' class='ver btn btn-info btn-xs' data-toggle='modal' data-target='#ver'><span class='glyphicon glyphicon-zoom-in' aria-hidden='true'></span></button><button type='button' class='editar btn btn-primary btn-xs' data-toggle='modal' data-target='#VentanaEditTipologiaInversion'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button><button type='button' class='eliminar btn btn-danger btn-xs' data-toggle='modal' data-target='#'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></button>"}
                               ],
//{ "defaultContent": "<div class='hidden-sm hidden-xs action-buttons'><a type='button' class='editar btn btn-primary btn-xs'  data-toggle='modal' data-target='#VentanaRegNaturalezaInversion' ><span class='glyphicon glyphicon-zoom-in bigger-180' aria-hidden='true'></span></button><a class='btn green'  data-toggle='modal' data-target='#VentanaRegNaturalezaInversion'><span class='glyphicon glyphicon-pencil bigger-180' aria-hidden='true'></span></a><a class='red' href='#delete'><span class='glyphicon glyphicon-trash bigger-180' aria-hidden='true' ></span></a></div><div class='hidden-md hidden-lg'><div class='dropdown'><button data-toggle='dropdown' type='button' class='btn btn-info btn-xs'><span class='glyphicon glyphicon-collapse-down icon-only bigger-120' aria-hidden='true'></span> <span class='caret'></span></button><ul class='dropdown-menu' ><li><a href='#ver' class='tooltip-info'  data-rel='tooltip' title='Ver'><span class='blue'><span class='glyphicon glyphicon-zoom-in bigger-100' aria-hidden='true'></span></span></a></li><li><a href='#ed' class='tooltip-success' data-rel='tooltip' title='Edit'><span class='green'><span class='glyphicon glyphicon-pencil bigger-100' aria-hidden='true'></span></span></a></li><li><a href='#delete' class='tooltip-error' data-rel='tooltip' title='Delete'><span class='red'><span class='glyphicon glyphicon-trash bigger-100' aria-hidden='true' ></span></span></a></li></ul></div></div>" }
     //     ],

                                "language":idioma_espanol
                    }); 
$.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';
				
				new $.fn.dataTable.Buttons( myTable, {
					buttons: [
					  {
						"extend": "colvis",
						"text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>Show/hide columns</span>",
						"className": "btn btn-white btn-primary btn-bold",
						columns: ':not(:first):not(:last)'
					  },
					  {
						"extend": "copy",
						"text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>Copy to clipboard</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "csv",
						"text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>Export to CSV</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "excel",
						"text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>Export to Excel</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "pdf",
						"text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "print",
						"text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>Print</span>",
						"className": "btn btn-white btn-primary btn-bold",
						autoPrint: false,
						message: 'This print was produced using the Print button for DataTables'
					  }		  
					]
				} );
				myTable.buttons().container().appendTo( $('.tableTools-container-TipologiaInversion') );
        TipologiaData("#dynamic-table-TipologiaInversion",myTable);  //CARGAR LA DATA PARA MOSTRAR EN EL MODAL  
        EliminarTipologiaData("#dynamic-table-TipologiaInversion",myTable);
                }

                var  TipologiaData=function(tbody,myTable){
                    $(tbody).on("click","button.editar",function(){
                        var data=myTable.row( $(this).parents("tr")).data();
                        var txt_IdTipologiaInversionM=$('#txt_IdTipologiaInversionM').val(data.IDTIPOLOGIAINVERSION);
                        var txt_NombreTipologiaInversionM=$('#txt_NombreTipologiaInversionM').val(data.NOMBRETIPOLOGIA);
                        var txt_DescripcionTipologiaInversionM=$('#txt_DescripcionTipologiaInversionM').val(data.DESCRIPCIONTIPOLOGIA);

                    });
                }
var EliminarTipologiaData=function(tbody,table){
                  $(tbody).on("click","button.eliminar",function(){
                        var data=table.row( $(this).parents("tr")).data();
                        //var id_sector=data.id_sector;
                        console.log(data);
                         swal({
                                title: "Desea eliminar ?",
                                text: "",
                                type: "warning",
                                showCancelButton: true,
                                confirmButtonColor: "#DD6B55",
                                confirmButtonText: "Yes,Eliminar",
                                closeOnConfirm: false
                              },
                              function(){
                                    $.ajax({
                                          url:base_url+"index.php/pip/EliminarTipologiaInversion",
                                          type:"POST",
                                          data:{IDTIPOLOGIAINVERSION:IDTIPOLOGIAINVERSION},
                                          success:function(respuesta){
                                            //alert(respuesta);
                                            swal("Deleted!", "Se elimino corectamente .", "success");
                                            $('#dynamic-table-TipologiaInversion').dataTable()._fnAjaxUpdate();//para actualizar mi datatablet datatablet

                                          }
                                        });
                              });
                    });
                }


                
              
        /*Idioma de datatablet table-sector */
            var idioma_espanol=
                {
                    "sProcessing":     "Procesando...",
                    "sLengthMenu":     "Mostrar _MENU_ registros",
                    "sZeroRecords":    "No se encontraron resultados",
                    "sEmptyTable":     "Ningún dato disponible en esta tabla",
                    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix":    "",
                    "sSearch":         "Buscar:",
                    "sUrl":            "",
                    "sInfoThousands":  ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst":    "Primero",
                        "sLast":     "Último",
                        "sNext":     "Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                    }
                }