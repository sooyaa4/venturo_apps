import 'package:flutter/widgets.dart';
import 'package:venturo_apps/models/voucher.dart';
import 'package:venturo_apps/services/voucher_services.dart';

class VoucherProvider with ChangeNotifier {
  List<VoucherModel> _vcr = [];
  List<VoucherModel> get vcr => _vcr;

  set vcr(List<VoucherModel> vcr) {
    _vcr = vcr;
    notifyListeners();
  }

  Future<void> getVoucher() async {
    try {
      List<VoucherModel> vcr = await VoucherService().getVoucher();
      _vcr = vcr;
    } catch (e) {
      print(e);
    }
  }
}
