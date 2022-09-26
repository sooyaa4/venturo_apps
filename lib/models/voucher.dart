// ignore_for_file: non_constant_identifier_names, avoid_print

class VoucherModel {
  int id;
  String kode;
  double nominal;

  VoucherModel({
    this.id,
    this.kode,
    this.nominal,
  });

  VoucherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toInt();
    kode = json['kode'];
    nominal = json['nominal'].toDouble();
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kode': kode,
      'nominal': nominal,
    };
  }
}
