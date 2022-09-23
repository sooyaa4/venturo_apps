// ignore_for_file: non_constant_identifier_names, avoid_print

class ProductBarangModel {
  int id;
  String nama;
  String tipe;
  double harga;
  String gambar;

  ProductBarangModel({
    this.id,
    this.nama,
    this.tipe,
    this.harga,
    this.gambar,
  });

  ProductBarangModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toInt();
    nama = json['nama'];
    tipe = json['tipe'];
    harga = json['harga'].toDouble();
    gambar = json['gambar'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'tipe': tipe,
      'harga': harga,
      'gambae': gambar,
    };
  }
}
