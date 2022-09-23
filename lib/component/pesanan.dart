import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:venturo_apps/component/produk_card.dart';
import 'package:venturo_apps/providers/cart_provider.dart';
import 'package:venturo_apps/providers/produk_provider.dart';
import 'package:venturo_apps/theme.dart';

class PesananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductBarangProvider productBarangProvider =
        Provider.of<ProductBarangProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    productBarangProvider.getProducts();
    print('jumlah produk homepage: ${productBarangProvider.products.length}');

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
                  Text(
                    'Total Pesanan' '(${cartProvider.totalItems()} Menu)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
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
