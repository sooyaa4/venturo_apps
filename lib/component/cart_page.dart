import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:venturo_apps/component/cart_card.dart';
import 'package:venturo_apps/providers/cart_provider.dart';
import 'package:venturo_apps/providers/transaksi_produk.dart';
import 'package:venturo_apps/theme.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransaksiBarangprovider transaksiBarangprovider =
        Provider.of<TransaksiBarangprovider>(context);

    handleCheckout() async {
      if (await transaksiBarangprovider.checkout(
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
      }
    }

    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor2,
        elevation: 0,
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: cartProvider.carts
            .map(
              (cart) => CartCard(cart),
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
                  Text(
                    'Total Pesanan' '(${cartProvider.totalItems()} Menu)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                    ),
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
                      Text(
                        ' Input voucher',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                        ),
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
                        Icons.arrow_forward,
                        color: primaryTextColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/Vector1.png',
                    height: 20,
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
                      onPressed: handleCheckout,
                      style: TextButton.styleFrom(
                        backgroundColor: priceColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bayar Sekarang',
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
      bottomNavigationBar:
          cartProvider.carts.length == 0 ? SizedBox() : customButtomNav(),
    );
  }
}
