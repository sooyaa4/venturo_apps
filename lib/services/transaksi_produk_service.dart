// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:venturo_apps/models/cart_model.dart';

class TransaksiBarangService {
  String baseUrl = 'https://tes-mobile.landa.id/api';

  Future<bool> checkout(
    List<CartModel> carts,
    double totalPrice,
  ) async {
    var url = Uri.parse('$baseUrl/order');
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = jsonEncode(
      {
        "nominal_diskon": "0",
        "nominal_pesanan": totalPrice,
        'items': carts
            .map(
              (cart) => {
                'id': cart.product.id,
                'harga': cart.product.harga,
                'catatan': cart.catatan,
              },
            )
            .toList(),
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      print(Exception);
      print(response);
      throw Exception('Gagal melakukan checkout');
    }
  }
}
