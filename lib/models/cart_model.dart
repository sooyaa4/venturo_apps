// ignore_for_file: non_constant_identifier_names

import 'package:venturo_apps/models/produk_barang_model.dart';

class CartModel {
  int id;
  ProductBarangModel product;
  int jumlah_pesan;
  String catatan;

  CartModel({
    this.id,
    this.product,
    this.jumlah_pesan,
    this.catatan,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toInt();
    product = ProductBarangModel.fromJson(json['product']);
    jumlah_pesan = json['jumlah_pesan'].toInt();
    catatan = json['catatan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'jumlah_pesam': jumlah_pesan,
      'catatan': catatan,
    };
  }

  double getTotalPrice() {
    return product.harga * jumlah_pesan;
  }
}
