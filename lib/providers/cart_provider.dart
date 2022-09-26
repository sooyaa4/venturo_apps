import 'package:flutter/material.dart';
import 'package:venturo_apps/models/cart_model.dart';
import 'package:venturo_apps/models/produk_barang_model.dart';
import 'package:venturo_apps/models/voucher.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductBarangModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      _carts[index].jumlah_pesan++;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          product: product,
          jumlah_pesan: 1,
          catatan: "Tidak ada catatan",
        ),
      );
    }
    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].jumlah_pesan++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].jumlah_pesan--;
    if (_carts[id].jumlah_pesan == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.jumlah_pesan;
    }
    return total;
  }

  totalProduct() {
    int total = _carts.length;
    return total;
  }

  catatan(int id) {
    _carts[id].catatan;

    notifyListeners();
  }

  addvoucher() {
    VoucherModel vcr;
    _carts.add(
      CartModel(
        id: _carts.length,
        vcr: vcr,
      ),
    );
    notifyListeners();
  }

  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.jumlah_pesan * item.product.harga);
    }
    return total;
  }

  productExist(ProductBarangModel product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
