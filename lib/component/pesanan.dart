// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:venturo_apps/component/produk_card.dart';
import 'package:venturo_apps/providers/cart_provider.dart';
import 'package:venturo_apps/providers/produk_provider.dart';
import 'package:venturo_apps/providers/voucher_provider.dart';
import 'package:venturo_apps/theme.dart';

class PesananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductBarangProvider productBarangProvider =
        Provider.of<ProductBarangProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    VoucherProvider voucherProvider = Provider.of<VoucherProvider>(context);
    // TextEditingController voucher = TextEditingController(text: '');

    // Future<void> voucherDialog() async {
    //   return showDialog(
    //     context: context,
    //     builder: (BuildContext context) => Container(
    //       width: MediaQuery.of(context).size.width - (2 * defaultMargin),
    //       child: AlertDialog(
    //         backgroundColor: backgroundColor2,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(30),
    //         ),
    //         content: SingleChildScrollView(
    //           child: Column(
    //             children: [
    //               Align(
    //                 alignment: Alignment.centerLeft,
    //                 child: GestureDetector(
    //                   onTap: () {
    //                     Navigator.pop(context);
    //                   },
    //                   child: Icon(
    //                     Icons.close,
    //                     color: primaryTextColor,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 12,
    //               ),
    //               Row(
    //                 children: [
    //                   Image.asset(
    //                     'assets/Vector.png',
    //                     height: 20,
    //                   ),
    //                   SizedBox(
    //                     width: 12,
    //                   ),
    //                   Text(
    //                     'Punya kode Voucher?',
    //                     style: primaryTextStyle.copyWith(
    //                         fontSize: 18, fontWeight: bold),
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 12,
    //               ),
    //               Container(
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     SizedBox(
    //                       height: 12,
    //                     ),
    //                     Container(
    //                       height: 45,
    //                       width: 230,
    //                       padding: EdgeInsets.symmetric(
    //                         horizontal: 16,
    //                       ),
    //                       decoration: BoxDecoration(
    //                         color: backgroundColor2,
    //                         borderRadius: BorderRadius.circular(12),
    //                         // border: Border.all(
    //                         //   color: primaryColor,
    //                         // ),
    //                       ),
    //                       child: Center(
    //                         child: Row(
    //                           children: [
    //                             SizedBox(
    //                               width: 5,
    //                             ),
    //                             Expanded(
    //                               child: TextFormField(
    //                                 style: primaryTextStyle,
    //                                 controller: voucher,
    //                                 decoration: InputDecoration.collapsed(
    //                                   hintText: 'Masukan voucher',
    //                                   hintStyle: primaryTextStyle,
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               Container(
    //                 width: 154,
    //                 height: 44,
    //                 child: TextButton(
    //                   // onPressed: cartProvider.addvoucher(),
    //                   style: TextButton.styleFrom(
    //                     backgroundColor: priceColor,
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(12),
    //                     ),
    //                   ),
    //                   child: Text(
    //                     'Validasi voucher',
    //                     style: secondaryTextStyle.copyWith(
    //                       fontSize: 16,
    //                       fontWeight: medium,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }

    productBarangProvider.getProducts();
    voucherProvider.getVoucher();
    print('jumlah produk homepage: ${productBarangProvider.products.length}');
    print('jumlah voucher tampil: ${voucherProvider.vcr.length}');

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        elevation: 0,
        centerTitle: true,
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: productBarangProvider.products
            .map(
              (product) => ProductCard(product),
            )
            .toList(),
      );
    }

    Widget customButtomNav() {
      return Container(
        decoration: BoxDecoration(
          color: backgroundColor4,
          borderRadius: BorderRadius.circular(25),
        ),
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Total Pesanan',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        '(${cartProvider.totalProduct()} Menu)',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                        .format(cartProvider.totalPrice()),
                    style: priceTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: backgroundColor3,
                  ),
                ],
              ),
            ),
            // Divider(
            //   thickness: 1,
            //   color: backgroundColor3,
            // ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/Vector.png',
                        height: 20,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Voucher',
                        style: primaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'input voucher',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: primaryTextColor,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     voucherDialog();
                      //   },
                      //   child: Icon(
                      //     Icons.arrow_forward_ios,
                      //     color: primaryTextColor,
                      //   ),
                      // ),
                      //
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 9,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/Vector1.png',
                    height: 25,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Pembayaran",
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(
                                  name: 'Rp ', decimalDigits: 0)
                              .format(cartProvider.totalPrice()),
                          style: priceTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: priceColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pesan Sekarang',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: header(),
      body: content(),
      bottomNavigationBar: customButtomNav(),
      resizeToAvoidBottomInset: false,
    );
  }
}
