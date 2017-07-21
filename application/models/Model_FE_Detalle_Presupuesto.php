<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_FE_Detalle_Presupuesto extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }
    
    function Insertar($idPresupuestoFE, $idsTipoGasto)
    {
        $this->db->query("execute sp_DetallePresupuesto_Insertar '".$idPresupuestoFE."','".$idsTipoGasto."'");

        return true;
    }

    function ObtenerUltimoIdDetallePresupuesto()
    {
    	return $this->db->query('select max(id_detalle_presupuesto) as idDetallePresupuesto from FE_DETALLE_PRESUPUESTO')->result()[0]->idDetallePresupuesto;
    }
}