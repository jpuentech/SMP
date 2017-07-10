<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_Programacion extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	//AGREGAR UN PROYECTO


	function GetMontosTemporales()
	{
		$montos=$this->db->query("execute sp_ProgramacionMontoTemporal_r");
		
		if($montos->num_rows()>0)
		{
			return $montos->result();
		}
		else
		{
			return false;
		}
	}
	
	//FIN AGREGAR UN PROYECTO
	function GetProgramacion($id_proyecto_filtro,$año_apertura_actual, $skip, $numberRow, $valueSearch)
	{
		$ProyectoInversion=$this->db->query("execute sp_ListarProyectoProgramacion '".$id_proyecto_filtro."','".$año_apertura_actual."',".$skip.",".$numberRow.",'".$valueSearch."'");//listar proyecto de programacion

		return $ProyectoInversion->result();
	}

	function BuscarProyectoInversion($Id_ProyectoInver,$opcion)
	{
		$ProyectoInversion=$this->db->query("execute sp_ProyectoInversionBuscar'".$Id_ProyectoInver."','".$opcion."'");//listar  programacion
		
		return $ProyectoInversion->result();
	}

	function GetProgramacionModificar($opcion,$id_prog,$id_brecha,$id_pi,$monto_prog,$año_prog,$prioridad_prog,$monto_opera_mant_prog,$tipo_prog)
	{
		$Programacion=$this->db->query("execute sp_Gestionar_Programacion'".$opcion."','".$id_prog."','".$id_brecha."','".$id_pi."','".$monto_prog."','".$año_prog."','".$prioridad_prog."','".$monto_opera_mant_prog."','".$tipo_prog."'");//listar  programacion


          }
      //AGREGAR UN PROYECTO
      function AddProgramacion($textidCartera,$cbxBrechaP,$textidpip,$txt_MontoProgramado,$AnioProgramado,$txtPrioridadProg,$monto_opera_mant_prog)
        {
           $this->db->query("execute sp_Programacion_c'".$textidCartera."','".$cbxBrechaP."','".$textidpip."','".$txt_MontoProgramado."','".$AnioProgramado."','".$txtPrioridadProg."','".$monto_opera_mant_prog."'");
            if ($this->db->affected_rows() > 0) 
              {
                return true;
              }
              else
              {
                return false;
              }
        }
        function AddProgramacionOperManteni($textidCartera,$cbxBrechaP,$textidpip,$txt_MontoProgramado,$AnioProgramadoOpeMant,$txtPrioridadProg,$txt_MontoOperacionMante)
        {
           $this->db->query("execute sp_Programacion_c'".$textidCartera."','".$cbxBrechaP."','".$textidpip."','".$txt_MontoProgramado."','".$AnioProgramadoOpeMant."','".$txtPrioridadProg."','".$txt_MontoOperacionMante."'");
            if ($this->db->affected_rows() > 0) 
              {
                return true;
              }
              else
              {
                return false;
              }
        }

        function GetMontosTemporales(){
           $montos=$this->db->query("execute sp_ProgramacionMontoTemporal_r");
            if($montos->num_rows()>0)
             {
              return $montos->result();
             }else
             {
              return false;
             }
        }
    //FIN AGREGAR UN PROYECTO
         function GetProgramacion($id_proyecto_filtro,$año_apertura_actual)
        {
            $ProyectoInversion=$this->db->query("execute sp_ListarProyectoProgramacion '".$id_proyecto_filtro."','".$año_apertura_actual."'");//listar proyecto de programacion
            return $ProyectoInversion->result();
        }

		return $Programacion->result();
	}


	//exporatr exel de la programaci
	function ExelProgramacionProyectos($id_proyecto_filtro,$año_apertura_actual)
	{
		$ProyectoInversion=$this->db->query("execute sp_ListarProyectoProgramacion '".$id_proyecto_filtro."','".$año_apertura_actual."',0 , 0, ''");//listar proyecto de programacion
		
		return $ProyectoInversion->result();
	}

	function UpdateProgramacion($opcion,$id_prog,$id_cartera,$id_brecha,$id_pi,$monto_prog,$año_prog,$prioridad_prog,$monto_opera_mant_prog,$tipo_prog)
	{
		$Programacion=$this->db->query("execute sp_Gestionar_Programacion'".$opcion."','".$id_prog."','".$id_cartera."','".$id_brecha."','".$id_pi."','".$monto_prog."','".$año_prog."','".$prioridad_prog."','".$monto_opera_mant_prog."','".$tipo_prog."'");//listar  programacion
		
		return $Programacion->result();
	}
}