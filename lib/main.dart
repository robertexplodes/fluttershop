import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/provider/cart_provider.dart';
import 'package:shop/pages/manage_products.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/shop_page.dart';

import 'domain/provider/product_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CartProvider(),
        ),
      ],
      child: const ShopApp(),
    ),
  );
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const ShopPage(),
        ManageProductsPage.route: (context) => const ManageProductsPage(),
        OrderPage.route: (context) => const OrderPage(),
      },
    );
  }
}
