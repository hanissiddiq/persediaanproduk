<?php
// Include librari PhpSpreadsheet
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
class Laporan extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        cek_login();
        $this->load->model('Laporan_model');
	
    }

    public function index()
    {	
        $data = array(
            'title' => 'Cetak Laporan'
        );

        $this->load->view('template/header.php', $data);
        $this->load->view('template/sidebar.php', $data);
        $this->load->view('pages/laporan/index_laporan.php', $data);
        $this->load->view('template/footer.php');
    }

    public function masuk_bulanan()
    {
        $bln = $this->input->post('bulan');
        $thn   = $this->input->post('tahun');

        $data = array(
            'title'         => 'Laporan Masuk Bulanan ' . '.' . $bln . '-' . $thn,
            'masuk'         => $this->Laporan_model->getMasukBulanan($bln, $thn),
            'bulan'           => $bln,
            'tahun'         => $thn,
        );

        $this->load->library('Pdf');
        $this->pdf->setPaper('A4', 'potrait');
        $this->pdf->filename = $bln . '-' . $thn . "-laporan_masuk_bulanan.pdf";
        return $this->pdf->load_view('pages/laporan/cetak/laporan_masuk_bulanan.php', $data);
    }

    public function masuk_tahunan()
    {
        $thn   = $this->input->post('tahun');

        $data = array(
            'title'         => 'Laporan Masuk Tahunan ' . '-' . $thn,
            'masuk'         => $this->Laporan_model->getMasukTahunan($thn),
            'tahun'         => $thn,
        );

        $this->load->library('Pdf');
        $this->pdf->setPaper('A4', 'potrait');
        $this->pdf->filename = $thn . "-laporan_masuk_tahunan.pdf";
        return $this->pdf->load_view('pages/laporan/cetak/laporan_masuk_tahunan.php', $data);
    }

    public function keluar_bulanan()
    {
        $bln = $this->input->post('bulan');
        $thn   = $this->input->post('tahun');

        $data = array(
            'title'         => 'Laporan Keluar Bualanan ' . '.' . $bln . '-' . $thn,
            'keluar'         => $this->Laporan_model->getKeluarBulanan($bln, $thn),
            'bln'           => $bln,
            'tahun'         => $thn,
        );

        $this->load->library('Pdf');
        $this->pdf->setPaper('A4', 'potrait');
        $this->pdf->filename = $bln . '-' . $thn . "-laporan_keluar_bulanan_.pdf";
        return $this->pdf->load_view('pages/laporan/cetak/laporan_keluar_bulanan.php', $data);
    }

    public function keluar_tahunan()
    {
        $thn   = $this->input->post('tahun');

        $data = array(
            'title'         => 'Laporan Keluar Bualanan ' . '-' . $thn,
            'keluar'         => $this->Laporan_model->getMasukTahunan($thn),
            'tahun'         => $thn,
        );

        $this->load->library('Pdf');
        $this->pdf->setPaper('A4', 'potrait');
        $this->pdf->filename = $thn . "-laporan_keluar_tahunan.pdf";
        return $this->pdf->load_view('pages/laporan/cetak/laporan_keluar_tahunan.php', $data);
    }
	
	
	
	public function excel_keluar_bulanan()
	{
		$bln = $this->input->post('bulan');
        $thn   = $this->input->post('tahun');
		
			$data = $this->Laporan_model->getKeluarBulanan($bln, $thn);
			$spreadsheet = new Spreadsheet();
			$sheet = $spreadsheet->getActiveSheet();
			$sheet->setCellValue('A1', 'No');
			$sheet->setCellValue('B1', 'Kode Produk');
			$sheet->setCellValue('C1', 'Nama Produk');
			$sheet->setCellValue('D1', 'Harga');
			$sheet->setCellValue('E1', 'Jumlah Keluar');
			$sheet->setCellValue('F1', 'Sisa Stok');
			$sheet->setCellValue('G1', 'Tanggal Keluar');
			
			//$siswa = $this->siswa_model->getAll();
			$no = 1;
			$x = 2;
			foreach($data as $row)
			{
				$sheet->setCellValue('A'.$x, $no++);
				$sheet->setCellValue('B'.$x, $row->kode_produk);
				$sheet->setCellValue('C'.$x, $row->nama_produk);
				$sheet->setCellValue('D'.$x, $row->harga);
				$sheet->setCellValue('E'.$x, $row->jumlah);
				$sheet->setCellValue('F'.$x, $row->stok);
				$sheet->setCellValue('G'.$x, $row->tanggal);
				$x++;
			}
			$writer = new Xlsx($spreadsheet);
			$filename = 'laporan-keluar-bulan-'.$bln.'-tahun-'.$thn;
			
			header('Content-Type: application/vnd.ms-excel');
			header('Content-Disposition: attachment;filename="'. $filename.'-'.$bln .'.xlsx"'); 
			header('Cache-Control: max-age=0');
	
			$writer->save('php://output');
	}
	
	public function excel_masuk_bulanan()
	{
		$bln = $this->input->post('bulan');
        $thn   = $this->input->post('tahun');
		
			$data = $this->Laporan_model->getMasukBulanan($bln, $thn);
			$spreadsheet = new Spreadsheet();
			$sheet = $spreadsheet->getActiveSheet();
			$sheet->setCellValue('A1', 'No');
			$sheet->setCellValue('B1', 'Kode Produk');
			$sheet->setCellValue('C1', 'Nama Produk');
			$sheet->setCellValue('D1', 'Harga');
			$sheet->setCellValue('E1', 'Jumlah Masuk');
			$sheet->setCellValue('F1', 'Sisa Stok');
			$sheet->setCellValue('G1', 'Tanggal Masuk');
			
			//$siswa = $this->siswa_model->getAll();
			$no = 1;
			$x = 2;
			foreach($data as $row)
			{
				$sheet->setCellValue('A'.$x, $no++);
				$sheet->setCellValue('B'.$x, $row->kode_produk);
				$sheet->setCellValue('C'.$x, $row->nama_produk);
				$sheet->setCellValue('D'.$x, $row->harga);
				$sheet->setCellValue('E'.$x, $row->jumlah);
				$sheet->setCellValue('F'.$x, $row->stok);
				$sheet->setCellValue('G'.$x, $row->tanggal);
				$x++;
			}
			$writer = new Xlsx($spreadsheet);
			$filename = 'laporan-masuk-bulan-'.$bln.'-tahun-'.$thn;
			
			header('Content-Type: application/vnd.ms-excel');
			header('Content-Disposition: attachment;filename="'. $filename.'-'.$bln .'.xlsx"'); 
			header('Cache-Control: max-age=0');
	
			$writer->save('php://output');
	}
		
}
