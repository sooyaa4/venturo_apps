import 'package:flutter/widgets.dart';
import 'package:venturo_apps/models/cart_model.dart';
import 'package:venturo_apps/services/transaksi_produk_service.dart';

class TransaksiBarangprovider with ChangeNotifier {
  Future<bool> checkout(
    List<CartModel> carts,
    double totalPrice,
  ) async {
    try {
      if (await TransaksiBarangService().checkout(
        carts,
        totalPrice,
      )) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);

      return false;
    }
  }
}
