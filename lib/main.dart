import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venturo_apps/component/cart_page.dart';
import 'package:venturo_apps/component/pesanan.dart';
import 'package:venturo_apps/providers/cart_provider.dart';
import 'package:venturo_apps/providers/produk_provider.dart';
import 'package:venturo_apps/providers/transaksi_produk.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductBarangProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransaksiBarangprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (contex) => PesananPage(),
          '/cart': (contex) => CartPage(),
        },
      ),
    );
  }
}
