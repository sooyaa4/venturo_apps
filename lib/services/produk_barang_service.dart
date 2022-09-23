// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:venturo_apps/models/produk_barang_model.dart';

class ProductBarangService {
  String baseUrl = 'https://tes-mobile.landa.id/api';

  Future<List<ProductBarangModel>> getProduk() async {
    var url = Uri.parse('$baseUrl/menus');
    var headers = {'Content-type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['datas'];
      List<ProductBarangModel> products = [];

      for (var item in data) {
        products.add(ProductBarangModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Product');
    }
  }
}
