<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Model_FEActividadEntregable extends CI_Model
{
           public function __construct()
          {
              parent::__construct();
            // $this->db->free_db_resource();

          }

       function get_Actividades($id_en)
        {
            $Actividades=$this->db->query("select id_act id,id_entregable,nombre_act title , fecha_inicio start, fecha_final 'end',valoracion,avance,color,Observacion from ACTIVIDAD_CRONOGRAMA where id_entregable='".$id_en."' ");
            if($Actividades->num_rows()>=0)
             {
              return $Actividades->result();
             }else
             {
              return false;
             }
   
        }
        function Add_Actividades($opcion,$id_act,$txt_id_entregable,$txt_nombre_act,$txt_fechaActividadI,$txt_fechaActividadf,$txt_valoracionEAc,$txt_AvanceEAc,$txt_observacio_EntreAc,$txt_ActividadColor)
        {

            $this->db->query("EXECUTE sp_Gestionar_Actividad_Entregable'".$opcion."','".$id_act."', '" . $txt_id_entregable."','".$txt_nombre_act."','".$txt_fechaActividadI."','".$txt_fechaActividadf."',".$txt_valoracionEAc.",'".$txt_AvanceEAc."','".$txt_observacio_EntreAc."','".$txt_ActividadColor."'");
            if ($this->db->affected_rows()> 0) 
              {
                return true;
              }
              else
              {
                return false;
              }

        }
        function Update_Actividades($opcion,$tx_IdActividad,$txt_idEntregable,$txt_NombreActividadAc,$txt_fechaActividadIAc,$txt_fechaActividadfAc,$txt_valorizacionEAct,$txt_avanceEAct,$txt_observacio_EntreAct,$txt_ActividadColorAc)
        {
          $this->db->query("EXECUTE sp_Gestionar_Actividad_Entregable'".$opcion."','".$tx_IdActividad."', '" . $txt_idEntregable."','".$txt_NombreActividadAc."','".$txt_fechaActividadIAc."','".$txt_fechaActividadfAc."',".$txt_valorizacionEAct.",'".$txt_avanceEAct."','".$txt_observacio_EntreAct."','".$txt_ActividadColorAc."'");
            if ($this->db->affected_rows()> 0) 
              {
                return true;
              }
              else
              {
                return false;
              }
        }

      function CalcularAvanceActividad($tx_IdActividad,$txt_idEntregable)
        {
           $actividad=$this->db->query("select id_entregable,Avance,Valoracion from ACTIVIDAD_CRONOGRAMA where id_entregable='".$txt_idEntregable."'");
              if($actividad->num_rows()>=0)
             {
              return $actividad->result();
             }else
             {
              return false;
             }

        }
        //fin funcion
       
        //fin division funciona
        //grupo funcional*/
  
}