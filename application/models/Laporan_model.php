<?php
class Laporan_model extends CI_Model
{
    public function getMasukBulanan($bln, $thn)
    {
        $this->db->order_by('produk_masuk.id_produk_masuk', 'DESC');
        $this->db->where('tahun', $thn);
        $this->db->where('bulan', $bln);
        $this->db->join('produk', 'produk.id_produk=produk_masuk.id_produk');
        return $this->db->get('produk_masuk')->result();
    }

    public function getMasukTahunan($thn)
    {
        $this->db->order_by('produk_masuk.id_produk_masuk', 'DESC');
        $this->db->where('tahun', $thn);
        $this->db->join('produk', 'produk.id_produk=produk_masuk.id_produk');
        return $this->db->get('produk_masuk')->result();
    }

    public function getKeluarBulanan($bln, $thn)
    {
        $this->db->order_by('produk_keluar.id_produk_keluar', 'DESC');
        $this->db->where('tahun', $thn);
        $this->db->where('bulan', $bln);
        $this->db->join('produk', 'produk.id_produk=produk_keluar.id_produk');
        return $this->db->get('produk_keluar')->result();
    }

    public function getKeluarTahunan($thn)
    {
        $this->db->order_by('produk_keluar.id_produk_keluar', 'DESC');
        $this->db->where('tahun', $thn);
        $this->db->join('produk', 'produk.id_produk=produk_keluar.id_produk');
        return $this->db->get('produk_keluar')->result();
    }
}
