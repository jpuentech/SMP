<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Model_ProgramaPresupuestal extends CI_Model
{
           public function __construct()
          {
              parent::__construct();
          }
//----------------------METODOS PARA EL MANTENIMIENTO DE RUBRO DE EJECUCION--------------------------------------------
    //AGREGAR UN PROGRAMA PRESUPUESTAL
      function AddProgramaP($txt_NombreProgramaP)
        {
           $this->db->query("execute sp_ProgramaPresupuestal_c'".$txt_NombreProgramaP."'");
            if ($this->db->affected_rows() > 0) 
              {
                return true;
              }
              else
              {
                return false;
              }
        }
    //FIN AGREGAR UN PROGRAMA PRESUPUESTAL
            //LISTAR PROGRAMA PRESUPUESTAL
      function GetProgramaP()
        {
            $programap=$this->db->query("execute sp_ProgramaPresupuestal_r"); //PROCEDIMIENTO DE LISTAR PROGRAMA PRESUPUESTAL
            if($programap->num_rows()>0)
             {
              return $programap->result();
             }else
             {
              return false;
             }
        } 
    //FIN LISTAR UN PROGRAMA PRESUPUESTAL
          //MODIFICAR DATOS DE PROGRAMA PRESUPUESTAL
         function UpdateProgramaP($id_prog_pres,$nombre_prog_pres)
        {
           $this->db->query("execute sp_ProgramaPresupuestal_u '".$id_prog_pres."','".$nombre_prog_pres."'");
            if ($this->db->affected_rows() > 0) 
              {
                return true;
              }
              else
              {
                return false;
              }
        }
    //FIN MODIFICAR DATOS DE PROGRAMA PRESUPUESTAL
//--------------FIN DE METODOS PARA EL MANTENIMIENTO DE PROGRAMA PRESUPUESTAL--------------------------------------------
}