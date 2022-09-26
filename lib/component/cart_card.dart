import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:venturo_apps/models/cart_model.dart';
import 'package:venturo_apps/providers/cart_provider.dart';
import 'package:venturo_apps/theme.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    // TextEditingController catatan = TextEditingController(text: '');

    // Future<void> catatanDialog() async {
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
    //               Text(
    //                 'Masukan catatan',
    //                 style: primaryTextStyle.copyWith(
    //                     fontSize: 18, fontWeight: bold),
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
    //                                 controller: catatan,
    //                                 decoration: InputDecoration.collapsed(
    //                                   hintText: 'Masukan catatan',
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
    //                   onPressed: cartProvider.catatan(cart.id),
    //                   style: TextButton.styleFrom(
    //                     backgroundColor: priceColor,
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(12),
    //                     ),
    //                   ),
    //                   child: Text(
    //                     'Tambahkan',
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

    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      cart.product.gambar,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.product.nama,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                          .format(cart.product.harga),
                      style: priceTextStyle,
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/note.png',
                          width: 10,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Tambahkan Catatan',
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: catatanDialog,
                        //   child: Text(
                        //     'Tambahkan Catatan',
                        //     style: primaryTextStyle.copyWith(
                        //       fontSize: 12,
                        //       fontWeight: light,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/min.png',
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    cart.jumlah_pesan.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/plus.png',
                      width: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          // GestureDetector(
          //   onTap: () {
          //     cartProvider.removeCart(cart.id);
          //   },
          //   child: Row(
          //     children: [
          //       Image.asset(
          //         'assets/icon_remove.png',
          //         width: 10,
          //       ),
          //       SizedBox(
          //         width: 4,
          //       ),
          //       Text(
          //         'Remove',
          //         style: alertTextStyle.copyWith(
          //           fontSize: 12,
          //           fontWeight: light,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
