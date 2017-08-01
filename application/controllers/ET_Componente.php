<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ET_Componente extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->load->model('Model_ET_Expediente_Tecnico');
		$this->load->model('Model_Unidad_Medida');
		$this->load->model('Model_ET_Componente');
		$this->load->model('Model_ET_Meta');
		$this->load->model('Model_ET_Partida');
	}

	public function insertar()
	{
		if($_POST)
		{
			$idET=$this->input->post('idET');
			$descripcionComponente=$this->input->post('descripcionComponente');

			$this->Model_ET_Componente->insertar($idET, $descripcionComponente);

			$ultimoIdComponente=$this->Model_ET_Componente->ultimoId();

			echo json_encode(['proceso' => 'Correcto', 'mensaje' => 'Componente registrado correctamente.', 'idComponente' => $ultimoIdComponente]);exit;
		}

		$expedienteTecnico=$this->Model_ET_Expediente_Tecnico->ExpedienteTecnico(1);
		$listaUnidadMedida=$this->Model_Unidad_Medida->UnidadMedidad_Listar();

		$expedienteTecnico->childComponente=$this->Model_ET_Componente->ETComponentePorIdET($expedienteTecnico->id_et);

		foreach($expedienteTecnico->childComponente as $key => $value)
		{
			$value->childMeta=$this->Model_ET_Meta->ETMetaPorIdComponente($value->id_componente);

			foreach($value->childMeta as $index => $item)
			{
				$this->obtenerMetaAnidada($item);
			}
		}

		$this->load->view('front/Ejecucion/ETComponente/insertar.php', ['expedienteTecnico' => $expedienteTecnico, 'listaUnidadMedida' => $listaUnidadMedida]);
	}

	private function obtenerMetaAnidada($meta)
	{
		$temp=$this->Model_ET_Meta->ETMetaPorIdMetaPadre($meta->id_meta);

		$meta->childMeta=$temp;

		if(count($temp)==0)
		{
			$meta->childPartida=$this->Model_ET_Partida->ETPartidaPorIdMeta($meta->id_meta);

			return false;
		}

		foreach($meta->childMeta as $key => $value)
		{
			$this->obtenerMetaAnidada($value);
		}
	}

	public function eliminar()
	{
		if($_POST)
		{
			$idComponente=$this->input->post('idComponente');

			$listaMeta=$this->Model_ET_Meta->ETMetaPorIdComponente($idComponente);

			foreach($listaMeta as $key => $value)
			{
				$this->eliminarMetaAnidada($value);
			}

			$this->Model_ET_Componente->eliminar($idComponente);

			echo json_encode(['proceso' => 'Correcto', 'mensaje' => 'Componente eliminado correctamente.']);exit;
		}

		$this->load->view('Front/Ejecucion/ETPartida/insertar');
	}

	private function eliminarMetaAnidada($meta)
	{
		$temp=$this->Model_ET_Meta->ETMetaPorIdMetaPadre($meta->id_meta);

		foreach($temp as $key => $value)
		{
			$this->eliminarMetaAnidada($value);
		}

		if(count($temp)==0)
		{
			$this->Model_ET_Partida->eliminarPorIdMeta($meta->id_meta);
		}

		$this->Model_ET_Meta->eliminar($meta->id_meta);
	}
}