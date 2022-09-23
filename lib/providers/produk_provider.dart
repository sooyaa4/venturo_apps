import 'package:flutter/widgets.dart';
import 'package:venturo_apps/models/produk_barang_model.dart';
import 'package:venturo_apps/services/produk_barang_service.dart';

class ProductBarangProvider with ChangeNotifier {
  List<ProductBarangModel> _products = [];
  List<ProductBarangModel> get products => _products;

  set products(List<ProductBarangModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductBarangModel> products =
          await ProductBarangService().getProduk();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
