// ignore_for_file: non_constant_identifier_names

import 'package:venturo_apps/models/produk_barang_model.dart';
import 'package:venturo_apps/models/voucher.dart';

class CartModel {
  int id;
  ProductBarangModel product;
  VoucherModel vcr;
  int jumlah_pesan;
  String catatan;

  CartModel({
    this.id,
    this.product,
    this.vcr,
    this.jumlah_pesan,
    this.catatan,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toInt();
    product = ProductBarangModel.fromJson(json['product']);
    vcr = VoucherModel.fromJson(json['vcr']);
    jumlah_pesan = json['jumlah_pesan'].toInt();
    catatan = json['catatan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'vcr': vcr.toJson(),
      'jumlah_pesan': jumlah_pesan,
      'catatan': catatan,
    };
  }

  double getTotalPrice() {
    return product.harga * jumlah_pesan;
  }
}
