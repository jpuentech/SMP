<?php
defined('BASEPATH') or exit('No direct script access allowed');
class ET_Img extends CI_Controller
{
public function __construct()
    {
        parent::__construct();
        $this->load->model("Model_ET_Img");    
    }
    /*function eliminarimg()
    {
        $id_et=$this->input->GET('id_et');
        $eliminarImg=$this->Model_ET_Expediente_Tecnico->ET_Img($id_et);
            foreach ($eliminarImg as $value) 
            {
                unlink("uploads/ImageExpediente/".$value->desc_img);
            }
            if($this->Model_ET_Img->EliminarImagen($id_et)==true)
            {   
                echo json_encode("correcto se elimino");
            }
    }*/

   /* public function eliminarimg()
    {
        if ($this->input->is_ajax_request()) 
        {
            $id_et=$this->input->post('id_et');

                $eliminarImg=$this->Model_ET_Expediente_Tecnico->ET_Img($id_et);
                foreach ($eliminarImg as $value) 
                {
                    unlink("uploads/ImageExpediente/".$value->desc_img);
                }
                if($this->Model_ET_Img->EliminarImagen($id_et)==true)
                {   //$img=$this->Model_ET_Img->eliminarimg()
                    
                    echo json_encode("correcto se elimino");
                }       
        }
    }*/
    public function eliminar()
    {
        if ($this->input->is_ajax_request()) 
        {
            if($_POST)
            {
                //$this->db->trans_start();

                $id_img=$this->input->post('id_img');
                /*$eliminarImg=$this->Model_ET_Expediente_Tecnico->ET_Img($id_et);
                foreach ($eliminarImg as $value) 
                {
                    unlink("uploads/ImageExpediente/".$value->desc_img);
                }*/
                $this->Model_ET_Img->EliminarImagen($id_img);

                $id_et=$this->input->post('id_et');
                $ListarImagen=$this->Model_ET_Img->ListarImagen($id_et);
                echo json_encode($ListarImagen);
               // echo json_encode(['proceso' => 'Correcto', 'mensaje' => 'Componente eliminado correctamente.']);exit;

               // $this->db->trans_complete();

                //echo json_encode(['proceso' => 'Correcto', 'mensaje' => 'Componente eliminado correctamente.']);exit;
            }
         }

    }

    /*public function EliminarImagen()
    {
        if($_POST)
        {
           // $this->db->trans_start();

            $id_et=$this->input->post('id_et');

            $eliminarImg=$this->Model_ET_Expediente_Tecnico->ET_Img($id_et);

            foreach ($eliminarImg as $value) 
            {
                unlink("uploads/ImageExpediente/".$value->desc_img);
            }
            if($this->Model_ET_Img->EliminarImagen($id_et)==true)
            {   
                echo json_encode(['proceso' => 'Correcto', 'mensaje' => 'Eliminar eliminado correctamente.']);exit;
            }
           // $this->db->trans_complete();
        }
        $this->load->view('Front/Ejecucion/ExpedienteTecnico/editar');
    }*/
}
