      <!-- Main Content -->
      <div class="main-content">
          <section class="section">
              <div class="section-header">
                  <h1>Data Satuan</h1>
                  <div class="section-header-breadcrumb">
                      <div class="breadcrumb-item active"><a href="<?= base_url('dashboard') ?>">Dashboard</a></div>
                      <div class="breadcrumb-item"><a href="<?= base_url('satuan') ?>">Satuan</a></div>
                      <div class="breadcrumb-item">Data</div>
                  </div>
              </div>

              <div class="section-body">
                  <h2 class="section-title">Data Satuan</h2>
              </div>
          </section>

          <div class="row">
              <div class="col-lg-12">
                  <div class="card">
                      <div class="card-header">
                          <h4 class="card-title">Data Satuan</h4>
                      </div>
                      <div class="card-body">
                          <button class="btn btn-success btn-sm mb-2" class="btn btn-primary" data-toggle="modal" data-target="#tambah-satuan"><i class="fas fa-plus-circle"></i> Tambah Data Satuan</button>
                          <div class="flashdata" id="flashdata" onload="clearmy()">
                              <?= $this->session->flashdata('message'); ?>
                          </div>
                          <div class="table-responsive">
                              <table id="satuan" class="table table-bordered text-center" style="width:100%">
                                  <thead>
                                      <tr>
                                          <th>No</th>
                                          <th>Aksi</th>
                                          <th>Nama Satuan</th>
                                          <th>Tanggal</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                      <?php $n = 1;
                                        foreach ($satuan as $data) { ?>
                                          <tr>
                                              <td><?= $n; ?></td>
                                              <td>
                                                  <div class="btn-group">
                                                      <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#hapus<?= $data->id_satuan ?>"><i class="fas fa-trash-alt"></i></button>
                                                      <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#edit<?= $data->id_satuan ?>"><i class="fas fa-edit"></i></button>
                                                  </div>
                                              </td>
                                              <!-- Modal Hapus -->
                                              <div class="modal fade" id="hapus<?= $data->id_satuan ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                  <div class="modal-dialog">
                                                      <div class="modal-content">
                                                          <div class="modal-header bg-danger">
                                                              <h5 class="modal-title text-white" id="exampleModalLabel">Konfirmasi Hapus</h5>
                                                          </div>
                                                          <div class="modal-body">
                                                              <div class="alert alert-warning text-center" role="alert">

                                                                  <p><b>Apakah anda yakin ingin menghapus data ini ?</b></p>

                                                              </div>
                                                          </div>
                                                          <div class="modal-footer">
                                                              <button type="button" class="btn btn-warning btn-sm" data-dismiss="modal">Close</button>
                                                              <a href="<?= base_url('hapus-satuan/') . $data->id_satuan ?>" type="button" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Hapus Data</a>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <!-- Modsal Edit -->
                                              <div class="modal fade" id="edit<?= $data->id_satuan ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                  <div class="modal-dialog">
                                                      <div class="modal-content">
                                                          <div class="modal-header bg-warning">
                                                              <h5 class="modal-title text-white" id="exampleModalLabel">Edit Data</h5>
                                                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                  <span aria-hidden="true">&times;</span>
                                                              </button>
                                                          </div>
                                                          <div class="modal-body">
                                                              <div class="row">
                                                                  <div class="col-lg-12">
                                                                      <form action="<?= base_url('edit-satuan/') . $data->id_satuan ?>" method="post" enctype="multipart/form-data">
                                                                          <div class="form-group">
                                                                              <label for="">Nama Satuan</label>
                                                                              <input type="text" name="nama_satuan" class="form-control" value="<?= $data->nama_satuan ?>">
                                                                          </div>
                                                                          <div class="form-group">
                                                                              <button class="btn btn-success btn-sm" type="submit">Simpan</button>
                                                                          </div>
                                                                      </form>
                                                                  </div>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <td><?= $data->nama_satuan ?></td>
                                              <td>
                                                  <small>Input : <?= $data->tgl_input == null ? '-' : $data->tgl_input ?></small>
                                                  <br>
                                                  <small>Update : <?= $data->tgl_update == '0000-00-00 00:00:00' ? '-' : $data->tgl_update ?></small>
                                              </td>
                                          </tr>
                                      <?php $n++;
                                        } ?>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>
              </div>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="tambah-satuan" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="modal-header bg-success">
                          <h5 class="modal-title text-white" id="exampleModalLabel">Tambah Data Satuan</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                          </button>
                      </div>
                      <div class="modal-body">
                          <div class="row">
                              <div class="col-lg-12">
                                  <form action="<?= base_url('tambah-data-satuan') ?>" method="post" enctype="multipart/form-data">
                                      <div class="form-group">
                                          <label for="">Nama Satuan</label>
                                          <input type="text" name="nama_satuan" class="form-control">
                                      </div>
                                      <div class="form-group">
                                          <button class="btn btn-success btn-sm" type="submit">Simpan</button>
                                      </div>
                                  </form>
                              </div>
                          </div>
                      </div>
                      <div class="modal-footer">
                      </div>
                  </div>
              </div>
          </div>

      </div>