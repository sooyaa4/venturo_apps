// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:venturo_apps/models/voucher.dart';

class VoucherService {
  String baseUrl = 'https://tes-mobile.landa.id/api';

  Future<List<VoucherModel>> getVoucher() async {
    var url = Uri.parse('$baseUrl/vouchers');
    var headers = {'Content-type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['datas'];
      List<VoucherModel> vcr = [];

      for (var item in data) {
        vcr.add(VoucherModel.fromJson(item));
      }

      return vcr;
    } else {
      throw Exception('Gagal Get Product');
    }
  }
}
